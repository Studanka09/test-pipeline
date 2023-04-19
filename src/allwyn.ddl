------------ Deployment: SEMICOLON
------------ Script:      T-TABLE.sql
------------ Technology:  AWS Redshift(id:8)
------------ Stereotype:  Dimension(id:1626) ------------
------------ Date time:   Mar 7, 2023 6:26:04 AM -----------------------------------
------------ Responsible person: EMPTY ------------
------------ Responsible analyst: EMPTY ------------
------------ Business domain: 1,152 ------------
------------ Schema: DW_CORE
------------ Entity type: EMPTY ------------
------------ Retention strategy: EMPTY ------------
------------ Partition strategy: EMPTY ------------
------------ Generated from template version: 56 ------------
------------ mdd-table.redshift27alter.ftl / freemarker 2.3.31
-------------------------------------------------------------------------------
------------ Known issues -----------------------------------------------------
-- 
-------------------------------------------------------------------------------
------------ Comments ---------------------------------------------------------
--
-------------------------------------------------------------------------------
 
-----------------------------------------
------------ TABLE + COLUMNS ------------
-----------------------------------------
CREATE TABLE IF NOT EXISTS DW_CORE.T --  Potrubí
(
    ACT_LEN                            DECIMAL(19,3), --Actual Length - Délka vedení skutečná [m]
    CRITICAL_PRESS_DATE                DATE, --Critical Pressure Date - Datum zjištění kritického tlaku
    DRAW_PRECSN_KEY                    VARCHAR(100) not null, --Drawing Precision Key - Přesnost zákresu, reference na tabulku Drawing Precision
)
;
-----------------------------------------
----------------- Constraints -----------
-----------------------------------------
ALTER TABLE DW_CORE.LINE_EQMT ADD CONSTRAINT PK_LINEEQMT PRIMARY KEY (INVT_KEY);
----------------------------------------------------
-------------------- Redshift comments ---------------
----------------------------------------------------
    comment on table DW_CORE.T is 'Line Equipment: Potrubí';
    comment on column DW_CORE.LINE_EQMT.DRAW_PRECSN_KEY is 'Drawing Precision Key: Přesnost zákresu, reference na tabulku Drawing Precision';
    comment on column DW_CORE.LINE_EQMT.ACT_LEN is 'Actual Length: Délka vedení skutečná [m]';
    comment on column DW_CORE.LINE_EQMT.CRITICAL_PRESS_DATE is 'Critical Pressure Date: Datum zjištění kritického tlaku';

-- NON-UNIQUE INDEXES
----------------------------------------------------
---------------- GRANTS ----------------------------
----------------------------------------------------

------------- Post table scripts ------------------
    ----------------- automatic -------------------
insert into DW_CORE.T(
        DRAW_PRECSN_KEY,
)values(
        'XNA',
);

insert into DW_CORE.T(
        DRAW_PRECSN_KEY,
)values(
        'XER',
);

    commit;
------------- /Post table scripts -------------
 

 
-----------------------------------------
------------ HISTORY TABLE + COLUMNS ------------
-----------------------------------------
CREATE TABLE IF NOT EXISTS DW_CORE.T_H --  Potrubí
(
    ACT_LEN                            DECIMAL(19,3), --Actual Length - Délka vedení skutečná [m]
    CRITICAL_PRESS_DATE                DATE, --Critical Pressure Date - Datum zjištění kritického tlaku
    DRAW_PRECSN_KEY                    VARCHAR(100) not null, --Drawing Precision Key - Přesnost zákresu, reference na tabulku Drawing Precision
    VALID_FROM                         TIMESTAMP default GETDATE() not null, --Valid From - Datum počátku platnosti historického záznamu
    VALID_TO                           TIMESTAMP not null, --Valid To - Datum konce platnosti historického záznamu. Pro aktuálně platné záznamy obsahuje technické nekonečno (datum 31.12.2999).
    INS_DT                             TIMESTAMP not null, --Insert Datetime - Datum a čas vložení záznamu do tabulky
    UPD_DT                             TIMESTAMP not null, --Update Datetime - Datum a čas poslední aktualizace záznamu
)
;
-----------------------------------------
----------------- Constraints -----------
-----------------------------------------
ALTER TABLE DW_CORE.LINE_EQMT_H ADD CONSTRAINT PK_LINEEQMT_H PRIMARY KEY (INVT_KEY, VALID_FROM, VALID_TO);
----------------------------------------------------
-------------------- Redshift comments ---------------
----------------------------------------------------
    comment on table DW_CORE.T is 'Line Equipment History: Potrubí';
    comment on column DW_CORE.LINE_EQMT_H.DRAW_PRECSN_KEY is 'Drawing Precision Key: Přesnost zákresu, reference na tabulku Drawing Precision';
    comment on column DW_CORE.LINE_EQMT_H.ACT_LEN is 'Actual Length: Délka vedení skutečná [m]';
    comment on column DW_CORE.LINE_EQMT_H.CRITICAL_PRESS_DATE is 'Critical Pressure Date: Datum zjištění kritického tlaku';

-- NON-UNIQUE INDEXES
----------------------------------------------------
---------------- GRANTS ----------------------------
----------------------------------------------------

------------- Post table scripts ------------------
------------- /Post table scripts -------------
 

