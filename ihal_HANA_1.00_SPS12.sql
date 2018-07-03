WITH 
/* 

[NAME]

- HANA_Configuration_Parameters_1.00.70+

[DESCRIPTION]

- SAP HANA parameter check

[SOURCE]

- SAP Note 1969700

[DETAILS AND RESTRICTIONS]

- Detailed check criteria are described in SAP Note 2600030
- WITH clause requires at least Rev. 70
- WITH clause does not work with older DBACOCKPIT transactions before SAP BASIS 7.02 SP16 / 7.30 SP12 / 7.31 SP12 / SAP_BASIS 7.40 SP07 (empty result returned) 

[VALID FOR]

- Revisions:              >= 1.00.70
- Statistics server type: all

[SQL COMMAND VERSION]
0
- 2014/03/31:  1.0 (initial version)
- 2014/05/13:  1.1 (EXCLUDE_ADMINISTRATIVE_MODIFICATIONS included)
- 2014/09/04:  1.2 (included possibility to check against two disjunct recommended value ranges)
- 2015/06/29:  2.0 (complete redesign)
- 2015/09/14:  2.1 (MDCSYS included)
- 2015/10/12:  2.2 (SDA and IQ included)
- 2016/02/16:  2.3 (PROD included)
- 2016/02/18:  2.4 (ABAP included)
- 2016/03/10:  2.5 (MDCTEN included)
- 2016/05/02:  2.6 (CPU_THREADS and ALLOC_LIM_MB included)
- 2016/08/13:  2.7 (IMPLEMENTATION_COMMAND and UNDO_COMMAND included)
- 2016/12/02:  2.8 (NUM_SLAVES included)
- 2018/05/10:  2.9 (priority P included)
- 2017/12/01:  3.0 QPCM initial modification
- 2018/04/03:  3.1 QPCM update
- 2018/06/16:  3.2 QPCM update
- 2018/07/03:  3.3 QPCM update: P included 

[INVOLVED TABLES]

- M_INIFILE_CONTENTS

[INPUT PARAMETERS]

- FILE_NAME

  File name

  'alert.trc'     --> File with name alert.trc
  '%oom%'         --> File with name containing 'oom'
  '%'             --> All files

- SECTION

  Parameter file section

  'joins'         --> Specific parameter file section 'joins'
  'stat%'         --> All parameter file sections starting with 'stat'
  '%'             --> All parameter file sections

- PARAMETER_NAME

  Parameter name

  'enable'        --> Parameters with name 'enable'
  'unload%'       --> Parameters starting with 'unload'
  '%'             --> All parameters

- REVISION

  Revision level to be checked against

  80              --> Check parameters against revision 80 recommendations
  -1              --> Check parameters against currently implemented revision

- VERSION

  Version level to be checked against

  2               --> Check parameters against SAP HANA version 2
  -1              --> Check parameters against currently implemented version

- CPU_THREADS

  Number of CPU threads to be taken into account for some parameter recommendations

  120             --> Consider 120 CPU threads for related parameter recommendations
  -1              --> Check parameters against CPU threads in current system

- NUMA_NODES

  Number of NUMA nodes (typically sockets) to be taken into account for some parameter recommendations

  16              --> Consider 16 NUMA nodes
  -1              --> Check parameters against NUMA nodes in current system

- ALLOC_LIM_GB

0  Service allocation limit (GB) to be taken into account for some parameter recommendations

  512             --> Consider service allocation limit of 512 GB for related parameter recommendations
  -1              --> Check parameters against service allocation limit in current system

- ENVIRONMENT

  Comma-separated list of environmental information:
  - ABAP:   ABAP stack
  - BPC:    Business objects planning and consolidation
  - BW:     Business warehouse
  - CRM:    Customer relationship management
  - ERP:    Enterprise resource planning (incl. SoH, S4HANA)
  - ESS:    Embedded statistics server
  - EWM:    Extended warehouse management
  - FRA:    Fraud management
  - HIST:   Existence of history tables (temporal tables / time-travel)
  - IQ:     Smart data access (Sybase IQ remote source)
  - LCACHE: Integrated liveCache
  - MDCSYS: Multitenant (system DB)
  - MDCTEN: Multitenant (tenant DB)
  - MULTI:  Scale-out / multi node
  - PORTAL: Enterprise Portal
  - PROD:   Production system
  - SCM:    Supply chain management
  - SDA:    Smart data access
  - SINGLE: Single node
  - SRM:    Supplier relationship management
  - SSS:    Standalone statistics server
  - SYSREP: System replication

  'ERP'          --> Provide recommendations for ERP environments
  'BW,MULTI'     --> Provide recommendations for BW scale-out environments
  'AUTO'         --> Automatic determination of system environment

- EXCLUDE_DEFAULT_MODIFICATIONS

  Controls the exclusion of parameters that are usually modified by the system per default

  'X'             --> Exclude parameters that are often modified by the system per default
  ' '             --> No restriction

- EXCLUDE_ADMINISTRATIVE_MODIFICATIONS

  Controls the exclusion of parameters that are usually modified for administrative reasons 
  (e.g. backup parameter file, table placement details)

  'X'             --> Exclude parameters that are often modified for administrative reasons
  ' '             --> No restriction

- EXCLUDE_SECURITY_MODIFICATIONS

  Controls the exclusion of parameters that are usually modified for security reasons 
  (e.g. password policites)

  'X'             --> Exclude parameters related to security
  ' '             --> No restriction

- MAX_VALUE_LENGTH

  Maximum length of parameter values

  40              --> Truncate parameter values after 40 characters
  -1              --> No truncation

[OUTPUT PARAMETERS]

- FILE_NAME:              Parameter file name
- SECTION:                Parameter file section
- PARAMETER_NAME:         Parameter name
- DEFAULT_VALUE:          Parameter value default
- CONFIGURED_VALUE:       Parameter value explicitly configured
- RECOMMENDED_VALUE:      Parameter value recommendation
- SAP_NOTE:               SAP Notes with further details for parameter
- CONFIGURED_HOST:        Parameter host explicitly configured,
- IMPLEMENTATION_COMMAND: Command to implement the recommended parameter changes (needs to be adjusted in case of ranges, individual requirements or TENANT related settings)
- UNDO_COMMAND:           Command to undo the recommended parameter changes (needs to be adjusted in case of individual requirements or TENANT related settings)

[EXAMPLE OUTPUT]

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
|FILE_NAME       |SECTION               |PARAMETER_NAME                  |DEFAULT_VALUE                           |CONFIGURED_VALUE                        |RECOMMENDED_VALUE      |SAP_NOTE|CONFIGURED_HOST|
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
|EVALUATION TIME:|2015/06/28 16:31:29   |                                |                                        |                                        |                       |        |               |
|REVISION:       |96                    |                                |                                        |                                        |                       |        |               |
|ENVIRONMENT:    |BW,ESS,MULTI          |                                |                                        |                                        |                       |        |               |
|                |                      |                                |                                        |                                        |                       |        |               |
|global.ini      |auditing configuration|global_auditing_state           |-- HANA internal --                     |-- not set --                           |true                   |  863362|-- not set --  |
|global.ini      |cryptography          |ssfs_key_file_path              |                                        |-- not set --                           |-- individual value -- | 2183624|-- not set --  |
|global.ini      |memorymanager         |statement_memory_limit          |                                        |300                                     |-- individual value -- | 1999997|               |
|indexserver.ini |sqlscript             |enable_select_into_scalar_udf   |-- HANA internal --                     |TRUE                                    |true                   | 2160814|               |
|indexserver.ini |transaction           |transaction_history_record_limit|1000000                                 |-- not set --                           |-- individual value -- | 1910610|-- not set --  |
|indexserver.ini |transaction           |transaction_history_size_limit  |10240                                   |-- not set --                           |-- individual value -- | 1910610|-- not set --  |
|xsengine.ini    |persistence           |log_segment_size_mb             |8                                       |-- not set --                           |64 to 1024             | 2062080|-- not set --  |
|global.ini      |table_placement       |bw_schema                       |-- HANA internal --                     |SAPSR3,SAPSR3SHD                        |-- no recommendation --| 2178461|               |
|global.ini      |table_placement       |prefix                          |-- HANA internal --                     |/                                       |-- no recommendation --| 2178461|               |
|indexserver.ini |mergedog              |auto_merge_decision_func        |(((DMS>PAL/2000 or DCC>100) and DRC > MR|(((DRC*TMD>3600*(MRC+0.0001) or DMS>PAL/|-- no recommendation --| 2057046|               |
|indexserver.ini |row_engine            |consistency_check_at_startup    |-- HANA internal --                     |page, index                             |-- no recommendation --|        |saphanahost    |
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

*/

BASIS_INFO AS
( SELECT
    BI.FILE_NAME,
    BI.SECTION,
    BI.PARAMETER_NAME,
    BI.CPU_THREADS BI_CPU_THREADS,
    MAP(BI.CPU_THREADS, -1, C.CPU_THREADS, BI.CPU_THREADS) CPU_THREADS,
    MAP(BI.CPU_FREQUENCY_MHZ, -1, C.CPU_FREQUENCY_MHZ, BI.CPU_FREQUENCY_MHZ) CPU_FREQUENCY_MHZ,
    MAP(BI.NUMA_NODES, -1, N.NUMA_NODES, BI.NUMA_NODES) NUMA_NODES,
    BI.ALLOC_LIM_GB BI_ALLOC_LIM_GB,
    MAP(BI.ALLOC_LIM_GB, -1, M.ALLOC_LIM_GB, BI.ALLOC_LIM_GB) ALLOC_LIM_GB,
    MAP(BI.NUM_SLAVES, -1, S.NUM_SLAVES, BI.NUM_SLAVES) NUM_SLAVES,
    MAP(BI.REVISION, -1, P.REVISION, BI.REVISION) CHECK_REVISION,
    MAP(BI.VERSION, -1, P.VERSION, BI.VERSION) CHECK_VERSION,
    MAX_VALUE_LENGTH,
    MAP(BI.ENVIRONMENT, 'AUTO', F.ENVIRONMENT, BI.ENVIRONMENT) ENV,
    EXCLUDE_DEFAULT_MODIFICATIONS,
    EXCLUDE_ADMINISTRATIVE_MODIFICATIONS,
    EXCLUDE_SECURITY_MODIFICATIONS,
    EXCLUDE_WEBDISPATCHER
  FROM
  ( SELECT                     /* Modification section */
      '%' FILE_NAME,
      '%' SECTION,
      '%' PARAMETER_NAME,
      -1 REVISION,             /* revision level to be checked, -1 for current revision */
      -1 VERSION,              /* main version level to be checked, -1 for current version */
      -1 CPU_THREADS,          /* number of CPU threads per SAP HANA node, -1 for CPU threads in existing system */
      -1 CPU_FREQUENCY_MHZ,    /* CPU frequency in MHz */
      -1 NUMA_NODES,           /* number of NUMA nodes (typically sockets) per SAP HANA node, -1 for NUMA nodes in existing system */
      -1 ALLOC_LIM_GB,         /* service allocation limit per SAP HANA node (GB), -1 for service allocation limit in existing system */
      -1 NUM_SLAVES,           /* number of slave nodes, -1 for number of slave nodes in existing system */
      'AUTO' ENVIRONMENT,      /* AUTO for automatic determination based on current environment,
                                  ABAP, BPC, BW, CRM, ERP, ESS, EWM, FRA, HIST, IQ, LCACHE, MDCSYS, MDCTEN, MULTI, PORTAL, PROD, S4, SCM, SDA, SINGLE, SRM, SSS, SYSREP, XFS and comma separated combinations */
      'X' EXCLUDE_DEFAULT_MODIFICATIONS,                   /* Exclusion of parameters that are usually modified by the system per default */
      'X' EXCLUDE_ADMINISTRATIVE_MODIFICATIONS,            /* Exclusion of parameters that are modified for administrative reasons, e.g. backup parameter file location */
      'X' EXCLUDE_SECURITY_MODIFICATIONS,                  /* Exclusion of parameters related to security, e.g. password policies */
      'X' EXCLUDE_WEBDISPATCHER,
      -1  MAX_VALUE_LENGTH
    FROM
      DUMMY
  ) BI,
  ( SELECT
      RTRIM(MAP(ABAP, 'Yes', 'ABAP,', '') || MAP(BPC, 'Yes', 'BPC,', '') || MAP(BW, 'Yes', 'BW,', '') || MAP(CRM, 'Yes', 'CRM,', '') || MAP(ERP, 'Yes', 'ERP,', '') || 
        MAP(ESS, 'Yes', 'ESS,', '') || MAP(EWM, 'Yes', 'EWM,', '') || MAP(S4, 'Yes', 'S/4,', '') || MAP(FRA, 'Yes', 'FRA,', '') || MAP(HIST, 'Yes', 'HIST,', '') || 
        MAP(IQ, 'Yes', 'IQ,', '') || MAP(LCACHE, 'Yes', 'LCACHE,', '') || MAP(MDCSYS, 'Yes', 'MDCSYS,', '') || MAP(MDCTEN, 'Yes', 'MDCTEN,', '') || MAP(MULTI, 'Yes', 'MULTI,', '') || 
        MAP(PORTAL, 'Yes', 'PORTAL,', '') || MAP(PROD, 'Yes', 'PROD,', '') || MAP(SCM, 'Yes', 'SCM,', '') || MAP(SDA, 'Yes', 'SDA,', '') || 
        MAP(SINGLE, 'Yes', 'SINGLE,', '') || MAP(SRM, 'Yes', 'SRM,', '') || MAP(SSS, 'Yes', 'SSS,', '') || MAP(SYSREP, 'Yes', 'SYSREP,', '') ||
        MAP(XFS, 'Yes', 'XFS,', ''), ',') ENVIRONMENT
    FROM
    ( SELECT
        MAP(COUNT(*), 0, 'No', 'Yes') ABAP
      FROM
        TABLES
      WHERE
        TABLE_NAME = 'T000'
    ),
    ( SELECT 
        MAP(COUNT(*), 0, 'No', 'Yes') BPC
      FROM
        M_TABLES
      WHERE
        TABLE_NAME = 'UJA_APPL' AND
        RECORD_COUNT > 0
    ),
    ( SELECT
        CASE WHEN IFNULL(SUM(RECORD_COUNT), 0) <= 10 THEN 'No' ELSE 'Yes' END BW
      FROM
        M_CS_TABLES
      WHERE
        TABLE_NAME = '/BI0/SREQUID'
    ),
    ( SELECT
        CASE WHEN IFNULL(SUM(RECORD_COUNT), 0) <= 10000 THEN 'No' ELSE 'Yes' END CRM
      FROM
        M_CS_TABLES
      WHERE
        TABLE_NAME = 'CRMD_ORDERADM_H'
    ),
    ( SELECT
        CASE WHEN IFNULL(SUM(RECORD_COUNT), 0) <= 10000 THEN 'No' ELSE 'Yes' END ERP
      FROM
        M_CS_TABLES
      WHERE
        TABLE_NAME IN ('MARA', 'BSEG', 'ACDOCA', 'PPOIX')
    ),
    ( SELECT
        MAP(IFNULL(SYSTEM_VALUE, IFNULL(HOST_VALUE, DEFAULT_VALUE)), 'true', 'Yes', NULL, 'Yes', 'No') ESS
      FROM
        DUMMY LEFT OUTER JOIN
      ( SELECT
          MAX(MAP(LAYER_NAME, 'DEFAULT', VALUE)) DEFAULT_VALUE,
          MAX(MAP(LAYER_NAME, 'HOST',    VALUE)) HOST_VALUE,
          MAX(MAP(LAYER_NAME, 'SYSTEM',  VALUE)) SYSTEM_VALUE
        FROM
          M_INIFILE_CONTENTS
        WHERE
          FILE_NAME IN ('indexserver.ini', 'nameserver.ini' ) AND
          SECTION = 'statisticsserver' AND
          KEY = 'active'
        GROUP BY
          KEY
      ) ON
        1 = 1
    ),
    ( SELECT 
        CASE WHEN IFNULL(SUM(RECORD_COUNT), 0) <= 10 THEN 'No' ELSE 'Yes' END EWM
      FROM
        M_CS_TABLES 
      WHERE
        TABLE_NAME = '/SCWM/ORDIM_C'
    ),
    ( SELECT 
        CASE WHEN IFNULL(SUM(RECORD_COUNT), 0) <= 10 THEN 'No' ELSE 'Yes' END S4
      FROM
        M_CS_TABLES 
      WHERE
        TABLE_NAME = 'MATDOC'
    ),
    ( SELECT 
        MAP(COUNT(*), 0, 'No', 'Yes') FRA
      FROM
        TABLES 
      WHERE
       TABLE_NAME IN ( 'FRA_D_ALERT_ROOT', 'FRA_D_STRAT_ROOT' )
    ),
    ( SELECT
        CASE WHEN COUNT(*) > 0 THEN 'Yes' ELSE 'No' END HIST
      FROM
        TABLES
      WHERE
        SESSION_TYPE = 'HISTORY'
    ),
    ( SELECT
        CASE WHEN COUNT(*) > 0 THEN 'Yes' ELSE 'No' END IQ
      FROM
        REMOTE_SOURCES
      WHERE
        ADAPTER_NAME = 'iqodbc'
    ),
    ( SELECT
        CASE WHEN COUNT(*) > 0 THEN 'Yes' ELSE 'No' END LCACHE
      FROM
        M_LIVECACHE_CONTAINER_STATISTICS
    ),
    ( SELECT
        CASE WHEN P.DB_TYPE = 'multidb' AND D.DATABASE_NAME != 'SYSTEMDB' THEN 'Yes' ELSE 'No' END MDCTEN
      FROM
      ( SELECT
          IFNULL(SYSTEM_VALUE, IFNULL(HOST_VALUE, DEFAULT_VALUE)) DB_TYPE
        FROM
        ( SELECT
            MAX(MAP(LAYER_NAME, 'DEFAULT', VALUE)) DEFAULT_VALUE,
            MAX(MAP(LAYER_NAME, 'HOST',    VALUE)) HOST_VALUE,
            MAX(MAP(LAYER_NAME, 'SYSTEM',  VALUE)) SYSTEM_VALUE
          FROM
            M_INIFILE_CONTENTS
          WHERE
            FILE_NAME = 'global.ini' AND
            SECTION = 'multidb' AND
            KEY = 'mode'
        )
      ) P,
        M_DATABASE D
    ),
    ( SELECT
        CASE WHEN P.DB_TYPE = 'multidb' AND D.DATABASE_NAME = 'SYSTEMDB' THEN 'Yes' ELSE 'No' END MDCSYS
      FROM
      ( SELECT
          IFNULL(SYSTEM_VALUE, IFNULL(HOST_VALUE, DEFAULT_VALUE)) DB_TYPE
        FROM
        ( SELECT
            MAX(MAP(LAYER_NAME, 'DEFAULT', VALUE)) DEFAULT_VALUE,
            MAX(MAP(LAYER_NAME, 'HOST',    VALUE)) HOST_VALUE,
            MAX(MAP(LAYER_NAME, 'SYSTEM',  VALUE)) SYSTEM_VALUE
          FROM
            M_INIFILE_CONTENTS
          WHERE
            FILE_NAME = 'global.ini' AND
            SECTION = 'multidb' AND
            KEY = 'mode'
        )
      ) P,
        M_DATABASE D
    ),
    ( SELECT
        RTRIM(SUBSTR(VALUE, 1, 3)) MULTI
      FROM
        M_SYSTEM_OVERVIEW
      WHERE
        SECTION = 'System' AND
        NAME = 'Distributed'
    ),
    ( SELECT
        MAP(COUNT(*), 0, 'No', 'Yes') PORTAL
      FROM
        TABLES
      WHERE
        TABLE_NAME IN ( 'EP_ATTR_VALUES3', 'KMC_DBRM_CONTENT' )
    ),
    ( SELECT
        MAP(UPPER(USAGE), 'PRODUCTION', 'Yes', 'No') PROD
      FROM
        M_DATABASE
    ),
    ( SELECT 
        MAP(COUNT(*), 0, 'No', 'Yes') SCM
      FROM
        TABLES 
      WHERE
        TABLE_NAME = '/SAPAPO/APO01'
    ),
    ( SELECT
        MAP(COUNT(*), 0, 'No', 'Yes') SDA
      FROM
        REMOTE_SOURCES
    ),
    ( SELECT
        MAP(RTRIM(SUBSTR(VALUE, 1, 3)), 'No', 'Yes', 'No') SINGLE
      FROM
        M_SYSTEM_OVERVIEW
      WHERE
        SECTION = 'System' AND
        NAME = 'Distributed'
    ),
    ( SELECT
        CASE WHEN IFNULL(SUM(RECORD_COUNT), 0) <= 1000 THEN 'No' ELSE 'Yes' END SRM
      FROM
        M_CS_TABLES
      WHERE
        TABLE_NAME IN ('BBP_PDORG', 'BBP_PDIGP')
    ),
    ( SELECT
        MAP(COUNT(*), 0, 'No', 'Yes') SSS
      FROM
        M_SERVICES
      WHERE
        SERVICE_NAME = 'statisticsserver'
    ),
    ( SELECT
        CASE SUM(MAP(FILESYSTEM_TYPE, 'xfs', 1, 0)) WHEN 0 THEN 'No' ELSE 'Yes' END XFS 
      FROM 
        M_DISKS 
    ),
    ( SELECT
        MAP(COUNT(*), 0, 'No', 'Yes') SYSREP
      FROM
        M_SERVICE_REPLICATION
    )
  ) F,
  ( SELECT
      VERSION,
      REVISION,
      CASE 
        WHEN VERSION = 1 THEN
        CASE
          WHEN REVISION BETWEEN 120 AND 129.99 THEN 12
          WHEN REVISION BETWEEN 110 AND 119.99 THEN 11
          WHEN REVISION BETWEEN 100 AND 109.99 THEN 10
          WHEN REVISION BETWEEN  90 AND  99.99 THEN  9
          WHEN REVISION BETWEEN  80 AND  89.99 THEN  8
          WHEN REVISION BETWEEN  70 AND  79.99 THEN  7
          WHEN REVISION BETWEEN  60 AND  69.99 THEN  6
          WHEN REVISION BETWEEN  45 AND  59.99 THEN  5
          WHEN REVISION BETWEEN  28 AND  44.99 THEN  4
          WHEN REVISION BETWEEN  20 AND  27.99 THEN  3
          WHEN REVISION BETWEEN  12 AND  19.99 THEN  2
          WHEN REVISION BETWEEN   1 AND  11.99 THEN  1
        END
        WHEN VERSION = 2 THEN
          0
      END SPS
    FROM
    ( SELECT
        TO_NUMBER(SUBSTR(VALUE, 1, 1)) VERSION,
        TO_DECIMAL(SUBSTR(VALUE, LOCATE(VALUE, '.', 1, 2) + 1, LOCATE(VALUE, '.', 1, 3) - LOCATE(VALUE, '.', 1, 2) - 1) ||
        MAP(LOCATE(VALUE, '.', 1, 4), 0, '', '.' || SUBSTR(VALUE, LOCATE(VALUE, '.', 1, 3) + 1, LOCATE(VALUE, '.', 1, 4) - LOCATE(VALUE, '.', 1, 3) - 1 )), 10, 2) REVISION 
      FROM 
        M_SYSTEM_OVERVIEW 
      WHERE 
        SECTION = 'System' AND 
        NAME = 'Version' 
    )
  ) P,
  ( SELECT
      MAX(MAP(KEY, 'cpu_cores', VALUE, 0)) CPU_CORES,
      MAX(MAP(KEY, 'cpu_threads', VALUE, 0)) CPU_THREADS,
      MAX(MAP(KEY, 'cpu_clock', VALUE, 0)) CPU_FREQUENCY_MHZ
    FROM
      M_HOST_INFORMATION
  ) C,
  ( SELECT
      MAX(NUMA_NODES) NUMA_NODES
    FROM
    ( SELECT
        COUNT(DISTINCT(STATISTICS_NAME)) NUMA_NODES
      FROM
        M_SEMAPHORES
      WHERE
        STATISTICS_NAME LIKE 'jx-free%'
      GROUP BY
        HOST
    )
  ) N,
  ( SELECT
      TO_DECIMAL(ROUND(MIN(ALLOC_LIMIT) / 1024 / 1024 / 1024), 10, 0) ALLOC_LIM_GB
    FROM
    ( ( SELECT TOP 1
          ALLOCATION_LIMIT ALLOC_LIMIT
        FROM
          M_SERVICE_MEMORY
        ORDER BY
          MAP(SERVICE_NAME, 'indexserver', 1, 'nameserver', 2, 3)
      )
      UNION ALL
      SELECT
        ALLOCATION_LIMIT ALLOC_LIMIT
      FROM
        M_HOST_RESOURCE_UTILIZATION
    )
  ) M,
  ( SELECT 
      COUNT(*) NUM_SLAVES
    FROM 
      M_LANDSCAPE_HOST_CONFIGURATION 
    WHERE 
      HOST_STATUS IN ('OK','WARNING','INFO') AND 
      INDEXSERVER_ACTUAL_ROLE='SLAVE'
  ) S
),
PARAMETER_INFOS AS
( SELECT
    P.ENV,
    CASE
      WHEN BI.ENV LIKE '%MDCSYS%' AND P.FILE_NAME = 'indexserver.ini' THEN 'nameserver.ini'
      WHEN BI.ENV LIKE '%MDCSYS%' AND P.FILE_NAME = 'indexserver_strict.ini' THEN 'indexserver.ini'
      WHEN BI.ENV LIKE '%MDC%'    AND P.FILE_NAME = 'nameserver.ini'  THEN 'indexserver.ini'
      ELSE P.FILE_NAME
    END FILE_NAME,
    P.P,
    P.SECTION,
    P.PARAMETER_NAME,
    P.NOT_1,
    P.MIN_VALUE_1,
    P.MAX_VALUE_1,
    P.MIN_VALUE_2,
    P.MAX_VALUE_2,
    P.MIN_REV,
    P.MAX_REV,
    P.MIN_VERS,
    P.MAX_VERS,
    P.SAP_NOTE,
    P.AREA,
    P.TYPE
  FROM
    BASIS_INFO BI,
  ( SELECT 0 P, 'ALL' ENV,     ' ' FILE_NAME,          ' ' SECTION,                ' ' PARAMETER_NAME,                          ' ' NOT_1, ' ' MIN_VALUE_1,      ' ' MAX_VALUE_1,         ' ' MIN_VALUE_2,           ' ' MAX_VALUE_2,           -1 MIN_REV, -1 MAX_REV, -1 MIN_VERS, -1 MAX_VERS, '' SAP_NOTE, ' ' AREA, ' 'TYPE FROM DUMMY WHERE 1 = 0 UNION ALL
    SELECT 0, 'ALL',         '%',                    'authentication',           '%',                                         ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2159014', 'security',       'S' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         '%',                    'communication',            'default_read_timeout',                      ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2000003', 'terminations',   ' ' FROM DUMMY UNION ALL
    SELECT 0, 'MDCSYS',      '%',                    '%',                        'listenport',                                ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2186744', 'multitenant',    'D' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         '%',                    'load_trace',               '%',                                         ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2119087', 'monitoring',     ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         '%',                    'password policy',          '%',                                         ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2159014', 'security',       'S' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         '%',                    'password policy',          'password_lock_for_system_user',             ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2216869', 'security',       'S' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         '%',                    'password policy',          'detailed_error_on_connect',                 ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2216869', 'security',       'S' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         '%',                    'persistence',              'log_segment_size_mb',                       ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2083715', 'backup',         ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         '%',                    'performance_analyzer',     '%',                                         ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2119087', 'monitoring',     ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         '%',                    'pythontrace',              '%',                                         ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2119087', 'monitoring',     ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         '%',                    'row_engine',               'lock_table_array_size',                     ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2169283', 'monitoring',     ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         '%',                    'row_engine',               'startup_consistency_check_timeout',         ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2116157', 'consistency',    ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         '%',                    'sqltrace',                 '%',                                         ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2119087', 'monitoring',     ' ' FROM DUMMY UNION ALL
    SELECT 3, 'SYSREP',      '%',                    'system_replication',       'logshipping_async_buffer_size',             ' ', '1073741824',               '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    73,  1,  1, '2086024', 'system rep.',    ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         '%',                    'trace',                    '%',                                         ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2119087', 'monitoring',     ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         '%',                    'traceprofile%',            '%',                                         ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2119087', 'monitoring',     ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         '%',                    'unload_trace',             '%',                                         ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2119087', 'monitoring',     ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'attributes.ini',       'global',                   'inverted_index_compression',                ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2177064', 'crash',          ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'attributes.ini',       'global',                   'inverted_index_verification_after_load',    ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2036111', 'consistency',    ' ' FROM DUMMY UNION ALL
    SELECT 1, 'ALL',         'attributes.ini',       'global',                   'runtime_structure_persistence',             ' ', 'false',                    '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', 70,    70,  1,  1, '2160391', 'consistency',    ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'attributes.ini',       'idattribute',              'check_duplicates_on_merge',                 ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', 64,    66,  1,  1, '1919034', 'consistency',    ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'daemon.ini',           '%',                        'affinity',                                  ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2100040', 'CPU',            ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'daemon.ini',           '%',                        'instances',                                 ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1,        '', ' ',              'D' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'daemon.ini',           '%',                        'instancids',                                ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2200202', ' ',              'D' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'daemon.ini',           'xsengine.%',               '%',                                         ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1,        '', ' ',              'D' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'daemon.ini',           'dpserver.%',               '%',                                         ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1,        '', ' ',              'D' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'daemon.ini',           'daemon',                   'environment',                               ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2222217', 'startup',        ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'daemon.ini',           'daemon',                   'forcedterminationtimeout',                  ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2177064', 'shutdown',       ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'daemon.ini',           'daemon',                   'terminationtimeout',                        ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2177064', 'shutdown',       ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'daemon.ini',           'esserver',                 'arguments',                                 ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2560038', 'startup',        ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'daemon.ini',           'limits',                   'core',                                      ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2154870', 'OS',             ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'dpserver.ini',         'framework',                'prefetchtimeout',                           ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2363544', 'terminations',   ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'dpserver.ini',         'framework',                'useprefetch',                               ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2363544', 'terminations',   ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'dpserver.ini',         'framework',                 'active',                                    ' ', 'yes',                      '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', 102.01,102.02, 1,  1, '2240059', 'monitoring',  ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'esserver.ini',         'database',                 'es_log_backup_interval',                    ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2547514', 'backup',         ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'esserver.ini',         'database',                 'es_log_backup_timeout',                     ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2184754', 'backup',         ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'esserver.ini',         'startup',                  'load_memory_mb',                            ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2096805', 'backup',         ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'esserver.ini',         'startup',                  'max_concurrent_connections',                ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2560038', 'performance',    ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'esserver.ini',         'startup',                  'max_concurrent_queries',                    ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2560038', 'performance',    ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'executor.ini',         'global',                   'use_statement_memory_tracking',             ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2207501', 'memory',         ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'executor.ini',         'inactivity',               'local_time',                                ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2584706', 'terminations',   ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'executor.ini',         'inactivity',               'remote_time',                               ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2584706', 'terminations',   ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'global.ini',           'auditing configuration',   'alert_audit_trail_type',                    ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2036111', 'security',       ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'global.ini',           'auditing configuration',   'critical_audit_trail_type',                 ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2036111', 'security',       ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'global.ini',           'auditing configuration',   'default_audit_trail_path',                  ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1,        '', ' ',              'A' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'global.ini',           'auditing configuration',   'default_audit_trail_type',                  'X', 'CSVTEXTFILE',              '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1,  '863362', 'security',       ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'global.ini',           'auditing configuration',   'emergency_audit_trail_type',                ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2036111', 'security',       ' ' FROM DUMMY UNION ALL
    SELECT 2, 'ALL',         'global.ini',           'auditing configuration',   'global_auditing_state',                     ' ', 'true',                     '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', 85.04, 89,  1,  1,  '863362', 'security',       ' ' FROM DUMMY UNION ALL
    SELECT 2, 'ALL',         'global.ini',           'auditing configuration',   'global_auditing_state',                     ' ', 'true',                     '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', 93,    -1,  1,  2,  '863362', 'security',       ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'global.ini',           'backint',                  '%_backup_parameter_file',                   ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1,        '', ' ',              'A' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'global.ini',           'backup',                   '%_backup_parameter_file',                   ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1,        '', ' ',              'A' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'global.ini',           'backup',                   'backint_response_timeout',                  ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2000003', 'backup',         'A' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'global.ini',           'backup',                   'data_backup_buffer_size',                   ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2458043', 'backup',         'A' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'global.ini',           'backup',                   'data_backup_max_chunk_size',                ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1,        '', 'backup',         'A' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'global.ini',           'backup',                   'data_backup_savepoint_lock_timeout',        ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2000003', 'backup',         ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'global.ini',           'backup',                   'log_backup_using_backint',                  ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1,        '', ' ',              'A' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'global.ini',           'backup',                   'max_recovery_backint_channels',             ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2168842', 'backup',         ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'global.ini',           'backup',                   'max_recoveryfile_age',                      ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '1975225', 'backup',         ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'global.ini',           'backup',                   'max_log_backup_group_size',                 ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2154870', 'backup',         ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'global.ini',           'backup',                   'parallel_data_backup_backint_channels',     ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2360533', 'backup',         'A' FROM DUMMY UNION ALL
    SELECT 0, 'MULTI',       'global.ini',           'communication',            'internal_network',                          ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2242514', 'network',        'A' FROM DUMMY UNION ALL
    SELECT 2, 'MULTI',       'global.ini',           'communication',            'listeninterface',                           ' ', '.internal',                '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', 70,    -1,  1, -1, '2183363', 'security',       ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'global.ini',           'communication',            'ss',                                        ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2159014', ' ',              'A' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'global.ini',           'communication',            'sslvalidatecertificate',                    ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2159014', ' ',              'A' FROM DUMMY UNION ALL
    SELECT 2, 'ALL',         'global.ini',           'communication',            'tcp_backlog',                               ' ', '2048',                     '-- no recommendation --', '-- no recommendation --', '-- no recommendation --',100,    -1,  1, -1, '2382421', 'terminations',   ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'global.ini',           'cross_database_access',    'enabled',                                   ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2387002', 'crash',          ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'global.ini',           'cryptography',             'ccl_fips_enabled',                          ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2180024', 'security',       ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'global.ini',           'cryptography',             'ssfs_key_file_path',                        ' ', '-- individual value --',   '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', 60, 85.04,  1,  1, '2183624', 'security',       ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'global.ini',           'cryptography',             'ssfs_key_file_path',                        ' ', '-- individual value --',   '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', 90,    97,  1,  1, '2183624', 'security',       ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'global.ini',           'cryptography',             'ssfs_key_file_path',                        ' ', '-- individual value --',   '-- no recommendation --', '-- no recommendation --', '-- no recommendation --',100,   100,  1,  1, '2183624', 'security',       ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'global.ini',           'csaccessor',               'use_dml_executor_dataredo',                 ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2449857', 'crash',          ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'global.ini',           'executed_statement',       'enable_ddl',                                ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2366291', 'trace',          ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'global.ini',           'executed_statement',       'maxfiles',                                  ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2366291', 'trace',          ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'global.ini',           'executed_statement',       'maxfilesize',                               ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2366291', 'trace',          ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'global.ini',           'executed_statement',       'trace_flush_interval',                      ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2366291', 'trace',          ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'global.ini',           'executed_statement',       'use_in_memory_tracing',                     ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2366291', 'trace',          ' ' FROM DUMMY UNION ALL
    SELECT 1, 'ALL',         'global.ini',           'execution',                'default_statement_concurrency_limit',       ' ', '-- SPECIAL --',            '-- SPECIAL --',           '-- no recommendation --', '-- no recommendation --',102.03, -1,  1, -1, '2222250', 'CPU',            ' ' FROM DUMMY UNION ALL
    SELECT 1, 'ALL',         'global.ini',           'execution',                'max_concurrency',                           ' ', '-- SPECIAL --',            '-- SPECIAL --',           '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2222250', 'CPU',            ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'global.ini',           'execution',                'max_concurrency_dyn_min_pct',               ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2222250', 'CPU',            ' ' FROM DUMMY UNION ALL
    SELECT 1, 'ALL',         'global.ini',           'execution',                'max_concurrency_hint',                      ' ', '-- SPECIAL --',            '-- SPECIAL --',           '-- no recommendation --', '-- no recommendation --', -1,     2, -1, 29, '2222250', 'CPU',            ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'global.ini',           'execution',                'max_concurrency_hint_dyn_min_pct',          ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2222250', 'CPU',            ' ' FROM DUMMY UNION ALL
    SELECT 3, 'ALL',         'global.ini',           'expensive_statement',      'enable',                                    ' ', 'true',                     '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2180165', 'monitoring',     ' ' FROM DUMMY UNION ALL
    SELECT 3, 'ALL',         'global.ini',           'expensive_statement',      'threshold_duration',                        ' ', '1000000',                  '100000000',               '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2180165', 'monitoring',     ' ' FROM DUMMY UNION ALL
    SELECT 3, 'ALL',         'global.ini',           'expensive_statement',      'use_in_memory_tracing',                     ' ', 'false',                    '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', 70, 89.99,  1,  1, '2112732', 'memory',         ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'global.ini',           'fileio',                   'async_read_submit',                         ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2399079', 'disk I/O',       ' ' FROM DUMMY UNION ALL      
    SELECT 0, 'ALL',         'global.ini',           'fileio',                   'async_write_submit_active',                 ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2399079', 'disk I/O',       ' ' FROM DUMMY UNION ALL      
    SELECT 0, 'ALL',         'global.ini',           'fileio',                   'async_write_submit_blocks',                 ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2399079', 'disk I/O',       ' ' FROM DUMMY UNION ALL      
    SELECT 0, 'ALL',         'global.ini',           'fileio',                   'max_parallel_io_requests',                  ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2399079', 'disk I/O',       ' ' FROM DUMMY UNION ALL      
    SELECT 0, 'ALL',         'global.ini',           'fileio',                   'max_submit_batch_size',                     ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2399079', 'disk I/O',       ' ' FROM DUMMY UNION ALL      
    SELECT 0, 'ALL',         'global.ini',           'fileio',                   'min_submit_batch_size',                     ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2399079', 'disk I/O',       ' ' FROM DUMMY UNION ALL      
    SELECT 0, 'ALL',         'global.ini',           'fileio',                   'num_completion_queues',                     ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2399079', 'disk I/O',       ' ' FROM DUMMY UNION ALL      
    SELECT 0, 'ALL',         'global.ini',           'fileio',                   'num_submit_queues',                         ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2399079', 'disk I/O',       ' ' FROM DUMMY UNION ALL      
    SELECT 0, 'ALL',         'global.ini',           'fileio',                   'size_kernel_io_queue',                      ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2399079', 'disk I/O',       ' ' FROM DUMMY UNION ALL      
    SELECT 0, 'ALL',         'global.ini',           'ha_dr_provider%',          '%',                                         ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1,        '', 'high availab.',  'A' FROM DUMMY UNION ALL      
    SELECT 0, 'MDCSYS',      'global.ini',           'indexserver.%',            '%',                                         ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2101244', 'multitenant',    'D' FROM DUMMY UNION ALL
    SELECT 3, 'SYSREP',      'global.ini',           'inifile_checker',          'enable',                                    ' ', 'false',                    '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', 70, 74.00,  1,  1, '1984641', 'terminations',   ' ' FROM DUMMY UNION ALL
    SELECT 0, 'SYSREP',      'global.ini',           'inifile_checker',          'exclusion_%',                               ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2100052', 'monitoring',     'A' FROM DUMMY UNION ALL
    SELECT 0, 'SYSREP',      'global.ini',           'inifile_checker',          'replicate',                                 ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '1999880', 'configuration',  'A' FROM DUMMY UNION ALL
    SELECT 0, 'SINGLE',      'global.ini',           'internal_hostname_resolution', '%',                                     ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1,        '', ' ',              'A' FROM DUMMY UNION ALL
    SELECT 2, 'MDCTEN',      'global.ini',           'memorymanager',            'allocationlimit',                           ' ', '-- SPECIAL --',            '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '1999997', 'memory',         ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'global.ini',           'memorymanager',            'async_free_target',                         ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2169283', 'memory',         ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'global.ini',           'memorymanager',            'async_free_threshold',                      ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2169283', 'memory',         ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'global.ini',           'memorymanager',            'gc_unused_memory_threshold_abs',            ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2169283', 'memory',         ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'global.ini',           'memorymanager',            'gc_unused_memory_threshold_rel',            ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2169283', 'memory',         ' ' FROM DUMMY UNION ALL
    SELECT 2, 'ALL',         'global.ini',           'memorymanager',            'enable_sharing_allocator_for_implicit',     ' ', 'false',                    '-- no recommendation --', '-- no recommendation --', '-- no recommendation --',122.16,122.16,1, 1, '2628153', 'terminations',   ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'global.ini',           'memorymanager',            'global_allocation_limit',                   ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '1999997', 'memory',         ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'global.ini',           'memorymanager',            'huge_alignment_early_commit',               ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '1999998', 'locks ',         ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'global.ini',           'memorymanager',            'oom_dump_time_delta',                       ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '1999997', 'memory',         'A' FROM DUMMY UNION ALL
    SELECT 1, 'ALL',         'global.ini',           'memorymanager',            'statement_memory_limit',                    ' ', '-- SPECIAL --',            '-- SPECIAL --',           '-- no recommendation --', '-- no recommendation --', 80,    -1,  1, -1, '1999997', 'memory',         ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'global.ini',           'memorymanager',            'statement_memory_limit_threshold',          ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '1999997', 'memory',         ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'global.ini',           'memoryobjects',            'disposition_paged_attribute',               ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '1999997', 'memory',         ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'global.ini',           'memoryobjects',            'disposition_weight_early_unload',           ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '1999997', 'memory',         ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'global.ini',           'memoryobjects',            'disposition_weight_long_term',              ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '1999997', 'memory',         ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'global.ini',           'memoryobjects',            'disposition_weight_mid_term',               ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '1999997', 'memory',         ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'global.ini',           'memoryobjects',            'disposition_weight_short_term',             ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '1999997', 'memory',         ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'global.ini',           'memoryobjects',            'page_loadable_columns_limit',               ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2111649', 'memory',         ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'global.ini',           'memoryobjects',            'page_loadable_columns_limit_rel',           ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2111649', 'memory',         ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'global.ini',           'memoryobjects',            'page_loadable_columns_min_size',            ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2111649', 'memory',         ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'global.ini',           'memoryobjects',            'page_loadable_columns_min_size_rel',        ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2111649', 'memory',         ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'global.ini',           'memoryobjects',            'unload_lower_bound',                        ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '1993128', 'memory',         ' ' FROM DUMMY UNION ALL
    SELECT 2, 'ALL',         'global.ini',           'memoryobjects',            'unload_upper_bound',                        ' ', '-- individual value --',   '-- no recommendation --', '-- no recommendation --', '-- no recommendation --',122.02,122.05,1, 1, '2301382', 'memory',         ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'global.ini',           'memoryobjects',            'unused_retention_period',                   ' ', '0',                        '-- no recommendation --', '3600',                    '999999999999',            70,    -1,  1, -1, '2127458', 'memory',         ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'global.ini',           'memoryobjects',            'unused_retention_period_check_interval',    ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2127458', 'memory',         ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'global.ini',           'multidb',                  'singletenant',                              ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2101244', 'MDC',            'D' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'global.ini',           'multidb',                  'database_isolation',                        ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2269429', 'MDC',            'D' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'global.ini',           'multidb',                  'mode',                                      ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2101244', 'MDC',            'D' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'global.ini',           'multidb',                  'reserved_instance_numbers',                 ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2101244', 'MDC',            ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'global.ini',           'multidb',                  'systemdb_reserved_memory',                  ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '1999997', 'MDC',            ' ' FROM DUMMY UNION ALL
    SELECT 1, 'ALL',         'global.ini',           'parallel',                 'num_cores',                                 ' ', '-- SPECIAL --',            '-- SPECIAL --',           '-- no recommendation --', '-- no recommendation --', -1,    -1,  1,  1, '2222250', 'CPU',            ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'global.ini',           'performance_analyzer',     'plan_trace_enable',                         ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2453348', 'performance',    ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'global.ini',           'persistence',              'basepath_shared',                           ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2080991', 'disk',           ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'global.ini',           'persistence',              'basepath%',                                 ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1,        '', ' ',              'D' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'global.ini',           'persistence',              'checksum_algorithm',                        ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2116157', 'consistency',    ' ' FROM DUMMY UNION ALL
    SELECT 1, 'ALL',         'global.ini',           'persistence',              'continuous_flush_interval_s',               ' ', '0',                        '-- no recommendation --', '-- no recommendation --', '-- no recommendation --',120,122.03,  1,  1, '2370160', 'consistency',    ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'global.ini',           'persistence',              'continuous_flush_threshold_s',              ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2100009', 'disk I/O',       ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'global.ini',           'persistence',              'data_encryption',                           ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2400005', 'persistence',    'A' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'global.ini',           'persistence',              'datavolume_striping',                       ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2400005', 'persistence',    ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'global.ini',           'persistence',              'datavolume_striping_size_gb',               ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2400005', 'persistence',    ' ' FROM DUMMY UNION ALL
    SELECT 2, 'ALL',         'global.ini',           'persistence',              'internal_caching_for_main',                 ' ', 'false',                    '-- no recommendation --', '-- no recommendation --', '-- no recommendation --',122.06,122.16,1, 1, '2403124', 'memory',         ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'global.ini',           'persistence',           'log_backup_history_broken_emergency_shutdown', ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2628775', 'consistency',    ' ' FROM DUMMY UNION ALL
    SELECT 3, 'ALL',         'global.ini',           'persistence',              'log_backup_timeout_s',                      ' ', '300',                      '3600',                    '-- no recommendation --', '-- no recommendation --', 13,    -1,  1, -1, '1645183', 'backup',         ' ' FROM DUMMY UNION ALL
    SELECT 3, 'ALL',         'global.ini',           'persistence',              'log_buffer_count',                          ' ', '8',                        '64',                      '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2215131', 'disk I/O',       ' ' FROM DUMMY UNION ALL
    SELECT 3, 'ALL',         'global.ini',           'persistence',              'log_buffer_size_kb',                        ' ', '1024',                     '16384',                   '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2215131', 'disk I/O',       ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'global.ini',           'persistence',              'logreplay_savepoint_interval_s',            ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2409671', 'system rep.',    ' ' FROM DUMMY UNION ALL
    SELECT 2, 'ALL',         'global.ini',           'persistence',              'max_gc_parallelity',                        ' ', '-- SPECIAL --',            '-- SPECIAL --',           '-- no recommendation --', '-- no recommendation --', -1,129.99,  1,  1, '2222250', 'CPU',            ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'global.ini',           'persistence',              'merge_during_logreplay',                    ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2057046', 'merge',          ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'global.ini',           'persistence',              'midsizelob_threshold',                      ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2220627', 'LOBs',           ' ' FROM DUMMY UNION ALL
    SELECT 2, 'ALL',         'global.ini',           'persistence',              'non_trans_cch_block_size',                  ' ', '16777216',                 '134217728',               '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '1999998', 'locks',          ' ' FROM DUMMY UNION ALL
    SELECT 3, 'ALL',         'global.ini',           'persistence',              'private_log_buffer_size_kb',                ' ', '0',                        '-- no recommendation --', '-- no recommendation --', '-- no recommendation --',100,   100,  1,  1, '2183246', 'consistency',    ' ' FROM DUMMY UNION ALL
    SELECT 2, 'ALL',         'global.ini',           'persistence',              'savepoint_interval_s',                      ' ', '10',                       '7200',                    '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '1898505', 'disk I/O',       ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'global.ini',           'persistence',              'recovery_queue_count',                      ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '1964645', 'CPU',            ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'global.ini',           'persistence',              'savepoint_max_pre_critical_flush_duration', ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1,  1,  1, '2100009', 'disk I/O',       ' ' FROM DUMMY UNION ALL
    SELECT 2, 'ALL',         'global.ini',           'persistence',              'savepoint_pre_critical_flush_retry_threshold',' ','-- SPECIAL --',           '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1, 12.04,  2,  2, '2538561', 'disk I/O',       ' ' FROM DUMMY UNION ALL
    SELECT 2, 'ALL',         'global.ini',           'persistence',              'savepoint_pre_critical_flush_retry_threshold',' ','-- SPECIAL --',           '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', 20,    23,  2,  2, '2538561', 'disk I/O',       ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'global.ini',           'persistence',              'tablepreload_write_interval',               ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2127458', 'memory',         ' ' FROM DUMMY UNION ALL
    SELECT 1, 'XFS',         'global.ini',           'persistence',              'use_helper_threads_for_flush',              ' ', 'false',                    '-- no recommendation --', '-- no recommendation --', '-- no recommendation --',122.16,122.17,1, 1, '2655238', 'disk I/O',       ' ' FROM DUMMY UNION ALL
    SELECT 1, 'XFS',         'global.ini',           'persistence',              'use_helper_threads_for_flush',              ' ', 'false',                    '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', 24, 24.03,  2,  2, '2655238', 'disk I/O',       ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'global.ini',           'persistence',              'use_mountpoints',                           ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '1820553', 'backup',         ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'global.ini',           'pitrestart',               'replay_step_size',                          ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2409671', 'system rep.',    ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'global.ini',           'public_hostname_resolution', '%',                                       ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2036111', 'network',        'A' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'global.ini',           'resource_tracking',        'cpu_time_measurement_mode',                 ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2100040', 'monitoring',     ' ' FROM DUMMY UNION ALL
    SELECT 1, 'ALL',         'global.ini',           'resource_tracking',        'enable_tracking',                           ' ', 'on',                       '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', 80,    -1,  1, -1, '1999997', 'monitoring',     ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'global.ini',           'resource_tracking',        'host_job_history_granularity',              ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2529478', 'monitoring',     ' ' FROM DUMMY UNION ALL
    SELECT 3, 'ALL',         'global.ini',           'resource_tracking',        'load_monitor_granularity',                  ' ', '1000',                     '60000',                   '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2222110', 'monitoring',     ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'global.ini',           'resource_tracking',        'load_monitor_max_samples',                  ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2222110', 'monitoring',     ' ' FROM DUMMY UNION ALL
    SELECT 1, 'ALL',         'global.ini',           'resource_tracking',        'memory_tracking',                           ' ', 'on',                       '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', 80,    -1,  1, -1, '1999997', 'monitoring',     ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'global.ini',           'resource_tracking',        'service_thread_sampling_monitor_enabled',   ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2114710', 'monitoring',     ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'global.ini',           'resource_tracking','service_thread_sampling_monitor_max_sample_lifetime',' ','-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2114710', 'monitoring',     ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'global.ini',           'resource_tracking','service_thread_sampling_monitor_max_samples',       ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2114710', 'monitoring',     ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'global.ini',           'resource_tracking','service_thread_sampling_monitor_sample_interval',   ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2114710', 'monitoring',     ' ' FROM DUMMY UNION ALL
    SELECT 2, 'ALL',         'global.ini',           'resource_tracking','service_thread_sampling_monitor_thread_detail_enabled', ' ', 'true',                 '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', 70,    -1,  1, -1, '2114710', 'monitoring',     ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'global.ini',           'row_engine',               'max_persistent_container_block',            ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2154870', 'terminations',   ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'global.ini',           'row_engine',               'max_transient_container_block',             ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2154870', 'terminations',   ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'global.ini',           'session',                  'busy_executor_threshold',                   ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2320604', 'CPU',            ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'global.ini',           'sql',                      'default_lob_memory_threshold',              ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2220627', 'LOBs',           ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'global.ini',           'sql',                      'default_lob_storage_type',                  ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2220627', 'LOBs',           ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'global.ini',           'sql',                      'fail_on_invalid_hint',                      ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2142945', 'terminations',   ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'global.ini',           'sql',                      'max_sql_executors',                         ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2222250', 'CPU',            ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'global.ini',           'sql',                      'sql_executors',                             ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2222250', 'CPU',            ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'global.ini',           'storage',                  'ha_provider%',                              ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1,        '', ' ',              'A' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'global.ini',           'storage',                  'partition_%',                               ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1,        '', ' ',              'A' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'global.ini',           'system_information',       'usage',                                     ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1,        '', ' ',              'D' FROM DUMMY UNION ALL
    SELECT 0, 'SYSREP',      'global.ini',           'system_replication',       'actual_mode',                               ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '1999880', 'system rep.',    'A' FROM DUMMY UNION ALL
    SELECT 0, 'SYSREP',      'global.ini',           'system_replication',       'check_secondary_active_status',             ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2000002', 'system rep.',    ' ' FROM DUMMY UNION ALL
    SELECT 0, 'SYSREP',      'global.ini',           'system_replication',       'datashipping_logsize_threshold',            ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2036111', 'system rep.',    ' ' FROM DUMMY UNION ALL
    SELECT 0, 'SYSREP',      'global.ini',           'system_replication',       'datashipping_min_time_interval',            ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2036111', 'system rep.',    ' ' FROM DUMMY UNION ALL
    SELECT 0, 'SYSREP',      'global.ini',           'system_replication',       'datashipping_snapshot_max_retention_time',  ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2036111', 'system rep.',    ' ' FROM DUMMY UNION ALL
    SELECT 0, 'SYSREP',      'global.ini',           'system_replication',    'enable_cache_pages_for_preload_version_check', ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2587465', 'system rep.',    ' ' FROM DUMMY UNION ALL
    SELECT 0, 'SYSREP',      'global.ini',           'system_replication',       'enable_data_compression',                   ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '1999880', 'network',        ' ' FROM DUMMY UNION ALL
    SELECT 0, 'SYSREP',      'global.ini',           'system_replication',       'enable_full_sync',                          ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2036111', 'system rep.',    ' ' FROM DUMMY UNION ALL
    SELECT 0, 'SYSREP',      'global.ini',           'system_replication',       'enable_log_compression',                    ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '1999880', 'network',        ' ' FROM DUMMY UNION ALL
    SELECT 0, 'SYSREP',      'global.ini',           'system_replication',       'enable_log_retention',                      ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '1999880', 'network',        ' ' FROM DUMMY UNION ALL
    SELECT 0, 'SYSREP',      'global.ini',           'system_replication',       'enable_send_ack_in_async_mode',             ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2312539', 'termination',    ' ' FROM DUMMY UNION ALL
    SELECT 0, 'SYSREP',      'global.ini',           'system_replication',       'enable_ssl',                                ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2230230', 'security',       ' ' FROM DUMMY UNION ALL
    SELECT 0, 'SYSREP',      'global.ini',           'system_replication',       'ensure_backup_history',                     ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2135107', 'system rep.',    ' ' FROM DUMMY UNION ALL
    SELECT 0, 'SYSREP',      'global.ini',           'system_replication',       'keep_old_style_alert',                      ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2036111', 'network',        ' ' FROM DUMMY UNION ALL
    SELECT 3, 'SYSREP',      '%',                    'system_replication',       'logshipping_async_buffer_size',             ' ', '1073741824',               '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    73,  1,  1, '2086024', 'system rep.',    ' ' FROM DUMMY UNION ALL
    SELECT 0, 'SYSREP',      'global.ini',           'system_replication',       'logshipping_async_wait_on_buffer_full',     ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2036111', 'system rep.',    ' ' FROM DUMMY UNION ALL
    SELECT 0, 'SYSREP',      'global.ini',           'system_replication',       'logshipping_max_retention_size',            ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2526877', 'system rep.',    ' ' FROM DUMMY UNION ALL
    SELECT 0, 'SYSREP',      'global.ini',           'system_replication',       'logshipping_replay_logbuffer_cache_size',   ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2405763', 'system rep.',    ' ' FROM DUMMY UNION ALL
    SELECT 0, 'SYSREP',      'global.ini',           'system_replication',       'logshipping_replay_push_callback_count',    ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2381431', 'system rep.',    ' ' FROM DUMMY UNION ALL
    SELECT 0, 'SYSREP',      'global.ini',           'system_replication','logshipping_replay_push_persistent_segment_count', ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2409671', 'system rep.',    ' ' FROM DUMMY UNION ALL
    SELECT 0, 'SYSREP',      'global.ini',           'system_replication',       'logshipping_secondary_timeout',             ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2400007', 'system rep.',    ' ' FROM DUMMY UNION ALL
    SELECT 0, 'SYSREP',      'global.ini',           'system_replication',       'logshipping_snapshot_logsize_threshold',    ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2332284', 'system rep.',    ' ' FROM DUMMY UNION ALL
    SELECT 0, 'SYSREP',      'global.ini',           'system_replication',       'logshipping_snapshot_min_time_interval',    ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2332284', 'system rep.',    ' ' FROM DUMMY UNION ALL
    SELECT 0, 'SYSREP',      'global.ini',           'system_replication',       'logshipping_timeout',                       ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2036111', 'system rep.',    ' ' FROM DUMMY UNION ALL
    SELECT 0, 'SYSREP',      'global.ini',           'system_replication',       'mode',                                      ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '1999880', 'system rep.',    'A' FROM DUMMY UNION ALL
    SELECT 0, 'SYSREP',      'global.ini',           'system_replication',       'operation_mode',                            ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '1999880', 'system rep.',    'A' FROM DUMMY UNION ALL
    SELECT 0, 'SYSREP',      'global.ini',           'system_replication',       'preload_column_tables',                     ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2127458', 'system rep.',    ' ' FROM DUMMY UNION ALL
    SELECT 0, 'SYSREP',      'global.ini',           'system_replication',       'reconnect_time_interval',                   ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2036111', 'system rep.',    ' ' FROM DUMMY UNION ALL
    SELECT 0, 'SYSREP',      'global.ini',           'system_replication',       'site_id',                                   ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '1999880', 'system rep.',    'A' FROM DUMMY UNION ALL
    SELECT 0, 'SYSREP',      'global.ini',           'system_replication',       'site_name',                                 ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '1999880', 'system rep.',    'A' FROM DUMMY UNION ALL
    SELECT 0, 'SYSREP',      'global.ini',           'system_replication_hostname_resolution', '%',                           ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2183363', 'system rep.',    'A' FROM DUMMY UNION ALL
    SELECT 0, 'SYSREP',      'global.ini',           'system_replication_communication', 'allowed_sender',                    ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2183363', 'system rep.',    ' ' FROM DUMMY UNION ALL
    SELECT 3, 'SYSREP',      'global.ini',           'system_replication_communication', 'listeninterface',                   ' ', '.global',                  '-- no recommendation --', '.internal',               '-- no recommendation --', -1,    -1, -1, -1, '2183363', 'system rep.',    ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'global.ini',           'table_consistency_check',  'check_max_concurrency',                     ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2116157', 'CPU',            ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'global.ini',           'table_consistency_check',  'max_duration',                              ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2116157', 'terminations',   ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'global.ini',           'table_consistency_check',  'enable_table_consistency_check_trace',      ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2116157', 'monitoring',     ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'global.ini',           'table_consistency_check',  'internal_check_max_concurrency',            ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2116157', 'CPU',            ' ' FROM DUMMY UNION ALL
    SELECT 3, 'ALL',         'global.ini',           'table_consistency_check',  'keypositions_maxsize',                      ' ', '0',                        '-- no recommendation --', '-- no recommendation --', '-- no recommendation --',110,   110,  1,  1, '2266533', 'CPU',            ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'global.ini',           'table_consistency_check',  'large_job_threshold',                       ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2116157', 'consistency',    ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'global.ini',           'table_consistency_check',  'max_num_large_jobs',                        ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2116157', 'consistency',    ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'global.ini',           'table_consistency_check',  'max_result_entry',                          ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2116157', 'consistency',    ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'global.ini',           'table_consistency_check',  'max_result_entry_per_entity',               ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2116157', 'consistency',    ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'global.ini',           'table_consistency_check',  'remote_check_timeout',                      ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2116157', 'consistency',    ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'global.ini',           'table_consistency_check',  'rowidpositions_maxsize',                    ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2116157', 'CPU',            ' ' FROM DUMMY UNION ALL
    SELECT 0, 'MULTI,BW',    'global.ini',           'table_placement',          'bw_schema',                                 ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '1715048', 'configuration',  'D' FROM DUMMY UNION ALL
    SELECT 2, 'MULTI,BW',    'global.ini',           'table_placement',          'initial_partitions',                        ' ', '3',                        '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    62,  1,  1, '1819123', 'performance',    ' ' FROM DUMMY UNION ALL
    SELECT 2, 'MULTI,BW',    'global.ini',           'table_placement',          'initial_partitions_bw_cube',                ' ', '3',                        '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    62,  1,  1, '1819123', 'performance',    ' ' FROM DUMMY UNION ALL
    SELECT 2, 'MULTI,BW',    'global.ini',           'table_placement',          'initial_partitions_bw_dso',                 ' ', '3',                        '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    62,  1,  1, '1819123', 'performance',    ' ' FROM DUMMY UNION ALL
    SELECT 2, 'MULTI,BW',    'global.ini',           'table_placement',          'initial_partitions_bw_psa',                 ' ', '1',                        '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    62,  1,  1, '1819123', 'performance',    ' ' FROM DUMMY UNION ALL
    SELECT 2, 'BW',          'global.ini',           'table_placement',          'max_partitions',                            ' ', '-- SPECIAL --',            '-- no recommendation --', '-- no recommendation --', '-- no recommendation --',120,    -1,  1, -1, '1908075, 2334091', 'performance',    ' ' FROM DUMMY UNION ALL
    SELECT 2, 'BW',          'global.ini',           'table_placement',          'max_partitions_limited_by_locations',       ' ', '-- SPECIAL --',            '-- no recommendation --', '-- no recommendation --', '-- no recommendation --',120,    -1,  1, -1, '1908075, 2334091', 'performance',    ' ' FROM DUMMY UNION ALL
    SELECT 2, 'BW',          'global.ini',           'table_placement',          'max_rows_per_partition',                    ' ', '1500000000',               '-- no recommendation --', '-- no recommendation --', '-- no recommendation --',100,    -1,  1, -1, '1908075, 2334091', 'performance',    ' ' FROM DUMMY UNION ALL
    SELECT 2, 'MULTI,BW',    'global.ini',           'table_placement',          'method',                                    ' ', '2',                        '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', 60, 99.99,  1,  1, '1908075, 2334091', 'performance',    ' ' FROM DUMMY UNION ALL
    SELECT 3, 'ERP',         'global.ini',           'table_placement',          'method',                                    ' ', '2',                        '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', 69, 99.99,  1,  1, '1899817', 'performance',    ' ' FROM DUMMY UNION ALL
    SELECT 3, 'BPC',         'global.ini',           'table_placement',          'method',                                    ' ', '2',                        '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1,  1,  1, '2003863', 'performance',    ' ' FROM DUMMY UNION ALL
    SELECT 2, 'MULTI,BW',    'global.ini',           'table_placement',          'partitioning_threshold',                    ' ', '40000000',                 '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    62,  1,  1, '1819123', 'performance',    ' ' FROM DUMMY UNION ALL
    SELECT 2, 'MULTI,BW',    'global.ini',           'table_placement',          'partitioning_threshold_bw_cube',            ' ', '40000000',                 '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    62,  1,  1, '1819123', 'performance',    ' ' FROM DUMMY UNION ALL
    SELECT 2, 'MULTI,BW',    'global.ini',           'table_placement',          'partitioning_threshold_bw_dso',             ' ', '40000000',                 '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    62,  1,  1, '1819123', 'performance',    ' ' FROM DUMMY UNION ALL
    SELECT 2, 'MULTI,BW',    'global.ini',           'table_placement',          'partitioning_threshold_bw_psa',             ' ', '2000000000',               '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    62,  1,  1, '1819123', 'performance',    ' ' FROM DUMMY UNION ALL
    SELECT 2, 'MULTI,BW',    'global.ini',           'table_placement',          'partition_row_count_threshold',             ' ', '40000000',                 '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    62,  1,  1, '1819123', 'performance',    ' ' FROM DUMMY UNION ALL
    SELECT 2, 'MULTI,BW',    'global.ini',           'table_placement',          'partition_row_count_threshold_bw_cube',     ' ', '40000000',                 '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    62,  1,  1, '1819123', 'performance',    ' ' FROM DUMMY UNION ALL
    SELECT 2, 'MULTI,BW',    'global.ini',           'table_placement',          'partition_row_count_threshold_bw_dso',      ' ', '40000000',                 '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    62,  1,  1, '1819123', 'performance',    ' ' FROM DUMMY UNION ALL
    SELECT 2, 'MULTI,BW',    'global.ini',           'table_placement',          'partition_row_count_threshold_bw_psa',      ' ', '2000000000',               '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    62,  1,  1, '1819123', 'performance',    ' ' FROM DUMMY UNION ALL
    SELECT 0, 'MULTI,BW',    'global.ini',           'table_placement',          'prefix',                                    ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '1715048', 'configuration',  'D' FROM DUMMY UNION ALL
    SELECT 3, 'BW',          'global.ini',           'table_placement',          'same_num_partitions',                       ' ', 'true',                     '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1,  1,  1, '1908075, 2003863, 2334091', 'performance',    ' ' FROM DUMMY UNION ALL
    SELECT 3, 'ERP',         'global.ini',           'table_placement',          'same_num_partitions',                       ' ', 'false',                    '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1,  1,  1, '1899817', 'performance',    ' ' FROM DUMMY UNION ALL
    SELECT 3, 'BPC',         'global.ini',           'threads',                  'default_stack_size_kb',                     ' ', '2048',                     '4096',                    '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '1847202', 'terminations',   ' ' FROM DUMMY UNION ALL
    SELECT 3, 'BPC',         'global.ini',           'threads',                  'worker_stack_size_kb',                      ' ', '2048',                     '8192',                    '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '1847202', 'terminations',   ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'global.ini',           'trace',                    'ha_dr%',                                    ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1,        '', ' ',              'D' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'global.ini',           'trace',                    'ha_fc%',                                    ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1,        '', ' ',              'D' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'global.ini',           'trace',                    'ha_fujitsu%',                               ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1,        '', ' ',              'D' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'admission_control',        'averaging_factor',                          ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2222250', 'performance',    ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'admission_control',        'dequeue_interval',                          ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2222250', 'performance',    ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'admission_control',        'dequeue_size',                              ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2222250', 'performance',    ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'admission_control',        'enable',                                    ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2222250', 'performance',    ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'admission_control',        'max_queue_size',                            ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2222250', 'performance',    ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'admission_control',        'queue_cpu_threshold',                       ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2222250', 'performance',    ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'admission_control',        'queue_memory_threshold',                    ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2222250', 'performance',    ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'admission_control',        'reject_cpu_threshold',                      ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2222250', 'performance',    ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'admission_control',        'reject_memory_threshold',                   ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2222250', 'performance',    ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'admission_control',        'statistics_collection_interval',            ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2222250', 'performance',    ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'admission_control_events', 'record_limit',                              ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2088971', 'data volume',    ' ' FROM DUMMY UNION ALL
    SELECT 2, 'ALL',         'indexserver.ini',      'authentication',           'last_successful_connect_update_interval',   ' ', '300',                      '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,122.09,  1,  1, '2460123', 'security',       ' ' FROM DUMMY UNION ALL
    SELECT 2, 'ALL',         'indexserver.ini',      'authentication',           'last_successful_connect_update_interval',   ' ', '-1',                       '-- no recommendation --', '-- no recommendation --', '-- no recommendation --',122.10,122.14,1, 1, '2460123', 'security',       ' ' FROM DUMMY UNION ALL
    SELECT 2, 'ALL',         'indexserver.ini',      'authentication',           'last_successful_connect_update_interval',   ' ', '-1',                       '-- no recommendation --', '-- no recommendation --', '-- no recommendation --',  1, 12.03,  2,  2, '2460123', 'security',       ' ' FROM DUMMY UNION ALL
    SELECT 2, 'ALL',         'indexserver.ini',      'authentication',           'last_successful_connect_update_interval',   ' ', '-1',                       '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', 20,    22,  2,  2, '2460123', 'security',       ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'authentication',           'saml_service_provider_name',                ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2127582', 'security',       'S' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'authentication',           'saplogonticketenabledfornewusers',          ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '1927949', 'security',       'S' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'authentication',           'saplogontickettruststore',                  ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '1927949', 'security',       'S' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'authorization',            'internal_support_user_limit',               ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2081857', 'security',       'S' FROM DUMMY UNION ALL
    SELECT 3, 'ALL',         'indexserver.ini',      'businessdb',               'parallel_threshold',                        ' ', '1000000000',               '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', 80,    81,  1,  1, '2041874', 'consistency',    ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'cache',            'cs_statistics_cache_invalidation_threshold_factor', ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2124112', 'performance',    ' ' FROM DUMMY UNION ALL
    SELECT 3, 'ALL',         'indexserver.ini',      'cache',                    'enable_single_value_caching',               ' ', 'off',                      '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', 70,    71,  1,  1, '1980765', 'consistency',    ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'cache',                    'hierarchies_transactional_cache_enabled',   ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '1999997', 'memory',         ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'cache',                    'resultcache_enabled',                       ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2014148', 'memory',         ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'cache',                    'resultcache_clear_config',                  ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2014148', 'memory',         ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'cache',                    'resultcache_local_lookup_only',             ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '1833049', 'memory',         ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'cache',                    'resultcache_maximum_value_size_in_bytes',   ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2014148', 'memory',         ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'cache',     'resultcache_minimum_query_execution_time_in_milliseconds', ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2014148', 'memory',         ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'cache',                  'resultcache_request_timeout_in_milliseconds', ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2014148', 'memory',         ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'cache',                    'resultcache_white_list',                    ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2014148', 'memory',         ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'calcengine',               'calc_view_with_dyn_ap_unfold',              ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2441054', 'performance',    ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'calcengine',               'ce2qo_enable_boundary_op',                  ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2517443', 'performance',    ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'calcengine',               'ce2qo_for_nested_views_with_sql_execution', ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2401093', 'crash',          ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'calcengine',               'cejoin_stringkeysize',                      ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2376420', 'performance',    ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'calcengine',               'cer_disable_workload_balance',              ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2548264', 'performance',    ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'calcengine',               'disabled_patterns',                         ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2100040', 'performance',    ' ' FROM DUMMY UNION ALL
    SELECT 3, 'ALL',         'indexserver.ini',      'calcengine',               'gc_cleanup_retention_sec',                  ' ', '604800',                   '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,122.10,  1,  1, '2474345', 'performance',    ' ' FROM DUMMY UNION ALL
    SELECT 3, 'ALL',         'indexserver.ini',      'calcengine',               'gc_cleanup_retention_sec',                  ' ', '3600',                     '604800',                  '-- no recommendation --', '-- no recommendation --', -1,    12,  2,  2, '2474345', 'performance',    ' ' FROM DUMMY UNION ALL
    SELECT 3, 'ALL',         'indexserver.ini',      'calcengine',               'max_cache_size_kb',                         ' ', '4194304',                  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    73,  1,  1, '1988050', 'performance',    ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'calcengine',               'max_cache_size_kb',                         ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2000002', 'performance',    ' ' FROM DUMMY UNION ALL
    SELECT 3, 'ALL',         'indexserver.ini',      'calcengine',               'optimize_cardinality',                      ' ', '13',                       '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', 85.02, 92,  1,  1, '2140610', 'performance',    ' ' FROM DUMMY UNION ALL
    SELECT 3, 'ALL',         'indexserver.ini',      'calcengine',               'optimize_combine_filter_multiple_consumer_new', ' ', '0',                    '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    81,  1,  1, '2114021', 'terminations',   ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'calcengine',               'optimize_convex_hull_fems_filter_new',      ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2064439', 'terminations',   ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'calcengine',               'optimize_convex_hull_through_mp',           ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2000002', 'performance',    ' ' FROM DUMMY UNION ALL
    SELECT 3, 'ALL',         'indexserver.ini',      'calcengine',               'optimize_filter_remove_attributes',         ' ', '0',                        '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', 71,    71,  1,  1, '1980763', 'consistency',    ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'calcengine',               'optimize_mp_merge_with_const_delta_query',  ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2451991', 'terminations',   ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'calcengine',               'optimize_simplify_filter_enabled',          ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2476216', 'terminations',   ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'catalog_watchdog',         'max_nologging_table_count_limit',           ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2214569', 'performance',    ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'cds',                      'internal',                                  ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2034208', 'terminations',   ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'communication',            'acceptqueuelen',                            ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2373231', ' ',              ' ' FROM DUMMY UNION ALL
    SELECT 2, 'ALL',         'indexserver.ini',      'communication',            'handles',                                   ' ', '40000',                    '-- no recommendation --', '-- no recommendation --', '-- no recommendation --',100,122.01,  1,  1, '2382421', 'terminations',   ' ' FROM DUMMY UNION ALL
    SELECT 2, 'ALL',         'indexserver.ini',      'communication',            'maxchannels',                               ' ', '20000',                    '40000',                   '-- no recommendation --', '-- no recommendation --',100,122.14,  1,  1, '2382421', 'terminations',   ' ' FROM DUMMY UNION ALL
    SELECT 2, 'ALL',         'indexserver.ini',      'communication',            'maxchannels',                               ' ', '20000',                    '40000',                   '-- no recommendation --', '-- no recommendation --', -1,     9,  2,  2, '2382421', 'terminations',   ' ' FROM DUMMY UNION ALL
    SELECT 2, 'ALL',         'indexserver.ini',      'communication',            'maxendpoints',                              ' ', '20000',                    '40000',                   '-- no recommendation --', '-- no recommendation --',100,122.14,  1,  1, '2382421', 'terminations',   ' ' FROM DUMMY UNION ALL
    SELECT 2, 'ALL',         'indexserver.ini',      'communication',            'maxendpoints',                              ' ', '20000',                    '40000',                   '-- no recommendation --', '-- no recommendation --', -1,     9,  2,  2, '2382421', 'terminations',   ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'communication',            'maxidleage',                                ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2222200', 'performance',    ' ' FROM DUMMY UNION ALL
    SELECT 2, 'ALL',         'indexserver.ini',      'communication',            'signal_recv_timeout',                       ' ', '60000',                    '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,122.06,  1,  1, '2427296', 'terminations',   ' ' FROM DUMMY UNION ALL
    SELECT 2, 'ALL',         'indexserver.ini',      'communication',            'signal_recv_timeout',                       ' ', '60000',                    '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,     1,  2,  2, '2427296', 'terminations',   ' ' FROM DUMMY UNION ALL
    SELECT 2, 'ALL',         'indexserver.ini',      'communication',            'signal_send_timeout',                       ' ', '60000',                    '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,122.06,  1,  1, '2427296', 'terminations',   ' ' FROM DUMMY UNION ALL
    SELECT 2, 'ALL',         'indexserver.ini',      'communication',            'signal_send_timeout',                       ' ', '60000',                    '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,     1,  2,  2, '2427296', 'terminations',   ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'communication',            'ssl%',                                      ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1,        '', ' ',              'A' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'communication',            'tcp_backlog',                               ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2373231', ' ',              ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'csaccessor',               'disable_table_consistency_checks',          ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2603049', 'consistency',    ' ' FROM DUMMY UNION ALL
    SELECT 1, 'ALL',         'indexserver.ini',      'delta',                    'btree_cache_aggressiveness',                ' ', '0',                        '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,112.03,  1,  1, '2338166', 'wrong results',  ' ' FROM DUMMY UNION ALL
    SELECT 1, 'ALL',         'indexserver.ini',      'delta',                    'btree_cache_aggressiveness',                ' ', '0',                        '-- no recommendation --', '-- no recommendation --', '-- no recommendation --',120,   121,  1,  1, '2338166', 'wrong results',  ' ' FROM DUMMY UNION ALL
    SELECT 1, 'ALL',         'indexserver.ini',      'delta',                    'btree_cache_heavy_hitters',                 ' ', '100.0',                    '-- no recommendation --', '-- no recommendation --', '-- no recommendation --',100,   102,  1,  1, '2226707', 'wrong results',  ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'delta',                    'cch_reopening_enabled',                     ' ', 'true',                     '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', 96, 97.01,  1,  1, '2214279', 'performance',    ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'delta',                    'readindex_fallback_threshold',              ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2318281', 'performance',    ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'delta',                    'use_massupdates',                           ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2632716', 'crash',          ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'dictstore',                'check_main_dictionary_after_load',          ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2116157', 'consistency',    ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'dictstore',                'check_main_dictionary_after_load_repair',   ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2116157', 'consistency',    ' ' FROM DUMMY UNION ALL
    SELECT 3, 'MULTI',       'indexserver.ini',      'distribution',             'client_distribution_mode',                  ' ', 'off',                      '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    84,  1,  1, '2200772', 'terminations',   ' ' FROM DUMMY UNION ALL
    SELECT 3, 'ALL',         'indexserver.ini',      'distribution',             'split_batch_commands',                      ' ', 'off',                      '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', 64,    66,  1,  1, '1912332', 'terminations',   ' ' FROM DUMMY UNION ALL
    SELECT 3, 'MULTI',       'indexserver.ini',      'distribution',             'split_batch_commands',                      ' ', 'off',                      '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', 67,    67,  1,  1, '1912332', 'terminations',   ' ' FROM DUMMY UNION ALL
    SELECT 3, 'MULTI',       'indexserver.ini',      'distribution',             'split_batch_commands',                      ' ', 'off',                      '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', 70,    83,  1,  1, '2063165', 'terminations',   ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'distribution',             'systemreplication_protocol_version',        ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2587258', 'hang situation', ' ' FROM DUMMY UNION ALL
    SELECT 1, 'BW',          'indexserver.ini',      'dso',                      'activation_columnset_size',                 ' ', '4000000000',               '-- no recommendation --', '-- no recommendation --', '-- no recommendation --',110,122.03,  1,  1, '2385658', 'inconsistency',  ' ' FROM DUMMY UNION ALL
    SELECT 0, 'BW',          'indexserver.ini',      'dso',                      'activation_row_count_limit',                ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2338069', 'wrong results',  ' ' FROM DUMMY UNION ALL
    SELECT 0, 'BW',          'indexserver.ini',      'dso',                  'calculate_active_data_from_detailed_changelog', ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2285173', 'termination',    ' ' FROM DUMMY UNION ALL
    SELECT 0, 'BW',          'indexserver.ini',      'dso',                      'force_detailed_changelog',                  ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2285173', 'termination',    ' ' FROM DUMMY UNION ALL
    SELECT 0, 'BW',          'indexserver.ini',      'dso',                      'search_realization',                        ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2613469', 'crash',          ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'dynamic_result_cache',     'enable',                                    ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2506811', 'memory',         ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'dynamic_result_cache',     'max_cache_entry_size',                      ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2506811', 'memory',         ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'dynamic_result_cache',     'total_size',                                ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2506811', 'memory',         ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'dynamic_result_cache',     'version_garbage_collection_blocking_period',' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2506811', 'memory',         ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'execution',                'recompile_table_size_increase',             ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2570371', 'performance',    ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'global',                   'timezone_default_data_schema_name',         ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2100040', 'performance',    ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'import_export',            'csv_import_path_filter',                    ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2109565', 'security',       ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'import_export',            'enable_convert_es_to_row_tables',           ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2178461', 'dyn. tiering',   ' ' FROM DUMMY UNION ALL
    SELECT 3, 'ALL',         'indexserver.ini',      'import_export',            'enable_csv_import_path_filter',             ' ', 'true',                     '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', 85, 89.99,  1,  1, '2109565', 'security',       ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'import_export',            'file_security',                             ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2252941', 'security',       ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'import_export',            'use_parallel_export',                       ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '1999998', 'locks',          ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'indexing',                 'max_chunk_size_for_delete',                 ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '1975448', 'terminations',   ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'indexing',                 'max_chunk_size_for_insert',                 ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '1975448', 'terminations',   ' ' FROM DUMMY UNION ALL
    SELECT 3, 'ALL',         'indexserver.ini',      'indexing',                 'max_chunk_size_for_update',                 ' ', '2000000000',               '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', 70,    70,  1,  1, '1974570', 'terminations',   ' ' FROM DUMMY UNION ALL
    SELECT 1, 'ALL',         'indexserver.ini',      'indexing',                 'migrate_vf_to_ut_in_deltamerge',            ' ', 'false',                    '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', 10,    11,  2,  2, '2487855', 'corruptions',    ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'indexing',                 'parallel_merge_threads',                    ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2057046', 'CPU',            ' ' FROM DUMMY UNION ALL
    SELECT 2, 'ALL',         'indexserver.ini',      'indexing',                 'use_sparsity_check',                        ' ', 'no',                       '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,122.08,  1,  1, '2112604', 'memory',         ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'indexmgr',                 'dump_again_seconds',                        ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '1999998', 'locks',          ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'indexmgr',                 'dump_wait_seconds',                         ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '1999998', 'locks',          ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'itab',                     'trace_leaks',                               ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '1999998', 'locks',          ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'itab',                     'trace_leakcallstacks',                      ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '1999998', 'locks',          ' ' FROM DUMMY UNION ALL
    SELECT 3, 'ALL',         'indexserver.ini',      'joins',                    'cache_temp_translation_tables',             ' ', 'false',                    '-- no recommendation --', '-- no recommendation --', '-- no recommendation --',97.02,99.99, 1,  1, '2217936', 'performance',    ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'joins',                    'column_view_accept_lob_join',               ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2222219', 'terminations',   ' ' FROM DUMMY UNION ALL
    SELECT 2, 'ALL',         'indexserver.ini',      'joins',                    'disable_aggregate_simplification',          ' ', 'true',                     '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,122.06,  1,  1, '2092196', 'stuck',          ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'joins',                    'disable_aggregate_simplification',          ' ', 'true',                     '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,     1,  2,  2, '2092196', 'stuck',          ' ' FROM DUMMY UNION ALL
    SELECT 1, 'ALL',         'indexserver.ini',      'joins',                    'disable_itab_runtime_pruning',              ' ', '1',                        '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', 20,    21,  2,  2, '2553487', 'wrong results',  ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'joins',                    'disable_join_collocation',                  ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2308421', 'terminations',   ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'joins',                    'disable_plan_simplification',               ' ', 'true',                     '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', 70,    73,  1,  1, '1991414', 'consistency',    ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'joins',                    'enable_new_cycle_join_resolution',          ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2000002', 'performance',    ' ' FROM DUMMY UNION ALL
    SELECT 2, 'ALL',         'indexserver.ini',      'joins',                    'map_threshold_factor_uns_mapping',          ' ', '4000000000',               '-- no recommendation --', '-- no recommendation --', '-- no recommendation --',122.15,122.15,1, 1, '2599767', 'crash',          ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'joins',                    'max_retry_on_syncpoint_error',              ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2112848', 'terminations',   ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'joins',                    'optimize_metamodel',                        ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '1986747', 'memory',         ' ' FROM DUMMY UNION ALL
    SELECT 1, 'ALL',         'indexserver.ini',      'joins',                    'prune_cached_plans',                        ' ', 'false',                    '-- no recommendation --', '-- no recommendation --', '-- no recommendation --',100,122.03,  1,  1, '2387680', 'memory',         ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'joins',               'single_thread_execution_for_partitioned_tables', ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2000002', 'performance',    ' ' FROM DUMMY UNION ALL
    SELECT 3, 'ALL',         'indexserver.ini',      'joins',                    'translator_cache_size',                     ' ', '200',                      '2000',                    '-- no recommendation --', '-- no recommendation --', -1, 79.99,  1,  1, '1998599', 'memory',         ' ' FROM DUMMY UNION ALL
    SELECT 3, 'ALL',         'indexserver.ini',      'joins',                    'translator_hashmap_max_size',               ' ', '100000',                   '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', 80, 89.99,  1,  1, '2036494', 'memory',         ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'joins',                    'translator_hashmap_min_size',               ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2036494', 'memory',         ' ' FROM DUMMY UNION ALL
    SELECT 1, 'ALL',         'indexserver.ini',      'joins',                    'tt_complete_fill_threshold',                ' ', '-1',                       '-- no recommendation --', '-- no recommendation --', '-- no recommendation --',100,102.04,  1,  1, '2642704', 'wrong results',  ' ' FROM DUMMY UNION ALL
    SELECT 1, 'ALL',         'indexserver.ini',      'joins',                    'virtual_vids_bitvector_threshold',          ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2272248', 'crash',          ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'joins',                    'use_single_part_plan_optimization',         ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2338565', 'performance',    ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'joins',                    'use_single_part_plan_optimization',         ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2338565', 'performance',    ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'jsvm',                     'max_runtime_bytes',                         ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2159899', 'xsengine',       ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'livecache',                'max_early_garbage_collection_jobs',         ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2169283', 'liveCache',      ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'livecache',                'max_version_retention_time',                ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2169283', 'liveCache',      ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'livecache',                'early_garbage_collection_interval',         ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2169283', 'liveCache',      ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'livecache',                'early_garbage_collection_threshold',        ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2169283', 'liveCache',      ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'livecache',                'version_threshold',                         ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2169283', 'liveCache',      ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'lobhandling',              'garbage_collect_interval_s',                ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2169283', 'memory',         ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'locale_mapping',           'ignore_country_code',                       ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2360741', 'wrong results',  ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'memoryobjects',            'page_loadable_columns_limit',               ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2111649', 'memory',         ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'memoryobjects',            'page_loadable_columns_min_size',            ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2111649', 'memory',         ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'memoryobjects',            'unload_lower_bound',                        ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', 70,    -1,  1,  1, '1993128', 'memory',         ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'mds',                      'cache_session_ttl',                         ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2559231', 'performance',    ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'mds',                      'cube_parallel_processing_11_job_size',      ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2321714', 'crash',          ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'mds',                      'flush_cache',                               ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2465129', 'performance',    ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'mdx',                      'treat_null_as_zero',                        ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2262591', 'wrong results',  ' ' FROM DUMMY UNION ALL
    SELECT 3, 'ALL',         'indexserver.ini',      'mergedog',                 'active',                                    ' ', 'yes',                      '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2057046', 'memory',         ' ' FROM DUMMY UNION ALL
    SELECT 3, 'ALL',         'indexserver.ini',      'mergedog',                 'auto_merge_decision_func',                  ' ', '(DRC*TMD>3600*(MRC+0.0001) or (THM>=256000 and (((DMS>100 or DCC>100 or DLS>1000) and DRC>MRC/100) or (DMR>0.2*MRC and DMR>0.001))) or (THM<256000 and (DMS>50 or DCC>8 or DLS>100))) and (DUC<0.1 or 0.05*DRC>=DUC)', '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1, 89.99,  1,  1, '2057046', 'memory', ' ' FROM DUMMY UNION ALL
    SELECT 3, 'ALL',         'indexserver.ini',      'mergedog',                 'auto_merge_decision_func',                  ' ', '((DRC*TMD>3600*(MRC+0.0001)) or ((DMS>PAL/2000 or DCC>100) and DRC>MRC/100) or (DMR>0.2*MRC and DMR>0.001)) and (DUC<0.1 or 0.05*DRC>=DUC)', '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', 90, 99.99,  1,  1, '2057046', 'memory', ' ' FROM DUMMY UNION ALL
    SELECT 3, 'ALL',         'indexserver.ini',      'mergedog',                 'auto_merge_decision_func',                  ' ', '((DRC*TMD>3600*(MRC+0.0001)) or ((DMS>PAL/2000 or DCC>100) and DRC>MRC/100) or (DMR>0.2*MRC and DMR>0.001)) and ((DRC>0 and DUC<0.1) or 0.05*DRC>=DUC)', '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', 100,109.99,  1,  1, '2057046', 'memory', ' ' FROM DUMMY UNION ALL
    SELECT 2, 'ALL',         'indexserver.ini',      'mergedog',                 'auto_merge_decision_func',                  ' ', '((DRC*TMD>3600*(MRC+0.0001)) or ((DMS>PAL/2000 or DMS>1000 or DCC>100) and DRC>MRC/100) or (TMD>86400 and DMR>0.2*MRC and DMR>0.001)) and ((DRC>0 and DUC<0.1) or 0.05*DRC>=DUC)', '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', 110,122.04,  1,  1, '2057046', 'memory', ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'mergedog',                 'auto_merge_priority_func',                  ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2057046', 'memory',         ' ' FROM DUMMY UNION ALL
    SELECT 3, 'BW',          'indexserver.ini',      'mergedog',                 'check_compression_no_automerge',            ' ', 'yes',                      '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', 60,    70,  1,  1, '1955508', 'memory',         ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'mergedog',                 'check_interval',                            ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2057046', 'memory',         ' ' FROM DUMMY UNION ALL
    SELECT 2, 'ALL',         'indexserver.ini',      'mergedog',                 'critical_merge_decision_func',              ' ', 'UPT>43200 and ((MMS<10000 and DMS>1000 and TMD>86400) or TMD>604800) and DUC<0.1', '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1, 109.99,  1,  1, '2057046', 'performance', ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'mergedog',                 'delta_merge_statistics_record_limit',       ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2088971', 'memory',         ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'mergedog',                 'hard_merge_priority_func',                  ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2057046', 'memory',         ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'mergedog',                 'load_balancing_func',                       ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2057046', 'memory',         ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'mergedog',                 'smart_merge_decision_func',                 ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2057046', 'memory',         ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'mergedog',                 'smart_merge_enabled',                       ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2057046', 'memory',         ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'mergedog',                 'smart_merge_priority_func',                 ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2057046', 'memory',         ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'mergedog',                 'token_per_table',                           ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2057046', 'memory',         ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'metadata',                 'enable_drop_global_temp_row_in_use',        ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2503043', 'terminations',   ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'metadata',                 'enable_metadata_separation',                ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2372809', 'terminations',   ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'metadata',                 'ignore_exception_during_auto_migration',    ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2535589', 'terminations',   ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'metadata',                 'startup_consistency_check',                 ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2116157', 'consistency',    ' ' FROM DUMMY UNION ALL
    SELECT 3, 'ALL',         'indexserver.ini',      'metadata',                 'force_turning_on_metadata_separation',      ' ', 'false',                    '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    83,  1,  1, '2082119', 'terminations',   ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'numa',                     'enforce_single_instance',                   ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2307882', 'terminations',   ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'olap',                     'compress_serialized_plandata_golomb_only',  ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2354107', 'crash',          ' ' FROM DUMMY UNION ALL
    SELECT 1, 'ALL',         'indexserver.ini',      'olap',                     'optimize_value_id_search',                  ' ', '0',                        '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1, 69.02,  1,  1, '1975223', 'consistency',    ' ' FROM DUMMY UNION ALL
    SELECT 2, 'BW',          'indexserver.ini',      'olap',                     'optimize_value_id_search',                  ' ', 'no',                       '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', 90,112.02,  1,  1, '2321910', 'consistency',    ' ' FROM DUMMY UNION ALL
    SELECT 3, 'ALL',         'indexserver.ini',      'olap_parallel_result',     'use_compact_column',                        ' ', 'no',                       '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', 70,    70,  1,  1, '1983888', 'consistency',    ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'optimize_compression',     'active',                                    ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2105761', 'memory',         ' ' FROM DUMMY UNION ALL
    SELECT 2, 'ALL',         'indexserver.ini',      'optimize_compression',     'auto_decision_func',                        ' ', '-- individual value --',   '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', 90,    92,  1,  1, '2105761', 'memory',         ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'optimize_compression',     'auto_decision_func',                        ' ', 'MMU>0.010240 and (CRCSOC>=50 or if(OCRC!=0, CRCSOC/OCRC>0.2,1))', '-- no recommendation --', '-- no recommendation --', '-- no recommendation --',110,122.04,  1,  1, '2057046', 'memory',         ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'optimize_compression',     'change_compression_threads',                ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2222250', 'CPU',            ' ' FROM DUMMY UNION ALL
    SELECT 2, 'ALL',         'indexserver.ini',      'optimize_compression',     'critical_decision_func',                    ' ', 'UPT>43200 and TOCD>604800 and MMU>0.010240 and (CRCSOC>=50 or if(OCRC!=0, CRCSOC/OCRC>0.2,1))',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --',110,122.04, 1, 1, '2057046', 'memory',         ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'optimize_compression',     'estimate_compression_threads',              ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2222250', 'CPU',            ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'optimize_compression',     'get_candidates_threads',                    ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2222250', 'CPU',            ' ' FROM DUMMY UNION ALL
    SELECT 1, 'ALL',         'indexserver.ini',      'optimize_compression',     'migrate_vf_to_ut',                          ' ', 'false',                    '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', 10,    11,  2,  2, '2487855', 'corruptions',    ' ' FROM DUMMY UNION ALL
    SELECT 2, 'ALL',         'indexserver.ini',      'optimize_compression',     'min_hours_since_last_merge_of_part',        ' ', '0',                        '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1, 89.99,  1,  1, '2105761', 'memory',         ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'optimize_compression',     'prepare_threads',                           ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2222250', 'CPU',            ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'optimize_compression',     'row_order_optimizer_threads',               ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2222250', 'CPU',            ' ' FROM DUMMY UNION ALL
    SELECT 1, 'ALL',         'indexserver.ini',      'optimize_compression',   'singleindex_consider_for_compressed_columns', ' ', 'false',                    '-- no recommendation --', '-- no recommendation --', '-- no recommendation --',122.10,122.11,1, 1, '2516807', 'performance',    ' ' FROM DUMMY UNION ALL
    SELECT 1, 'ALL',         'indexserver.ini',      'optimize_compression',   'singleindex_consider_for_compressed_columns', ' ', 'false',                    '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1, 12.01,  2,  2, '2516807', 'performance',    ' ' FROM DUMMY UNION ALL
    SELECT 1, 'ALL',         'indexserver.ini',      'optimize_compression',   'singleindex_consider_for_compressed_columns', ' ', 'false',                    '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', 20,    20,  2,  2, '2516807', 'performance',    ' ' FROM DUMMY UNION ALL
    SELECT 2, 'ALL',         'indexserver.ini',      'optimize_compression',     'smart_decision_func',                       ' ', '-- individual value --',   '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', 90,    92,  1,  1, '2105761', 'memory',         ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'optimize_compression',     'smart_decision_func',                       ' ', 'MMU>0.010240 and (CRCSOC>=50 or if(OCRC!=0, CRCSOC/OCRC>0.2,1))', '-- no recommendation --', '-- no recommendation --', '-- no recommendation --',110,122.04,  1,  1, '2057046', 'memory',         ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'parallel',                 'use_append_dict',                           ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2363632', 'termination',    ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'parallel',                 'max_lock_retry',                            ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2535656', 'termination',    ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'parallel',                 'mode',                                      ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2036111', 'CPU',            ' ' FROM DUMMY UNION ALL
    SELECT 1, 'ALL',         'indexserver.ini',      'parallel',                 'should_stop_time',                          ' ', '4294967290',               '-- no recommendation --', '-- no recommendation --', '-- no recommendation --',122.04,122.04, 1, 1,'2403088', 'wrong results',  ' ' FROM DUMMY UNION ALL
    SELECT 3, 'ALL',         'indexserver.ini',      'parallel',                 'tables_preloaded_in_parallel',              ' ', '-- SPECIAL --',            '-- SPECIAL --',           '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2222250', 'CPU',            ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'partitioning',             'allow_dynamic_range_partitioning',          ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2081135', 'partitioning',   ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'partitioning',             'bulk_load_size',                            ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '1999998', 'partitioning',   ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'partitioning',             'dynamic_range_check_time_interval_sec',     ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2044468', 'partitioning',   ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'partitioning',             'dynamic_range_default_threshold',           ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2044468', 'partitioning',   ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'partitioning',             'split_history_parallel',                    ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2036111', 'partitioning',   ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'partitioning',             'split_threads',                             ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2036111', 'partitioning',   ' ' FROM DUMMY UNION ALL
    SELECT 3, 'ALL',         'indexserver.ini',      'password policy',          'force_first_password_change',               ' ', 'true',                     '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1,  '863362', 'security',       ' ' FROM DUMMY UNION ALL
    SELECT 3, 'ALL',         'indexserver.ini',      'password policy',          'maximum_unused_inital_password_lifetime',   ' ', '1',                        '7',                       '-- no recommendation --', '-- no recommendation --', -1,    -1,  1,  1,  '863362', 'security',       ' ' FROM DUMMY UNION ALL
    SELECT 3, 'ALL',         'indexserver.ini',      'password policy',          'minimal_password_length',                   ' ', '8',                        '999999999999',            '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1,  '863362', 'security',       ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'password policy',          'password_expire_warning_time',              ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2082406', 'security',       'S' FROM DUMMY UNION ALL
    SELECT 3, 'PROD',        'indexserver.ini',      'performance_analyzer',     'planviz_enable',                            ' ', 'false',                    '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,122.17,  1,  1, '2119087', 'crash',          ' ' FROM DUMMY UNION ALL
    SELECT 3, 'PROD',        'indexserver.ini',      'performance_analyzer',     'planviz_enable',                            ' ', 'false',                    '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1, 24.02,  2,  2, '2119087', 'crash',          ' ' FROM DUMMY UNION ALL
    SELECT 3, 'PROD',        'indexserver.ini',      'performance_analyzer',     'planviz_enable',                            ' ', 'false',                    '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', 30,    30,  2,  2, '2119087', 'crash',          ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'persistence',              'disposition_lob_read',                      ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '1999997', 'performance',    ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'persistence',              'disposition_lob_read_small',                ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '1999997', 'performance',    ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'persistence',              'disposition_lob_write',                     ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '1999997', 'performance',    ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'persistence',              'disposition_lob_write_small',               ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '1999997', 'performance',    ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'persistence',              'lob_page_trigger_cleanup_threshold',        ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2220627', 'memory',         ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'persistence',              'log_preformat_segment_count',               ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '1999998', 'performance',    ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'persistence',              'runtimedump_for_blocked_savepoint_timeout', ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2100009', 'trace',          ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'persistence',              'tracefile',                                 ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, ' ',       'performance',    'D' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'persistence',              'undo_file_cache_size',                      ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2547543', 'performance',    ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'planningengine',           'allow_fox_table_type',                      ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2200331', 'terminations',   ' ' FROM DUMMY UNION ALL
    SELECT 3, 'ALL',         'indexserver.ini',      'planningengine',           'allow_non_readonly_sqlscript',              ' ', 'yes',                      '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', 70,    71,  1,  1, '1979401', 'terminations',   ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'planningengine',           'disable_string_length_checks',              ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2285769', 'terminations',   ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'planningengine',           'formula_parallel_limit',                    ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2607741', 'wrong results',  ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'planningengine',           'use_fox_loop_caching',                      ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2065893', 'terminations',   ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'plan_stabilizer',          'enable_plan_stabilizer',                    ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2400006', 'performance',    ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'plan_stabilizer',          'enable_stored_hints',                       ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2400006', 'performance',    ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'queueserver',              'inactive_at_service_start',                 ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2140653', 'memory',         ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'query_mediator',           'cache_enable',                              ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2555376', 'crash',          ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'query_mediator',           'filtertransport_enable',                    ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2535996', 'memory',         ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'query_mediator',           'local_group_bys_optimization_level',        ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2553642', 'wrong results',  ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'query_mediator',           'tracefile',                                 ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, ' ',       'performance',    'D' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'repository',               'content_vendor',                            ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2275523', ' ',              'A' FROM DUMMY UNION ALL
    SELECT 3, 'ALL',         'indexserver.ini',      'repository',               'differ',                                    ' ', 'off',                      '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    80,  1,  1, '2113745', 'monitoring',     ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'repository',               'sqlscript_mode',                            ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '1994104', ' ',              ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'result_cache',             'before_analytic_privilege',                 ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2336344', 'memory',         ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'result_cache',             'enable',                                    ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2336344', 'memory',         ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'result_cache',             'total_size',                                ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2336344', 'memory',         ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'row_engine',               'bulk_delete_threshold',                     ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2000003', 'DML',            ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'row_engine',               'collect_leaked_pages_at_startup',           ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2101640', 'startup',        ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'row_engine',               'consistency_check_at_startup',              ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2116157', 'consistency',    ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'row_engine',               'dynamic_parallel_insert_max_workers',       ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '1999997', 'memory',         ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'row_engine',               'garbage_lob_file_handler_enabled',          ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2169283', 'LOB',            ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'row_engine',               'garbage_lob_file_handler_interval',         ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2169283', 'LOB',            ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'row_engine',               'keep_shared_memory_over_restart',           ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2159435', 'startup',        ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'row_engine',               'keep_shared_memory_over_restart_timeout',   ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2159435', 'startup',        ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'row_engine',               'multi_container_enabled',                   ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2287439', 'terminations',   ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'row_engine',               'page_compaction_enable',                    ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '1813245', 'memory',         ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'row_engine',               'page_compaction_max_pages',                 ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '1813245', 'memory',         ' ' FROM DUMMY UNION ALL
    SELECT 3, 'ALL',         'indexserver.ini',      'row_engine',               'parallel_query_execution',                  ' ', 'false',                    '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', 60,    69,  1,  1, '2000792', 'memory',         ' ' FROM DUMMY UNION ALL
    SELECT 3, 'ALL',         'indexserver.ini',      'row_engine',               'parallel_query_execution',                  ' ', 'false',                    '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', 70,    70,  1,  1, '2000792', 'memory',         ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'row_engine',               'reuse_shared_memory_for_restart',           ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2159435', 'startup',        ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'row_engine',               'reuse_shared_memory_for_restart_timeout',   ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2159435', 'startup',        ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'row_engine',               'show_primary_key_in_consistency_check',     ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2116157', 'startup',        ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'row_engine',               'show_record_in_consistency_check',          ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2116157', 'startup',        ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'row_engine',               'version_space_partitions',                  ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2169283', 'CPU',            ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'row_engine',               'use_jobex_index_rebuild',                   ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2005478', 'memory',         ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'runtimedump',              'default_sections',                          ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2400007', 'trace',          ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'saml',                     'add_key_info',                              ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2127658', 'security',       ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'saml',                     'default_application_path',                  ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2127658', 'security',       ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'saml',                     'hash',                                      ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2127658', 'security',       ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'saml',                     'sign_authn_request',                        ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2127658', 'security',       ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'search',                   'collect_top_documents_count',               ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2611281', 'terminations',   ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'search',                   'late_materialization_threshold',            ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '1975448', 'terminations',   ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'search',                   'late_materialization_threshold_for_insert', ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '1975448', 'terminations',   ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'search',                   'qo_extensive_checks',                       ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2616802', 'terminations',   ' ' FROM DUMMY UNION ALL
    SELECT 3, 'ALL',         'indexserver.ini',      'search',                   'qo_optimize_valuevec_limit',                ' ', '0',                        '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', 80,    80,  1,  1, '2042749', 'terminations',   ' ' FROM DUMMY UNION ALL
    SELECT 3, 'CRM',         'indexserver.ini',      'search',                   'qo_top_1_optimization',                     ' ', 'false',                    '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', 90,129.99,  1,  1, '2238679', 'performance',    ' ' FROM DUMMY UNION ALL
    SELECT 3, 'ERP',         'indexserver.ini',      'search',                   'qo_top_1_optimization',                     ' ', 'false',                    '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', 90,129.99,  1,  1, '2238679', 'performance',    ' ' FROM DUMMY UNION ALL
    SELECT 3, 'SCM',         'indexserver.ini',      'search',                   'qo_top_1_optimization',                     ' ', 'false',                    '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', 90,129.99,  1,  1, '2238679', 'performance',    ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'series',                   'abap_itab_parameter',                       ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2399993', 'FDA',            ' ' FROM DUMMY UNION ALL
    SELECT 1, 'ALL',         'indexserver.ini',      'series',                   'series_column_lrle_compression_enabled',    ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', 90,    -1,  1, -1, '2549632', 'terminations',   ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'session',                  'connection_history_lifetime',               ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2088971', 'limitation',     ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'session',                  'connection_history_maximum_size',           ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2088971', 'limitation',     ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'session',                  'data_format_version',                       ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2638379', 'terminations',   ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'session',                  'enable_eapi_fact_compression',              ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2381733', 'crash',          ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'session',                  'enable_plan_cache_decoupling',              ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2519670', 'performance',    ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'session',                  'fda_enabled',                               ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2399993', 'FDA',            ' ' FROM DUMMY UNION ALL
    SELECT 3, 'MULTI',       'indexserver.ini',      'session',                  'idle_connection_timeout',                   ' ', '0',                        '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    81,  1,  1, '2035443', 'terminations',   ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'session',                  'idle_connection_timeout_application_%',     ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2036111', 'terminations',   ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'session',                  'initial_receive_timeout',                   ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2385992', 'performance',    ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'session',                  'maximum_connections',                       ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '1910159', 'limitation',     ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'session',                  'maximum_external_connections',              ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '1910159', 'limitation',     ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'session',                  'max_statements_per_connection',             ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2154870', 'limitation',     ' ' FROM DUMMY UNION ALL
    SELECT 3, 'ALL',         'indexserver.ini',      'session',                  'socket_keepalive',                          ' ', 'on',                       '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', 53,    -1,  1,  1, '1836774', 'network',        ' ' FROM DUMMY UNION ALL
    SELECT 3, 'ALL',         'indexserver.ini',      'session',                  'tcp_keepalive_intvl',                       ' ', '10',                       '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', 53,109.99,  1,  1, '1836774', 'network',        ' ' FROM DUMMY UNION ALL
    SELECT 3, 'ALL',         'indexserver.ini',      'session',                  'tcp_keepalive_probes',                      ' ', '5',                        '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', 53,109.99,  1,  1, '1836774', 'network',        ' ' FROM DUMMY UNION ALL
    SELECT 3, 'ALL',         'indexserver.ini',      'session',                  'tcp_keepalive_time',                        ' ', '600',                      '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', 53,109.99,  1,  1, '1836774', 'network',        ' ' FROM DUMMY UNION ALL
    SELECT 0, 'SDA',         'indexserver.ini',      'smart_data_access',        'default_connections_pool_max_size',         ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2180119', 'memory',         ' ' FROM DUMMY UNION ALL
    SELECT 0, 'SDA',         'indexserver.ini',      'smart_data_access',        'enable_binary_transfer',                    ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2472882', 'crash',          ' ' FROM DUMMY UNION ALL
    SELECT 0, 'SDA',         'indexserver.ini',      'smart_data_access',        'enable_remote_cache',                       ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2036111', 'memory',         ' ' FROM DUMMY UNION ALL
    SELECT 0, 'SDA',         'indexserver.ini',      'smart_data_access',        'enable_subqueries_gen',                     ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2609173', 'termination',    ' ' FROM DUMMY UNION ALL
    SELECT 0, 'BW,IQ,SDA',   'indexserver.ini',      'smart_data_access',        'join_relocation',                           ' ', '-- individual value --',   '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', 70, 89.99,  1,  1, '2100962', 'performance',    ' ' FROM DUMMY UNION ALL
    SELECT 0, 'SDA',         'indexserver.ini',      'smart_data_access',        'max_output_batch_rows',                     ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2180119', 'memory',         ' ' FROM DUMMY UNION ALL
    SELECT 0, 'SDA',         'indexserver.ini',      'smart_data_access',        'remote_cache_validity',                     ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2036111', 'memory',         ' ' FROM DUMMY UNION ALL
    SELECT 3, 'BW,SDA',      'indexserver.ini',      'smart_data_access',        'semi_join_virtual_table_threshold',         ' ', '5000',                     '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', 70, 89.99,  1,  1, '2100962', 'performance',    ' ' FROM DUMMY UNION ALL
    SELECT 0, 'SDA',         'indexserver.ini',      'smart_data_access',        'virtual_table_default_cardinality',         ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2100962', 'performance',    ' ' FROM DUMMY UNION ALL
    SELECT 3, 'BW,SDA',      'indexserver.ini',      'smart_data_access',        'virtual_table_format',                      ' ', 'column',                   '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', 70, 89.99,  1,  1, '2100962', 'performance',    ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'sql',                      'allow_incomplete_results_for_contains',     ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2224909', 'terminations',   ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'sql',                      'calculation_view_unfolding',                ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2177965', 'terminations',   ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'sql',                      'ce2qo_transient_plan_for_data_var',         ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2441054', 'terminations',   ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'sql',                   'conservative_cs_anti_join_estimation_enabled', ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2000002', 'performance',    ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'sql',                      'disj_filter_into_union_threshold',          ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2228370', 'wrong results',  ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'sql',                      'disjunctive_hash_join_enabled',             ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2462138', 'crash',          ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'sql',                      'display_sql_statement_parameters_in_dump',  ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2288661', 'monitoring',     ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'sql',                      'enable_old_update_from_behavior',           ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2241598', 'terminations',   ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'sql',                      'esx_level',                                 ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2599949', 'crash',          ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'sql',                      'hex_enabled',                               ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2570371', 'performance',    ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'sql',                      'inverse_function_optimization',             ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2392856', 'crash',          ' ' FROM DUMMY UNION ALL
    SELECT 2, 'ALL',         'indexserver.ini',      'sql',                      'multistore_feature_toggle', ' ', 'multistore_operator,column,update,false',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', 30,    31,  2,  2, '2600030', 'performance',    ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'sql',                      'native_mixed_join_enabled',                 ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2624305', 'memory',         ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'sql',                      'nested_trigger_check_in_ddl_time',          ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2170927', 'terminations',   ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'sql',                      'nested_trigger_limit',                      ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2130431', 'terminations',   ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'sql',                     'olap_count_distinct_over_huge_table_enabled',' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2396894', 'performance',    ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'sql',                      'plan_cache_auto_recompilation_enabled',     ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2124112', 'performance',    ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'sql',                      'plan_cache_enabled',                        ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2088971', 'monitoring',     ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'sql',                      'plan_cache_parameter_enabled',              ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2000002', 'monitoring',     ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'sql',                      'plan_cache_parameter_for_lob_enabled',      ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2000002', 'monitoring',     ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'sql',                      'plan_cache_parameter_sum_threshold',        ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2000002', 'monitoring',     ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'sql',                      'plan_cache_parameter_threshold',            ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2000002', 'monitoring',     ' ' FROM DUMMY UNION ALL
    SELECT 3, 'ALL',         'indexserver.ini',      'sql',                      'plan_cache_size',                           ' ', '2147483648',               '999999999999',            '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2124112', 'performance',    ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'sql',                      'plan_cache_plan_cache_trexviadbsl_enabled', ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2000002', 'monitoring',     ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'sql',                      'plan_cache_plan_cache_trexviadbsl_for_join_engine', ' ','-- no recommendation --', '-- no recommendation --','-- no recommendation --','-- no recommendation --',-1, -1, -1, -1, '2000002', 'monitoring',     ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'sql',                      'plan_cache_plan_cache_trexviadbsl_for_olap_engine', ' ','-- no recommendation --', '-- no recommendation --','-- no recommendation --','-- no recommendation --',-1, -1, -1, -1, '2000002', 'monitoring',     ' ' FROM DUMMY UNION ALL
    SELECT 3, 'ALL',         'indexserver.ini',      'sql',                      'prefer_multi_column_in_threshold',          ' ', '512',                      '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', 95,    95,  1,  1, '2165232', 'consistency',    ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'sql',                      'preferred_routing_cost_threshold',          ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2518407', 'replication',    ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'sql',                      'recompile_with_param',                      ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2124112', 'performance',    ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'sql',                      'reload_tables',                             ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2127458', 'startup',        ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'sql',                      'reserved_connections',                      ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2036111', 'monitoring',     ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'sql',                      'reserve_object_name_prefix',                ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2091256', 'stat. server',   ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'sql',                      'search_vid_count',                          ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2124112', 'CPU',            ' ' FROM DUMMY UNION ALL
    SELECT 3, 'ALL',         'indexserver.ini',      'sql',                      'subplan_sharing',                           ' ', 'off',                      '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    70,  1,  1, '2002208', 'terminations',   ' ' FROM DUMMY UNION ALL
    SELECT 3, 'ALL',         'indexserver.ini',      'sql',                      'subplan_sharing',                           ' ', 'off',                      '-- no recommendation --', '-- no recommendation --', '-- no recommendation --',110,   111,  1,  1, '2275220', 'terminations',   ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'sql',                      'table_statistics_enabled',                  ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2343579', 'crash',          ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'sql',                      'table_statistics_modify_enabled',           ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2088971', 'monitoring',     ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'sql',                      'table_statistics_select_enabled',           ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2088971', 'monitoring',     ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'sql',                      'use_interuser_plan_sharing',                ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2124112', 'performance',    ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'sql',                      'use_new_placement_scheme_for_replicas',     ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2381080', 'performance',    ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'sql',                      'use_old_locate_function',                   ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2304091', 'consistency',    ' ' FROM DUMMY UNION ALL
    SELECT 3, 'ALL',         'indexserver.ini',      'sql',                      'use_startup_timezone',                      ' ', 'false',                    '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', 65,    68,  1,  1, '1932132', 'terminations',   ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'sql_client_network_io',    'enabled',                                   ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2119087', 'network',        ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'sql_client_network_io',    'buffer_size',                               ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2119087', 'network',        ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'sqlscript',                'allow_nested_call_in_auto_tx_dev',          ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2222219', 'terminations',   ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'sqlscript',                'disable_procedure_flattening',              ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2557912', 'crash',          ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'sqlscript',                'enable_se_execution_with_gtti_dev',         ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2527648', 'terminations',   ' ' FROM DUMMY UNION ALL
    SELECT 4, 'ABAP',        'indexserver.ini',      'sqlscript',                'enable_select_into_scalar_udf',             ' ', 'TRUE',                     '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', 80, 99.99,  1,  1, '2160814', 'terminations',   ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'sqlscript',                'execution_monitoring_level',                ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2088971', 'locks',          ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'sqlscript',                'execution_monitoring_limit',                ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2088971', 'memory',         ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'sqlscript',                'monitoring_level',                          ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2088971', 'locks',          ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'sqlscript',                'number_of_calls_to_retain_after_execution', ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2000002', 'monitoring',     ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'sqlscript',                'retention_period_for_sqlscript_context',    ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2000002', 'monitoring',     ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini', 'sqlscript', 'skip_revalidation_and_accept_invalid_procedures_after_startup', ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2323112', 'terminations',   ' ' FROM DUMMY UNION ALL
    SELECT 0, 'MULTI',       'indexserver.ini',      'sqlscript',                'translate_ce_datasource_to_select_stmt',    ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2174236', 'terminations',   ' ' FROM DUMMY UNION ALL
    SELECT 0, 'MULTI',       'indexserver.ini',      'sqlscript',                'typecheck_procedure_input_param',           ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2036111', 'terminations',   ' ' FROM DUMMY UNION ALL
    SELECT 3, 'MDCSYS',      'indexserver_strict.ini', 'statisticsserver',       'active',                                    ' ', 'true',                     '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '1917938', 'monitoring',     ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'statisticsserver',         'initial_profile',                           ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2127247', 'stat. server',   'D' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'statisticsserver',         'threadpool',                                ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2222250', 'CPU',            ' ' FROM DUMMY UNION ALL
    SELECT 0, 'MULTI',       'indexserver.ini',      'table_redist',             'all_moves_physical',                        ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2081591', 'redistribution', ' ' FROM DUMMY UNION ALL
    SELECT 3, 'ERP',         'indexserver.ini',      'table_redist',             'balance_by_execution_count',                ' ', 'true',                     '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', 70,    -1,  1, -1, '1899817', 'redistribution', ' ' FROM DUMMY UNION ALL
    SELECT 3, 'MULTI',       'indexserver.ini',      'table_redist',             'balance_by_execution_count',                ' ', 'true',                     '-- no recommendation --', '-- no recommendation --', '-- no recommendation --',120,    -1,  1, -1, '1958216', 'redistribution', ' ' FROM DUMMY UNION ALL
    SELECT 3, 'ERP',         'indexserver.ini',      'table_redist',             'balance_by_execution_count_weight',         ' ', '1',                        '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', 70,    -1,  1, -1, '1899817', 'redistribution', ' ' FROM DUMMY UNION ALL
    SELECT 3, 'ERP',         'indexserver.ini',      'table_redist',             'balance_by_execution_time',                 ' ', 'true',                     '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', 70,    -1,  1, -1, '1899817', 'redistribution', ' ' FROM DUMMY UNION ALL
    SELECT 3, 'MULTI',       'indexserver.ini',      'table_redist',             'balance_by_execution_time',                 ' ', 'true',                     '-- no recommendation --', '-- no recommendation --', '-- no recommendation --',120,    -1,  1, -1, '1958216', 'redistribution', ' ' FROM DUMMY UNION ALL
    SELECT 3, 'ERP',         'indexserver.ini',      'table_redist',             'balance_by_execution_time_weight',          ' ', '1',                        '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', 70,    -1,  1, -1, '1899817', 'redistribution', ' ' FROM DUMMY UNION ALL
    SELECT 3, 'MULTI',       'indexserver.ini',      'table_redist',             'balance_by_memuse',                         ' ', 'false',                    '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', 74,    84,  1,  1, '1958216', 'redistribution', ' ' FROM DUMMY UNION ALL
    SELECT 3, 'MULTI',       'indexserver.ini',      'table_redist',             'balance_by_memuse',                         ' ', 'false',                    '-- no recommendation --', '-- no recommendation --', '-- no recommendation --',120,    -1,  1, -1, '1958216', 'redistribution', ' ' FROM DUMMY UNION ALL
    SELECT 3, 'MULTI',       'indexserver.ini',      'table_redist',             'balance_by_part_id',                        ' ', 'false',                    '-- no recommendation --', '-- no recommendation --', '-- no recommendation --',120,    -1,  1, -1, '1958216', 'redistribution', ' ' FROM DUMMY UNION ALL
    SELECT 3, 'MULTI',       'indexserver.ini',      'table_redist',             'balance_by_partnum',                        ' ', 'false',                    '-- no recommendation --', '-- no recommendation --', '-- no recommendation --',120,    -1,  1, -1, '1958216', 'redistribution', ' ' FROM DUMMY UNION ALL
    SELECT 3, 'MULTI',       'indexserver.ini',      'table_redist',             'balance_by_rows',                           ' ', 'false',                    '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', 74,    84,  1,  1, '1958216', 'redistribution', ' ' FROM DUMMY UNION ALL
    SELECT 3, 'MULTI',       'indexserver.ini',      'table_redist',             'balance_by_rows',                           ' ', 'false',                    '-- no recommendation --', '-- no recommendation --', '-- no recommendation --',120,    -1,  1, -1, '1958216', 'redistribution', ' ' FROM DUMMY UNION ALL
    SELECT 3, 'MULTI',       'indexserver.ini',      'table_redist',             'balance_by_table_classification',           ' ', 'false',                    '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', 74, 99.99,  1,  1, '1958216', 'redistribution', ' ' FROM DUMMY UNION ALL
    SELECT 3, 'MULTI',       'indexserver.ini',      'table_redist',             'balance_by_table_classification',           ' ', 'false',                    '-- no recommendation --', '-- no recommendation --', '-- no recommendation --',120,    -1,  1, -1, '1958216', 'redistribution', ' ' FROM DUMMY UNION ALL
    SELECT 3, 'MULTI',       'indexserver.ini',      'table_redist',             'balance_by_table_size_hosted',              ' ', 'true',                     '-- no recommendation --', '-- no recommendation --', '-- no recommendation --',120,    -1,  1, -1, '1958216', 'redistribution', ' ' FROM DUMMY UNION ALL
    SELECT 3, 'MULTI',       'indexserver.ini',      'table_redist',             'balance_by_table_subclassification',        ' ', 'false',                    '-- no recommendation --', '-- no recommendation --', '-- no recommendation --',120,    -1,  1, -1, '1958216', 'redistribution', ' ' FROM DUMMY UNION ALL
    SELECT 3, 'MULTI',       'indexserver.ini',      'table_redist',             'debug_export_detail',                       ' ', '0',                        '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1, 89.99,  1,  1, '2210025', 'redistribution', ' ' FROM DUMMY UNION ALL
    SELECT 3, 'MULTI',       'indexserver.ini',      'table_redist',             'enable_merge',                              ' ', '0',                        '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', 64, 74.01,  1,  1, '1958216', 'redistribution', ' ' FROM DUMMY UNION ALL
    SELECT 3, 'MULTI',       'indexserver.ini',      'table_redist',             'enable_repartitioning_with_gcd',            ' ', 'false',                    '-- no recommendation --', '-- no recommendation --', '-- no recommendation --',100,109.99,  1,  1, '1958216', 'redistribution', ' ' FROM DUMMY UNION ALL
    SELECT 0, 'MULTI',       'indexserver.ini',      'table_redist',             'force_partnum_to_splitrule',                ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2081591', 'redistribution', ' ' FROM DUMMY UNION ALL
    SELECT 0, 'MULTI',       'indexserver.ini',      'table_redist',             'num_exec_threads',                          ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2081591', 'redistribution', ' ' FROM DUMMY UNION ALL
    SELECT 4, 'ALL',         'indexserver.ini',      'trace',                    'tablereload',                               ' ', 'info',                     '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2222217', 'startup',        ' ' FROM DUMMY UNION ALL
    SELECT 3, 'ALL',         'indexserver.ini',      'transaction',              'aggressive_gc_interval',                    ' ', '300',                      '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1,  1,  1, '2169283', 'performance',    ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'transaction',              'check_global_trans_consistency',            ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2129651', 'consistency',    ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'transaction',              'check_slave_on_master_restart',             ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2129651', 'consistency',    ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'transaction',              'idle_cursor_lifetime',                      ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2169283', 'garbage coll.',  ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'transaction',              'idle_cursor_alert_timeout',                 ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2169283', 'garbage coll.',  ' ' FROM DUMMY UNION ALL
    SELECT 3, 'ALL',         'indexserver.ini',      'transaction',              'lock_wait_timeout',                         ' ', '100000',                   '7200000',                 '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '1999998', 'performance',    ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'transaction',              'max_tid_vector_size',                       ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2355498', 'crash',          ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'transaction',              'max_tid_vector_size_for_tid_buffer',        ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2355498', 'crash',          ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'transaction',              'max_versions_per_record_alert_threshold',   ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2169283', 'garbage coll.',  ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'transaction',              'max_versions_per_table_alert_threshold',    ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2169283', 'garbage coll.',  ' ' FROM DUMMY UNION ALL
    SELECT 0, 'MULTI',       'indexserver.ini',      'transaction',              'mincid_table_truncation_interval',          ' ', '9223372036854775807',      '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    73,  1,  1, '1991599', 'terminations',   ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'transaction',              'mvcc_aged_checker_timeout',                 ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2169283', 'garbage coll.',  ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'transaction',              'num_of_async_rep_queue',                    ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2340450', 'CPU',            ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'transaction',              'number_versions_alert_threshold',           ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2169283', 'garbage coll.',  ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'transaction',              'parallel_batch_insert_threshold',           ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2000003', 'DML',            ' ' FROM DUMMY UNION ALL
    SELECT 0, 'HIST',        'indexserver.ini',      'transaction',              'transaction_history_record_limit',          ' ', '-- individual value --',   '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '1910610', 'consistency',    ' ' FROM DUMMY UNION ALL
    SELECT 0, 'HIST',        'indexserver.ini',      'transaction',              'transaction_history_size_limit',            ' ', '-- individual value --',   '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '1910610', 'consistency',    ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'transaction',              'transaction_number_limit',                  ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2154870', 'terminations',   ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'transaction',              'uncommitted_write_transaction_alert_timeout',' ','-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2169283', 'garbage coll.',  ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'indexserver.ini',      'transaction',              'uncommitted_write_transaction_lifetime',    ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2169283', 'garbage coll.',  ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'multidb.ini',          'readonly_parameters',      '%',                                         ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2036111', 'multitenant',    ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'nameserver.ini',       'distributed_watchdog',     'interval',                                  ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2380176', 'network',        ' ' FROM DUMMY UNION ALL
    SELECT 0, 'MDCSYS',      'nameserver.ini',       'execution',                'max_concurrency',                           ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2186744', 'multitenant',    'D' FROM DUMMY UNION ALL
    SELECT 0, 'MDCSYS',      'nameserver.ini',       'httpserver',               'embedded',                                  ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2186744', 'multitenant',    'D' FROM DUMMY UNION ALL
    SELECT 0, 'MDCSYS',      'nameserver.ini',       'httpserver',               'maxthreads',                                ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2186744', 'multitenant',    'D' FROM DUMMY UNION ALL
    SELECT 0, 'MDCSYS',      'nameserver.ini',       'httpserver',               'workerpoolsize',                            ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2186744', 'multitenant',    'D' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'nameserver.ini',       'landscape',                '%',                                         ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1,        '', ' ',              'D' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'nameserver.ini',       'local_watchdog',           'interval',                                  ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2380176', 'network',        ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'nameserver.ini',       'sld',                      'configpath',                                ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1,        '', ' ',              'A' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'nameserver.ini',       'sld',                      'enable',                                    ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2430523', ' ',              'A' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'nameserver.ini',       'sld',                      'force_interval',                            ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2303938', ' ',              ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'nameserver.ini',       'sld',                      'interval',                                  ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2303938', ' ',              ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'nameserver.ini',       'sld',                      'lmstructurepath',                           ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1,        '', ' ',              'A' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'nameserver.ini',       'sld',                      'xmlpath',                                   ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1,        '', ' ',              'A' FROM DUMMY UNION ALL
    SELECT 0, 'MDCSYS',      'nameserver.ini',       'sql',                      'sql_executors',                             ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2186744', 'multitenant',    'D' FROM DUMMY UNION ALL
    SELECT 2, 'ALL',         'nameserver.ini',       'statisticsserver',         'active',                                    ' ', 'true',                     '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', 74,    -1,  1,  1, '1917938', 'monitoring',     ' ' FROM DUMMY UNION ALL
    SELECT 0, 'MDCSYS',      'nameserver.ini',       'threads',                  'poolsize',                                  ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2186744', 'multitenant',    'D' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'nameserver.ini',       'topology',                 'size',                                      ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '1977101', 'memory',         ' ' FROM DUMMY UNION ALL
    SELECT 2, 'ALL',         'scriptserver.ini',     'communication',            'maxchannels',                               ' ', '4000',                     '-- no recommendation --', '-- no recommendation --', '-- no recommendation --',100,122.14,  1,  1, '2382421', 'terminations',   ' ' FROM DUMMY UNION ALL
    SELECT 2, 'ALL',         'scriptserver.ini',     'communication',            'maxchannels',                               ' ', '4000',                     '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,     9,  2,  2, '2382421', 'terminations',   ' ' FROM DUMMY UNION ALL
    SELECT 2, 'ALL',         'scriptserver.ini',     'communication',            'maxendpoints',                              ' ', '4000',                     '-- no recommendation --', '-- no recommendation --', '-- no recommendation --',100,122.14,  1,  1, '2382421', 'terminations',   ' ' FROM DUMMY UNION ALL
    SELECT 2, 'ALL',         'scriptserver.ini',     'communication',            'maxendpoints',                              ' ', '4000',                     '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,     9,  2,  2, '2382421', 'terminations',   ' ' FROM DUMMY UNION ALL
    SELECT 0, 'SSS',         'statisticsserver.ini', '%',                        '%',                                         ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2147247', 'stat. server',   ' ' FROM DUMMY UNION ALL
    SELECT 0, 'SSS',         'statisticsserver.ini', 'memorymanager',            'allocationlimit',                           ' ', '-- individual value --',   '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    73,  1,  1, '1929538', 'memory',         ' ' FROM DUMMY UNION ALL
    SELECT 0, 'SSS',         'statisticsserver.ini', 'persistence',              'log_segment_size_mb',                       ' ', '1024',                     '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2019148', 'backup',         ' ' FROM DUMMY UNION ALL
    SELECT 0, 'SSS',         'statisticsserver.ini', 'row_engine',               'parallel_query_execution',                  ' ', 'false',                    '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', 60,    69,  1,  1, '2000792', 'memory',         ' ' FROM DUMMY UNION ALL
    SELECT 0, 'SSS',         'statisticsserver.ini', 'row_engine',               'parallel_query_execution',                  ' ', 'false',                    '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', 70,    70,  1,  1, '2000792', 'memory',         ' ' FROM DUMMY UNION ALL
    SELECT 0, 'SSS',         'statisticsserver.ini', 'sql',                      'use_startup_timezone',                      ' ', 'false',                    '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', 65,    68,  1,  1, '1932132', 'terminations',   ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ESS',         'statisticsserver.ini', 'statisticsserver_general', 'active',                                    ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2147247', 'monitoring',     'D' FROM DUMMY UNION ALL
    SELECT 0, 'SSS',         'statisticsserver.ini', 'statisticsserver_general', 'editing',                                   ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2084747', 'stat. server',   ' ' FROM DUMMY UNION ALL
    SELECT 0, 'SSS',         'statisticsserver.ini', 'statisticsserver_intervals','interval_purgehistory',                    ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '1929538', 'stat. server',   ' ' FROM DUMMY UNION ALL
    SELECT 0, 'SSS',         'statisticsserver.ini', 'statisticsserver_view%',   '%',                                         ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2084747', 'stat. server',   'A' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'webdispatcher.ini',    '%',                        '%',                                         ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '1990354', 'configuration',  ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'webdispatcher.ini',    'profile',                  'icm/HTTP/logging_n',                        ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2201212', 'trace',          ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'webdispatcher.ini',    'profile',                  'icm/HTTP/mod%',                             ' ', '-- individual value --',   '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    94,  1,  1, '2176128', 'security',       ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'webdispatcher.ini',    'profile',                  'wdisp/filter_xs_internal_uri',              ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '1855097', ' ',              'A' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'webdispatcher.ini',    'profile',                  'wdisp/system_auto_configuration',           ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2360874', ' ',              'A' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'webdispatcher.ini',    'profile',                  'wdisp/system%',                             ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1,        '', ' ',              'A' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'webdispatcher.ini',    'communication',            'sslkeystore',                               ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2134259', 'security',       'A' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'xsengine.ini',         'application_container',    'application_list',                          ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2134259', 'xsengine',       ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'xsengine.ini',         'communication',            'client_ciphersuites',                       ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2173384', 'xsengine',       ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'xsengine.ini',         'communication',            'client_sni_enabled',                        ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2173384', 'xsengine',       ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'xsengine.ini',         'customer_usage',           '%',                                         ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2201212', 'xsengine',       ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'xsengine.ini',         'debugger',                 'enabled ',                                  ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2328680', 'terminations',   ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'xsengine.ini',         'httpserver',               'embedded',                                  ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2132353', 'xsengine',       'A' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'xsengine.ini',         'httpserver',               'max_request_runtime',                       ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2159899', 'xsengine',       ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'xsengine.ini',         'httpserver',               'sessiontimeout',                            ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2159899', 'xsengine',       ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'xsengine.ini',         'jsvm',                     'max_runtime_bytes',                         ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2159899', 'xsengine',       ' ' FROM DUMMY UNION ALL
    SELECT 3, 'ALL',         'xsengine.ini',         'persistence',              'log_segment_size_mb',                       ' ', '64',                       '1024',                    '-- no recommendation --', '-- no recommendation --', -1,    82,  1,  1, '2062080', 'backup',         ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'xsengine.ini',         'public_urls',              'http_url',                                  ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2378150', 'network',        'A' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'xsengine.ini',         'public_urls',              'https_url',                                 ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2378150', 'network',        'A' FROM DUMMY UNION ALL
    SELECT 3, 'ALL',         'xsengine.ini',         'row_engine',               'parallel_query_execution',                  ' ', 'false',                    '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', 60,    69,  1,  1, '2000792', 'memory',         ' ' FROM DUMMY UNION ALL
    SELECT 3, 'ALL',         'xsengine.ini',         'row_engine',               'parallel_query_execution',                  ' ', 'false',                    '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', 70,    70,  1,  1, '2000792', 'memory',         ' ' FROM DUMMY UNION ALL
    SELECT 0, 'ALL',         'xsengine.ini',         'scheduler',                'enabled',                                   ' ', '-- no recommendation --',  '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', -1,    -1, -1, -1, '2160230', 'xsengine',       'A' FROM DUMMY UNION ALL
SELECT 3,'ALL','indexserver.ini','search','qo_top_1_optimization',' ','false','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,-1,1,1,'2238679','CPU;MVCC;top_optimization;internal_parameter',' ' from DUMMY UNION ALL
SELECT 1,'ALL','indexserver.ini','delta','btree_cache_aggressiveness',' ','0','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,121.999,1,1,'2339989','consistency',' ' from DUMMY UNION ALL
SELECT 3,'ALL','indexserver.ini','row_engine','garbage_lob_file_handler_enabled',' ','false','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,122.019,1,1,'2351467','GC;RowStore;memory_leak;LOB',' ' from DUMMY UNION ALL
SELECT 1,'SYSREP','global.ini','system_replication','logshipping_replay_push_callback_count',' ','300000','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,122.049,1,1,'2381431','system_replication;log_replay',' ' from DUMMY UNION ALL
SELECT 1,'ALL','indexserver.ini','session','fda_enable',' ','off','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,122.039,1,1,'2406964','FDA;indexserver_crash',' ' from DUMMY UNION ALL
SELECT 4,'ALL','indexserver.ini','session','max_lob_prefetch_size',' ','2147483647','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,-1,1,1,'2408032','LOB;JDBC',' ' from DUMMY UNION ALL
SELECT 3,'SDA','indexserver.ini','smart_data_access','enable_binary_transfer',' ','false','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,-1,1,1,'2416236','SDA',' ' from DUMMY UNION ALL
SELECT 4,'BW','indexserver.ini','indexing','use_sparsity_check',' ','no','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,122.089,1,1,'2430257','BWoH;SCM;Memory_leak;compression;delta_merge',' ' from DUMMY UNION ALL
SELECT 1,'ALL','global.ini','resource_tracking','service_thread_sampling_monitor_enabled',' ','false','-- no recommendation --','-- no recommendation --','-- no recommendation --',122.07,122.079,1,1,'2437287','indexserver_crash;system_view',' ' from DUMMY UNION ALL
SELECT 1,'ALL','indexserver.ini','row_engine','page_compaction_max_pages',' ','2097152','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,122.079,1,1,'2440717','indexserver_crash;rowstore_reorg',' ' from DUMMY UNION ALL
SELECT 2,'SYSREP','global.ini','system_replication','enable_log_retention',' ','off','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,122.049,1,1,'2442450','system_replication;log_replay',' ' from DUMMY UNION ALL
SELECT 1,'ALL','indexserver.ini','sql','disjunctive_hash_join_enabled',' ','false','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,122.049,1,1,'2445356','indexserver_crash;join_engine;optimizer',' ' from DUMMY UNION ALL
SELECT 1,'ALL','indexserver.ini','authentication','last_successful_connect_update_interval',' ','300','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,122.149,1,1,'2460123','CPU;lock_manager',' ' from DUMMY UNION ALL
SELECT 1,'ALL','indexserver.ini','row_engine','dynamic_parallel_insert_max_workers',' ','1','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,122.089,1,1,'2461264','indexserver_crash;Rowstore',' ' from DUMMY UNION ALL
SELECT 1,'ALL','indexserver.ini','sql','disjunctive_hash_join_enabled',' ','false','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,122.089,1,1,'2462138','indexserver_crash',' ' from DUMMY UNION ALL
SELECT 1,'ALL','global.ini','communication','ssl',' ','off','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,122.089,1,1,'2464452','SSL;indexserver_crash;encryption',' ' from DUMMY UNION ALL
SELECT 3,'SDA','indexserver.ini','smart_data_access','enable_binary_transfer',' ','-- no recommendation --','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,122.079,1,1,'2472882','virtual_table;LOB;SDA',' ' from DUMMY UNION ALL
SELECT 3,'MULTI','indexserver.ini','calcengine','gc_cleanup_retention_sec',' ','604800','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,122.109,1,1,'2474345','calc_engine;scale-out;GC;performance',' ' from DUMMY UNION ALL
SELECT 3,'ALL','indexserver.ini','calcengine','instantiate_max_itab_transformation_size',' ','<number_higher_than_number_of_predicates>','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,122.099,1,1,'2476064','calc_view',' ' from DUMMY UNION ALL
SELECT 1,'ALL','indexserver.ini','calcengine','optimize_simplify_filter_enabled',' ','0','-- no recommendation --','-- no recommendation --','-- no recommendation --',122.04,122.099,1,1,'2476216','indexserver_crash;calc_engine',' ' from DUMMY UNION ALL
SELECT 2,'ALL','indexserver.ini','lobhandling','garbage_collect_interval_s',' ','0','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,122.099,1,1,'2477482','partitioning;LOB',' ' from DUMMY UNION ALL
SELECT 4,'ALL','indexserver.ini','resource_tracking','service_thread_sampling_monitor_include_passport',' ','no','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,122.119,1,1,'2478767','system_view',' ' from DUMMY UNION ALL
SELECT 1,'ALL','indexserver.ini','session','fda_enable',' ','off','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,122.109,1,1,'2495247','FDA;wrong_result',' ' from DUMMY UNION ALL
SELECT 3,'MULTI','indexserver.ini','distribution','client_distibution_mode',' ','off','-- no recommendation --','-- no recommendation --','-- no recommendation --',121,122.119,1,1,'2500745','scale-out;LOB;repository;deploy',' ' from DUMMY UNION ALL
SELECT 1,'ALL','indexserver.ini','joins','disable_aggregate_simplification',' ','true','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,122.119,1,1,'2509750','partitioning',' ' from DUMMY UNION ALL
SELECT 3,'ALL','nameserver.ini','session','max_number_of_sessions_per_partition',' ','2048','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,-1,1,1,'2516320','connection_limit;session',' ' from DUMMY UNION ALL
SELECT 1,'ALL','indexserver.ini','optimize_compression','singleindex_consider_for_compressed_columns',' ','false','-- no recommendation --','-- no recommendation --','-- no recommendation --',122.1,122.119,1,1,'2516807','indexes;CPU;join_engine',' ' from DUMMY UNION ALL
SELECT 2,'BW','indexserver.ini','calcengine','ce2qo_enable_boundary_op',' ','0','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,122.139,1,1,'2517443','performance; calc_view;Bex;memory_leak;FEMS;BWoH',' ' from DUMMY UNION ALL
SELECT 1,'SYSREP','global.ini','system_replication','enable_evict_pages_after_takeover',' ','false','-- no recommendation --','-- no recommendation --','-- no recommendation --',122.1,122.119,1,1,'2519008','indexserver_crash;system_replication;page_cache',' ' from DUMMY UNION ALL
SELECT 1,'SYSREP','indexserver.ini','row_engine','keep_shared_memory_over_restart',' ','false','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,122.119,1,1,'2522580','indexserver_crash; system_replication;RowStore;delta_data_shipping;takeover',' ' from DUMMY UNION ALL
SELECT 1,'ALL','global.ini','communication','ssl',' ','off','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,122.119,1,1,'2523100','SSL;indexserver_crash;encryption',' ' from DUMMY UNION ALL
SELECT 1,'ERP','indexserver.ini','sql','plan_cache_size',' ','5368709120','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,-1,1,1,'2523230','BSoH;error_2048;sql_plan_cache',' ' from DUMMY UNION ALL
SELECT 2,'SYSREP','global.ini','system_replication','enable_log_retention',' ','-- no recommendation --','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,122.019,1,1,'2525420','system_replication',' ' from DUMMY UNION ALL
SELECT 1,'ALL','indexserver.ini','session','fda_enable',' ','off','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,122.129,1,1,'2534365','indexserver_crash;FDA',' ' from DUMMY UNION ALL
SELECT 2,'BW','indexserver.ini','parallel','max_lock_retry',' ','60','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,-1,1,1,'2535656','OLAP;BWoH;SCM;lock_manager',' ' from DUMMY UNION ALL
SELECT 1,'ALL','indexserver.ini','query_mediator','filtertransport_enable',' ','0','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,122.129,1,1,'2535996','indexserver_crash;olap_engine;optimizer',' ' from DUMMY UNION ALL
SELECT 1,'ALL','indexserver.ini','search','late_materialization_threshold_for_insert',' ','10000000000','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,122.119,1,1,'2539459','indexserver_crash;trex;late_materialization',' ' from DUMMY UNION ALL
SELECT 1,'ALL','indexserver.ini','session','protocol_trace',' ','-- no recommendation --','-- no recommendation --','-- no recommendation --','-- no recommendation --',122.11,122.139,1,1,'2540710','indexserver_crash;PowerPC;trace',' ' from DUMMY UNION ALL
SELECT 2,'SDA','indexserver.ini','smart_data_access','join_relocation',' ','false','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,-1,1,1,'2542329','SDA;virtual_table',' ' from DUMMY UNION ALL
SELECT 1,'SYSREP','global.ini','system_replication','preload_column_tables',' ','false','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,122.129,1,1,'2542853','indexserver_crash;system_replication;takeover;preload;delta_data_shipping;upgrade',' ' from DUMMY UNION ALL
SELECT 1,'ALL','indexserver.ini','performance_analyzer','planviz_enable',' ','false','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,122.139,1,1,'2542972','indexserver_crash;planviz',' ' from DUMMY UNION ALL
SELECT 1,'ALL','indexserver.ini','calcengine','ce2qo_disable_unfolding',' ','1','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,122.129,1,1,'2544123','indexserver_crash;calc_engine;optimizer',' ' from DUMMY UNION ALL
SELECT 1,'MULTI','indexserver.ini','row_engine','dynamic_parallel_insert_max_workers',' ','1','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,122.129,1,1,'2544949','indexserver_crash;redistribution;scale-out',' ' from DUMMY UNION ALL
SELECT 2,'ALL','indexserver.ini','persistence','undo_file_cache_size',' ','512','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,122.119,1,1,'2547543','CPU;performance;undo_files',' ' from DUMMY UNION ALL
SELECT 1,'ALL','indexserver.ini','session','fda_enable',' ','off','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,122.109,1,1,'2547605','indexserver_crash',' ' from DUMMY UNION ALL
SELECT 3,'ALL','indexserver.ini','series','series_column_lrle_compression_enabled',' ','false','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,122.139,1,1,'2549632','compression_LRLE',' ' from DUMMY UNION ALL
SELECT 1,'MULTI','indexserver.ini','query_mediator','cache_enable',' ','0','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,122.139,1,1,'2555376','indexserver_crash;scale-out;sql_plan_cache',' ' from DUMMY UNION ALL
SELECT 2,'ALL','indexserver.ini','calcengine','disabled_patterns',' ','23','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,122.109,1,1,'2557609','calc_view;calc_engine',' ' from DUMMY UNION ALL
SELECT 1,'ALL','xsengine.ini','sql','use_new_placement_scheme_for_replicas',' ','false','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,122.139,1,1,'2558683','XS_engine',' ' from DUMMY UNION ALL
SELECT 3,'SDI','dpserver.ini','persistence','receiver_comi_interval_sec',' ','2','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,122.139,1,1,'2560056','SDI',' ' from DUMMY UNION ALL
SELECT 3,'ALL','indexserver.ini','persistence','savepoint_max_pre_critical_flush_duration',' ','-- no recommendation --','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,122.109,1,1,'2565285','performance;GC;LOB;MVCC',' ' from DUMMY UNION ALL
SELECT 1,'SDA','indexserver.ini','smart_data_access','enable_binary_transfer',' ','false','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,122.149,1,1,'2566685','SDA;virtual_table',' ' from DUMMY UNION ALL
SELECT 1,'SYSREP','global.ini','pitrestart','replay_step_size',' ','88080384','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,122.139,1,1,'2567255','indexserver_crash;system_replication;takeover',' ' from DUMMY UNION ALL
SELECT 2,'ALL','indexserver.ini','calcengine','ce2qo_skip_cache_lookup',' ','1','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,122.089,1,1,'2573582','calc_view;calc_engine',' ' from DUMMY UNION ALL
SELECT 1,'SYSREP','global.ini','system_replication','enable_log_retention',' ','off','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,122.059,1,1,'2576669','system_replication;log_replay',' ' from DUMMY UNION ALL
SELECT 1,'ALL','global.ini','backup','parallel_data_backup_backint_channels',' ','-- no recommendation --','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,122.159,1,1,'2579371','indexserver_crash;nameserver_crash;backup,backint',' ' from DUMMY UNION ALL
SELECT 2,'SYSREP','nameserver.ini','local_watchdog','interval',' ','0','-- no recommendation --','-- no recommendation --','-- no recommendation --',122.1,122.129,1,1,'2581373','system_replication;takeover',' ' from DUMMY UNION ALL
SELECT 1,'ALL','global.ini','expensive_statement','internal',' ','-- no recommendation --','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,122.149,1,1,'2583885','indexserver_crash;trace',' ' from DUMMY UNION ALL
SELECT 3,'ALL','indexserver.ini','calcengine','disabled_patterns',' ','15','-- no recommendation --','-- no recommendation --','-- no recommendation --',122.06,122.069,1,1,'2583936','calc_view;calc_engine;performance',' ' from DUMMY UNION ALL
SELECT 3,'BW','indexserver.ini','calcengine','disabled_patterns',' ','43','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,122.149,1,1,'2584492','JDBC;Composite_Provider;calc_engine;OLAP_engine;BWoH',' ' from DUMMY UNION ALL
SELECT 1,'ALL','global.ini','resource_tracking','memory_tracking',' ','off','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,122.149,1,1,'2586437','indexserver_crash;OOM;',' ' from DUMMY UNION ALL
SELECT 1,'ALL','indexserver.ini','row_engine','bulk_deletion_enabled',' ','false','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,122.089,1,1,'2593025','GC;RowStore;indexserver_crash',' ' from DUMMY UNION ALL
SELECT 3,'SDA','indexserver.ini','smart_data_access','join_relocation',' ','false','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,-1,1,1,'2593695','SDA;virtual_table;JDBC',' ' from DUMMY UNION ALL
SELECT 3,'ALL','indexserver.ini','sql','conservative_cs_anti_join_estimation_enabled',' ','true','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,122.119,1,1,'2000002','performance;join_engine',' ' from DUMMY UNION ALL
SELECT 2,'ALL','indexserver.ini','joins','disable_aggregate_simplification',' ','true','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,122.069,1,1,'2092196','join_engine;optimizer',' ' from DUMMY UNION ALL
SELECT 2,'BW','indexserver.ini','calcengine','disabled_patterns',' ','38','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,122.129,1,1,'2100040','BWoH;CPU;performance',' ' from DUMMY UNION ALL
SELECT 2,'ALL','indexserver.ini','row_engine','garbage_lob_file_handler_enabled',' ','false','-- no recommendation --','-- no recommendation --','-- no recommendation --',122.07,122.109,1,1,'2413261','LOB;GC',' ' from DUMMY UNION ALL
SELECT 2,'ALL','indexserver.ini','row_engine','garbage_lob_file_handler_enabled',' ','false','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,122.049,1,1,'2413261','LOB;GC',' ' from DUMMY UNION ALL
SELECT 3,'ALL','indexserver.ini','sql','calc_view_with_dyn_ap_unfold',' ','false','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,-1,1,1,'2441054','calc_view',' ' from DUMMY UNION ALL
SELECT 3,'ALL','indexserver.ini','calcengine','ce2qo_transient_plan_for_data_var',' ','0','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,-1,1,1,'2441054','calc_view',' ' from DUMMY UNION ALL
SELECT 3,'ALL','global.ini','communication','ssl',' ','off','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,122.129,1,1,'2547142','OOM;SSL;encryption',' ' from DUMMY UNION ALL
SELECT 1,'ALL','indexserver.ini','performance_analyzer','planviz_enable',' ','false','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,122.149,1,1,'2575166','indexserver_crash;planviz',' ' from DUMMY UNION ALL
SELECT 2,'SDA','indexserver.ini','smart_data_access','join_relocation',' ','false','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,122.149,1,1,'2585974','SDA;virtual_table;optimizer;Composite_provider',' ' from DUMMY UNION ALL
SELECT 2,'SDA','indexserver.ini','smart_data_access','join_relocation',' ','false','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,122.149,1,1,'2587067','SDA;virtual_table',' ' from DUMMY UNION ALL
SELECT 1,'SYSREP','indexserver.ini','persistence','log_segment_size_mb',' ','1024','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,122.149,1,1,'2572012','system_replication',' ' from DUMMY UNION ALL
SELECT 3,'SYSREP','global.ini','system_replication','enable_cache_pages_for_preload_version_check',' ','true','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,122.099,1,1,'2587465','system_replication;delta_data_shipping',' ' from DUMMY UNION ALL
SELECT 2,'ALL','indexserver.ini','distribution','client_distibution_mode',' ','off','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,122.159,1,1,'2591281','JDBC;lock_manager',' ' from DUMMY UNION ALL
SELECT 1,'ALL','indexserver.ini','sql','reload_tables',' ','false','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,122.149,1,1,'2598453','indexserver_crash;transaction;MVCC',' ' from DUMMY UNION ALL
SELECT 1,'ALL','indexserver.ini','joins','map_threshold_factor_uns_mapping',' ','4000000000','-- no recommendation --','-- no recommendation --','-- no recommendation --',122.15,122.159,1,1,'2599767','indexserver_crash;join_engine;optimizer',' ' from DUMMY UNION ALL
SELECT 2,'ALL','indexserver.ini','joins','disable_aggregate_simplification',' ','true','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,122.149,1,1,'2583884','attribute_engine;trace',' ' from DUMMY UNION ALL
SELECT 1,'ALL','indexserver.ini','joins','prune_cached_plans',' ','false','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,122.039,1,1,'2387680','partitioning;wrong_result',' ' from DUMMY UNION ALL
SELECT 2,'ALL','indexserver.ini','communication','signal_send_timeout',' ','60000','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,122.069,1,1,'2427296','network;trace',' ' from DUMMY UNION ALL
SELECT 2,'ALL','indexserver.ini','communication','signal_recv_timeout',' ','60000','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,122.069,1,1,'2427296','network;trace',' ' from DUMMY UNION ALL
SELECT 1,'ALL','global.ini','persistence','continuous_flush_interval_s',' ','0','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,122.039,1,1,'2370160','consistency',' ' from DUMMY UNION ALL
SELECT 1,'BW','indexserver.ini','dso','activation_columnset_size',' ','4000000000','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,122.039,1,1,'2385658','BWoH;SCM;consistency;wrong_result',' ' from DUMMY UNION ALL
SELECT 3,'ALL','indexserver.ini','delta','btree_cache_aggressiveness',' ','0','-- no recommendation --','-- no recommendation --','-- no recommendation --',121,121.999,1,1,'2338166','duplicate_key',' ' from DUMMY UNION ALL
SELECT 2,'BW','indexserver.ini','olap','optimize_value_id_search',' ','no','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,120.999,1,1,'2321910','BWoH;BEX;OLAP_engine;FEMS',' ' from DUMMY UNION ALL
SELECT 2,'ALL','global.ini','expensive_statement','use_in_memory_tracing',' ','false','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,-1,1,1,'2608324','trace;',' ' from DUMMY UNION ALL
SELECT 2,'ALL','indexserver.ini','calcengine','disabled_patterns',' ','23','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,122.159,1,1,'2601405','calc_engine;calc_view',' ' from DUMMY UNION ALL
SELECT 2,'ALL','indexserver.ini','communication','default_read_timeout',' ','-1','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,122.109,1,1,'2488737','network;TREX;tcp_timeout',' ' from DUMMY UNION ALL
SELECT 1,'ALL','indexserver.ini','planningengine','formula_parallel_limit',' ','<large_integer_value>','-- no recommendation --','-- no recommendation --','-- no recommendation --',122.13,122.159,1,1,'2607741','wrong_result;planning_engine',' ' from DUMMY UNION ALL
SELECT 2,'ALL','indexserver.ini','search','collect_top_documents_count',' ','false','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,122.159,1,1,'2611281','attribute_engine;',' ' from DUMMY UNION ALL
SELECT 1,'ALL','indexserver.ini','sql','force_block_fallback',' ','false','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,122.159,1,1,'2614277','indexserver_crash;replicated_table',' ' from DUMMY UNION ALL
SELECT 1,'ALL','indexserver.ini','mds','cube_parallel_processing_11_job_size',' ','1000000000','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,120.999,1,1,'2321714','indexserver_crash;MDS',' ' from DUMMY UNION ALL
SELECT 1,'ALL','indexserver.ini','search','qo_extensive_checks',' ','false','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,122.159,1,1,'2616802','indexserver_crash;CPU',' ' from DUMMY UNION ALL
SELECT 2,'ALL','indexserver.ini','joins','single_thread_execution_for_partitioned_tables',' ','false','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,122.169,1,1,'2620310','join_engine;performance;delta_merge',' ' from DUMMY UNION ALL
SELECT 3,'ALL','indexserver.ini','sqlscript','typecheck_procedure_input_param',' ','false','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,-1,1,1,'2457876','calc_engine;calc_view',' ' from DUMMY UNION ALL
SELECT 1,'ALL','global.ini','memorymanager','statement_memory_limit',' ','<increase_by_1GB>','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,122.139,1,1,'2603589','oom;memory_leak',' ' from DUMMY UNION ALL
SELECT 1,'ALL','global.ini','resource_tracking','enable_tracking',' ','off','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,122.139,1,1,'2603589','oom;memory_leak',' ' from DUMMY UNION ALL
SELECT 1,'ALL','global.ini','resource_tracking','memory_tracking',' ','off','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,122.139,1,1,'2603589','oom;memory_leak',' ' from DUMMY UNION ALL
SELECT 3,'SDA','indexserver.ini','smart_data_access','remote_conn_idle_timeout’',' ','600','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,-1,1,1,'2578523','SDA;tcp_timeout;connection_limit',' ' from DUMMY UNION ALL
SELECT 2,'BW','indexserver.ini','session','socket_keepalive',' ','on','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,-1,1,1,'2621464','tcp_timeout;BWoH;error_10107;error_10108;network',' ' from DUMMY UNION ALL
SELECT 2,'BW','indexserver.ini','session','tcp_keepalive_time',' ','60','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,-1,1,1,'2621464','tcp_timeout;BWoH;error_10107;error_10108;network',' ' from DUMMY UNION ALL
SELECT 2,'BW','indexserver.ini','session','tcp_keepalive_intvl',' ','1','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,-1,1,1,'2621464','tcp_timeout;BWoH;error_10107;error_10108;network',' ' from DUMMY UNION ALL
SELECT 2,'BW','indexserver.ini','session','tcp_keepalive_probes',' ','5','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,-1,1,1,'2621464','tcp_timeout;BWoH;error_10107;error_10108;network',' ' from DUMMY UNION ALL
SELECT 1,'ALL','global.ini','memorymanager','enable_sharing_allocator_for_implicit',' ','false','-- no recommendation --','-- no recommendation --','-- no recommendation --',122.16,122.169,1,1,'2628153','OOM;memory_leak',' ' from DUMMY UNION ALL
SELECT 3,'ALL','indexserver.ini','load_trace','enable',' ','false','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,121.999,1,1,'2340582','memory_leak',' ' from DUMMY UNION ALL
SELECT 3,'ALL','indexserver.ini','unload_trace','enable',' ','false','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,121.999,1,1,'2340582','memory_leak',' ' from DUMMY UNION ALL
SELECT 3,'SDI','indexserver.ini','session','max_statements_per_connection',' ','200000','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,122.099,1,1,'2464140','SDI;data_provisioning;connection_limit',' ' from DUMMY UNION ALL
SELECT 2,'ALL','indexserver.ini','session','fda_enable',' ','off','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,-1,1,1,'2627679','FDA;workprocess;signal_11',' ' from DUMMY UNION ALL
SELECT 3,'SDA','indexserver.ini','smart_data_access','enable_or_to_in',' ','false','-- no recommendation --','-- no recommendation --','-- no recommendation --',122.11,122.159,1,1,'2601496','SDA;virtual_table;ODBC',' ' from DUMMY UNION ALL
SELECT 2,'ALL','indexserver.ini','performance_analyzer','planviz_enable',' ','false','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,122.169,1,1,'2637828','memory_leak;performance;planviz;trace',' ' from DUMMY UNION ALL
SELECT 3,'MULTI','indexserver.ini','table_redist','balance_by_partnum',' ','false','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,-1,1,1,'1958216','scale-out;redistribution;partitioning;performance',' ' from DUMMY UNION ALL
SELECT 3,'MULTI','indexserver.ini','table_redist','balance_by_memuse',' ','false','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,-1,1,1,'1958216','scale-out;redistribution;partitioning;performance',' ' from DUMMY UNION ALL
SELECT 3,'MULTI','indexserver.ini','table_redist','balance_by_table_size_hosted',' ','true','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,-1,1,1,'1958216','scale-out;redistribution;partitioning;performance',' ' from DUMMY UNION ALL
SELECT 3,'MULTI','indexserver.ini','table_redist','balance_by_rows',' ','false','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,-1,1,1,'1958216','scale-out;redistribution;partitioning;performance',' ' from DUMMY UNION ALL
SELECT 3,'MULTI','indexserver.ini','table_redist','balance_by_part_id',' ','false','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,-1,1,1,'1958216','scale-out;redistribution;partitioning;performance',' ' from DUMMY UNION ALL
SELECT 3,'MULTI','indexserver.ini','table_redist','balance_by_execution_time',' ','true','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,-1,1,1,'1958216','scale-out;redistribution;partitioning;performance',' ' from DUMMY UNION ALL
SELECT 3,'MULTI','indexserver.ini','table_redist','balance_by_execution_count',' ','true','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,-1,1,1,'1958216','scale-out;redistribution;partitioning;performance',' ' from DUMMY UNION ALL
SELECT 3,'MULTI','indexserver.ini','table_redist','balance_by_table_classification',' ','false','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,-1,1,1,'1958216','scale-out;redistribution;partitioning;performance',' ' from DUMMY UNION ALL
SELECT 3,'MULTI','indexserver.ini','table_redist','balance_by_table_subclassification',' ','false','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,-1,1,1,'1958216','scale-out;redistribution;partitioning;performance',' ' from DUMMY UNION ALL
SELECT 3,'ALL','indexserver.ini','sqlscript','execution_monitoring_level',' ','0','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,-1,1,1,'1999998','lock_manager;performance;system_view;sqlscript',' ' from DUMMY UNION ALL
SELECT 2,'ALL','indexserver.ini','sql','native_mixed_join_enabled',' ','false','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,122.169,1,1,'2624305','memory_leak;memory_management;OOM;join_engine;inverted_index',' ' from DUMMY UNION ALL
SELECT 2,'ALL','global.ini','performance_analyzer','plan_trace_enable',' ','false','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,-1,1,1,'2643064','indexserver_crash;trace;planviz;signal_11',' ' from DUMMY UNION ALL
SELECT 2,'ALL','global.ini','persistence','non_trans_cch_block_size',' ','134217728','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,-1,1,1,'1999998','parameter;delta_merge',' ' from DUMMY UNION ALL
SELECT 4,'SYSREP','nameserver.ini','sld','enable',' ','false','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,122.129,1,1,'2577511','SLD;system_replication',' ' from DUMMY UNION ALL
SELECT 4,'ALL','nameserver.ini','sld','enable',' ','false','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,122.129,1,1,'2577511','SLD;MDC',' ' from DUMMY UNION ALL
SELECT 1,'ALL','indexserver.ini','performance_analyzer','planviz_enable',' ','false','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,-1,1,1,'2600030','indexserver_crash;planviz',' ' from DUMMY UNION ALL
SELECT 2,'ALL','xsengine.ini','httpserver','sessiontimeout',' ','<new_value>','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,-1,1,1,'2473231','XS_engine;session;tcp_timeout;connection_limit',' ' from DUMMY UNION ALL
SELECT 2,'ALL','xsengine.ini','httpserver','maxsessions',' ','<new_value>','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,-1,1,1,'2473231','XS_engine;session;tcp_timeout;connection_limit',' ' from DUMMY UNION ALL
SELECT 2,'ALL','indexserver.ini','transaction','lock_wait_timeout',' ','5*<timeout_in_ms>','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,-1,1,1,'2549013','lock_manager;deadlock;XS_engine',' ' from DUMMY UNION ALL
SELECT 1,'ALL','indexserver.ini','sql','cs_equi_cond_update_optimization_batch_size',' ','1000000','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,-1,1,1,'2644935','LOB;wrong_result;consistency',' ' from DUMMY UNION ALL
SELECT 3,'ALL','indexserver.ini','persistence','use_helper_threads_for_flush',' ','false','-- no recommendation --','-- no recommendation --','-- no recommendation --',122.16,-1,1,1,'2655238','XFS;volume;performance',' ' from DUMMY UNION ALL
SELECT 3,'ALL','nameserver.ini','statisticsserver','active',' ','true','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,-1,1,1,'2644242','statisticsserver;system_view;upgrade',' ' from DUMMY UNION ALL
SELECT 2,'ALL','indexserver.ini','statisticsserver','threadpool',' ','0','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,122.149,1,1,'2584388','Memory_leak;',' ' from DUMMY UNION ALL
SELECT 3,'ALL','global.ini','backup','data_backup_buffer_size',' ','1536','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,-1,1,1,'2657261','backup;backint;performance',' ' from DUMMY UNION ALL
SELECT 3,'ALL','global.ini','backup','parallel_data_backup_backint_channels',' ','3','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,-1,1,1,'2657261','backup;backint;performance',' ' from DUMMY UNION ALL
SELECT 3,'SYSREP','global.ini','system_replication','check_secondary_active_status',' ','false','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,-1,1,1,'2649721','system_replication;lock_manager;system_view',' ' from DUMMY UNION ALL
SELECT 4,'ALL','global.ini','resource_tracking','service_thread_sampling_monitor_enabled',' ','true','-- no recommendation --','-- no recommendation --','-- no recommendation --',122.14,-1,1,1,'2600030','thread;monitoring',' ' from DUMMY UNION ALL
SELECT 2,'ALL','indexserver.ini','calcengine','enforce_bigint_counters',' ','1','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,-1,1,1,'2648134','calc_view;calc_engine;attribute_engine',' ' from DUMMY UNION ALL
SELECT 4,'ALL','indexserver.ini','sqlscript','dynamic_sql_ddl_error_level',' ','silent','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,-1,1,1,'2660239','dynamic_sql',' ' from DUMMY UNION ALL
SELECT 1,'MULTI','indexserver.ini','search','late_materialization_threshold',' ','-1','-- no recommendation --','-- no recommendation --','-- no recommendation --',120,-1,1,1,'2662717','indexserver_crash;scale-out;late_materialization',' ' from DUMMY UNION ALL
    SELECT 3, 'ALL',         'xsengine.ini',         'sql',                      'use_startup_timezone',                      ' ', 'false',                    '-- no recommendation --', '-- no recommendation --', '-- no recommendation --', 65,    68,  1,  1, '1932132', 'terminations',   ' ' FROM DUMMY 
  ) P
),
PARAMETER_SETTINGS AS
( SELECT 
    FILE_NAME,
    SECTION,
    PARAMETER_NAME,
    DEFAULT_VALUE,
    USER_VALUE,
    DEFAULT_HOST,
    USER_HOST
  FROM 
  ( SELECT
      P1.HOST DEFAULT_HOST,
      P2.HOST USER_HOST,
      P1.FILE_NAME,
      P1.SECTION,
      P1.KEY PARAMETER_NAME,
      P1.VALUE DEFAULT_VALUE,
      P2.VALUE USER_VALUE
    FROM
      M_INIFILE_CONTENTS P1,
      M_INIFILE_CONTENTS P2
    WHERE
      P1.TENANT_NAME = P2.TENANT_NAME AND
      P1.FILE_NAME = P2.FILE_NAME AND
      P1.SECTION = P2.SECTION AND
      P1.KEY = P2.KEY AND
      P1.LAYER_NAME = 'DEFAULT' AND
      P2.LAYER_NAME IN ( 'SYSTEM', 'HOST' )
    UNION ALL
    ( SELECT 
        P1.HOST DEFAULT_HOST,
        '-- not set --' USER_HOST,
        P1.FILE_NAME,
        P1.SECTION,
        P1.KEY PARAMETER_NAME,
        P1.VALUE DEFAULT_VALUE,
        '-- not set --' USER_VALUE
      FROM
        M_INIFILE_CONTENTS P1
      WHERE
        P1.LAYER_NAME = 'DEFAULT' AND
        NOT EXISTS
        ( SELECT 
            * 
          FROM 
            M_INIFILE_CONTENTS P2 
          WHERE
            P1.TENANT_NAME = P2.TENANT_NAME AND
            P1.FILE_NAME = P2.FILE_NAME AND
            P1.SECTION = P2.SECTION AND
            P1.KEY = P2.KEY AND
            P2.LAYER_NAME IN ( 'SYSTEM', 'HOST' )
        )
    )
    UNION ALL
    ( SELECT
        '-- HANA internal --'  DEFAULT_HOST,
        P2.HOST USER_HOST,
        P2.FILE_NAME,
        P2.SECTION,
        P2.KEY PARAMETER_NAME,
        '-- HANA internal --' DEFAULT_VALUE,
        P2.VALUE USER_VALUE
      FROM
        M_INIFILE_CONTENTS P2
      WHERE
        P2.LAYER_NAME <> 'DEFAULT' AND 
        NOT EXISTS
        ( SELECT 
            * 
          FROM 
            M_INIFILE_CONTENTS P1 
          WHERE
            P1.TENANT_NAME = P2.TENANT_NAME AND
            P1.FILE_NAME = P2.FILE_NAME AND
            P1.SECTION = P2.SECTION AND
            P1.KEY = P2.KEY AND
            P1.LAYER_NAME = 'DEFAULT'
        )   
    )
  )
),
PARAMETERS AS
( SELECT
    FILE_NAME,
    SECTION,
    PARAMETER_NAME,
    PRIORITY,
    DEFAULT_VALUE,
    USER_VALUE,
    DEFAULT_HOST,
    USER_HOST,
    ENV,
    NOT_1,
    CASE MIN_VALUE_1
      WHEN '-- SPECIAL --' THEN
        CASE PARAMETER_NAME
          WHEN 'allocationlimit'                              THEN CASE WHEN BI.BI_ALLOC_LIM_GB != -1 THEN TO_VARCHAR(TO_DECIMAL(ROUND(TO_BIGINT(BI_ALLOC_LIM_GB) * 1024), 10, 0)) ELSE '-- no recommendation --' END
          WHEN 'default_statement_concurrency_limit'          THEN TO_VARCHAR(TO_DECIMAL(ROUND(LEAST(16, GREATEST(2, BI.CPU_THREADS * 0.30))), 10, 0))
          WHEN 'max_concurrency' THEN
            CASE 
              WHEN CHECK_VERSION = 1 OR CHECK_VERSION = 2 AND CHECK_REVISION <= 29 THEN 
                TO_VARCHAR(TO_DECIMAL(ROUND(GREATEST(4, BI.CPU_THREADS * 0.33)), 10, 0))
              WHEN ( CHECK_VERSION >= 3 OR CHECK_VERSION = 2 AND CHECK_REVISION >= 30 ) AND BI_CPU_THREADS != -1 THEN 
                TO_VARCHAR(TO_DECIMAL(ROUND(GREATEST(4, BI.CPU_THREADS)), 10, 0))
              ELSE '-- no recommendation --'
            END
          WHEN 'max_concurrency_hint'                         THEN TO_VARCHAR(TO_DECIMAL(ROUND(LEAST(8, GREATEST(4, BI.CPU_THREADS * 0.10))), 10, 0))
          WHEN 'max_partitions'                               THEN CASE WHEN BI.ALLOC_LIM_GB > 2048 THEN TO_VARCHAR(MAP(BI.NUM_SLAVES, 0, 4, 1, 8, 12)) ELSE '-- no recommendation --' END
          WHEN 'max_partitions_limited_by_locations'          THEN CASE WHEN BI.ALLOC_LIM_GB > 2048 THEN 'false' ELSE '-- no recommendation --' END
          WHEN 'num_cores'                                    THEN TO_VARCHAR(TO_DECIMAL(ROUND(LEAST(8, GREATEST(4, BI.CPU_THREADS * 0.10))), 10, 0))
          WHEN 'max_gc_parallelity'                           THEN TO_VARCHAR(TO_DECIMAL(ROUND(GREATEST(2, LEAST(72, BI.CPU_THREADS * 0.50))), 10, 0))
          WHEN 'tables_preloaded_in_parallel'                 THEN TO_VARCHAR(TO_DECIMAL(ROUND(GREATEST(5, BI.CPU_THREADS * 0.05)), 10, 0))
          WHEN 'savepoint_pre_critical_flush_retry_threshold' THEN TO_VARCHAR(TO_DECIMAL(ROUND(TO_BIGINT(BI.CPU_FREQUENCY_MHZ) * 1000 * 3000), 10, 0))
          WHEN 'statement_memory_limit'                       THEN TO_VARCHAR(TO_DECIMAL(ROUND(LEAST(100, BI.ALLOC_LIM_GB * 0.10)), 10, 0))
          ELSE '-- no recommendation --'
        END
      ELSE
        MIN_VALUE_1
    END MIN_VALUE_1,
    CASE MAX_VALUE_1
      WHEN '-- SPECIAL --' THEN
        CASE PARAMETER_NAME
          WHEN 'default_statement_concurrency_limit' THEN TO_VARCHAR(TO_DECIMAL(ROUND(GREATEST(2, BI.CPU_THREADS * 0.50)), 10, 0))
          WHEN 'max_concurrency' THEN
            CASE
              WHEN CHECK_VERSION = 1 OR CHECK_VERSION = 2 AND CHECK_REVISION <= 29 THEN 
                TO_VARCHAR(TO_DECIMAL(ROUND(GREATEST(4, BI.CPU_THREADS * 1.00)), 10, 0))
              ELSE '-- no recommendation --'
            END
          WHEN 'max_concurrency_hint'                THEN TO_VARCHAR(TO_DECIMAL(ROUND(GREATEST(4, BI.CPU_THREADS * 0.50)), 10, 0))
          WHEN 'max_gc_parallelity'                  THEN TO_VARCHAR(TO_DECIMAL(ROUND(GREATEST(2, BI.CPU_THREADS * 0.50)), 10, 0))
          WHEN 'num_cores'                           THEN TO_VARCHAR(TO_DECIMAL(ROUND(GREATEST(4, BI.CPU_THREADS * 0.50)), 10, 0))
          WHEN 'tables_preloaded_in_parallel'        THEN TO_VARCHAR(TO_DECIMAL(ROUND(GREATEST(5, BI.CPU_THREADS * 0.10)), 10, 0))
          WHEN 'statement_memory_limit'              THEN TO_VARCHAR(TO_DECIMAL(ROUND(LEAST(500, BI.ALLOC_LIM_GB * 0.30)), 10, 0))
        END
      ELSE
        MAX_VALUE_1
    END MAX_VALUE_1,
    MIN_VALUE_2,
    MAX_VALUE_2,
    MIN_VERS,
    MAX_VERS,
    MIN_REV,
    MAX_REV,
    IFNULL(IFNULL(MAP(SAP_NOTE, '', NULL, SAP_NOTE), MAP(SAP_NOTE_FALLBACK, '', NULL, SAP_NOTE_FALLBACK)), ' ') SAP_NOTE,
    IFNULL(IFNULL(AREA, AREA_FALLBACK), ' ') AREA,   
    IFNULL(IFNULL(TYPE, TYPE_FALLBACK), ' ') TYPE    
  FROM
  ( SELECT 
      IFNULL(PS.FILE_NAME, PI.FILE_NAME) FILE_NAME,
      IFNULL(PS.SECTION, PI.SECTION) SECTION,
      IFNULL(PS.PARAMETER_NAME, PI.PARAMETER_NAME) PARAMETER_NAME,
      IFNULL(PS.DEFAULT_VALUE, '-- HANA internal --') DEFAULT_VALUE,
      IFNULL(PS.USER_VALUE, '-- not set --') USER_VALUE,
      IFNULL(PS.DEFAULT_HOST, '-- HANA internal --') DEFAULT_HOST,
      IFNULL(PS.USER_HOST, '-- not set --') USER_HOST,
      IFNULL(PI.P, 0) PRIORITY,
      IFNULL(PI.ENV, 'ALL') ENV,
      IFNULL(PI.NOT_1, ' ') NOT_1,
      IFNULL(PI.MIN_VALUE_1, '-- no recommendation --') MIN_VALUE_1,
      IFNULL(PI.MAX_VALUE_1, '-- no recommendation --') MAX_VALUE_1,
      IFNULL(PI.MIN_VALUE_2, '-- no recommendation --') MIN_VALUE_2,
      IFNULL(PI.MAX_VALUE_2, '-- no recommendation --') MAX_VALUE_2,
      IFNULL(PI.MIN_VERS, -1) MIN_VERS,
      IFNULL(PI.MAX_VERS, -1) MAX_VERS,
      IFNULL(PI.MIN_REV, -1) MIN_REV,
      IFNULL(PI.MAX_REV, -1) MAX_REV,
      PI.SAP_NOTE,
      PI.AREA,
      PI.TYPE,
      ( SELECT MAX(SAP_NOTE) FROM PARAMETER_INFOS PI2 WHERE ( PI2.SECTION != '%' OR PI2.PARAMETER_NAME != '%' ) AND PS.SECTION LIKE PI2.SECTION AND PS.PARAMETER_NAME LIKE PI2.PARAMETER_NAME ) SAP_NOTE_FALLBACK,
      ( SELECT MAX(AREA)     FROM PARAMETER_INFOS PI2 WHERE ( PI2.SECTION != '%' OR PI2.PARAMETER_NAME != '%' ) AND PS.SECTION LIKE PI2.SECTION AND PS.PARAMETER_NAME LIKE PI2.PARAMETER_NAME ) AREA_FALLBACK,
      ( SELECT MAX(TYPE)     FROM PARAMETER_INFOS PI2 WHERE ( PI2.SECTION != '%' OR PI2.PARAMETER_NAME != '%' ) AND PS.SECTION LIKE PI2.SECTION AND PS.PARAMETER_NAME LIKE PI2.PARAMETER_NAME ) TYPE_FALLBACK
    FROM
      PARAMETER_INFOS PI FULL OUTER JOIN
      PARAMETER_SETTINGS PS ON
        PS.FILE_NAME = PI.FILE_NAME AND
        PS.SECTION = PI.SECTION AND
        PS.PARAMETER_NAME = PI.PARAMETER_NAME
  ),
  ( SELECT CHECK_VERSION, CHECK_REVISION, BI_CPU_THREADS, ALLOC_LIM_GB, BI_ALLOC_LIM_GB, CPU_FREQUENCY_MHZ, CPU_THREADS, NUM_SLAVES FROM BASIS_INFO ) BI
),
PARAMETER_RECOMMENDATIONS AS
( SELECT
    P.FILE_NAME,
    P.SECTION,
    P.PARAMETER_NAME,
    P.PRIORITY,
    P.DEFAULT_VALUE,
    P.USER_VALUE,
    CASE WHEN NOT_1 = 'X' THEN 'do not set to' || CHAR(32) ELSE '' END ||
      P.MIN_VALUE_1 || MAP(P.MAX_VALUE_1, '-- no recommendation --', '', P.MIN_VALUE_1, '', '999999999999', ' or higher', ' to ' || P.MAX_VALUE_1) ||
      CASE WHEN P.MIN_VALUE_2 != '-- no recommendation --' OR P.MAX_VALUE_2 != '-- no recommendation --' THEN
        ' or' || CHAR(32) || P.MIN_VALUE_2 || MAP(P.MAX_VALUE_2, '-- no recommendation --', '', P.MIN_VALUE_2, '', '999999999999', ' or higher', ' to ' || P.MAX_VALUE_2) ELSE ''
      END RECOMMENDED_VALUE,
    P.SAP_NOTE,
    P.AREA,
    P.DEFAULT_HOST,
    P.USER_HOST,  
    CASE WHEN
    ( P.MIN_VALUE_1 = '-- no recommendation --' AND
      P.MAX_VALUE_1 = '-- no recommendation --' 
    ) OR
    ( P.MIN_VALUE_1 = '-- individual value --' AND 
      P.USER_VALUE != '-- not set --' 
    ) OR
    ( P.PARAMETER_NAME IN ( 'auto_merge_decision_func', 'critical_merge_decision_func' ) AND
      UPPER(REPLACE(P.MIN_VALUE_1, CHAR(32), '')) = UPPER(REPLACE(P.CONFIG_VALUE, CHAR(32), ''))
    ) OR
    ( P.MIN_VALUE_1 != '-- individual value --' AND 
      P.PARAMETER_NAME NOT IN ( 'auto_merge_decision_func', 'critical_merge_decision_func' ) AND
      ( ( NOT_1 = ' ' AND
          ( P.MAX_VALUE_1 = '-- no recommendation --' AND P.CONFIG_VALUE = LPAD(P.MIN_VALUE_1, 1000) OR
            P.MAX_VALUE_1 != '-- no recommendation --' AND P.CONFIG_VALUE BETWEEN LPAD(P.MIN_VALUE_1, 1000) AND LPAD(P.MAX_VALUE_1, 1000)
          )
        ) OR
        ( NOT_1 = 'X' AND
          ( P.MAX_VALUE_1 = '-- no recommendation --' AND P.CONFIG_VALUE != LPAD(P.MIN_VALUE_1, 1000) OR
            P.MAX_VALUE_1 != '-- no recommendation --' AND P.CONFIG_VALUE NOT BETWEEN LPAD(P.MIN_VALUE_1, 1000) AND LPAD(P.MAX_VALUE_1, 1000)
          )
        )
      )
    ) OR
    ( P.MAX_VALUE_2 = '-- no recommendation --' AND 
      P.CONFIG_VALUE = LPAD(P.MIN_VALUE_2, 1000)
    ) OR
    ( P.MAX_VALUE_2 != '-- no recommendation --' AND 
      P.CONFIG_VALUE BETWEEN LPAD(P.MIN_VALUE_2, 1000) AND LPAD(P.MAX_VALUE_2, 1000)
    )
    THEN 'X' ELSE ' ' END SET_CORRECTLY
  FROM
    BASIS_INFO BI,
  ( SELECT
      P.*,
      LPAD(MAP(P.USER_VALUE, '-- not set --', P.DEFAULT_VALUE, P.USER_VALUE), 1000) CONFIG_VALUE
    FROM
      PARAMETERS P
  ) P
  WHERE
  ( ( P.ENV = 'ALL' OR
      ( ( LOCATE(P.ENV, 'ABAP')   > 0 AND LOCATE(BI.ENV, 'ABAP')   > 0 ) OR
        ( LOCATE(P.ENV, 'BPC')    > 0 AND LOCATE(BI.ENV, 'BPC')    > 0 ) OR
        ( LOCATE(P.ENV, 'BW')     > 0 AND LOCATE(BI.ENV, 'BW')     > 0 ) OR
        ( LOCATE(P.ENV, 'CRM')    > 0 AND LOCATE(BI.ENV, 'CRM')    > 0 ) OR
        ( LOCATE(P.ENV, 'ERP')    > 0 AND LOCATE(BI.ENV, 'ERP')    > 0 AND ( P.SECTION != 'table_placement' OR LOCATE(BI.ENV, 'BW') = 0 ) ) OR      /* table_placement precedence for BW over ERP */
        ( LOCATE(P.ENV, 'ESS')    > 0 AND LOCATE(BI.ENV, 'ESS')    > 0 ) OR
        ( LOCATE(P.ENV, 'EWM')    > 0 AND LOCATE(BI.ENV, 'EWM')    > 0 ) OR
        ( LOCATE(P.ENV, 'FRA')    > 0 AND LOCATE(BI.ENV, 'FRA')    > 0 ) OR
        ( LOCATE(P.ENV, 'HIST')   > 0 AND LOCATE(BI.ENV, 'HIST')   > 0 ) OR
        ( LOCATE(P.ENV, 'IQ')     > 0 AND LOCATE(BI.ENV, 'IQ')     > 0 ) OR
        ( LOCATE(P.ENV, 'LCACHE') > 0 AND LOCATE(BI.ENV, 'LCACHE') > 0 ) OR
        ( LOCATE(P.ENV, 'MDCSYS') > 0 AND LOCATE(BI.ENV, 'MDCSYS') > 0 ) OR
        ( LOCATE(P.ENV, 'MDCTEN') > 0 AND LOCATE(BI.ENV, 'MDCTEN') > 0 ) OR
        ( LOCATE(P.ENV, 'MULTI')  > 0 AND LOCATE(BI.ENV, 'MULTI')  > 0 ) OR
        ( LOCATE(P.ENV, 'PORTAL') > 0 AND LOCATE(BI.ENV, 'PORTAL') > 0 ) OR
        ( LOCATE(P.ENV, 'PROD')   > 0 AND LOCATE(BI.ENV, 'PROD')   > 0 ) OR
        ( LOCATE(P.ENV, 'S4')     > 0 AND LOCATE(BI.ENV, 'S4')     > 0 ) OR
        ( LOCATE(P.ENV, 'SCM')    > 0 AND LOCATE(BI.ENV, 'SCM')    > 0 ) OR
        ( LOCATE(P.ENV, 'SDA')    > 0 AND LOCATE(BI.ENV, 'SDA')    > 0 ) OR
        ( LOCATE(P.ENV, 'SINGLE') > 0 AND LOCATE(BI.ENV, 'SINGLE') > 0 ) OR
        ( LOCATE(P.ENV, 'SRM')    > 0 AND LOCATE(BI.ENV, 'SRM')    > 0 ) OR
        ( LOCATE(P.ENV, 'SSS')    > 0 AND LOCATE(BI.ENV, 'SSS')    > 0 ) OR
        ( LOCATE(P.ENV, 'SYSREP') > 0 AND LOCATE(BI.ENV, 'SYSREP') > 0 ) OR
        ( LOCATE(P.ENV, 'XFS')    > 0 AND LOCATE(BI.ENV, 'XFS')    > 0 )
      ) AND NOT
      ( ( LOCATE(P.ENV, 'ABAP')   > 0 AND LOCATE(BI.ENV, 'ABAP')   = 0 ) OR
        ( LOCATE(P.ENV, 'BPC')    > 0 AND LOCATE(BI.ENV, 'BPC')    = 0 ) OR
        ( LOCATE(P.ENV, 'BW')     > 0 AND LOCATE(BI.ENV, 'BW')     = 0 ) OR
        ( LOCATE(P.ENV, 'CRM')    > 0 AND LOCATE(BI.ENV, 'CRM')    = 0 ) OR
        ( LOCATE(P.ENV, 'ERP')    > 0 AND LOCATE(BI.ENV, 'ERP')    = 0 ) OR
        ( LOCATE(P.ENV, 'ESS')    > 0 AND LOCATE(BI.ENV, 'ESS')    = 0 ) OR
        ( LOCATE(P.ENV, 'EWM')    > 0 AND LOCATE(BI.ENV, 'EWM')    = 0 ) OR
        ( LOCATE(P.ENV, 'S4')     > 0 AND LOCATE(BI.ENV, 'S4')     = 0 ) OR
        ( LOCATE(P.ENV, 'FRA')    > 0 AND LOCATE(BI.ENV, 'FRA')    = 0 ) OR
        ( LOCATE(P.ENV, 'HIST')   > 0 AND LOCATE(BI.ENV, 'HIST')   = 0 ) OR
        ( LOCATE(P.ENV, 'IQ')     > 0 AND LOCATE(BI.ENV, 'IQ')     = 0 ) OR
        ( LOCATE(P.ENV, 'LCACHE') > 0 AND LOCATE(BI.ENV, 'LCACHE') = 0 ) OR
        ( LOCATE(P.ENV, 'MDCSYS') > 0 AND LOCATE(BI.ENV, 'MDCSYS') = 0 ) OR
        ( LOCATE(P.ENV, 'MULTI')  > 0 AND LOCATE(BI.ENV, 'MULTI')  = 0 ) OR
        ( LOCATE(P.ENV, 'PORTAL') > 0 AND LOCATE(BI.ENV, 'PORTAL') = 0 ) OR
        ( LOCATE(P.ENV, 'PROD')   > 0 AND LOCATE(BI.ENV, 'PROD')   = 0 ) OR
        ( LOCATE(P.ENV, 'SCM')    > 0 AND LOCATE(BI.ENV, 'SCM')    = 0 ) OR
        ( LOCATE(P.ENV, 'SDA')    > 0 AND LOCATE(BI.ENV, 'SDA')    = 0 ) OR
        ( LOCATE(P.ENV, 'SINGLE') > 0 AND LOCATE(BI.ENV, 'SINGLE') = 0 ) OR
        ( LOCATE(P.ENV, 'SRM')    > 0 AND LOCATE(BI.ENV, 'SRM')    = 0 ) OR
        ( LOCATE(P.ENV, 'SSS')    > 0 AND LOCATE(BI.ENV, 'SSS')    = 0 ) OR
        ( LOCATE(P.ENV, 'SYSREP') > 0 AND LOCATE(BI.ENV, 'SYSREP') = 0 ) OR
        ( LOCATE(P.ENV, 'XFS')    > 0 AND LOCATE(BI.ENV, 'XFS')    = 0 )
      ) 
    ) AND
    LPAD(TO_DECIMAL(BI.CHECK_VERSION, 10, 2), 10, '0') || LPAD(TO_DECIMAL(BI.CHECK_REVISION, 10, 2), 10, '0') BETWEEN
      LPAD(TO_DECIMAL(MAP(P.MIN_VERS, -1, 0, P.MIN_VERS), 10, 2), 10, '0') || LPAD(TO_DECIMAL(MAP(P.MIN_REV, -1, 0, P.MIN_REV), 10, 2), 10, '0') AND
      LPAD(TO_DECIMAL(MAP(P.MAX_VERS, -1, 99999, P.MAX_VERS), 10, 2), 10, '0') || LPAD(TO_DECIMAL(MAP(P.MAX_REV, -1, 99999, P.MAX_REV), 10, 2), 10, '0') AND
    P.MIN_VALUE_1 != '-- no recommendation --'
  )
)
SELECT
  FILE_NAME,
  SECTION,
  PARAMETER_NAME,
  P,
  DEFAULT_VALUE,
  CONFIGURED_VALUE,
  RECOMMENDED_VALUE,
  SAP_NOTE SAP_NOTES,
  CONFIGURED_HOST,
  IMPLEMENTATION_COMMAND,
  UNDO_COMMAND
FROM
( SELECT
    10 LINE_NO,
    'Evaluation time:' FILE_NAME,
    TO_VARCHAR(CURRENT_TIMESTAMP, 'YYYY/MM/DD HH24:MI:SS') SECTION,
    '' PARAMETER_NAME,
    '' P,
    '' DEFAULT_VALUE,
    '' CONFIGURED_VALUE,
    '' RECOMMENDED_VALUE,
    '' SAP_NOTE,
    '' CONFIGURED_HOST,
    '' IMPLEMENTATION_COMMAND,
    '' UNDO_COMMAND
  FROM
    DUMMY
  UNION ALL 
  ( SELECT 
      14, 
      'QPCM Statement version:',
      '3.3.1 (2018/07/03)',
      '', '', '', '', '', '', '', '', ''
    FROM
      DUMMY
  )    
  UNION ALL
  ( SELECT
      20,
      'Revision:',
      TO_VARCHAR(CHECK_VERSION) || '.00.' || LPAD(ROUND(TO_DECIMAL(CHECK_REVISION, 5, 0)), 3, '0') || MAP(CHECK_REVISION, FLOOR(CHECK_REVISION), '', '.' || LPAD((CHECK_REVISION - FLOOR(CHECK_REVISION)) * 100, 2, '0')),
      '', '', '', '', '', '', '', '', ''
    FROM
      BASIS_INFO
  )
  UNION ALL
  ( SELECT
      30, 
      'Environment:',
      ENV,
      '', '', '', '', '', '', '', '', ''
    FROM
      BASIS_INFO  
  )
  UNION ALL
  ( SELECT
      31,
      'CPU threads:',
      TO_VARCHAR(CPU_THREADS) || MAP(BI_CPU_THREADS, -1, '', CHAR(32) || '(manual)'),
      '', '', '', '', '', '', '', '', ''
    FROM
      BASIS_INFO  
  )
  UNION ALL
  ( SELECT
      31.2,
      'CPU frequency (MHz):',
      TO_VARCHAR(CPU_FREQUENCY_MHZ),
      '', '', '', '', '', '', '', '', ''
    FROM
      BASIS_INFO  
  )
  UNION ALL
  ( SELECT
      31.5,
      'NUMA nodes:',
      TO_VARCHAR(NUMA_NODES),
      '', '', '', '', '', '', '', '', ''
    FROM
      BASIS_INFO
  )
  UNION ALL
  ( SELECT
      32,
      'GAL (GB):',
      TO_VARCHAR(ALLOC_LIM_GB) || MAP(BI_ALLOC_LIM_GB, -1, '', CHAR(32) || '(manual)'),
      '', '', '', '', '', '', '', '', ''
    FROM
      BASIS_INFO  
  )
  UNION ALL
  ( SELECT
      33,
      'Slave nodes:',
      TO_VARCHAR(NUM_SLAVES),
      '', '', '', '', '', '', '', '', ''
    FROM
      BASIS_INFO  
  )
  UNION ALL
  ( SELECT 40, '', '', '', '', '', '', '', '', '', '', '' FROM DUMMY )
  UNION ALL
  ( SELECT
      MAX(LINE_NO) LINE_NO,
      FILE_NAME,
      SECTION,
      PARAMETER_NAME,
      MAP(RECOMMENDED_VALUE, '-- no recommendation --', '', MAP(PRIORITY, 0, '', TO_VARCHAR(PRIORITY))) P,
      DEFAULT_VALUE,
      CONFIGURED_VALUE,
      RECOMMENDED_VALUE,
      MAX(SAP_NOTE) SAP_NOTE,
      CONFIGURED_HOST,
      IMPLEMENTATION_COMMAND,
      UNDO_COMMAND
    FROM
    ( SELECT
        ROW_NUMBER () OVER (ORDER BY MAP(RECOMMENDED_VALUE, '-- no recommendation --', 1, 0), FILE_NAME, SECTION, PARAMETER_NAME) + 100 LINE_NO,
        FILE_NAME,
        SECTION,
        PARAMETER_NAME,
        PRIORITY,
        DEFAULT_VALUE,
        CONFIGURED_VALUE,
        RECOMMENDED_VALUE,
        SAP_NOTE,
        CONFIGURED_HOST,
        IMPLEMENTATION_COMMAND,
        UNDO_COMMAND
      FROM
      ( SELECT DISTINCT
          FILE_NAME,
          SECTION,
          PARAMETER_NAME,
          PRIORITY,
          MAP(MAX_VALUE_LENGTH, -1, DEFAULT_VALUE,     SUBSTR(DEFAULT_VALUE,     1, MAX_VALUE_LENGTH)) DEFAULT_VALUE,
          MAP(MAX_VALUE_LENGTH, -1, USER_VALUE,        SUBSTR(USER_VALUE,        1, MAX_VALUE_LENGTH)) CONFIGURED_VALUE,
          MAP(MAX_VALUE_LENGTH, -1, RECOMMENDED_VALUE, SUBSTR(RECOMMENDED_VALUE, 1, MAX_VALUE_LENGTH)) RECOMMENDED_VALUE,
          SAP_NOTE,
          USER_HOST CONFIGURED_HOST,
          'ALTER SYSTEM ALTER CONFIGURATION (' || CHAR(39) || FILE_NAME || CHAR(39) || ',' || CHAR(32) || CHAR(39) || 
            MAP(USER_HOST, '', 'SYSTEM', '-- not set --', 'SYSTEM', 'HOST' || CHAR(39) || ',' || CHAR(32) || CHAR(39) || USER_HOST) || CHAR(39) || ')' || CHAR(32) ||
            MAP(RECOMMENDED_VALUE, '-- no recommendation --', 'UN', '') || 'SET (' || CHAR(39) || SECTION || CHAR(39) || ',' || CHAR(32) ||
            CHAR(39) || PARAMETER_NAME || CHAR(39) || ')' ||
            MAP(RECOMMENDED_VALUE, '-- no recommendation --', '', CHAR(32) || '=' || CHAR(32) || CHAR(39) || 
            CASE WHEN RECOMMENDED_VALUE LIKE '% to %' THEN SUBSTR(RECOMMENDED_VALUE, 1, LOCATE(RECOMMENDED_VALUE, ' to ') - 1) ELSE RECOMMENDED_VALUE END || 
            CHAR(39)) || ' WITH RECONFIGURE' || CHAR(59) IMPLEMENTATION_COMMAND,
          'ALTER SYSTEM ALTER CONFIGURATION (' || CHAR(39) || FILE_NAME || CHAR(39) || ',' || CHAR(32) || CHAR(39) || 
            MAP(USER_HOST, '', 'SYSTEM', '-- not set --', 'SYSTEM', 'HOST' || CHAR(39) || ',' || CHAR(32) || CHAR(39) || USER_HOST) || CHAR(39) || ')' || CHAR(32) ||
            MAP(RECOMMENDED_VALUE, '-- no recommendation --', '', 'UN') || 'SET (' || CHAR(39) || SECTION || CHAR(39) || ',' || CHAR(32) ||
            CHAR(39) || PARAMETER_NAME || CHAR(39) || ')' ||
            MAP(RECOMMENDED_VALUE, '-- no recommendation --', CHAR(32) || '=' || CHAR(32) || CHAR(39) || USER_VALUE || CHAR(39), '') || ' WITH RECONFIGURE' || CHAR(59) UNDO_COMMAND
        FROM
        ( SELECT /* Parameters deviating from existing recommendation */
            PR.FILE_NAME,
            PR.SECTION,
            PR.PARAMETER_NAME,
            PR.DEFAULT_VALUE,
            PR.USER_VALUE,
            PR.RECOMMENDED_VALUE,
            PR.PRIORITY,
            PR.SAP_NOTE,
            PR.AREA,
            PR.DEFAULT_HOST,
            PR.USER_HOST,
            BI.MAX_VALUE_LENGTH
          FROM
            BASIS_INFO BI,
            PARAMETER_RECOMMENDATIONS PR
          WHERE
            PR.FILE_NAME LIKE BI.FILE_NAME AND
            PR.SECTION LIKE BI.SECTION AND
            PR.PARAMETER_NAME LIKE BI.PARAMETER_NAME AND
            PR.SET_CORRECTLY = ' '
          UNION ALL
          SELECT /* Parameters being set although there is no general recommendation */
            P.FILE_NAME,
            P.SECTION,
            P.PARAMETER_NAME,
            P.DEFAULT_VALUE,
            P.USER_VALUE,
            '-- no recommendation --' RECOMMENDED_VALUE,
            P.PRIORITY,
            P.SAP_NOTE,
            P.AREA,
            P.DEFAULT_HOST,
            P.USER_HOST,
            BI.MAX_VALUE_LENGTH
          FROM
            BASIS_INFO BI,
            PARAMETERS P
          WHERE
            P.FILE_NAME LIKE BI.FILE_NAME AND
            P.SECTION LIKE BI.SECTION AND
            P.PARAMETER_NAME LIKE BI.PARAMETER_NAME AND 
            P.USER_VALUE != '-- not set --' AND
            P.USER_VALUE != P.DEFAULT_VALUE AND
            ( BI.EXCLUDE_DEFAULT_MODIFICATIONS = ' ' OR 
              P.TYPE != 'D' OR
              BI.ENV NOT LIKE '%MDCSYS%' AND
              P.FILE_NAME || '->[' || P.SECTION || ']->' || P.PARAMETER_NAME IN
              ( 'nameserver.ini->[execution]->max_concurrency', 'nameserver.ini->[httpserver]->embedded', 'nameserver.ini->[httpserver]->listenport',
                'nameserver.ini->[httpserver]->maxthreads', 'nameserver.ini->[httpserver]->workerpoolsize', 'nameserver.ini->[sql]->sql_executors', 
                'nameserver.ini->[threads]->poolsize'
              )
            ) AND
            ( BI.EXCLUDE_ADMINISTRATIVE_MODIFICATIONS = ' ' OR 
              P.TYPE != 'A' 
            ) AND
            ( BI.EXCLUDE_SECURITY_MODIFICATIONS = ' ' OR
              P.TYPE != 'S'
            ) AND
            ( BI.EXCLUDE_WEBDISPATCHER = ' ' OR
              P.FILE_NAME != 'webdispatcher.ini'
            ) AND
            NOT EXISTS ( SELECT 1 FROM PARAMETER_RECOMMENDATIONS PR WHERE PR.FILE_NAME = P.FILE_NAME AND PR.SECTION = P.SECTION AND PR.PARAMETER_NAME = P.PARAMETER_NAME )
        )
      )
    )
    GROUP BY
      FILE_NAME,
      SECTION,
      PARAMETER_NAME,
      PRIORITY,
      DEFAULT_VALUE,
      CONFIGURED_VALUE,
      RECOMMENDED_VALUE,
      CONFIGURED_HOST,
      IMPLEMENTATION_COMMAND,
      UNDO_COMMAND
  )
)
ORDER BY
  LINE_NO
