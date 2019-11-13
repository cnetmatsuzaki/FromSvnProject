/*************************************************************************
 **■ MC_VARIOUS_FEE
 *************************************************************************/
DECLARE
    v_date VARCHAR2(8) := TO_CHAR(sysdate,'YYYYMMDD');
BEGIN
    BEGIN
        EXECUTE IMMEDIATE 'DROP TABLE MC_VARIOUS_FEE_' || v_date;
    EXCEPTION
    WHEN OTHERS THEN
        NULL;
    END;
EXECUTE IMMEDIATE 'CREATE TABLE MC_VARIOUS_FEE_' || v_date || ' AS SELECT * FROM MC_VARIOUS_FEE';
--EXECUTE IMMEDIATE 'TRUNCATE TABLE MC_VARIOUS_FEE';
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
INSERT INTO MC_VARIOUS_FEE (
 CENTER_CODE
,CONSIGNOR_CODE
,VARIOUS_FEE_TYPE
,EXPENSE_CODE
,EXPENSE_ITEM_CODE
,EXPENSE_ITEM_NAME
,DISPLAY_ORDER
,UNIT_RATE
,TAX_CLASS
,DELETE_FLAG
,DATA_VERSION
) VALUES (
 cen.center_code
,con.consignor_code
,'1'
,'10'
,'0001'
,'TranferFee1'
,'1'
,'1'
,'110'
,'0'
,'1'
 );
EXCEPTION
WHEN DUP_VAL_ON_INDEX THEN
NULL;
END;
BEGIN
INSERT INTO MC_VARIOUS_FEE (
 CENTER_CODE
,CONSIGNOR_CODE
,VARIOUS_FEE_TYPE
,EXPENSE_CODE
,EXPENSE_ITEM_CODE
,EXPENSE_ITEM_NAME
,DISPLAY_ORDER
,UNIT_RATE
,TAX_CLASS
,DELETE_FLAG
,DATA_VERSION
) VALUES (
 cen.center_code
,con.consignor_code
,'1'
,'10'
,'0002'
,'TranferFee2'
,'2'
,'1'
,'110'
,'0'
,'1'
 );
EXCEPTION
WHEN DUP_VAL_ON_INDEX THEN
NULL;
END;
BEGIN
INSERT INTO MC_VARIOUS_FEE (
 CENTER_CODE
,CONSIGNOR_CODE
,VARIOUS_FEE_TYPE
,EXPENSE_CODE
,EXPENSE_ITEM_CODE
,EXPENSE_ITEM_NAME
,DISPLAY_ORDER
,UNIT_RATE
,TAX_CLASS
,DELETE_FLAG
,DATA_VERSION
) VALUES (
 cen.center_code
,con.consignor_code
,'1'
,'50'
,'0001'
,'ManagementFee1'
,'1'
,'1'
,'110'
,'0'
,'1'
 );
EXCEPTION
WHEN DUP_VAL_ON_INDEX THEN
NULL;
END;
BEGIN
INSERT INTO MC_VARIOUS_FEE (
 CENTER_CODE
,CONSIGNOR_CODE
,VARIOUS_FEE_TYPE
,EXPENSE_CODE
,EXPENSE_ITEM_CODE
,EXPENSE_ITEM_NAME
,DISPLAY_ORDER
,UNIT_RATE
,TAX_CLASS
,DELETE_FLAG
,DATA_VERSION
) VALUES (
 cen.center_code
,con.consignor_code
,'1'
,'50'
,'0002'
,'ManagementFee2'
,'2'
,'2'
,'030'
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
