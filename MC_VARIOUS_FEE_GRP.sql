/*************************************************************************
 **■ MC_VARIOUS_FEE_GRP
 *************************************************************************/
DECLARE
    v_date VARCHAR2(8) := TO_CHAR(sysdate,'YYYYMMDD');
BEGIN
    BEGIN
        EXECUTE IMMEDIATE 'DROP TABLE MC_VARIOUS_FEE_GRP_' || v_date;
    EXCEPTION
    WHEN OTHERS THEN
        NULL;
    END;
EXECUTE IMMEDIATE 'CREATE TABLE MC_VARIOUS_FEE_GRP_' || v_date || ' AS SELECT * FROM MC_VARIOUS_FEE_GRP';
--EXECUTE IMMEDIATE 'TRUNCATE TABLE MC_VARIOUS_FEE_GRP';
FOR con IN ( 
SELECT consignor_code
FROM mc_consignor
ORDER BY consignor_code
)
LOOP
FOR cen IN ( 
SELECT center_code
FROM mc_center
ORDER BY center_code
)
LOOP
BEGIN
INSERT INTO MC_VARIOUS_FEE_GRP (
 CENTER_CODE
,CONSIGNOR_CODE
,VARIOUS_FEE_TYPE
,EXPENSE_CODE
,EXPENSE_NAME
,DISPLAY_ORDER
,DELETE_FLAG
,DATA_VERSION
) VALUES (
 cen.center_code
,con.consignor_code
,'1'
,'10'
,'Transfer Fee'
,'1'
,'0'
,'1'
 );
EXCEPTION
WHEN DUP_VAL_ON_INDEX THEN
NULL;
END;
BEGIN
INSERT INTO MC_VARIOUS_FEE_GRP (
 CENTER_CODE
,CONSIGNOR_CODE
,VARIOUS_FEE_TYPE
,EXPENSE_CODE
,EXPENSE_NAME
,DISPLAY_ORDER
,DELETE_FLAG
,DATA_VERSION
) VALUES (
 cen.center_code
,con.consignor_code
,'1'
,'50'
,'Management Fee'
,'1'
,'0'
,'1'
 );
EXCEPTION
WHEN DUP_VAL_ON_INDEX THEN
NULL;
END;
BEGIN
INSERT INTO MC_VARIOUS_FEE_GRP (
 CENTER_CODE
,CONSIGNOR_CODE
,VARIOUS_FEE_TYPE
,EXPENSE_CODE
,EXPENSE_NAME
,DISPLAY_ORDER
,DELETE_FLAG
,DATA_VERSION
) VALUES (
 cen.center_code
,con.consignor_code
,'1'
,'90'
,'Other'
,'1'
,'0'
,'1'
 );
EXCEPTION
WHEN DUP_VAL_ON_INDEX THEN
NULL;
END;
END LOOP;
END LOOP;
COMMIT;
END;
/
