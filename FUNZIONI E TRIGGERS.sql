/*----OPERAZIONI DATA-BASE

* 9 TRIGGERS
* 6 PROCEDURE

*/
-----------------------TRIGGERS------------------------------

--CHECK DIPENDENTE MAGGIORENNE
CREATE OR REPLACE TRIGGER maggiorenne
before insert on dipendente
for each row
DECLARE
check_maggiorenne EXCEPTION;
BEGIN
floor((sysdate-:new.data_nascita)/365)
if (floor((sysdate-:new.data_nascita)/365) < 17) then
raise check_maggiorenne;
end if;
EXCEPTION
when check_maggiorenne then
raise_application_error(-20001,'DIPENDENTE MINORENNE');
end;

--CHECK SINGOLO DIRETTORE AZIENDALE
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
raise_application_error(-20001,'Esiste già un direttore in azienda');
end;



-- CHECK SE L'OFFICINA HA NELLO STESSO PERIODO HA DUE VEICOLI NON PUO INSERIRE IL TERZO
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
raise_application_error(-20001,'Officina troppo piena');
END;


--DIPENDENTE TROPPO ANZIANO (OVER 60)
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
raise_application_error(-20001,'Il dipendente è troppo anziano per gli standard aziendali');
END;


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
raise_application_error(-20001,'Il camion non può contenere questo lotto');
END;





-- CHECK MASSIMO NUMERO DI DIPENDENTI
CREATE OR REPLACE TRIGGER checkNumDip
before insert or update on dipendente
for each row
DECLARE
MaxNumDip EXCEPTION;
cont NUMBER;
BEGIN
select count(*) into cont from dipendente;
if (cont=35) then
raise MaxNumDip;
end if;
EXCEPTION
when MaxNumDip then
raise_application_error(-20001,'Raggiunto massimo numero di dipendenti');
END;

----------------------------------PROCEDURE----------------------------------

--LICENZIAMENTO DIPENDENTE (IMPIEGATO/AUTISTA)
CREATE OR REPLACE PROCEDURE licenziamento(codFiscale varchar)
IS
BEGIN
delete from dipendente where cf = codFiscale;
END;
