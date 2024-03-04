-CHECK DIPENDENTE MAGGIORENNE O TROPPO ANZIANO
CREATE OR REPLACE TRIGGER checkEta
before insert on dipendente
for each row
DECLARE
check_eta EXCEPTION;
BEGIN
if (floor((sysdate-:new.data_nascita)/365) < 18 OR (floor((sysdate-:new.data_nascita)/365)) > 60 ) then
raise check_eta;
end if;
EXCEPTION
when check_eta then
raise_application_error(-20001,'Il candidato dipendente non rientra nei paramentri di assunzione');
end;


--1.CHECK SINGOLO DIRETTORE AZIENDALE + CHECK CAPIENZA UFFICIO
CREATE OR REPLACE TRIGGER checkMansione
before insert on impiegato
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
CREATE OR REPLACE TRIGGER checkPres
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

