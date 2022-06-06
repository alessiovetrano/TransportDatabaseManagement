/* CREAZIONE TABELLE  		*/

--OK
CREATE TABLE dipendente (
cf VARCHAR2(16) NOT NULL PRIMARY KEY,
nome VARCHAR2(20) NOT NULL,
cognome VARCHAR2(20) NOT NULL,
data_nascita DATE NOT NULL,
data_assunzione DATE NOT NULL,


CONSTRAINT data_assunzione_check CHECK(

	TO_CHAR(data_assunzione,'YYYY-MM-DD') between '1990-01-01' AND '2022-01-01')

);


--OK
CREATE TABLE veicolo (
targa VARCHAR2(7) NOT NULL PRIMARY KEY,
costo_veicolo INT NOT NULL,
peso_massimo NUMBER(3) NOT NULL,
tipo_veicolo VARCHAR2(20) NOT NULL,
casa_produttrice VARCHAR2(10) NOT NULL,
CONSTRAINT targa_mask CHECK(
	REGEXP_LIKE(targa,'[A-Z]{2}[0-9]{3}[A-Z]{2}')),

CONSTRAINT veicolo_ammesso CHECK(
	LOWER(tipo_veicolo) IN
		('furgone','motrice','bilico','autotreno')),

CONSTRAINT casa_prod CHECK(
	INITCAP(casa_produttrice) IN
		('Mercedes','Iveco','Scania','Daf')),

CONSTRAINT peso_veicolo CHECK(
	(LOWER(tipo_veicolo) = 'furgone' AND peso_massimo = 10)
	OR
	(LOWER(tipo_veicolo) = 'motrice' AND peso_massimo = 25)
	OR
	(LOWER(tipo_veicolo) = 'bilico' AND peso_massimo = 240)
	OR
	(LOWER(tipo_veicolo) = 'autotreno' AND peso_massimo = 260))
);

--OK
CREATE TABLE ufficio (
num_ufficio VARCHAR2(2) NOT NULL PRIMARY KEY,
Piano_ufficio INT NOT NULL,
num_impiegati INT NOT NULL
);

--OK
CREATE TABLE officina (
p_iva_officina VARCHAR2(11) PRIMARY KEY,
nome VARCHAR2(20) NOT NULL,
via VARCHAR2(30) NOT NULL,
citta VARCHAR2(20) NOT NULL,
cap VARCHAR2(5) NOT NULL
);

--OK
CREATE TABLE fornitore (
p_iva_fornitore VARCHAR2(11) PRIMARY KEY,
nome VARCHAR2(30) NOT NULL,
via VARCHAR2(30) NOT NULL,
citta VARCHAR2(20) NOT NULL,
cap VARCHAR2(5) NOT NULL,
tipo_prodotto VARCHAR2(30) NOT NULL
);


CREATE TABLE ferie (
data_inizio_ferie DATE,
Cod_fiscale_ferie VARCHAR(16),
data_fine DATE NOT NULL,
Retribuzione INT,
tipo_ferie VARCHAR(30),
PRIMARY KEY(data_inizio_ferie,Cod_fiscale_ferie),
FOREIGN KEY(Cod_fiscale_ferie) REFERENCES dipendente(cf)
ON DELETE CASCADE
);


--OK
CREATE TABLE impiegato (
cf_impiegato VARCHAR2(16) PRIMARY KEY,
ufficio_impiegato VARCHAR2(2) NOT NULL,
codice_badge VARCHAR2(5) NOT NULL UNIQUE,
mansione VARCHAR2(30) NOT NULL,
FOREIGN KEY(ufficio_impiegato) REFERENCES ufficio(num_ufficio)
ON DELETE CASCADE,
FOREIGN KEY(cf_impiegato) REFERENCES dipendente(cf)
ON DELETE CASCADE,

CONSTRAINT cf_ammesso CHECK(
	REGEXP_LIKE(cf_impiegato,'[A-Z]{6}[0-9]{2}[A-Z][0-9]{2}[A-Z][0-9]{3}[A-Z]')),

CONSTRAINT mansione_ammessa CHECK(
	LOWER(mansione) IN
	('segretario','analista','legale','manager','direttore'))
);


CREATE TABLE contratto (
codice_contratto VARCHAR2(10) NOT NULL PRIMARY KEY,
cf_contratto VARCHAR2(16) NOT NULL,
durata_contratto NUMBER,
tipo_contratto VARCHAR2(25) NOT NULL,
FOREIGN KEY(cf_contratto) REFERENCES dipendente(cf)
ON DELETE CASCADE,

CONSTRAINT cod_contratto CHECK(
	REGEXP_LIKE(codice_contratto,'[A-Z]{3}[0-9]{7}')),

CONSTRAINT cf_contratto_mask CHECK(
	REGEXP_LIKE(cf_contratto,'[A-Z]{6}[0-9]{2}[A-Z][0-9]{2}[A-Z][0-9]{3}[A-Z]'))

);


CREATE TABLE stipendio (
data_stipendio DATE,
contratto_stipendio VARCHAR2(10) NOT NULL,
importo NUMBER(4) NOT NULL,
trattenute NUMBER(3) NOT NULL,
FOREIGN KEY(contratto_stipendio) REFERENCES contratto(codice_contratto)
ON DELETE CASCADE,
PRIMARY KEY(data_stipendio,contratto_stipendio),

CONSTRAINT cod_contratto_stipendio CHECK(
	REGEXP_LIKE(contratto_stipendio,'[A-Z]{3}[0-9]{7}'))
);

--OK
CREATE TABLE autista (
cf_autista VARCHAR2(16) PRIMARY KEY,
tipo_patente VARCHAR2(3) NOT NULL,
num_patente VARCHAR2(10) NOT NULL UNIQUE,
targa_autista VARCHAR2(7) NOT NULL UNIQUE,
FOREIGN KEY (targa_autista) REFERENCES veicolo(targa)
ON DELETE CASCADE,
FOREIGN KEY(cf_autista) REFERENCES dipendente(cf)
ON DELETE CASCADE,

CONSTRAINT cf_autista_mask CHECK(
	REGEXP_LIKE(cf_autista,'[A-Z]{6}[0-9]{2}[A-Z][0-9]{2}[A-Z][0-9]{3}[A-Z]')),

CONSTRAINT targa_autista_mask CHECK(
	REGEXP_LIKE(targa_autista,'[A-Z]{2}[0-9]{3}[A-Z]{2}')),

CONSTRAINT tipo_patente_mask CHECK (
	UPPER(tipo_patente) IN
		('B1','C1','C','CE')),

CONSTRAINT num_patente_mask CHECK (
	REGEXP_LIKE(num_patente,'[A-Z]{2}[0-9]{7}[A-Z]'))
);


CREATE TABLE presenza (
Data_presenza DATE,
cf_presenza VARCHAR2(16),
ora_entrata DATE,
ora_uscita DATE,
FOREIGN KEY(cf_presenza) REFERENCES impiegato(cf_impiegato)
ON DELETE CASCADE,
PRIMARY KEY(data_presenza,cf_presenza),

CONSTRAINT cf_presenza_mask CHECK(
	REGEXP_LIKE(cf_presenza,'[A-Z]{6}[0-9]{2}[A-Z][0-9]{2}[A-Z][0-9]{3}[A-Z]')),

CONSTRAINT data_presenza_check CHECK(


	TO_CHAR(data_presenza,'YYYY-MM-DD') > '1990-01-01') --CONTROLLA SE FUNZIONA


);


CREATE TABLE manutenzione (
fattura_manutenzione VARCHAR2(6) NOT NULL PRIMARY KEY,
targa_manutenzione VARCHAR2(7) NOT NULL,
p_iva_meccanico VARCHAR2(11) NOT NULL,
costo_manutenzione NUMBER(4) NOT NULL,
data_inizio_man DATE NOT NULL,
data_fine_man DATE NOT NULL,
FOREIGN KEY(targa_manutenzione) REFERENCES veicolo(targa)
ON DELETE CASCADE,
FOREIGN KEY(p_iva_meccanico) REFERENCES officina(p_iva_officina),

CONSTRAINT targa_manutenzione_mask CHECK(
	REGEXP_LIKE(targa_manutenzione,'[A-Z]{2}[0-9]{3}[A-Z]{2}'))
);

-- HA SENSO AGGIUNGERE AZIENDA DI PARTENZA E AZIENDA DI ARRIVO! 
-- UTILE ANCHE PER IL JOIN E LA CREAZIONE DEL TRIGGER
CREATE TABLE viaggio (
Data_viaggio DATE,
cf_viaggio VARCHAR2(16),
p_iva_forn VARCHAR2(11) NOT NULL,
km_totali NUMBER(4) NOT NULL,
num_soste INT NOT NULL,
Durata INT NOT NULL,
Ora_carico DATE NOT NULL,
PRIMARY KEY(data_viaggio,cf_viaggio),
FOREIGN KEY(cf_viaggio) REFERENCES autista(cf_autista)
ON DELETE CASCADE,
FOREIGN KEY(p_iva_forn) REFERENCES fornitore(p_iva_fornitore),


CONSTRAINT cf_viaggio_mask CHECK(
	REGEXP_LIKE(cf_viaggio,'[A-Z]{6}[0-9]{2}[A-Z][0-9]{2}[A-Z][0-9]{3}[A-Z]'))
);

--OK
CREATE TABLE azienda_esterna (
p_iva_azienda_esterna VARCHAR2(11) PRIMARY KEY,
nome VARCHAR2(30) NOT NULL,
via VARCHAR2(30) NOT NULL,
citta VARCHAR2(20) NOT NULL,
cap VARCHAR2(5) NOT NULL,
email VARCHAR(30) NOT NULL UNIQUE,

CONSTRAINT email_mask CHECK (
	REGEXP_LIKE(email,'^\w+.*@{1}\w+.*$')) --nome@posta.it
);


CREATE TABLE spedizione (
num_tracciamento VARCHAR2(10) PRIMARY KEY,
data_spedizione DATE NOT NULL,
cf_spedizione VARCHAR(16),
p_iva_aziendaArrivo VARCHAR2(11) NOT NULL,
FOREIGN KEY(data_spedizione,cf_spedizione) REFERENCES viaggio(data_viaggio,cf_viaggio),
FOREIGN KEY(p_iva_aziendaArrivo) REFERENCES azienda_esterna(p_iva_azienda_esterna)
);


CREATE TABLE lotto (
bolla_trasporto VARCHAR(10) PRIMARY KEY,
tracciamento_lotto VARCHAR2(10) NOT NULL,
peso_lotto NUMBER(2) NOT NULL,
FOREIGN KEY(tracciamento_lotto) REFERENCES spedizione(num_tracciamento)
ON DELETE CASCADE,
CONSTRAINT bolla_ammessa CHECK (
	REGEXP_LIKE(bolla_trasporto,'[A-Z]{4}[0-9]{6}'))
);
