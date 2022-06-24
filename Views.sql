CREATE OR REPLACE VIEW SchemaUffici 
AS select cf_impiegato,ufficio_impiegato,num_impiegati from impiegato join ufficio on ufficio_impiegato = num_ufficio;
