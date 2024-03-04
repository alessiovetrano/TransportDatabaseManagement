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
COMMIT;
DBMS_OUTPUT.PUT_LINE('L''impiegato ' || (nomeDir) ||' ' || (cognomeDir) ||' è ufficialmente il nuovo direttore');

EXCEPTION
when NO_DATA_FOUND then
DBMS_OUTPUT.PUT_LINE('L''impiegato ' || (nomeDir) ||' ' || (cognomeDir) ||' non può diventare direttore per le regole aziendali'); 

when giaDirettore then
DBMS_OUTPUT.PUT_LINE('L''impiegato ' || (nomeDir) ||' ' || (cognomeDir) ||' è gia Direttore');
END; 

--
--2.PROCEDURA CONTA ORA DI PRESENZA - FAI CONTROLLO SE ESISTE NELLA TABELLA CON MESSAGGIO D'ERRORE
--UTLIZZO TRE TABELLE DIVERSE
CREATE OR REPLACE PROCEDURE contaOre (nomeP varchar, cognomeP varchar)
IS
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

exception

when no_data_found then
DBMS_OUTPUT.PUT_LINE('Non esiste il dipendente nel database'); 
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
random_value_string varchar2(4) := dbms_random.string('U',4);    
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
    COMMIT;
	
end; 

--4. PROCEDURA DI UNA PROMOZIONE DI UN SEGRETARIO A MANAGER

CREATE OR REPLACE PROCEDURE promozione(nomep varchar2, cognomep varchar2) -- PROMOZIONE DA SEGRETARIO A MANAGER
IS
mansione_im impiegato.mansione%type;
nomeProm dipendente.nome%type;
cognomeProm dipendente.cognome%type;
cfprom dipendente.cf%type;
tp_contratto contratto.tipo_contratto%type;
BEGIN
select nome, cognome, cf_impiegato, mansione, tipo_contratto into nomeProm, cognomeProm, cfprom, mansione_im, tp_contratto from impiegato im
join dipendente dip on dip.cf = im.cf_impiegato  
join contratto contr on dip.cf = contr.cf_contratto 
where nomep = nome and cognomep = cognome
order by data_inizio_contratto desc
fetch first 1 row only;

if lower(mansione_im) = 'segretario' and (tp_contratto = 'Indeterminato' or tp_contratto = 'Determinato') then
    UPDATE IMPIEGATO set mansione = 'manager' where cf_impiegato = cfprom;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Il dipendente '|| (nomep) ||' ' ||(cognomep)||' è stato promosso correttamente');
else
    DBMS_OUTPUT.PUT_LINE('Il dipendente '|| (nomep) ||' ' ||(cognomep)|| ' non è un segretario a tempo determinato o indeterminato');
    ROLLBACK;
    end if;
EXCEPTION
WHEN NO_DATA_FOUND THEN
DBMS_OUTPUT.PUT_LINE('Il dipendente non esiste nel data_base');
end;
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
    COMMIT;
end if;
DBMS_OUTPUT.PUT_LINE('ELIMINAZIONE DAL DATA-BASE ANDATA A BUON FINE');

EXCEPTION
when error1 then 
raise_application_error(-20001,'NON PUOI LICENZIARE UN DIRETTORE SENZA AVERNE ELETTO UN ALTRO');
when no_data_found then
DBMS_OUTPUT.PUT_LINE('Non esiste il dipendente nel database'); 

END;

--PROCEDURA TREDICESIMA, QUATTORDICESIMA

CREATE OR REPLACE PROCEDURE check_bonus(nomeIn varchar2, cognomeIn varchar2) 
 
IS 
importo_stip stipendio.importo%type; 
nomeSt dipendente.nome%type; 
cognomeSt dipendente.cognome%type; 
codice_stipendio stipendio.contratto_stipendio%type; 
data_s stipendio.data_stipendio%type; 
BEGIN 
 
select nome, cognome , importo, contratto_stipendio, data_stipendio into nomeSt, cognomeSt, importo_stip, codice_stipendio, data_s from dipendente dip join contratto cont 
on dip.cf = cont.cf_contratto join stipendio st on cont.codice_contratto  = st.contratto_stipendio 
where nome = nomeIn and cognome = CognomeIn   
and data_stipendio between date'2022-06-01' and date'2022-06-30'  
or data_stipendio between date'2022-12-01' and date'2022-12-31'; 
 
UPDATE stipendio set importo = importo_stip*1.3 where contratto_stipendio = codice_stipendio and data_s = data_stipendio ; --30% in piu 
COMMIT;
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
random_value_string varchar(3) := dbms_random.string('U',3); 
tp_contratto contratto.tipo_contratto%type; 
codice_contratto_nuovo varchar2(10) := random_value_string || (random_value); 
err1 EXCEPTION; 
mansioneIN impiegato.mansione%type;
BEGIN 


select tipo_contratto,sysdate, mansione into tp_contratto, data_contratto, mansioneIN
from dipendente join contratto on cf = cf_contratto 
join impiegato on cf_impiegato = cf
where cf = cf_in 
order by data_inizio_contratto desc 
fetch first 1 row only; 
 
if tp_contratto = 'Indeterminato' and tipo_contratto_in = 'Indeterminato' then 
    raise err1; 
elsif tp_contratto != 'Indeterminato' then 
    insert into contratto  values (codice_contratto_nuovo,cf_in,durata_in,tipo_contratto_in,data_contratto); 
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Rinnovo del contratto avvenuto con successo. Ora il suo contratto è di tipo: ' || (tp_contratto) ||', con la mansione di: ' || (mansioneIN)); 

end if; 
 
EXCEPTION 
when err1 then 
DBMS_OUTPUT.PUT_LINE('Rinnovo del contratto non avvenuto poichè il dipendente ha gia un contratto a tempo indeterminato');
when no_data_found then
DBMS_OUTPUT.PUT_LINE('Il dipendente non esiste nel database');
END;
