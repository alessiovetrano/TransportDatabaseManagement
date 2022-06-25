--PRIVILEGI DIRETTORE
GRANT ALL PRIVILEGES TO utenteDirettore;


--PRIVILEGI MANAGER
GRANT SELECT ON SchemaUffici TO ManagerAziendale;
GRANT SELECT ON SchemaVeicoliAssociati TO ManagerAziendale;
GRANT SELECT ON VeicoliDisponibili TO ManagerAziendale;
GRANT SELECT ON ImpiegatiInUfficio_attuale TO ManagerAziendale;
GRANT EXECUTE ON ScheduleViaggio TO ManagerAziendale;
GRANT EXECUTE ON contaOre TO ManagerAziendale;

--PRIVILEGI AUTISTA
GRANT SELECT ON SchemaVeicoliAssociati to AutistaAziendale;
GRANT SELECT ON StoricoViaggi to AutistaAziendale;


--PRIVILEGI IMPIEGATO
GRANT SELECT ON SchemaUffici to ImpiegatoAziendale;
GRANT SELECT ON ImpiegatiInUfficio_attuale TO ImpiegatoAziendale;








