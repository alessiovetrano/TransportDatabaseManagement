/*----OPERAZIONI DATA-BASE

* 9 TRIGGERS
* 6 PROCEDURE

*/
-----------------------TRIGGERS------------------------------

--CHECK DIPENDENTE MAGGIORENNE O TROPPO ANZIANO
CREATE OR REPLACE TRIGGER maggiorenne
before insert on dipendente
for each row
DECLARE
check_eta EXCEPTION;
BEGIN
if (floor((sysdate-:new.data_nascita)/365) < 17 OR (floor((sysdate-:new.data_nascita)/365)) > 60 ) then
raise check_eta;
end if;
EXCEPTION
when check_eta then
raise_application_error(-20001,'Il candidato dipendente non rientra nei paramentri di assunzione');
end;


--1.CHECK SINGOLO DIRETTORE AZIENDALE + CHECK CAPIENZA UFFICIO
CREATE OR REPLACE TRIGGER checkMansione
before insert or update on impiegato
for each row
DECLARE
overNum EXCEPTION;
overNumUfficio EXCEPTION;
contatore int;
contatoreUff NUMBER;
num_max INT;
numero_ufficio varchar(30);
BEGIN

select count(*) into contatore from impiegato
where mansione = 'Direttore';

if :new.mansione = 'Direttore' and contatore = 1 then
raise overNum;
end if;

select count(*) into contatoreUff
from impiegato im join ufficio uff on im.ufficio_impiegato = uff.num_ufficio
where uff.num_ufficio = :new.ufficio_impiegato;


select num_impiegati into numero_ufficio
from ufficio
where :new.ufficio_impiegato = num_ufficio;


if ((contatoreUff + 1) > numero_ufficio) then
raise overNumUfficio;
end if;

EXCEPTION
when overNum then
raise_application_error(-20001,'ESISTE GIA UN DIRETTORE IN AZIENDA');
when overNumUfficio then
raise_application_error(-20001,'Errore l''ufficio pieno. L''impiegato non può essere assegnato.');
end;



--2.CHECK SE L'OFFICINA HA NELLO STESSO PERIODO HA DUE VEICOLI NON PUO INSERIRE IL TERZO
CREATE OR REPLACE TRIGGER checknumVeicoli
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


--3.PESO RISPETTO AL VEICOLO
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
join veicolo v on v.targa = aux.targa_autista
where s.num_tracciamento = :new.tracciamento_lotto;


select sum(peso_lotto) into somma_lotti from lotto lt join spedizione sp on lt.tracciamento_lotto = sp.num_tracciamento
where cf_spedizione = (select cf_spedizione from spedizione where num_tracciamento = :new.tracciamento_lotto)
and data_spedizione = (select data_spedizione from spedizione where num_tracciamento = :new.tracciamento_lotto);

if (peso <= :new.peso_lotto + somma_lotti) then
raise overPeso;
end if;
EXCEPTION
when overPeso then
raise_application_error(-20001,'IL VEICOLO NON PUO CONTENERE QUESTO LOTTO');
END;

--4.TRIGGER CONTROLLA STIPENDIO DEL DIRETTORE
CREATE OR REPLACE TRIGGER checkStipendio
before insert on stipendio
for each row
DECLARE
mansioneCheck VARCHAR2(30);
stipendio_basso EXCEPTION;
contatore NUMBER;
contatoreIm NUMBER;
BEGIN

select count(*),mansione into contatore, mansioneCheck from impiegato im join dipendente dip on im.cf_impiegato = dip.cf 
    join contratto contr on dip.cf = contr.cf_contratto 
    where contr.codice_contratto = :new.contratto_stipendio
    group by cf_impiegato, mansione;


if (contatore > 0) then 
     if (:new.importo < 3000 and mansioneCheck = 'Direttore') then
        raise stipendio_basso;
    elsif (:new.importo < 1200 and mansioneCheck = 'Segretario') then 
        raise stipendio_basso;
    elsif (:new.importo < 1300 and mansioneCheck = 'Manager') then 
        raise stipendio_basso;
    elsif (:new.importo < 2300 and mansioneCheck = 'Legale' ) then 
        raise stipendio_basso;
    elsif (:new.importo < 1950 and mansioneCheck = 'Analista') then 
        raise stipendio_basso;
    end if;
end if;

EXCEPTION
when NO_DATA_FOUND then
    if :new.importo < 1200 then
    raise stipendio_basso;
    end if;
when stipendio_basso then
raise_application_error(-20001,'STIPENDIO TROPPO BASSO PER QUESTA DETERMINATA MANSIONE');
end;



--5.CHECK MASSIMO NUMERO DI DIPENDENTI
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

--CHECK PATENTE CON IL TIPO DEL VEICOLO
CREATE OR REPLACE TRIGGER checkPatente 
before insert on autista
FOR EACH ROW 
DECLARE 
checkVeicolo veicolo.tipo_veicolo%type;
Error1 EXCEPTION;

BEGIN
select tipo_veicolo into checkVeicolo from veicolo where targa = :new.targa_autista;

if checkVeicolo = 'motrice' AND :new.tipo_patente = 'B1' then 
raise Error1;
elsif checkVeicolo = 'bilico' AND :new.tipo_patente = 'B1' then 
raise Error1;
elsif checkVeicolo = 'bilico' AND :new.tipo_patente = 'C1' then 
raise Error1;
elsif checkVeicolo = 'autotreno' AND :new.tipo_patente != 'CE' then 
raise Error1;
end if;

EXCEPTION
when Error1 then
raise_application_error(-20001,'QUESTO VEICOLO NON PUO ESSERE GUIDATO CON TALE PATENTE');
END;

--6.TRIGGER NON PUOI AGGIUNGERE FERIE SE CI SONO GIA DUE PERSONE NELLO STESSO UFFICIO IN FERIE

CREATE OR REPLACE TRIGGER check_ferie
BEFORE INSERT ON FERIE
FOR EACH ROW
DECLARE
num_ufficio VARCHAR2(2);
contatore_impiegati NUMBER;
underImpiegati EXCEPTION;
BEGIN

select ufficio_impiegato into num_ufficio from impiegato im
join dipendente dip on dip.cf = im.cf_impiegato
where cf_impiegato = :new.cod_fiscale_ferie;

select count(*) into contatore_impiegati from impiegato 
join dipendente dip on cf_impiegato = dip.cf 
where UFFICIO_IMPIEGATO = num_ufficio
and cf_impiegato != :new.cod_fiscale_ferie;


if (contatore_impiegati > 2) then
  raise underImpiegati;
end if;


EXCEPTION

when underImpiegati then
raise_application_error(-20001,'Non è possibile assegnare queste ferie poichè l''ufficio di competenza rimarrebbe vuoto');
END;


--7. Non è possibile inserire una presenza se l'impiegato è in ferie
CREATE OR REPLACE TRIGGER checkPresFerie
before insert on presenza
for each row
DECLARE
check_ferie EXCEPTION;
contatore NUMBER;
BEGIN
select count(*) into contatore from ferie 
where cod_fiscale_ferie = (select cf_presenza from impiegato im 
join presenza pr on im.cf_impiegato = pr.cf_presenza
where cf_presenza = :new.cf_presenza
and :new.data_presenza between DATA_INIZIO_FERIE and DATA_FINE
group by cf_presenza
);

if contatore >0 then
    raise check_ferie;
end if;


EXCEPTION
when check_ferie then
raise_application_error(-20001,'Non è possibile inserire una presenza poichè il dipednente è in ferie');
end;

--8. NON PUOI ELIMINARE UN UFFICIO SE CI SONO DEGLI IMPIEGATI ASSEGNATI AD ESSO
CREATE OR REPLACE TRIGGER check_elim_uff
before delete on ufficio
for each row
DECLARE
num_impiegati_uff ufficio.num_impiegati%type;
ufficio_imp impiegato.ufficio_impiegato%type;
overNumImp EXCEPTION;
BEGIN

select count(*) into num_impiegati_uff 
from impiegato  
where ufficio_impiegato = :old.num_ufficio
group by ufficio_impiegato;

if (num_impiegati_uff != 0) then
raise overNumImp;
end if;

EXCEPTION
when overNumImp then
raise_application_error(-20001,'Non è possibile eliminare l''ufficio poichè esistono degli impiegati assegnati ad esso');
end;


--CHECK NUMERO MASSIMO DI SPEDIZIONI PER OGNI VIAGGIO

CREATE OR REPLACE TRIGGER checkNumSped
Before insert on spedizione
FOR EACH ROW
DECLARE
NumTotSpedizione int;
err1 exception;

BEGIN
select count(*) into NumTotSpedizione from viaggio join spedizione on cf_viaggio = cf_spedizione and data_spedizione = data_viaggio
where data_viaggio = :new.data_spedizione
and cf_viaggio = :new.cf_spedizione;

if (NumTotSpedizione + 1 > 3) then 
raise err1;
end if;

EXCEPTION
when err1 then
DBMS_OUTPUT.PUT_LINE('Hai raggiunto il numero massimo di spedizioni');
END;

----------------------------------PROCEDURE----------------------------------

--1.  ELEZIONE NUOVO DIRETTORE
CREATE OR REPLACE PROCEDURE nuovoDirettore (CodFiscale varchar)
IS
nomeDir varchar2(30);
cognomeDir varchar2(30);
cod_fiscale VARCHAR(16);
giaDirettore EXCEPTION;
CodDirettore varchar2(30);

BEGIN
select cf_impiegato into CodDirettore from impiegato where mansione = 'Direttore';

if CodDirettore = CodFiscale then
raise giaDirettore;
end if;

select nome, cognome, cf  into nomeDir,cognomeDir,cod_fiscale from impiegato im 
join dipendente dip on im.cf_impiegato = dip.cf 
join contratto on cf_impiegato = cf_contratto 
WHERE cf = codFiscale
AND MANSIONE != 'Segretario'
and tipo_contratto = 'Indeterminato';


update impiegato set mansione = 'Manager' where mansione = 'Direttore';
update impiegato set mansione = 'Direttore' where cf_impiegato = CodFiscale;
DBMS_OUTPUT.PUT_LINE('L''impiegato ' || (nomeDir) ||' ' || (cognomeDir) ||' è ufficialmente il nuovo direttore');

EXCEPTION
when NO_DATA_FOUND then
DBMS_OUTPUT.PUT_LINE('L''impiegato ' || (nomeDir) ||' ' || (cognomeDir) ||' non può diventare direttore per le regole aziendali'); 

when giaDirettore then
DBMS_OUTPUT.PUT_LINE('L''impiegato ' || (nomeDir) ||' ' || (cognomeDir) ||' è gia Direttore');
COMMIT;
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

CREATE OR REPLACE PROCEDURE ScheduleViaggio(dataViaggio date, kilometri number,pivaforn varchar, pivaesterna varchar, orario_cons date, peso_in int, tipo_In varchar2)
IS
AutistaCandidato autista.cf_autista%type;
error1 exception;
error2 exception;
numSoste viaggio.num_soste%type := floor(kilometri/300);
DurataViaggio int := floor(Kilometri/90);
DurataIn viaggio.durata%type;
viaggioIn viaggio.data_viaggio%type;
numTracc integer := dbms_random.value(1000000000,9999999999);
contatore number := 0;
dataAssegnata viaggio.data_viaggio%type;
dataAssegnataFinale viaggio.data_viaggio%type;
--NUMERO RANDOM BOLLA CON 4 LETTERE E 6 NUMERI
random_value integer := dbms_random.value(100000,999999); 
random_value_string varchar2(4) := dbms_random.string('X',4); 
num_bolla_nuovo varchar2(10) := random_value_string || (random_value); 

BEGIN
    while(AutistaCandidato IS NULL)
    loop
    BEGIN
    
    select cf_autista, (data_viaggio) into AutistaCandidato, dataAssegnata  from viaggio join autista on cf_viaggio = cf_autista
    where data_viaggio <= (dataViaggio+contatore)
    and not
    (dataViaggio+contatore) between data_viaggio and (data_viaggio+(durata/24)+8/24) and
    not ((dataViaggio+contatore)+(durataViaggio/24)+8/24) between data_viaggio and (data_viaggio+(durata/24)+8/24)
    group by cf_autista,data_viaggio
    order by data_viaggio
    fetch first 1 row only;
    

    if (dataViaggio != dataAssegnata) then
        raise error1;
    elsif (dataViaggio = dataAssegnata) then 
        raise error2;
    end if;



EXCEPTION
    when error1 then
    select durata, data_viaggio into durataIN, viaggioIn from viaggio where cf_viaggio = AutistaCandidato 
    and data_viaggio <= dataViaggio order by data_viaggio
    fetch first 1 row only;
    
    dataAssegnataFinale := viaggioIn + durataIn/24 + 8/24;

    if (dataAssegnataFinale < dataViaggio) then
        select durata, data_viaggio into durataIN, viaggioIn from viaggio where cf_viaggio = AutistaCandidato 
        and data_viaggio > dataViaggio order by data_viaggio
        fetch first 1 row only;
        dataAssegnataFinale := dataViaggio;
    end if;
    
    when error2 then
    DBMS_OUTPUT.PUT_LINE('Error 2: dataAssegnata ' || (dataAssegnata));
    select durata, data_viaggio into durataIN, viaggioIn from viaggio where cf_viaggio = AutistaCandidato
    and data_viaggio = dataViaggio;
    dataAssegnataFinale := dataAssegnata + durataIn/24 + 8/24;
    
    when NO_DATA_FOUND then
    contatore := +1;
    end;
    end loop;
    DBMS_OUTPUT.PUT_LINE('End : Il viaggio puo essere schedulato nella seguente data: '|| to_char(dataAssegnataFinale,'yyyy-mm-dd hh24:mi') || ' Autista: '|| (AutistaCandidato)) ;

    insert into viaggio values (dataAssegnataFinale,AutistaCandidato,pivaforn,kilometri,numSoste,DurataViaggio);
    insert into spedizione values (numTracc,dataAssegnataFinale,AutistaCandidato,orario_cons,pivaesterna);
	insert into lotto values (num_bolla_nuovo,numTracc,peso_in,tipo_in);
end;


--4. PROCEDURA DI UNA PROMOZIONE DI UN SEGRETARIO A MANAGER

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

--PROCEDURA TREDICESIMA, QUATTORDICESIMA

CREATE OR REPLACE PROCEDURE check_bonus(nomeIn varchar2, cognomeIn varchar2)

IS
importo_stip stipendio.importo%type;
nomeSt dipendente.nome%type;
cognomeSt dipendente.cognome%type;
codice_stipendio stipendio.contratto_stipendio%type;
BEGIN

select nome, cognome , importo, contratto_stipendio into nomeSt, cognomeSt, importo_stip, codice_stipendio from dipendente dip join contratto cont
on dip.cf = cont.cf_contratto join stipendio st on cont.codice_contratto  = st.contratto_stipendio
where nome = nomeIn and cognome = CognomeIn  
and data_stipendio between date'2022-06-01' and date'2022-06-30' 
or data_stipendio between date'2022-12-01' and date'2022-12-31';

UPDATE stipendio set importo = importo_stip*1.3 where contratto_stipendio = codice_stipendio; --30% in piu

DBMS_OUTPUT.PUT_LINE('L''impiegato' || (nomeSt) ||' ' || (cognomeSt) ||'ha ricevuto l''aumento'); 


EXCEPTION
when NO_DATA_FOUND then
DBMS_OUTPUT.PUT_LINE('L''impiegato' || (nomeSt) ||' ' || (cognomeSt) ||' non ha ancora percepito lo stipendio'); 
END; 

---
CREATE OR REPLACE PROCEDURE rinnova_contratto(cf_in varchar, tipo_contratto_in varchar, durata_in number) 
 
IS 
data_contratto date; 
random_value integer := dbms_random.value(1000000,9999999); 
random_value_string varchar(3) := dbms_random.string('X',3); 
tp_contratto contratto.tipo_contratto%type; 
codice_contratto_nuovo varchar2(10) := random_value_string || (random_value); 
err1 EXCEPTION; 
BEGIN 







select tipo_contratto,sysdate into tp_contratto, data_contratto from dipendente join contratto on cf = cf_contratto where cf = cf_in 
order by data_inizio_contratto desc 
fetch first 1 row only; 
 
if tp_contratto = 'Indeterminato' and tipo_contratto_in = 'Indeterminato' then 
    raise err1; 
elsif tp_contratto != 'Indeterminato' then 
    insert into contratto  values (codice_contratto_nuovo,cf_in,durata_in,tipo_contratto_in,data_contratto); 
end if; 
 
EXCEPTION 
when err1 then 
DBMS_OUTPUT.PUT_LINE('Rinnovo del contratto non avvenuto poichè il dipendente ha gia un contratto a tempo indeterminato'); 
END; 
