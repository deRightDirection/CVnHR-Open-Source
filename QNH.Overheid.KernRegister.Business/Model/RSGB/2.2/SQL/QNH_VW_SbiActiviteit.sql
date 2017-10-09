﻿-- ORACLE VIEW
CREATE OR REPLACE VIEW QNH_VW_SBIACTIVITEIT (
	 Id,
    ISHOOFDSBIACTIVITEIT,
    SbiCode_id,
    KvKInschrijving_id
) AS
SELECT 
	1 AS Id,
	0 AS ISHOOFDSBIACTIVITEIT,
  va.FK_SBI_ACTIVITEIT_CODE AS SbiCode_id,
  0  KvKInschrijving_id
FROM VESTG_ACTIVITEIT va
  INNER JOIN MAATSCHAPP_ACTIVITEIT ma
  on ma.FK_4PES_SC_IDENTIF = va.FK_VESTG_NUMMER;