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
