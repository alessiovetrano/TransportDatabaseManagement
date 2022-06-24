CREATE OR REPLACE VIEW SchemaUffici AS
select cf_impiegato,ufficio_impiegato,num_impiegati from impiegato join ufficio on ufficio_impiegato = num_ufficio;

CREATE OR REPLACE VIEW SchemaVeicoliAssociati AS 
select cf_autista,num_patente,targa as targa_veicolo_associato from autista join veicolo on targa=targa_autista

CREATE OR REPLACE VIEW
Veicoli_disponibili
AS
select targa,tipo_veicolo,casa_produttrice from veicolo 
minus 
select targa,tipo_veicolo,casa_produttrice from veicolo join autista on targa=targa_autista;

CREATE OR REPLACE VIEW ImpiegatiInUfficio_attuale
AS
select num_ufficio as numero_ufficio,count(*) as numero_attuale_impiegati from impiegato join ufficio on num_ufficio = ufficio_impiegato
group by num_ufficio;

CREATE OR REPLACE VIEW StoricoViaggi
AS
select data_viaggio,cf_viaggio 
from viaggio join spedizione on data_viaggio = data_spedizione and cf_viaggio = cf_spedizione;
