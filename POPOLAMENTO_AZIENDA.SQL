/*		POPOLAMENTO AZIENDA 		*/



----DIPENDENTI POPOLAZIONE -- 20 DIPENDENTI
Insert all
	into dipendente (cf,nome,cognome,data_nascita,data_assunzione) values('CLMGLC85L02I926V','Gianluca','Colombarini',DATE '1985-07-02',DATE '2004-01-01')
	into dipendente (cf,nome,cognome,data_nascita,data_assunzione) values('MRTPLN65L69G577R','Apollonia','Mortari',DATE '1965-07-29',DATE '2004-09-01')
	into dipendente (cf,nome,cognome,data_nascita,data_assunzione) values('SPNRSR76H05F578I','Rosario','Spina',DATE '1976-06-05',DATE'1998-01-01')
	into dipendente (cf,nome,cognome,data_nascita,data_assunzione) values('SRCLND77S27G601O','Olindo','Sarci',DATE '1977-11-27',DATE'2002-09-01')
	into dipendente (cf,nome,cognome,data_nascita,data_assunzione) values('CHPPPN95H19F806J','Pomponio','Chiappa',DATE '1995-06-19',DATE'2015-09-01')
	into dipendente (cf,nome,cognome,data_nascita,data_assunzione) values('CRTNDR94P22A310N','Andrea','Carta',DATE '1994-09-22',DATE'2016-01-01')
	into dipendente (cf,nome,cognome,data_nascita,data_assunzione) values('SDNGTR73T41F025B','Geltrude','Sodano',DATE '1973-12-01',DATE'1998-01-01')
	into dipendente (cf,nome,cognome,data_nascita,data_assunzione) values('BSLCLL67C08L155K','Camillo','Bosello',DATE '1967-3-08',DATE'2006-09-01')
	into dipendente (cf,nome,cognome,data_nascita,data_assunzione) values('FVLPRN75R41A139W','Petronilla','Favalli',DATE '1975-10-01',DATE'2002-09-01')
	into dipendente (cf,nome,cognome,data_nascita,data_assunzione) values('LNNGST70B20D443N','Augusto','Alunno',DATE '1970-02-20',DATE'2005-09-01')
	into dipendente (cf,nome,cognome,data_nascita,data_assunzione) values('VLLGPR97E08F089M','Gaspare','Valle',DATE '1997-05-08',DATE'2020-01-01')
	into dipendente (cf,nome,cognome,data_nascita,data_assunzione) values('DOXSST85E28B869H','Sisto','Do',DATE '1985-5-28',DATE'2002-10-01')
	into dipendente (cf,nome,cognome,data_nascita,data_assunzione) values('BTTPTR92P30E158C','Pietro','Bettega',DATE '1992-11-30',DATE'2011-08-01')
	into dipendente (cf,nome,cognome,data_nascita,data_assunzione) values('PVNLNZ68S18L974V','Lorenzo','Pavoncelli',DATE '1968-11-18',DATE'2000-06-01')
	into dipendente (cf,nome,cognome,data_nascita,data_assunzione) values('NCRCRD70D14D315A','Corrado','Incerti',DATE '1970-04-14',DATE'1997-03-01')
	into dipendente (cf,nome,cognome,data_nascita,data_assunzione) values('SMCRLD67H20B617Z','Arialdo','Osmici',DATE '1967-06-20',DATE'2001-01-01')
	into dipendente (cf,nome,cognome,data_nascita,data_assunzione) values('RPSLNZ87E52I963W','Lorenza','Repossi',DATE'1987-05-12',DATE'2009-03-01')
	into dipendente (cf,nome,cognome,data_nascita,data_assunzione) values('VTRLSS98T11F839O','Alessio','Vetrano',DATE '1998-12-11',DATE'2021-01-01')
	into dipendente (cf,nome,cognome,data_nascita,data_assunzione) values('GLLLGU01M17F839G','Luigi','Galluccio',DATE '2001-08-17',DATE'2021-01-01')
	into dipendente (cf,nome,cognome,data_nascita,data_assunzione) values('DNNLCU01E15F839T','Luca','Danna',DATE '2001-05-15',DATE'2022-01-01')
	into dipendente (cf,nome,cognome,data_nascita,data_assunzione) values('CRUVLR88C23E922X','Valerio','Curi',DATE '1988-03-23',DATE'2009-01-01')
	into dipendente (cf,nome,cognome,data_nascita,data_assunzione) values('QRNRNN94E52I566X','Rosanna','Quirino',DATE '1984-05-12',DATE'2006-01-01')
	into dipendente (cf,nome,cognome,data_nascita,data_assunzione) values('GPPFNZ63A17G455X','Fiorenzo','Giupponi',DATE '1963-01-17',DATE'1994-10-01')
	into dipendente (cf,nome,cognome,data_nascita,data_assunzione) values('RMNGDI92S47F048Q','Giada','Iurman',DATE '1992-11-07',DATE'2013-01-01')
	into dipendente (cf,nome,cognome,data_nascita,data_assunzione) values('DSSSSN84R30C649B','Sansone','Adessi',DATE '1984-10-30',DATE'2004-09-01')
	into dipendente (cf,nome,cognome,data_nascita,data_assunzione) values('DFZSLA76E68L865H','Ausilia','De Fazi',DATE '1976-05-28',DATE'1998-07-01')
	into dipendente (cf,nome,cognome,data_nascita,data_assunzione) values('CNGRDT64S13E866D','Ardito','Coniglione',DATE '1964-11-13',DATE'1992-01-01')
	into dipendente (cf,nome,cognome,data_nascita,data_assunzione) values('SRCSLV85E54D267Z','Silvia','Sarcone',DATE '1985-05-14',DATE'2012-11-01')
	into dipendente (cf,nome,cognome,data_nascita,data_assunzione) values('CRLBGD75D59F678Q','Brigida','Carlesso',DATE '1975-04-19',DATE'2002-02-01')
	into dipendente (cf,nome,cognome,data_nascita,data_assunzione) values('LPRBRN76R42F839H','Bruna','Lepora',DATE '1976-10-02',DATE'2002-01-01')

	SELECT 1 FROM DUAL;


--VEICOLO -- 20 VEICOLI

insert all

	into veicolo (targa, costo_veicolo, peso_massimo, tipo_veicolo, casa_produttrice) values	('BA767WF','32000',10,'furgone','Mercedes')
	into veicolo (targa, costo_veicolo, peso_massimo, tipo_veicolo, casa_produttrice) values	('CZ371YF','117000',260,'autotreno','Mercedes')
	into veicolo (targa, costo_veicolo, peso_massimo, tipo_veicolo, casa_produttrice) values	('FS717BG','57000',25,'motrice','Daf')
	into veicolo (targa, costo_veicolo, peso_massimo, tipo_veicolo, casa_produttrice) values	('CD121FR','98000',240,'bilico','Iveco')
	into veicolo (targa, costo_veicolo, peso_massimo, tipo_veicolo, casa_produttrice) values	('FW123FC','29500',10,'furgone','Iveco')
	into veicolo (targa, costo_veicolo, peso_massimo, tipo_veicolo, casa_produttrice) values	('CZ441YF','122000',260,'autotreno','Daf')
	into veicolo (targa, costo_veicolo, peso_massimo, tipo_veicolo, casa_produttrice) values	('DF717GG','34200',10,'furgone','Daf')
	into veicolo (targa, costo_veicolo, peso_massimo, tipo_veicolo, casa_produttrice) values	('FZ121ER','53200',25,'motrice','Scania')
	into veicolo (targa, costo_veicolo, peso_massimo, tipo_veicolo, casa_produttrice) values	('DZ671AZ','112000',260,'autotreno','Scania')
	into veicolo (targa, costo_veicolo, peso_massimo, tipo_veicolo, casa_produttrice) values	('DW134DC','106000',240,'bilico','Scania')
	into veicolo (targa, costo_veicolo, peso_massimo, tipo_veicolo, casa_produttrice) values	('FS757BG','27800',10,'furgone','Daf')
	into veicolo (targa, costo_veicolo, peso_massimo, tipo_veicolo, casa_produttrice) values	('FG666FG','45000',25,'motrice','Mercedes')
	into veicolo (targa, costo_veicolo, peso_massimo, tipo_veicolo, casa_produttrice) values	('AZ222DC','97800',240,'bilico','Scania')
	into veicolo (targa, costo_veicolo, peso_massimo, tipo_veicolo, casa_produttrice) values	('DF678DF','52300',25,'motrice','Scania')
	into veicolo (targa, costo_veicolo, peso_massimo, tipo_veicolo, casa_produttrice) values	('FD321AZ','12700',260,'autotreno','Scania')
	into veicolo (targa, costo_veicolo, peso_massimo, tipo_veicolo, casa_produttrice) values	('AC415DC','109000',240,'bilico','Scania')
	into veicolo (targa, costo_veicolo, peso_massimo, tipo_veicolo, casa_produttrice) values	('FG341BG','29000',10,'furgone','Daf')
	into veicolo (targa, costo_veicolo, peso_massimo, tipo_veicolo, casa_produttrice) values	('FW343FC','37800',25,'motrice','Mercedes')
	into veicolo (targa, costo_veicolo, peso_massimo, tipo_veicolo, casa_produttrice) values	('GH123DD','112000',240,'bilico','Scania')
	into veicolo (targa, costo_veicolo, peso_massimo, tipo_veicolo, casa_produttrice) values	('EH565FG','27900',10,'furgone','Iveco')

	SELECT 1 FROM DUAL;


--UFFICIO -> 15
insert all
	into ufficio(num_ufficio, piano_ufficio, num_impiegati) values ('01',1,2)
	into ufficio(num_ufficio, piano_ufficio, num_impiegati) values ('02',1,3)
	into ufficio(num_ufficio, piano_ufficio, num_impiegati) values ('03',1,3)
	into ufficio(num_ufficio, piano_ufficio, num_impiegati) values ('04',2,2)
	into ufficio(num_ufficio, piano_ufficio, num_impiegati) values ('05',2,2)
	into ufficio(num_ufficio, piano_ufficio, num_impiegati) values ('06',3,4)
	into ufficio(num_ufficio, piano_ufficio, num_impiegati) values ('07',3,4)
	into ufficio(num_ufficio, piano_ufficio, num_impiegati) values ('08',3,5)
	into ufficio(num_ufficio, piano_ufficio, num_impiegati) values ('09',3,4)
	into ufficio(num_ufficio, piano_ufficio, num_impiegati) values ('10',4,4)
	into ufficio(num_ufficio, piano_ufficio, num_impiegati) values ('11',4,3)
	into ufficio(num_ufficio, piano_ufficio, num_impiegati) values ('12',4,4)
	into ufficio(num_ufficio, piano_ufficio, num_impiegati) values ('13',5,2)
	into ufficio(num_ufficio, piano_ufficio, num_impiegati) values ('14',5,4)
	into ufficio(num_ufficio, piano_ufficio, num_impiegati) values ('15',5,5)

	SELECT 1 FROM DUAL;


--OFFICINA COMPLETO -> 15

insert all
	into officina(p_iva_officina, nome, via, citta, cap) values ('46083770191', 'SUDueRuote', 'Via Gian Battista Vico','Napoli','80137')
	into officina(p_iva_officina, nome, via, citta, cap) values ('22691950095', 'Officina Manco', 'Via Santa Maria a Cubito','Mugnano di Napoli','80145')
	into officina(p_iva_officina, nome, via, citta, cap) values ('35710160710', 'Carrozzeria Esposito', 'Viale Europa','Afragola','80021')
	into officina(p_iva_officina, nome, via, citta, cap) values ('15135260402', 'TuttoGomme', 'Via Arpino','Casoria','80026')
	into officina(p_iva_officina, nome, via, citta, cap) values ('44537280404', 'Gomme Rippa', 'Via Filippo Briganti','Napoli','80141')
	into officina(p_iva_officina, nome, via, citta, cap) values ('51507310467', 'Carrozzeria Simeoli', 'Via Tito Livio','Volla','80040')
	into officina(p_iva_officina, nome, via, citta, cap) values ('17291027830', 'Officina Russo', 'Largo Francesco Celebrano, 24','Napoli','80129')
	into officina(p_iva_officina, nome, via, citta, cap) values ('78102936718', 'Officina Nettuno', 'Via Carlo Di Tocco','Napoli','80142')
	into officina(p_iva_officina, nome, via, citta, cap) values ('45618920192', 'CarBlind', 'Via Torino','Napoli','80121')
	into officina(p_iva_officina, nome, via, citta, cap) values ('91928361782', 'Rosano Gomme', 'Via Acquaviva, 8','Napoli','80141')
	into officina(p_iva_officina, nome, via, citta, cap) values ('22335201920', 'Ruote24', 'Via Nuova Poggioreale, 56','Napoli','80143')
	into officina(p_iva_officina, nome, via, citta, cap) values ('67401823311', 'Officina Contiello', 'Via Calabria, 3','Napoli','80142')
	into officina(p_iva_officina, nome, via, citta, cap) values ('19897887655', 'Autofficina Romano', 'Via Micca, 3','Casoria','80026')
	into officina(p_iva_officina, nome, via, citta, cap) values ('56761221341', 'QuattroRuote', 'Via Rossini, 31','Casoria','80026')
	into officina(p_iva_officina, nome, via, citta, cap) values ('89987654321', 'Officina Conte', 'Via Palazziello, 93','Volla','80040')

	SELECT 1 FROM DUAL;

-- FORNITORE -- OK

insert all
	into fornitore(p_iva_fornitore, nome, via, citta, cap, tipo_prodotto) values ('74015300846','Biscottificio Fazzi', 'Via Della Meccanica, 10','Verona','37139','biscotti')
	into fornitore(p_iva_fornitore, nome, via, citta, cap, tipo_prodotto) values ('13273750110','Saporti Italiani', 'Via Guglielmo Marconi, 44','Bentivoglio','40010','Formaggi')
	into fornitore(p_iva_fornitore, nome, via, citta, cap, tipo_prodotto) values ('65987210906','F.lli Manco', 'Via Bottinaccio, 3','Montelupo Fiorentino','50056','Salumi')
	into fornitore(p_iva_fornitore, nome, via, citta, cap, tipo_prodotto) values ('74015311846','DND s.r.l.', 'Via Kennedy, 5','Pietramelara','81051','Prodotti per Ufficio')
	into fornitore(p_iva_fornitore, nome, via, citta, cap, tipo_prodotto) values ('47096840864','Bestit', 'Via Scandone, 11','Avellino','83100','Mobilio')
	into fornitore(p_iva_fornitore, nome, via, citta, cap, tipo_prodotto) values ('32953090639','Party-Games', 'Via Del Caucaso, 49','Roma','00144','Giochi')
	into fornitore(p_iva_fornitore, nome, via, citta, cap, tipo_prodotto) values ('54046440977','MyShopCasa', 'Via Del Marzocco, 75','Pietrasanta','55045','Prodotti per la casa')
	into fornitore(p_iva_fornitore, nome, via, citta, cap, tipo_prodotto) values ('23844060097','GrandiStock', 'Via Premuda, 18','Lecce','73100','Ingrosso alimentare')
	into fornitore(p_iva_fornitore, nome, via, citta, cap, tipo_prodotto) values ('44941270322','Moccia Cash and Carry', 'Via Brecciame, 49','Maddaloni','81024','Ingrosso alimentare')
	into fornitore(p_iva_fornitore, nome, via, citta, cap, tipo_prodotto) values ('20052840558','ItalyEatFood', 'Vicolo Lambro, 1','Monza','20900','Ingrosso alimentare')
	into fornitore(p_iva_fornitore, nome, via, citta, cap, tipo_prodotto) values ('00103498345','SportPerTutti','Via Nicolardi, 10','Napoli','80131','Articoli Sportivi')
	into fornitore(p_iva_fornitore, nome, via, citta, cap, tipo_prodotto) values ('90004576975','HardwareStock','Via Brombeis, 119','Salerno','84121','Prodotti hardware')
	into fornitore(p_iva_fornitore, nome, via, citta, cap, tipo_prodotto) values ('12390442324','ElettroShop','Via Vesuvio, 202','Nola','80035','Elettrodomestici')
	into fornitore(p_iva_fornitore, nome, via, citta, cap, tipo_prodotto) values ('45521466213','Abbigliamento De Luca','Via Colosseo, 10','Roma','00100','Ingrosso abbigliamento')
	into fornitore(p_iva_fornitore, nome, via, citta, cap, tipo_prodotto) values ('76896748487','Mobilingrosso','Via Falcone, 101','Afragola','80021','Mobilio')

	SELECT 1 FROM DUAL;


---IMPIEGATO -> 15

insert all
	into impiegato(cf_impiegato,ufficio_impiegato,codice_badge,mansione) values ('MRTPLN65L69G577R','10','01003','Analista')--OK
	into impiegato(cf_impiegato,ufficio_impiegato,codice_badge,mansione) values ('SRCLND77S27G601O','01','00120','Segretario')--ok
	into impiegato(cf_impiegato,ufficio_impiegato,codice_badge,mansione) values ('SPNRSR76H05F578I','01','00001','Segretario') --OK
	into impiegato(cf_impiegato,ufficio_impiegato,codice_badge,mansione) values ('LNNGST70B20D443N','02','01001','Legale')--OK
	into impiegato(cf_impiegato,ufficio_impiegato,codice_badge,mansione) values ('GLLLGU01M17F839G','02','01110','Manager') --OK
	into impiegato(cf_impiegato,ufficio_impiegato,codice_badge,mansione) values ('VTRLSS98T11F839O','02','90010','Analista') --ok
	into impiegato(cf_impiegato,ufficio_impiegato,codice_badge,mansione) values ('DNNLCU01E15F839T','10','01088','Direttore') --OK
	into impiegato(cf_impiegato,ufficio_impiegato,codice_badge,mansione) values ('DOXSST85E28B869H','10','34111','Legale') --ok
	into impiegato(cf_impiegato,ufficio_impiegato,codice_badge,mansione) values ('RMNGDI92S47F048Q','09','80093','Segretario') --OK
	into impiegato(cf_impiegato,ufficio_impiegato,codice_badge,mansione) values ('RPSLNZ87E52I963W','08','45211','Analista') --OK
	into impiegato(cf_impiegato,ufficio_impiegato,codice_badge,mansione) values ('SMCRLD67H20B617Z','07','35311','Manager') --OK
	into impiegato(cf_impiegato,ufficio_impiegato,codice_badge,mansione) values ('NCRCRD70D14D315A','08','41131','Manager') --OK
	into impiegato(cf_impiegato,ufficio_impiegato,codice_badge,mansione) values ('DSSSSN84R30C649B','08','01312','Manager') --OK
	into impiegato(cf_impiegato,ufficio_impiegato,codice_badge,mansione) values ('CNGRDT64S13E866D','06','41252','Analista') --OK
	into impiegato(cf_impiegato,ufficio_impiegato,codice_badge,mansione) values ('GPPFNZ63A17G455X','06','68576','Segretario') --ok

	SELECT 1 FROM DUAL;


-- CONTRATTO

insert all
    into contratto (codice_contratto, cf_contratto, durata_contratto, tipo_contratto) values ('QRT1859037','MRTPLN65L69G577R',0.6,'Part-time')
    into contratto (codice_contratto, cf_contratto, durata_contratto, tipo_contratto) values ('GTR9649901','SRCLND77S27G601O',0.6,'Apprendistato')
    into contratto (codice_contratto, cf_contratto, durata_contratto, tipo_contratto) values ('POI2161048','SPNRSR76H05F578I',NULL,'Indeterminato')
    into contratto (codice_contratto, cf_contratto, durata_contratto, tipo_contratto) values ('LKD8273619','LNNGST70B20D443N',2.0,'Determinato')
    into contratto (codice_contratto, cf_contratto, durata_contratto, tipo_contratto) values ('VMH7195739','GLLLGU01M17F839G',NULL,'Indeterminato')
    into contratto (codice_contratto, cf_contratto, durata_contratto, tipo_contratto) values ('AFD6195637','VTRLSS98T11F839O',NULL,'Indeterminato')
    into contratto (codice_contratto, cf_contratto, durata_contratto, tipo_contratto) values ('ASD7640625','DNNLCU01E15F839T',NULL,'Indeterminato')
    into contratto (codice_contratto, cf_contratto, durata_contratto, tipo_contratto) values ('BDD0946503','DOXSST85E28B869H',1.6,'Determinato')
    into contratto (codice_contratto, cf_contratto, durata_contratto, tipo_contratto) values ('ANA9018475','RMNGDI92S47F048Q',0.6,'Part-time')
    into contratto (codice_contratto, cf_contratto, durata_contratto, tipo_contratto) values ('LQW5916239','RPSLNZ87E52I963W',1.6,'Determinato')
    into contratto (codice_contratto, cf_contratto, durata_contratto, tipo_contratto) values ('VHG6123654','SMCRLD67H20B617Z',1.6,'Determinato')
    into contratto (codice_contratto, cf_contratto, durata_contratto, tipo_contratto) values ('ZXF3475436','NCRCRD70D14D315A',1.6,'Determinato')
    into contratto (codice_contratto, cf_contratto, durata_contratto, tipo_contratto) values ('PMG4710457','DSSSSN84R30C649B',2.0,'Determinato')
    into contratto (codice_contratto, cf_contratto, durata_contratto, tipo_contratto) values ('DHG9240965','CNGRDT64S13E866D',1.0,'Determinato')
    into contratto (codice_contratto, cf_contratto, durata_contratto, tipo_contratto) values ('SWW2346345','GPPFNZ63A17G455X',0.6,'Apprendistato')
	into contratto (codice_contratto, cf_contratto, durata_contratto, tipo_contratto) values ('MMM8494933','CLMGLC85L02I926V',1.0,'Part-time')
	into contratto (codice_contratto, cf_contratto, durata_contratto, tipo_contratto) values ('PQQ7595844','CHPPPN95H19F806J',0.5,'Part_time')
	into contratto (codice_contratto, cf_contratto, durata_contratto, tipo_contratto) values ('JJH8403130','CRTNDR94P22A310N',3.0,'Determinato')
	into contratto (codice_contratto, cf_contratto, durata_contratto, tipo_contratto) values ('YUI8940357','SDNGTR73T41F025B',2.5,'Determinato')
	into contratto (codice_contratto, cf_contratto, durata_contratto, tipo_contratto) values ('ZXC4789654','BSLCLL67C08L155K',NULL,'Indeterminato')
	into contratto (codice_contratto, cf_contratto, durata_contratto, tipo_contratto) values ('IUT2345609','FVLPRN75R41A139W',NULL,'Indeterminato')
	into contratto (codice_contratto, cf_contratto, durata_contratto, tipo_contratto) values ('LKJ5600865','VLLGPR97E08F089M',1.0,'Apprendistato')
	into contratto (codice_contratto, cf_contratto, durata_contratto, tipo_contratto) values ('XXX7009764','BTTPTR92P30E158C',1.0,'Apprendistato')
	into contratto (codice_contratto, cf_contratto, durata_contratto, tipo_contratto) values ('QQQ7811146','PVNLNZ68S18L974V',NULL,'Indeterminato')
	into contratto (codice_contratto, cf_contratto, durata_contratto, tipo_contratto) values ('LLF8909654','CRUVLR88C23E922X',2.0,'Determinato')
	into contratto (codice_contratto, cf_contratto, durata_contratto, tipo_contratto) values ('YTR9006546','QRNRNN94E52I566X',2.0,'Determinato')
	into contratto (codice_contratto, cf_contratto, durata_contratto, tipo_contratto) values ('IUI6895346','DFZSLA76E68L865H',NULL,'Indeterminato')
	into contratto (codice_contratto, cf_contratto, durata_contratto, tipo_contratto) values ('VVV4711056','SRCSLV85E54D267Z',NULL,'Indeterminato')
	into contratto (codice_contratto, cf_contratto, durata_contratto, tipo_contratto) values ('OOU8967948','CRLBGD75D59F678Q',1.0,'Apprendistato')
	into contratto (codice_contratto, cf_contratto, durata_contratto, tipo_contratto) values ('GTR7975469','LPRBRN76R42F839H',5.5,'Determinato')

select 1 from dual;



-- STIPENDIO DEGLI ULTIMI 4 MESI

--ANALISTA IN MEDIA 2200 EURO QUINDI CALCOLO LE TRATTENUTE IN BASE ALLO STIPENDIO CHE DECIDO
--LEGALE IN MEDIA 2550 EURO
--DIRETTORE IN MEDIA 3200
--SEGRETARIO 1400
--MANAGER 2000
--AUTISTA 1800 IN MEDIA

--data degli stipendi di solito è il 27
--Considero stipendi da Gennaio ad Aprile


insert all
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-01-27','QRT1859037',2057,143) --ANALISTA
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-02-27','QRT1859037',2074,126)
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-03-27','QRT1859037',2120,80)
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-04-27','QRT1859037',2087,113)
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-01-27','GTR9649901',1220,80) --SEGRETARIO in apprendistato stipendio piu basso
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-02-27','GTR9649901',1236,64)
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-03-27','GTR9649901',1217,83)
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-04-27','GTR9649901',1203,97)
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-01-27','POI2161048',1330,70) --SEGRETARIO
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-02-27','POI2161048',1345,55)
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-03-27','POI2161048',1377,23)
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-04-27','POI2161048',1380,20)
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-01-27','LKD8273619',2537,13) --LEGALE
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-02-27','LKD8273619',2475,75)
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-03-27','LKD8273619',2492,58)
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-04-27','LKD8273619',2522,28)
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-01-27','VMH7195739',1950,50)-- MANAGER
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-02-27','VMH7195739',1980,20)
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-03-27','VMH7195739',1927,73)
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-04-27','VMH7195739',1948,52)
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-01-27','AFD6195637',2173,27) --ANALISTA
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-02-27','AFD6195637',2097,103)
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-03-27','AFD6195637',2105,95)
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-04-27','AFD6195637',2122,78)
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-01-27','ASD7640625',3173,27)--DIRETTORE
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-02-27','ASD7640625',3123,77)
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-03-27','ASD7640625',3144,56)
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-04-27','ASD7640625',3102,98)
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-01-27','BDD0946503',2477,73)--LEGALE
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-02-27','BDD0946503',2492,58)
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-03-27','BDD0946503',2522,28)
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-04-27','BDD0946503',2517,33)
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-01-27','ANA9018475',927,73)--SEGRETARIO PART-TIME(1000 euro im media)
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-02-27','ANA9018475',933,73)
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-03-27','ANA9018475',955,45)
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-04-27','ANA9018475',944,56)
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-01-27','LQW5916239',2083,117)--ANALISTA
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-02-27','LQW5916239',2112,88)
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-03-27','LQW5916239',2123,77)
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-04-27','LQW5916239',2113,87)
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-01-27','VHG6123654',1927,73)--MANAGER
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-02-27','VHG6123654',1933,67)
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-03-27','VHG6123654',1955,45)
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-04-27','VHG6123654',1931,69)
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-01-27','ZXF3475436',1944,56)--MANAGER
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-02-27','ZXF3475436',1952,48)
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-03-27','ZXF3475436',1964,36)
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-04-27','ZXF3475436',1970,30)
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-01-27','PMG4710457',1952,48)--MANAGER
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-02-27','PMG4710457',1966,34)
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-03-27','PMG4710457',1972,28)
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-04-27','PMG4710457',1924,76)
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-01-27','DHG9240965',2097,103)--ANALISTA
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-02-27','DHG9240965',2180,20)
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-03-27','DHG9240965',2113,87)
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-04-27','DHG9240965',2128,72)
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-01-27','SWW2346345',1220,80)--SEGRETARIO APPRENDISTATO
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-02-27','SWW2346345',1227,74)
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-03-27','SWW2346345',1275,25)
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-04-27','SWW2346345',1233,67)
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-01-27','MMM8494933',1233,67) --PART TIME--AUTISTI
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-02-27','MMM8494933',1220,80)
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-03-27','MMM8494933',1228,72)
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-04-27','MMM8494933',1243,67)
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-01-27','PQQ7595844',1247,53) --PART TIME
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-02-27','PQQ7595844',1238,62)
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-03-27','PQQ7595844',1222,78)
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-04-27','PQQ7595844',1233,67)
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-01-27','JJH8403130',1772,28) --
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-02-27','JJH8403130',1680,120)
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-03-27','JJH8403130',1727,73)
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-04-27','JJH8403130',1782,18)
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-01-27','YUI8940357',1697,103) --
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-02-27','YUI8940357',1712,88)
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-03-27','YUI8940357',1722,78)
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-04-27','YUI8940357',1744,56)
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-01-27','ZXC4789654',1733,67) --
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-02-27','ZXC4789654',1781,19)
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-03-27','ZXC4789654',1711,89)
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-04-27','ZXC4789654',1688,112)
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-01-27','IUT2345609',1727,73) --
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-02-27','IUT2345609',1711,89)
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-03-27','IUT2345609',1733,67)
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-04-27','IUT2345609',1772,28)
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-01-27','LKJ5600865',1447,53) -- APPRENDISTATO
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-02-27','LKJ5600865',1422,78)
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-03-27','LKJ5600865',1452,48)
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-04-27','LKJ5600865',1405,95)
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-01-27','XXX7009764',1398,102) -- APPRENDISTATO
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-02-27','XXX7009764',1412,88)
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-03-27','XXX7009764',1433,67)
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-04-27','XXX7009764',1444,56)
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-01-27','QQQ7811146',1713,87) --
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-02-27','QQQ7811146',1711,89)
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-03-27','QQQ7811146',1728,72)
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-04-27','QQQ7811146',1698,102)
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-01-27','LLF8909654',1697,103) --
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-02-27','LLF8909654',1702,98)
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-03-27','LLF8909654',1733,67)
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-04-27','LLF8909654',1724,76)
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-01-27','YTR9006546',1727,73) --
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-02-27','YTR9006546',1733,67)
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-03-27','YTR9006546',1713,87)
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-04-27','YTR9006546',1692,108)
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-01-27','IUI6895346',1781,19) --
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-02-27','IUI6895346',1712,88)
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-03-27','IUI6895346',1774,26)
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-04-27','IUI6895346',1698,102)
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-01-27','VVV4711056',1743,67) --
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-02-27','VVV4711056',1783,17)
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-03-27','VVV4711056',1723,77)
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-04-27','VVV4711056',1712,88)
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-01-27','OOU8967948',1388,112) -- APPRENDISTATO
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-02-27','OOU8967948',1424,76)
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-03-27','OOU8967948',1432,68)
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-04-27','OOU8967948',1447,53)
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-01-27','GTR7975469',1753,47) --
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-02-27','GTR7975469',1783,17)
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-03-27','GTR7975469',1744,56)
		into stipendio (data_stipendio,contratto_stipendio,importo,trattenute) values (date'2022-04-27','GTR7975469',1722,78)



select 1 from dual;








--AZIENDA ESTERNA

!!!	MANCA ORA ARRIVO 	!!!

insert all
	into azienda_esterna(p_iva_azienda_esterna, nome, via, citta, cap, email) values ('28392680808','Euronics', 'Via San Secondo, 98Bis','Torino','10128','euro@euronicsitalia.it')
	into azienda_esterna(p_iva_azienda_esterna, nome, via, citta, cap, email) values ('49862681001','MediaWorld', 'Via Ottavio Munerati, 5','Rovigo','45100','mediaworld@gmail.com')
	into azienda_esterna(p_iva_azienda_esterna, nome, via, citta, cap, email) values ('29263440975','Conad', 'Via Matteotti, 7','Casaletto Ceredano','26010','conadcity@conadita.it')
	into azienda_esterna(p_iva_azienda_esterna, nome, via, citta, cap, email) values ('26680280919','Ikea', 'Via Beirut, 5','Cropani','88050','ikea@libero.it')
	into azienda_esterna(p_iva_azienda_esterna, nome, via, citta, cap, email) values ('29130410664','GameStop', 'Via Di Matteo, 128','Piedimonte Matese','81016','giochi@gamestop.it')
	into azienda_esterna(p_iva_azienda_esterna, nome, via, citta, cap, email) values ('77267030599','AKinformatica', 'Via Della Mattonara, 9','Viterbo','01100','akinformatica@info.com')
	into azienda_esterna(p_iva_azienda_esterna, nome, via, citta, cap, email) values ('25375100150','Coop', 'Via Monsignor Pignedoli, 6','Albinea','42020','viamons@coopitalia.it')
	into azienda_esterna(p_iva_azienda_esterna, nome, via, citta, cap, email) values ('53980110695','Decathlon', 'Via Savoca, 13','Bisacquino','90032','decathlon@italia.com')
	into azienda_esterna(p_iva_azienda_esterna, nome, via, citta, cap, email) values ('26195380519','Mr. Risparmio', 'Via Trento, 21','Parma','43122','mrrisparmio@libero.it')
	into azienda_esterna(p_iva_azienda_esterna, nome, via, citta, cap, email) values ('35462500436','Centro Convenienza', 'Via Pozzobonelli, 16','Rho','20017','centroconv@gmail.com')
	into azienda_esterna(p_iva_azienda_esterna, nome, via, citta, cap, email) values ('64635253636','Mondo Convenienza','Via Roma, 10','Trieste','34121','mondoconv@libero.it')
	into azienda_esterna(p_iva_azienda_esterna, nome, via, citta, cap, email) values ('56363534242','Uffici Arredo','Corso Italia, 89','Roma','00100','roma@ufficiarredo.it')
	into azienda_esterna(p_iva_azienda_esterna, nome, via, citta, cap, email) values ('13145424211','Coop','Via Argine, 90','Napoli','80147','viaargine@coopitalia.it')
	into azienda_esterna(p_iva_azienda_esterna, nome, via, citta, cap, email) values ('46433524545','Caseificio De Martino','Piazza Carlo III, 30','Napoli','80137','demartino@gmail.com')
 	into azienda_esterna(p_iva_azienda_esterna, nome, via, citta, cap, email) values ('87435362313','Zara','Via Scarlatti, 129','Napoli','80129','viascarlatti@zara.com')
SELECT 1 FROM DUAL;



--AUTISTI

Insert all
	into autista (cf_autista,tipo_patente,num_patente,targa_autista) values('CLMGLC85L02I926V','C1','NA2113212M','FS717BG')
	into autista (cf_autista,tipo_patente,num_patente,targa_autista) values('CHPPPN95H19F806J','CE','NA1213241L','FD321AZ')
	into autista (cf_autista,tipo_patente,num_patente,targa_autista) values('CRTNDR94P22A310N','CE','NA3211254S','DZ671AZ')
	into autista (cf_autista,tipo_patente,num_patente,targa_autista) values('SDNGTR73T41F025B','B1','NA9876178L','BA767WF')--furgone
	into autista (cf_autista,tipo_patente,num_patente,targa_autista) values('BSLCLL67C08L155K','C','NA1234561S','CD121FR')
	into autista (cf_autista,tipo_patente,num_patente,targa_autista) values('FVLPRN75R41A139W','C1','NA4545415A','DF678DF')
	into autista (cf_autista,tipo_patente,num_patente,targa_autista) values('VLLGPR97E08F089M','B1','NA3213211A','FW123FC') --furgone
	into autista (cf_autista,tipo_patente,num_patente,targa_autista) values('BTTPTR92P30E158C','C1','NA6776617W','FG666FG')
	into autista (cf_autista,tipo_patente,num_patente,targa_autista) values('PVNLNZ68S18L974V','C','NA3443314K','DW134DC')
	into autista (cf_autista,tipo_patente,num_patente,targa_autista) values('CRUVLR88C23E922X','CE','NA7898112D','CZ371YF')
	into autista (cf_autista,tipo_patente,num_patente,targa_autista) values('QRNRNN94E52I566X','B1','NA0001111G','FS757BG') --furgone
	into autista (cf_autista,tipo_patente,num_patente,targa_autista) values('DFZSLA76E68L865H','B1','NA7601121G','FG341BG') --furgone
	into autista (cf_autista,tipo_patente,num_patente,targa_autista) values('SRCSLV85E54D267Z','C1','NA5465176A','FZ121ER')
	into autista (cf_autista,tipo_patente,num_patente,targa_autista) values('CRLBGD75D59F678Q','C','NA0110011L','AC415DC')
	into autista (cf_autista,tipo_patente,num_patente,targa_autista) values('LPRBRN76R42F839H','C1','NA4567189L','FW343FC')
SELECT 1 FROM DUAL;



--MANUTENZIONE



insert all
	into manutenzione (fattura_manutenzione, targa_manutenzione, p_iva_meccanico, costo_manutenzione, data_inizio_man, data_fine_man) values ('122030','CZ371YF','46083770191',1600,DATE '2022-01-10',DATE'2022-01-05')
	into manutenzione (fattura_manutenzione, targa_manutenzione, p_iva_meccanico, costo_manutenzione, data_inizio_man, data_fine_man) values ('344312','FS717BG','22691950095',800,DATE '2021-12-10',DATE'2021-12-13')
	into manutenzione (fattura_manutenzione, targa_manutenzione, p_iva_meccanico, costo_manutenzione, data_inizio_man, data_fine_man) values ('676743','CD121FR','35710160710',1200,DATE '2022-02-12',DATE'2022-02-15')
	into manutenzione (fattura_manutenzione, targa_manutenzione, p_iva_meccanico, costo_manutenzione, data_inizio_man, data_fine_man) values ('988978','CZ441YF','15135260402',2200,DATE '2019-01-08',DATE'2019-01-13')
	into manutenzione (fattura_manutenzione, targa_manutenzione, p_iva_meccanico, costo_manutenzione, data_inizio_man, data_fine_man) values ('421232','DF717GG','44537280404',450,DATE '2018-04-10',DATE'2018-04-17')
	into manutenzione (fattura_manutenzione, targa_manutenzione, p_iva_meccanico, costo_manutenzione, data_inizio_man, data_fine_man) values ('897832','FZ121ER','51507310467',835,DATE '2022-01-10',DATE'2022-01-05')
	into manutenzione (fattura_manutenzione, targa_manutenzione, p_iva_meccanico, costo_manutenzione, data_inizio_man, data_fine_man) values ('987654','DZ671AZ','17291027830',1440,DATE '2017-10-10',DATE'2017-10-20')
	into manutenzione (fattura_manutenzione, targa_manutenzione, p_iva_meccanico, costo_manutenzione, data_inizio_man, data_fine_man) values ('098978','DW134DC','78102936718',1250,DATE '2021-08-04',DATE'2021-08-12')
	into manutenzione (fattura_manutenzione, targa_manutenzione, p_iva_meccanico, costo_manutenzione, data_inizio_man, data_fine_man) values ('091243','FG666FG','45618920192',875,DATE '2020-04-18',DATE'2020-04-22')
	into manutenzione (fattura_manutenzione, targa_manutenzione, p_iva_meccanico, costo_manutenzione, data_inizio_man, data_fine_man) values ('432354','AZ222DC','91928361782',1100,DATE '2019-12-11',DATE'2019-12-23')
	into manutenzione (fattura_manutenzione, targa_manutenzione, p_iva_meccanico, costo_manutenzione, data_inizio_man, data_fine_man) values ('980231','DF678DF','22335201920',800,DATE '2015-07-07',DATE'2015-07-10')
	into manutenzione (fattura_manutenzione, targa_manutenzione, p_iva_meccanico, costo_manutenzione, data_inizio_man, data_fine_man) values ('789127','FD321AZ','67401823311',1770,DATE '2014-06-12',DATE'2014-06-22')
	into manutenzione (fattura_manutenzione, targa_manutenzione, p_iva_meccanico, costo_manutenzione, data_inizio_man, data_fine_man) values ('890127','AC415DC','19897887655',1280,DATE '2018-03-25',DATE'2018-04-02')
	into manutenzione (fattura_manutenzione, targa_manutenzione, p_iva_meccanico, costo_manutenzione, data_inizio_man, data_fine_man) values ('823129','FW343FC','56761221341',770,DATE '2021-01-23',DATE'2021-01-28')
	into manutenzione (fattura_manutenzione, targa_manutenzione, p_iva_meccanico, costo_manutenzione, data_inizio_man, data_fine_man) values ('321789','GH123DD','89987654321',1210,DATE '2018-02-27',DATE'2018-03-07')
select 1 from dual;





--PRESENZA
--INSERIMENTO PRESENZE NELLA SETTIMANA DAL lUNEDI 04/04/2022 AL 08/04/2022
--POSSIIBILE FUNZIONE DI CONTEGGIO DELLE ORE DI UN IMPIEGATO: OGNI TOT ORE DEVE FARE PAUSA PRANZO DA DETRARRE DALLE ORE DI UNA GIORNATA
-- ES. ENTRA ALLE 8 ESCE ALLE 17 CON 1 ORA DI PAUSA PRANZO SONO 8 ORE DI LAVORO

--DA COMPLETARE VEDERE SOTTO QUALI IMPIEGATI MANCANO

insert all

	--IMPIEGATO MANCATO UN GIORNO LEVARE NOT NULL PER DATA ENTRRATA EUSCITA
	into presenza(Data_presenza,cf_presenza,ora_entrata,ora_uscita) values(to_date('2022-04-04','yyyy-mm-dd'),'MRTPLN65L69G577R',to_date('2022-04-04 08:00','yyyy-mm-dd hh24:mi'),to_date('2022-04-04 17:00','yyyy-mm-dd hh24:mi'))
	into presenza(Data_presenza,cf_presenza,ora_entrata,ora_uscita) values(to_date('2022-04-05','yyyy-mm-dd'),'MRTPLN65L69G577R',to_date('2022-04-05 08:12','yyyy-mm-dd hh24:mi'),to_date('2022-04-04 17:12','yyyy-mm-dd hh24:mi'))
	into presenza(Data_presenza,cf_presenza,ora_entrata,ora_uscita) values(to_date('2022-04-06','yyyy-mm-dd'),'MRTPLN65L69G577R',to_date('2022-04-06 08:07','yyyy-mm-dd hh24:mi'),to_date('2022-04-04 17:07','yyyy-mm-dd hh24:mi'))
	into presenza(Data_presenza,cf_presenza,ora_entrata,ora_uscita) values(to_date('2022-04-07','yyyy-mm-dd'),'MRTPLN65L69G577R',to_date('2022-04-07 08:00','yyyy-mm-dd hh24:mi'),to_date('2022-04-04 17:00','yyyy-mm-dd hh24:mi'))
	into presenza(Data_presenza,cf_presenza,ora_entrata,ora_uscita) values(to_date('2022-04-08','yyyy-mm-dd'),'MRTPLN65L69G577R',NULL,NULL)

	--IMPIEGATO 1 ORE DI PERMESSO --SRCLND77S27G601O
	into presenza(Data_presenza,cf_presenza,ora_entrata,ora_uscita) values(to_date('2022-04-04','yyyy-mm-dd'),'SRCLND77S27G601O',to_date('2022-04-04 08:22','yyyy-mm-dd hh24:mi'),to_date('2022-04-04 17:22','yyyy-mm-dd hh24:mi'))
	into presenza(Data_presenza,cf_presenza,ora_entrata,ora_uscita) values(to_date('2022-04-05','yyyy-mm-dd'),'SRCLND77S27G601O',to_date('2022-04-05 09:15','yyyy-mm-dd hh24:mi'),to_date('2022-04-04 17:15','yyyy-mm-dd hh24:mi'))--ORA PERMESSO
	into presenza(Data_presenza,cf_presenza,ora_entrata,ora_uscita) values(to_date('2022-04-06','yyyy-mm-dd'),'SRCLND77S27G601O',to_date('2022-04-06 08:13','yyyy-mm-dd hh24:mi'),to_date('2022-04-04 17:13','yyyy-mm-dd hh24:mi'))
	into presenza(Data_presenza,cf_presenza,ora_entrata,ora_uscita) values(to_date('2022-04-07','yyyy-mm-dd'),'SRCLND77S27G601O',to_date('2022-04-07 08:00','yyyy-mm-dd hh24:mi'),to_date('2022-04-04 17:00','yyyy-mm-dd hh24:mi'))
	into presenza(Data_presenza,cf_presenza,ora_entrata,ora_uscita) values(to_date('2022-04-08','yyyy-mm-dd'),'SRCLND77S27G601O',to_date('2022-04-08 08:00','yyyy-mm-dd hh24:mi'),to_date('2022-04-04 17:00','yyyy-mm-dd hh24:mi'))

	into presenza(Data_presenza,cf_presenza,ora_entrata,ora_uscita) values(to_date('2022-04-04','yyyy-mm-dd'),'SPNRSR76H05F578I',to_date('2022-04-04 08:20','yyyy-mm-dd hh24:mi'),to_date('2022-04-04 17:20','yyyy-mm-dd hh24:mi'))
	into presenza(Data_presenza,cf_presenza,ora_entrata,ora_uscita) values(to_date('2022-04-05','yyyy-mm-dd'),'SPNRSR76H05F578I',to_date('2022-04-05 08:03','yyyy-mm-dd hh24:mi'),to_date('2022-04-04 17:10','yyyy-mm-dd hh24:mi'))
	into presenza(Data_presenza,cf_presenza,ora_entrata,ora_uscita) values(to_date('2022-04-06','yyyy-mm-dd'),'SPNRSR76H05F578I',to_date('2022-04-06 08:05','yyyy-mm-dd hh24:mi'),to_date('2022-04-04 17:03','yyyy-mm-dd hh24:mi'))
	into presenza(Data_presenza,cf_presenza,ora_entrata,ora_uscita) values(to_date('2022-04-07','yyyy-mm-dd'),'SPNRSR76H05F578I',to_date('2022-04-07 08:10','yyyy-mm-dd hh24:mi'),to_date('2022-04-04 16:14','yyyy-mm-dd hh24:mi'))--ORA PERMESSO
	into presenza(Data_presenza,cf_presenza,ora_entrata,ora_uscita) values(to_date('2022-04-08','yyyy-mm-dd'),'SPNRSR76H05F578I',to_date('2022-04-08 08:09','yyyy-mm-dd hh24:mi'),to_date('2022-04-04 17:00','yyyy-mm-dd hh24:mi'))

	--MANCA UN GIORNO
	into presenza(Data_presenza,cf_presenza,ora_entrata,ora_uscita) values(to_date('2022-04-04','yyyy-mm-dd'),'LNNGST70B20D443N',to_date('2022-04-04 08:00','yyyy-mm-dd hh24:mi'),to_date('2022-04-04 17:00','yyyy-mm-dd hh24:mi'))
	into presenza(Data_presenza,cf_presenza,ora_entrata,ora_uscita) values(to_date('2022-04-05','yyyy-mm-dd'),'LNNGST70B20D443N',NULL,NULL)
	into presenza(Data_presenza,cf_presenza,ora_entrata,ora_uscita) values(to_date('2022-04-06','yyyy-mm-dd'),'LNNGST70B20D443N',to_date('2022-04-06 08:02','yyyy-mm-dd hh24:mi'),to_date('2022-04-04 17:02','yyyy-mm-dd hh24:mi'))
	into presenza(Data_presenza,cf_presenza,ora_entrata,ora_uscita) values(to_date('2022-04-07','yyyy-mm-dd'),'LNNGST70B20D443N',to_date('2022-04-07 08:05','yyyy-mm-dd hh24:mi'),to_date('2022-04-04 17:05','yyyy-mm-dd hh24:mi'))
	into presenza(Data_presenza,cf_presenza,ora_entrata,ora_uscita) values(to_date('2022-04-08','yyyy-mm-dd'),'LNNGST70B20D443N',to_date('2022-04-08 08:13','yyyy-mm-dd hh24:mi'),to_date('2022-04-04 17:13','yyyy-mm-dd hh24:mi'))

	into presenza(Data_presenza,cf_presenza,ora_entrata,ora_uscita) values(to_date('2022-04-04','yyyy-mm-dd'),'GLLLGU01M17F839G',to_date('2022-04-04 08:00','yyyy-mm-dd hh24:mi'),to_date('2022-04-04 17:00','yyyy-mm-dd hh24:mi'))
	into presenza(Data_presenza,cf_presenza,ora_entrata,ora_uscita) values(to_date('2022-04-05','yyyy-mm-dd'),'GLLLGU01M17F839G',to_date('2022-04-05 07:50','yyyy-mm-dd hh24:mi'),to_date('2022-04-04 16:50','yyyy-mm-dd hh24:mi'))
	into presenza(Data_presenza,cf_presenza,ora_entrata,ora_uscita) values(to_date('2022-04-06','yyyy-mm-dd'),'GLLLGU01M17F839G',to_date('2022-04-06 08:05','yyyy-mm-dd hh24:mi'),to_date('2022-04-04 17:05','yyyy-mm-dd hh24:mi'))
	into presenza(Data_presenza,cf_presenza,ora_entrata,ora_uscita) values(to_date('2022-04-07','yyyy-mm-dd'),'GLLLGU01M17F839G',to_date('2022-04-07 08:00','yyyy-mm-dd hh24:mi'),to_date('2022-04-04 17:00','yyyy-mm-dd hh24:mi'))
	into presenza(Data_presenza,cf_presenza,ora_entrata,ora_uscita) values(to_date('2022-04-08','yyyy-mm-dd'),'GLLLGU01M17F839G',to_date('2022-04-08 08:13','yyyy-mm-dd hh24:mi'),to_date('2022-04-04 17:13','yyyy-mm-dd hh24:mi'))

	into presenza(Data_presenza,cf_presenza,ora_entrata,ora_uscita) values(to_date('2022-04-04','yyyy-mm-dd'),'VTRLSS98T11F839O',to_date('2022-04-04 08:00','yyyy-mm-dd hh24:mi'),to_date('2022-04-04 17:00','yyyy-mm-dd hh24:mi'))
	into presenza(Data_presenza,cf_presenza,ora_entrata,ora_uscita) values(to_date('2022-04-05','yyyy-mm-dd'),'VTRLSS98T11F839O',to_date('2022-04-05 08:17','yyyy-mm-dd hh24:mi'),to_date('2022-04-04 17:17','yyyy-mm-dd hh24:mi'))
	into presenza(Data_presenza,cf_presenza,ora_entrata,ora_uscita) values(to_date('2022-04-06','yyyy-mm-dd'),'VTRLSS98T11F839O',to_date('2022-04-06 08:03','yyyy-mm-dd hh24:mi'),to_date('2022-04-04 17:03','yyyy-mm-dd hh24:mi'))
	into presenza(Data_presenza,cf_presenza,ora_entrata,ora_uscita) values(to_date('2022-04-07','yyyy-mm-dd'),'VTRLSS98T11F839O',to_date('2022-04-07 08:12','yyyy-mm-dd hh24:mi'),to_date('2022-04-04 17:12','yyyy-mm-dd hh24:mi'))
	into presenza(Data_presenza,cf_presenza,ora_entrata,ora_uscita) values(to_date('2022-04-08','yyyy-mm-dd'),'VTRLSS98T11F839O',to_date('2022-04-08 08:13','yyyy-mm-dd hh24:mi'),to_date('2022-04-04 17:13','yyyy-mm-dd hh24:mi'))


	into presenza(Data_presenza,cf_presenza,ora_entrata,ora_uscita) values(to_date('2022-04-04','yyyy-mm-dd'),'DNNLCU01E15F839T',to_date('2022-04-04 08:00','yyyy-mm-dd hh24:mi'),to_date('2022-04-04 17:00','yyyy-mm-dd hh24:mi'))
	into presenza(Data_presenza,cf_presenza,ora_entrata,ora_uscita) values(to_date('2022-04-05','yyyy-mm-dd'),'DNNLCU01E15F839T',to_date('2022-04-05 08:00','yyyy-mm-dd hh24:mi'),to_date('2022-04-04 17:00','yyyy-mm-dd hh24:mi'))
	into presenza(Data_presenza,cf_presenza,ora_entrata,ora_uscita) values(to_date('2022-04-06','yyyy-mm-dd'),'DNNLCU01E15F839T',to_date('2022-04-06 08:03','yyyy-mm-dd hh24:mi'),to_date('2022-04-04 17:03','yyyy-mm-dd hh24:mi'))
	into presenza(Data_presenza,cf_presenza,ora_entrata,ora_uscita) values(to_date('2022-04-07','yyyy-mm-dd'),'DNNLCU01E15F839T',to_date('2022-04-07 08:05','yyyy-mm-dd hh24:mi'),to_date('2022-04-04 17:05','yyyy-mm-dd hh24:mi'))
	into presenza(Data_presenza,cf_presenza,ora_entrata,ora_uscita) values(to_date('2022-04-08','yyyy-mm-dd'),'DNNLCU01E15F839T',NULL,NULL)


	into presenza(Data_presenza,cf_presenza,ora_entrata,ora_uscita) values(to_date('2022-04-04','yyyy-mm-dd'),'DOXSST85E28B869H',to_date('2022-04-04 08:20','yyyy-mm-dd hh24:mi'),to_date('2022-04-04 17:20','yyyy-mm-dd hh24:mi'))
	into presenza(Data_presenza,cf_presenza,ora_entrata,ora_uscita) values(to_date('2022-04-05','yyyy-mm-dd'),'DOXSST85E28B869H',to_date('2022-04-05 08:15','yyyy-mm-dd hh24:mi'),to_date('2022-04-04 17:15','yyyy-mm-dd hh24:mi'))
	into presenza(Data_presenza,cf_presenza,ora_entrata,ora_uscita) values(to_date('2022-04-06','yyyy-mm-dd'),'DOXSST85E28B869H',to_date('2022-04-06 08:12','yyyy-mm-dd hh24:mi'),to_date('2022-04-04 17:12','yyyy-mm-dd hh24:mi'))
	into presenza(Data_presenza,cf_presenza,ora_entrata,ora_uscita) values(to_date('2022-04-07','yyyy-mm-dd'),'DOXSST85E28B869H',to_date('2022-04-07 08:23','yyyy-mm-dd hh24:mi'),to_date('2022-04-04 17:23','yyyy-mm-dd hh24:mi'))
	into presenza(Data_presenza,cf_presenza,ora_entrata,ora_uscita) values(to_date('2022-04-08','yyyy-mm-dd'),'DOXSST85E28B869H',to_date('2022-04-08 08:03','yyyy-mm-dd hh24:mi'),to_date('2022-04-04 17:03','yyyy-mm-dd hh24:mi'))
	
	into presenza(Data_presenza,cf_presenza,ora_entrata,ora_uscita) values(to_date('2022-04-04','yyyy-mm-dd'),'RMNGDI92S47F048Q',to_date('2022-04-04 08:12','yyyy-mm-dd hh24:mi'),to_date('2022-04-04 17:12','yyyy-mm-dd hh24:mi'))
	into presenza(Data_presenza,cf_presenza,ora_entrata,ora_uscita) values(to_date('2022-04-05','yyyy-mm-dd'),'RMNGDI92S47F048Q',to_date('2022-04-05 08:16','yyyy-mm-dd hh24:mi'),to_date('2022-04-04 17:16','yyyy-mm-dd hh24:mi'))
	into presenza(Data_presenza,cf_presenza,ora_entrata,ora_uscita) values(to_date('2022-04-06','yyyy-mm-dd'),'RMNGDI92S47F048Q',to_date('2022-04-06 08:02','yyyy-mm-dd hh24:mi'),to_date('2022-04-04 17:02','yyyy-mm-dd hh24:mi'))
	into presenza(Data_presenza,cf_presenza,ora_entrata,ora_uscita) values(to_date('2022-04-07','yyyy-mm-dd'),'RMNGDI92S47F048Q',to_date('2022-04-07 08:15','yyyy-mm-dd hh24:mi'),to_date('2022-04-04 17:15','yyyy-mm-dd hh24:mi'))
	into presenza(Data_presenza,cf_presenza,ora_entrata,ora_uscita) values(to_date('2022-04-08','yyyy-mm-dd'),'RMNGDI92S47F048Q',to_date('2022-04-08 08:20','yyyy-mm-dd hh24:mi'),to_date('2022-04-04 17:20','yyyy-mm-dd hh24:mi'))
	
	into presenza(Data_presenza,cf_presenza,ora_entrata,ora_uscita) values(to_date('2022-04-04','yyyy-mm-dd'),'RPSLNZ87E52I963W',NULL,NULL)
	into presenza(Data_presenza,cf_presenza,ora_entrata,ora_uscita) values(to_date('2022-04-05','yyyy-mm-dd'),'RPSLNZ87E52I963W',to_date('2022-04-05 08:04','yyyy-mm-dd hh24:mi'),to_date('2022-04-05 17:04','yyyy-mm-dd hh24:mi'))
	into presenza(Data_presenza,cf_presenza,ora_entrata,ora_uscita) values(to_date('2022-04-06','yyyy-mm-dd'),'RPSLNZ87E52I963W',to_date('2022-04-06 08:12','yyyy-mm-dd hh24:mi'),to_date('2022-04-06 17:12','yyyy-mm-dd hh24:mi'))
	into presenza(Data_presenza,cf_presenza,ora_entrata,ora_uscita) values(to_date('2022-04-07','yyyy-mm-dd'),'RPSLNZ87E52I963W',to_date('2022-04-07 08:01','yyyy-mm-dd hh24:mi'),to_date('2022-04-07 17:01','yyyy-mm-dd hh24:mi'))
	into presenza(Data_presenza,cf_presenza,ora_entrata,ora_uscita) values(to_date('2022-04-08','yyyy-mm-dd'),'RPSLNZ87E52I963W',to_date('2022-04-08 08:09','yyyy-mm-dd hh24:mi'),to_date('2022-04-08 17:09','yyyy-mm-dd hh24:mi'))
	
	
	into presenza(Data_presenza,cf_presenza,ora_entrata,ora_uscita) values(to_date('2022-04-04','yyyy-mm-dd'),'SMCRLD67H20B617Z',to_date('2022-04-04 08:02','yyyy-mm-dd hh24:mi'),to_date('2022-04-04 17:02','yyyy-mm-dd hh24:mi'))
	into presenza(Data_presenza,cf_presenza,ora_entrata,ora_uscita) values(to_date('2022-04-05','yyyy-mm-dd'),'SMCRLD67H20B617Z',to_date('2022-04-05 08:04','yyyy-mm-dd hh24:mi'),to_date('2022-04-05 16:04','yyyy-mm-dd hh24:mi'))
	into presenza(Data_presenza,cf_presenza,ora_entrata,ora_uscita) values(to_date('2022-04-06','yyyy-mm-dd'),'SMCRLD67H20B617Z',to_date('2022-04-06 08:16','yyyy-mm-dd hh24:mi'),to_date('2022-04-06 17:16','yyyy-mm-dd hh24:mi'))
	into presenza(Data_presenza,cf_presenza,ora_entrata,ora_uscita) values(to_date('2022-04-07','yyyy-mm-dd'),'SMCRLD67H20B617Z',to_date('2022-04-07 08:01','yyyy-mm-dd hh24:mi'),to_date('2022-04-07 17:01','yyyy-mm-dd hh24:mi'))
	into presenza(Data_presenza,cf_presenza,ora_entrata,ora_uscita) values(to_date('2022-04-08','yyyy-mm-dd'),'SMCRLD67H20B617Z',to_date('2022-04-08 08:17','yyyy-mm-dd hh24:mi'),to_date('2022-04-08 17:17','yyyy-mm-dd hh24:mi'))
	
	
	
	into presenza(Data_presenza,cf_presenza,ora_entrata,ora_uscita) values(to_date('2022-04-04','yyyy-mm-dd'),'NCRCRD70D14D315A',to_date('2022-04-04 08:12','yyyy-mm-dd hh24:mi'),to_date('2022-04-04 17:12','yyyy-mm-dd hh24:mi'))
	into presenza(Data_presenza,cf_presenza,ora_entrata,ora_uscita) values(to_date('2022-04-05','yyyy-mm-dd'),'NCRCRD70D14D315A',to_date('2022-04-05 08:02','yyyy-mm-dd hh24:mi'),to_date('2022-04-05 16:02','yyyy-mm-dd hh24:mi'))
	into presenza(Data_presenza,cf_presenza,ora_entrata,ora_uscita) values(to_date('2022-04-06','yyyy-mm-dd'),'NCRCRD70D14D315A',to_date('2022-04-06 08:23','yyyy-mm-dd hh24:mi'),to_date('2022-04-06 17:23','yyyy-mm-dd hh24:mi'))
	into presenza(Data_presenza,cf_presenza,ora_entrata,ora_uscita) values(to_date('2022-04-07','yyyy-mm-dd'),'NCRCRD70D14D315A',to_date('2022-04-07 08:11','yyyy-mm-dd hh24:mi'),to_date('2022-04-07 17:11','yyyy-mm-dd hh24:mi'))
	into presenza(Data_presenza,cf_presenza,ora_entrata,ora_uscita) values(to_date('2022-04-08','yyyy-mm-dd'),'NCRCRD70D14D315A',to_date('2022-04-08 08:13','yyyy-mm-dd hh24:mi'),to_date('2022-04-08 17:13','yyyy-mm-dd hh24:mi'))
	
	into presenza(Data_presenza,cf_presenza,ora_entrata,ora_uscita) values(to_date('2022-04-04','yyyy-mm-dd'),'DSSSSN84R30C649B',to_date('2022-04-04 08:09','yyyy-mm-dd hh24:mi'),to_date('2022-04-04 17:09','yyyy-mm-dd hh24:mi'))
	into presenza(Data_presenza,cf_presenza,ora_entrata,ora_uscita) values(to_date('2022-04-05','yyyy-mm-dd'),'DSSSSN84R30C649B',NULL,NULL)
	into presenza(Data_presenza,cf_presenza,ora_entrata,ora_uscita) values(to_date('2022-04-06','yyyy-mm-dd'),'DSSSSN84R30C649B',to_date('2022-04-06 08:11','yyyy-mm-dd hh24:mi'),to_date('2022-04-06 17:11','yyyy-mm-dd hh24:mi'))
	into presenza(Data_presenza,cf_presenza,ora_entrata,ora_uscita) values(to_date('2022-04-07','yyyy-mm-dd'),'DSSSSN84R30C649B',to_date('2022-04-07 08:04','yyyy-mm-dd hh24:mi'),to_date('2022-04-07 17:04','yyyy-mm-dd hh24:mi'))
	into presenza(Data_presenza,cf_presenza,ora_entrata,ora_uscita) values(to_date('2022-04-08','yyyy-mm-dd'),'DSSSSN84R30C649B',to_date('2022-04-08 08:09','yyyy-mm-dd hh24:mi'),to_date('2022-04-08 17:09','yyyy-mm-dd hh24:mi'))
	
	
	into presenza(Data_presenza,cf_presenza,ora_entrata,ora_uscita) values(to_date('2022-04-04','yyyy-mm-dd'),'CNGRDT64S13E866D',to_date('2022-04-04 08:10','yyyy-mm-dd hh24:mi'),to_date('2022-04-04 17:10','yyyy-mm-dd hh24:mi'))
	into presenza(Data_presenza,cf_presenza,ora_entrata,ora_uscita) values(to_date('2022-04-05','yyyy-mm-dd'),'CNGRDT64S13E866D',to_date('2022-04-05 08:01','yyyy-mm-dd hh24:mi'),to_date('2022-04-05 17:01','yyyy-mm-dd hh24:mi'))
	into presenza(Data_presenza,cf_presenza,ora_entrata,ora_uscita) values(to_date('2022-04-06','yyyy-mm-dd'),'CNGRDT64S13E866D',to_date('2022-04-06 08:03','yyyy-mm-dd hh24:mi'),to_date('2022-04-06 17:03','yyyy-mm-dd hh24:mi'))
	into presenza(Data_presenza,cf_presenza,ora_entrata,ora_uscita) values(to_date('2022-04-07','yyyy-mm-dd'),'CNGRDT64S13E866D',NULL,NULL)
	into presenza(Data_presenza,cf_presenza,ora_entrata,ora_uscita) values(to_date('2022-04-08','yyyy-mm-dd'),'CNGRDT64S13E866D',to_date('2022-04-08 08:12','yyyy-mm-dd hh24:mi'),to_date('2022-04-08 17:12','yyyy-mm-dd hh24:mi'))
	
	
	into presenza(Data_presenza,cf_presenza,ora_entrata,ora_uscita) values(to_date('2022-04-04','yyyy-mm-dd'),'GPPFNZ63A17G455X',to_date('2022-04-04 08:07','yyyy-mm-dd hh24:mi'),to_date('2022-04-04 17:07','yyyy-mm-dd hh24:mi'))
	into presenza(Data_presenza,cf_presenza,ora_entrata,ora_uscita) values(to_date('2022-04-05','yyyy-mm-dd'),'GPPFNZ63A17G455X',to_date('2022-04-05 08:01','yyyy-mm-dd hh24:mi'),to_date('2022-04-05 15:01','yyyy-mm-dd hh24:mi'))
	into presenza(Data_presenza,cf_presenza,ora_entrata,ora_uscita) values(to_date('2022-04-06','yyyy-mm-dd'),'GPPFNZ63A17G455X',to_date('2022-04-06 08:12','yyyy-mm-dd hh24:mi'),to_date('2022-04-06 17:12','yyyy-mm-dd hh24:mi'))
	into presenza(Data_presenza,cf_presenza,ora_entrata,ora_uscita) values(to_date('2022-04-07','yyyy-mm-dd'),'GPPFNZ63A17G455X',to_date('2022-04-07 08:21','yyyy-mm-dd hh24:mi'),to_date('2022-04-07 17:21','yyyy-mm-dd hh24:mi'))
	into presenza(Data_presenza,cf_presenza,ora_entrata,ora_uscita) values(to_date('2022-04-08','yyyy-mm-dd'),'GPPFNZ63A17G455X',to_date('2022-04-08 08:06','yyyy-mm-dd hh24:mi'),to_date('2022-04-08 17:06','yyyy-mm-dd hh24:mi'))
	
	select 1 from dual;




	/*


insert all
	into impiegato(cf_impiegato,ufficio_impiegato,codice_badge,mansione) values ('GPPFNZ63A17G455X','06','68576','Segretario') --ok



	*/
