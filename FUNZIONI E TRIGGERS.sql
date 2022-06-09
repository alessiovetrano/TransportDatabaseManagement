/*----OPERAZIONI DATA-BASE

* 9 TRIGGERS
* 6 PROCEDURE

*/
-----------------------TRIGGERS------------------------------

--1.CHECK DIPENDENTE MAGGIORENNE
CREATE OR REPLACE TRIGGER maggiorenne
before insert on dipendente
for each row
DECLARE
check_maggiorenne EXCEPTION;
BEGIN
if (floor((sysdate-:new.data_nascita)/365) < 17) then
raise check_maggiorenne;
end if;
EXCEPTION
when check_maggiorenne then
raise_application_error(-20001,'DIPENDENTE MINORENNE');
end;

--2.CHECK SINGOLO DIRETTORE AZIENDALE
CREATE OR REPLACE TRIGGER checkMansione
before insert or update on impiegato
for each row
DECLARE
overNum EXCEPTION;
contatore NUMBER;
BEGIN
select count(*) into contatore from IMPIEGATO
where mansione = 'Direttore';
if contatore = 1 then
raise overNum;
end if;
EXCEPTION
when overNum then
raise_application_error(-20001,'ESISTE GIA UN DIRETTORE IN AZIENDA');
end;



--3.CHECK SE L'OFFICINA HA NELLO STESSO PERIODO HA DUE VEICOLI NON PUO INSERIRE IL TERZO
CREATE OR REPLACE TRIGGER checknumVei
before insert on manutenzione
for each row
DECLARE
overNum EXCEPTION;
contatore NUMBER;
BEGIN
select count(*) into contatore from manutenzione where p_iva_meccanico = :new.p_iva_meccanico AND (:new.data_inizio_man between data_inizio_man and data_fine_man);
if (contatore > 2) then
  raise overNum;
end if;
EXCEPTION
when overNum then 
raise_application_error(-20001,'OFFICINA TROPPO PIENA');
END;


--4.DIPENDENTE TROPPO ANZIANO (OVER 60)
CREATE OR REPLACE TRIGGER checkAnziano
before insert or update on dipendente
for each row
DECLARE
troppoAnziano EXCEPTION;
BEGIN
if (floor((sysdate-:new.data_nascita)/365)) > 60 then
raise troppoAnziano;
end if;
EXCEPTION
when troppoAnziano then
raise_application_error(-20001,'DIPENDENTE TROPPO ANZIANO PER GLI STANDARD AZIENDALI');
END;

--5.PESO RISPETTO AL VEICOLO
CREATE OR REPLACE TRIGGER checkPeso
before insert or update on lotto
for each row
DECLARE
overPeso EXCEPTION;
peso INT;
somma_lotti INT;
BEGIN
select peso_massimo into peso from viaggio v 
join fornitore forn on v.p_iva_forn = forn.p_iva_fornitore
join spedizione s on v.cf_viaggio  = s.cf_spedizione and v.data_viaggio = s.data_spedizione
join azienda_esterna az on s.p_iva_aziendaArrivo = az.p_iva_azienda_esterna
join autista aux on v.cf_viaggio = aux.cf_autista
join veicolo v on v.targa = aux.targa_autista;
select SUM(Peso_lotto) into somma_lotti from lotto lt join spedizione sp on lt.tracciamento_lotto = sp.num_tracciamento;
if (peso < :new.peso_lotto + somma_lotti) then
raise overPeso;
end if;
EXCEPTION
when overPeso then
raise_application_error(-20001,'IL VEICOLO NON PUO CONTENERE QUESTO LOTTO');
END;

--6.TRIGGER CONTROLLA STIPENDIO DEL DIRETTORE
CREATE OR REPLACE TRIGGER checkStipendio
before insert on stipendio
for each row
DECLARE
mansioneCheck VARCHAR2(30);
stipendio_basso EXCEPTION;
BEGIN

select mansione into mansioneCheck from impiegato im join dipendente dip on im.cf_impiegato = dip.cf 
join contratto contr on dip.cf = contr.cf_contratto join stipendio stip on stip.contratto_stipendio = contr.codice_contratto
where contr.codice_contratto = :new.contratto_stipendio
group by cf_impiegato, mansione;



if (:new.importo < 3200 and mansioneCheck = 'Direttore') then
    raise stipendio_basso;
elsif (:new.importo < 1400 and mansioneCheck = 'Segretario') then 
    raise stipendio_basso;
elsif (:new.importo < 2000 and mansioneCheck = 'Manager') then 
    raise stipendio_basso;
elsif (:new.importo < 2550 and mansioneCheck = 'Legale' ) then 
    raise stipendio_basso;
elsif (:new.importo < 2200 and mansioneCheck = 'Analista') then 
    raise stipendio_basso;
end if;


EXCEPTION
when stipendio_basso then
raise_application_error(-20001,'STIPENDIO TROPPO BASSO PER QUESTA DETERMINATA MANSIONE');
end;




--7.CHECK MASSIMO NUMERO DI DIPENDENTI
CREATE OR REPLACE TRIGGER checkNumDip
before insert or update on dipendente
for each row
DECLARE
MaxNumDip EXCEPTION;
cont NUMBER;
BEGIN
select count(*) into cont from dipendente;
if (cont=40) then
raise MaxNumDip;
end if;
EXCEPTION
when MaxNumDip then
raise_application_error(-20001,'RAGGIUNTO MASSIMO NUMERO DI DIPENDENTI');
END;

--9. CHECK CAPIENZA_UFFICIO
CREATE OR REPLACE TRIGGER checkUfficio
before insert or update on impiegato
for each row
DECLARE
overNumUfficio EXCEPTION;
contatore INT;
num_max INT;
numero_ufficio varchar(30);
BEGIN

select count(*) into contatore
from impiegato im join ufficio uff on im.ufficio_impiegato = uff.num_ufficio
where :new.ufficio_impiegato = uff.num_ufficio;


select  NUM_IMPIEGATI,  num_ufficio into num_max, numero_ufficio
from impiegato im join ufficio uff on im.ufficio_impiegato = uff.num_ufficio
where :new.ufficio_impiegato = uff.num_ufficio group by NUM_IMPIEGATI, num_ufficio;

if ((contatore + 1) > num_max) then
raise overNumUfficio;
end if;
EXCEPTION
when overNumUfficio then
raise_application_error(-20001,'Errore l''ufficio pieno. L''impiegato non può essere assegnato.');
end;


----------------------------------PROCEDURE----------------------------------


--LICENZIAMENTO DIPENDENTE (IMPIEGATO/AUTISTA)
CREATE OR REPLACE PROCEDURE licenziamento(codFiscale varchar)
IS
error1 EXCEPTION;
cfDir VARCHAR2(16);
BEGIN
select cf_impiegato into cfDir from impiegato where mansione = 'Direttore';

if cfDir = codFiscale then
    raise error1;
else
    delete from dipendente where cf = codFiscale;
end if;
DBMS_OUTPUT.PUT_LINE('ELIMINAZIONE DAL DATA-BASE ANDATA A BUON FINE');

EXCEPTION
when error1 then 
raise_application_error(-20001,'NON PUOI LICENZIARE UN DIRETTORE SENZA AVERNE ELETTO UN ALTRO');
END;

--1.ELEZIONE NUOVO DIRETTORE
CREATE OR REPLACE PROCEDURE nuovoDirettore (CodFiscale varchar)
IS
error1 EXCEPTION;
nomeDir varchar2(30);
cognomeDir varchar2(30);

BEGIN
select nome,cognome into nomeDir,cognomeDir  from impiegato im join dipendente dip on im.cf_impiegato = dip.cf where cf = CodFiscale;
for ind in 
(select cf_impiegato from dipendente join impiegato on cf=cf_impiegato join contratto on cf_impiegato = cf_contratto 
    where mansione = 'Segretario' OR tipo_contratto != 'Indeterminato' OR TO_CHAR(data_assunzione) > '2012-01-01')
loop
    if ind.cf_impiegato = CodFiscale then
        raise error1;
    end if;
end loop;
update impiegato set mansione = 'Manager' where mansione = 'Direttore';
update impiegato set mansione = 'Direttore' where cf_impiegato = CodFiscale;
DBMS_OUTPUT.PUT_LINE('L''impiegato ' || (nomeDir) ||' ' || (cognomeDir) ||' è ufficialmente il nuovo direttore');

EXCEPTION
when error1 then
DBMS_OUTPUT.PUT_LINE('L''impiegato ' || (nomeDir) ||' ' || (cognomeDir) ||' non può diventare direttore per le regole aziendali'); 
END; 

--
--2.PROCEDURA CONTA ORA DI PRESENZA - FAI CONTROLLO SE ESISTE NELLA TABELLA CON MESSAGGIO D'ERRORE
--UTLIZZO TRE TABELLE DIVERSE
CREATE OR REPLACE PROCEDURE contaOre (nomeP varchar, cognomeP varchar)
IS
error1 EXCEPTION;
numOre NUMBER;
nomeDir VARCHAR2(30);
cognomeDir VARCHAR2(30);
BEGIN
select nome, cognome, sum(floor(((ora_uscita - ora_entrata)*24 - 1))) into nomeDir,cognomeDir,numOre 
    from dipendente dip 
    join impiegato im on dip.cf = im.cf_impiegato 
    join presenza pr on im.cf_impiegato = pr.cf_presenza
    where nomeP = dip.nome and cognomeP = dip.cognome
group by nome, cognome;
DBMS_OUTPUT.PUT_LINE('L''impiegato ' || (nomeDir) ||' ' || (cognomeDir) ||' ha effettuato '||(numOre) || ' ore di presenze'); 
END; 

--3. PROCEDURA SULLA SCHEDULAZIONE DI UN NUOVO VIAGGIO---FARE ALTRI TEST
-- AGGIUNGENO IL LOTTO(CHECK SULA BOLLA TRASPORTO) RAGGIUNGIAMO TRE TABELLE

CREATE OR REPLACE PROCEDURE ScheduleViaggio(dataViaggio date, kilometri number,pivaforn varchar, pivaesterna varchar)
IS
AutistaCandidato varchar2(16);
error1 exception;
numSoste number := floor(kilometri/300);
DurataViaggio int := floor(Kilometri/90);
numTracc int := dbms_random.value(100000000,999999999);
BEGIN

select cf_autista into AutistaCandidato from (autista join viaggio on cf_autista = cf_viaggio) 
where 
not dataViaggio between data_viaggio and (data_viaggio+(durata/24)+8/24) and 
not (dataViaggio+(DurataViaggio/24)+8/24) between data_viaggio and (data_viaggio+(durata/24)+8/24)
and data_viaggio < ( dataViaggio+(DurataViaggio/24)+8/24)

order by dbms_random.value()
fetch first 1 row only;


    insert into viaggio (data_viaggio,cf_viaggio,p_iva_forn,km_totali,num_soste,durata) values(dataViaggio,AutistaCandidato,pivaforn,kilometri,numSoste,durataViaggio);
    insert into spedizione values(NumTracc,dataViaggio,AutistaCandidato,pivaesterna);

 

EXCEPTION
WHEN NO_DATA_FOUND THEN
DBMS_OUTPUT.PUT_LINE('Il viaggio non puo essere schedulato nella seguente data: '|| (dataViaggio));
END;


--PROCEDURA DI UNA PROMOZIONE DI UN SEGRETARIO A MANAGER

CREATE OR REPLACE PROCEDURE promozione(nomep varchar2, cognomep varchar2) -- PROMOZIONE DA SEGRETARIO A MANAGER
IS
Cod_contr VARCHAR2(10); 
mansione_im VARCHAR2(30);
nomeProm varchar(30);
cognomeProm varchar(30);
cfprom varchar(16);
BEGIN
select nome, cognome , codice_contratto, cf_impiegato, mansione into nomeProm, cognomeProm, Cod_contr, cfprom, mansione_im from impiegato im
join dipendente dip on dip.cf = im.cf_impiegato  
join contratto contr on dip.cf = contr.cf_contratto 
where nomep = nome and cognomep = cognome;

if lower(mansione_im) = 'segretario' then
    UPDATE IMPIEGATO set mansione = 'manager' where cf_impiegato = cfprom;
    DBMS_OUTPUT.PUT_LINE('Il dipendente '|| (nomep) ||' ' ||(cognomep)||' è stato promosso correttamente');
else
    DBMS_OUTPUT.PUT_LINE('Il dipendente '|| (nomep) ||' ' ||(cognomep)|| ' non è un segretario');
    end if;
EXCEPTION
WHEN NO_DATA_FOUND THEN
DBMS_OUTPUT.PUT_LINE('Il dipendente '|| (nomep) || (cognomep)|| ' non fa parte del database');
END; 



