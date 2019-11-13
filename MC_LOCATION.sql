/*************************************************************************
 **■ MC_LOCATION
 *************************************************************************/
DECLARE
    v_date VARCHAR2(8) := TO_CHAR(sysdate,'YYYYMMDD');
BEGIN
    BEGIN
        EXECUTE IMMEDIATE 'DROP TABLE MC_LOCATION_' || v_date;
    EXCEPTION
    WHEN OTHERS THEN
        NULL;
    END;
EXECUTE IMMEDIATE 'CREATE TABLE MC_LOCATION_' || v_date || ' AS SELECT * FROM MC_LOCATION';
--EXECUTE IMMEDIATE 'TRUNCATE TABLE MC_LOCATION';
FOR cen IN ( 
SELECT center_code
FROM mc_center
ORDER BY center_code
)
LOOP
BEGIN
INSERT INTO MC_LOCATION (
 CENTER_CODE
,WAREHOUSE_CODE
,LOCATION_CODE
,WORK_ZONE_CODE
,ZONE
,EDIT_LOCATION_CODE
,LOCATION_TYPE
,PICKING_PRIORITY
,INV_PRIORITY
,EMPTY_FLAG
,MAX_CAPA
,USED_CAPA
,MAX_WEIGHT
,MH_FLAG
,NOT_REC_FLAG
,NOT_SHIP_FLAG
,ADD_FLAG
,SAME_ITEM_FLAG
,SAME_LOT_FLAG
,SAME_LOT2_FLAG
,WAREHOUSE_TRADE_TYPE
,ALLOC_UNIT
,DELETE_FLAG
,DATA_VERSION
) VALUES (
 cen.center_code
,'001'
,'001'
,'001'
,'1'
,''
,''
,'9999'
,'9999'
,'1'
,'9999999.99'
,''
,'9999999.99'
,''
,'0'
,'0'
,'1'
,'0'
,'0'
,'0'
,''
,''
,'0'
,'1'
 );
EXCEPTION
WHEN DUP_VAL_ON_INDEX THEN
NULL;
END;
END LOOP;
COMMIT;
END;
/
