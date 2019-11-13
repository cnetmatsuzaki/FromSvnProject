/*************************************************************************
 **■ MC_WORK_ZONE
 *************************************************************************/
DECLARE
    v_date VARCHAR2(8) := TO_CHAR(sysdate,'YYYYMMDD');
BEGIN
    BEGIN
        EXECUTE IMMEDIATE 'DROP TABLE MC_WORK_ZONE_' || v_date;
    EXCEPTION
    WHEN OTHERS THEN
        NULL;
    END;
EXECUTE IMMEDIATE 'CREATE TABLE MC_WORK_ZONE_' || v_date || ' AS SELECT * FROM MC_WORK_ZONE';
--EXECUTE IMMEDIATE 'TRUNCATE TABLE MC_WORK_ZONE';
FOR cen IN ( 
SELECT center_code
FROM mc_center
ORDER BY center_code
)
LOOP
BEGIN
INSERT INTO MC_WORK_ZONE (
 CENTER_CODE
,WORK_ZONE_CODE
,NAME
,MH_TYPE
,DELETE_FLAG
,DATA_VERSION
) VALUES (
 cen.center_code
,'001'
,'Zone1'
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
