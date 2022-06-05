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

--CONTROLLA SE IL PESO DEL LOTTO PUO ESSERE PRESO DAL CAMION
||| PER FARLA FUNZIONARE SI DOVREBBE AGGIUNGERE UNA CHIAVE ESTERNA CHE COLLEGA L'AZIENDA ESTERNA AL VIAGGIO CON IL NOME p_iva_az_esterna |||

 
CREATE OR REPLACE TRIGGER checkPeso
before insert or update on lotto
for each row
DECLARE
overPeso EXCEPTION;
BEGIN
if(select peso_massimo from lotto lt join spedizione sp on lt.tracciamento_lotto = sp.num_tracciamento join azienda_esterna ae on sp.p_iva_aziendaArrivo = ae.p_iva_azienda_esterna join viaggio vg on ar.p_iva_azeinda_esterna = vg.p_iva_az_esterna join autista au on vg.cf_viaggio = au.cf_autista join veicolo vc on au.targa_autista = vc.targa) < :new.peso_lotto then
reise overPeso;
end if;
EXCEPTION
when overPeso then
raise_application_error(-20001,'Il camion non puo contenere questo lotto');
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
