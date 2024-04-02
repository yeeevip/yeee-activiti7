-- SYSDBA.ACT_EVT_LOG definition

CREATE TABLE ACT_EVT_LOG (
                             LOG_NR_ NUMBER(19,0) NOT NULL,
                             TYPE_ NVARCHAR2(256) NULL,
                             PROC_DEF_ID_ NVARCHAR2(256) NULL,
                             PROC_INST_ID_ NVARCHAR2(256) NULL,
                             EXECUTION_ID_ NVARCHAR2(256) NULL,
                             TASK_ID_ NVARCHAR2(256) NULL,
                             TIME_STAMP_ TIMESTAMP NOT NULL,
                             USER_ID_ NVARCHAR2(1020) NULL,
                             DATA_ BLOB NULL,
                             LOCK_OWNER_ NVARCHAR2(1020) NULL,
                             LOCK_TIME_ TIMESTAMP NULL,
                             IS_PROCESSED_ NUMBER(3,0) DEFAULT 0 NULL,
                             CONSTRAINT CONS134219054 PRIMARY KEY (LOG_NR_)
);
CREATE UNIQUE INDEX INDEX33555917 ON ACT_EVT_LOG (LOG_NR_);


-- SYSDBA.ACT_GE_PROPERTY definition

CREATE TABLE ACT_GE_PROPERTY (
                                 NAME_ NVARCHAR2(256) NOT NULL,
                                 VALUE_ NVARCHAR2(1200) NULL,
                                 REV_ INTEGER NULL,
                                 CONSTRAINT CONS134219027 PRIMARY KEY (NAME_)
);
CREATE UNIQUE INDEX INDEX33555889 ON ACT_GE_PROPERTY (NAME_);


-- SYSDBA.ACT_HI_ACTINST definition

CREATE TABLE ACT_HI_ACTINST (
                                ID_ NVARCHAR2(256) NOT NULL,
                                PROC_DEF_ID_ NVARCHAR2(256) NOT NULL,
                                PROC_INST_ID_ NVARCHAR2(256) NOT NULL,
                                EXECUTION_ID_ NVARCHAR2(256) NOT NULL,
                                ACT_ID_ NVARCHAR2(1020) NOT NULL,
                                TASK_ID_ NVARCHAR2(256) NULL,
                                CALL_PROC_INST_ID_ NVARCHAR2(256) NULL,
                                ACT_NAME_ NVARCHAR2(1020) NULL,
                                ACT_TYPE_ NVARCHAR2(1020) NOT NULL,
                                ASSIGNEE_ NVARCHAR2(1020) NULL,
                                START_TIME_ TIMESTAMP NOT NULL,
                                END_TIME_ TIMESTAMP NULL,
                                DURATION_ NUMBER(19,0) NULL,
                                DELETE_REASON_ NVARCHAR2(8000) NULL,
                                TENANT_ID_ NVARCHAR2(1020) DEFAULT '' NULL,
                                CONSTRAINT CONS134219100 PRIMARY KEY (ID_)
);
CREATE INDEX ACT_IDX_HI_ACT_INST_END ON ACT_HI_ACTINST (END_TIME_);
CREATE INDEX ACT_IDX_HI_ACT_INST_EXEC ON ACT_HI_ACTINST (EXECUTION_ID_,ACT_ID_);
CREATE INDEX ACT_IDX_HI_ACT_INST_PROCINST ON ACT_HI_ACTINST (PROC_INST_ID_,ACT_ID_);
CREATE INDEX ACT_IDX_HI_ACT_INST_START ON ACT_HI_ACTINST (START_TIME_);
CREATE UNIQUE INDEX INDEX33556028 ON ACT_HI_ACTINST (ID_);


-- SYSDBA.ACT_HI_ATTACHMENT definition

CREATE TABLE ACT_HI_ATTACHMENT (
                                   ID_ NVARCHAR2(256) NOT NULL,
                                   REV_ INTEGER NULL,
                                   USER_ID_ NVARCHAR2(1020) NULL,
                                   NAME_ NVARCHAR2(1020) NULL,
                                   DESCRIPTION_ NVARCHAR2(8000) NULL,
                                   TYPE_ NVARCHAR2(1020) NULL,
                                   TASK_ID_ NVARCHAR2(256) NULL,
                                   PROC_INST_ID_ NVARCHAR2(256) NULL,
                                   URL_ NVARCHAR2(8000) NULL,
                                   CONTENT_ID_ NVARCHAR2(256) NULL,
                                   TIME_ TIMESTAMP NULL,
                                   CONSTRAINT CONS134219105 PRIMARY KEY (ID_)
);
CREATE UNIQUE INDEX INDEX33556038 ON ACT_HI_ATTACHMENT (ID_);


-- SYSDBA.ACT_HI_COMMENT definition

CREATE TABLE ACT_HI_COMMENT (
                                ID_ NVARCHAR2(256) NOT NULL,
                                TYPE_ NVARCHAR2(1020) NULL,
                                TIME_ TIMESTAMP NOT NULL,
                                USER_ID_ NVARCHAR2(1020) NULL,
                                TASK_ID_ NVARCHAR2(256) NULL,
                                PROC_INST_ID_ NVARCHAR2(256) NULL,
                                ACTION_ NVARCHAR2(1020) NULL,
                                MESSAGE_ NVARCHAR2(8000) NULL,
                                FULL_MSG_ BLOB NULL,
                                CONSTRAINT CONS134219104 PRIMARY KEY (ID_)
);
CREATE UNIQUE INDEX INDEX33556036 ON ACT_HI_COMMENT (ID_);


-- SYSDBA.ACT_HI_DETAIL definition

CREATE TABLE ACT_HI_DETAIL (
                               ID_ NVARCHAR2(256) NOT NULL,
                               TYPE_ NVARCHAR2(1020) NOT NULL,
                               PROC_INST_ID_ NVARCHAR2(256) NULL,
                               EXECUTION_ID_ NVARCHAR2(256) NULL,
                               TASK_ID_ NVARCHAR2(256) NULL,
                               ACT_INST_ID_ NVARCHAR2(256) NULL,
                               NAME_ NVARCHAR2(1020) NOT NULL,
                               VAR_TYPE_ NVARCHAR2(256) NULL,
                               REV_ INTEGER NULL,
                               TIME_ TIMESTAMP NOT NULL,
                               BYTEARRAY_ID_ NVARCHAR2(256) NULL,
                               DOUBLE_ NUMBER(38,10) NULL,
                               LONG_ NUMBER(19,0) NULL,
                               TEXT_ NVARCHAR2(8000) NULL,
                               TEXT2_ NVARCHAR2(8000) NULL,
                               CONSTRAINT CONS134219103 PRIMARY KEY (ID_)
);
CREATE INDEX ACT_IDX_HI_DETAIL_ACT_INST ON ACT_HI_DETAIL (ACT_INST_ID_);
CREATE INDEX ACT_IDX_HI_DETAIL_NAME ON ACT_HI_DETAIL (NAME_);
CREATE INDEX ACT_IDX_HI_DETAIL_PROC_INST ON ACT_HI_DETAIL (PROC_INST_ID_);
CREATE INDEX ACT_IDX_HI_DETAIL_TASK_ID ON ACT_HI_DETAIL (TASK_ID_);
CREATE INDEX ACT_IDX_HI_DETAIL_TIME ON ACT_HI_DETAIL (TIME_);
CREATE UNIQUE INDEX INDEX33556034 ON ACT_HI_DETAIL (ID_);


-- SYSDBA.ACT_HI_IDENTITYLINK definition

CREATE TABLE ACT_HI_IDENTITYLINK (
                                     ID_ NVARCHAR2(256) NOT NULL,
                                     GROUP_ID_ NVARCHAR2(1020) NULL,
                                     TYPE_ NVARCHAR2(1020) NULL,
                                     USER_ID_ NVARCHAR2(1020) NULL,
                                     TASK_ID_ NVARCHAR2(256) NULL,
                                     PROC_INST_ID_ NVARCHAR2(256) NULL,
                                     CONSTRAINT CONS134219106 PRIMARY KEY (ID_)
);
CREATE INDEX ACT_IDX_HI_IDENT_LNK_PROCINST ON ACT_HI_IDENTITYLINK (PROC_INST_ID_);
CREATE INDEX ACT_IDX_HI_IDENT_LNK_TASK ON ACT_HI_IDENTITYLINK (TASK_ID_);
CREATE INDEX ACT_IDX_HI_IDENT_LNK_USER ON ACT_HI_IDENTITYLINK (USER_ID_);
CREATE UNIQUE INDEX INDEX33556040 ON ACT_HI_IDENTITYLINK (ID_);


-- SYSDBA.ACT_HI_PROCINST definition

CREATE TABLE ACT_HI_PROCINST (
                                 ID_ NVARCHAR2(256) NOT NULL,
                                 PROC_INST_ID_ NVARCHAR2(256) NOT NULL,
                                 BUSINESS_KEY_ NVARCHAR2(1020) NULL,
                                 PROC_DEF_ID_ NVARCHAR2(256) NOT NULL,
                                 START_TIME_ TIMESTAMP NOT NULL,
                                 END_TIME_ TIMESTAMP NULL,
                                 DURATION_ NUMBER(19,0) NULL,
                                 START_USER_ID_ NVARCHAR2(1020) NULL,
                                 START_ACT_ID_ NVARCHAR2(1020) NULL,
                                 END_ACT_ID_ NVARCHAR2(1020) NULL,
                                 SUPER_PROCESS_INSTANCE_ID_ NVARCHAR2(256) NULL,
                                 DELETE_REASON_ NVARCHAR2(8000) NULL,
                                 TENANT_ID_ NVARCHAR2(1020) DEFAULT '' NULL,
                                 NAME_ NVARCHAR2(1020) NULL,
                                 CONSTRAINT CONS134219098 PRIMARY KEY (ID_)
);
CREATE INDEX ACT_IDX_HI_PRO_INST_END ON ACT_HI_PROCINST (END_TIME_);
CREATE INDEX ACT_IDX_HI_PRO_I_BUSKEY ON ACT_HI_PROCINST (BUSINESS_KEY_);
CREATE UNIQUE INDEX INDEX33556025 ON ACT_HI_PROCINST (ID_);
CREATE UNIQUE INDEX INDEX33556026 ON ACT_HI_PROCINST (PROC_INST_ID_);


-- SYSDBA.ACT_HI_TASKINST definition

CREATE TABLE ACT_HI_TASKINST (
                                 ID_ NVARCHAR2(256) NOT NULL,
                                 PROC_DEF_ID_ NVARCHAR2(256) NULL,
                                 TASK_DEF_KEY_ NVARCHAR2(1020) NULL,
                                 PROC_INST_ID_ NVARCHAR2(256) NULL,
                                 EXECUTION_ID_ NVARCHAR2(256) NULL,
                                 PARENT_TASK_ID_ NVARCHAR2(256) NULL,
                                 NAME_ NVARCHAR2(1020) NULL,
                                 DESCRIPTION_ NVARCHAR2(8000) NULL,
                                 OWNER_ NVARCHAR2(1020) NULL,
                                 ASSIGNEE_ NVARCHAR2(1020) NULL,
                                 START_TIME_ TIMESTAMP NOT NULL,
                                 CLAIM_TIME_ TIMESTAMP NULL,
                                 END_TIME_ TIMESTAMP NULL,
                                 DURATION_ NUMBER(19,0) NULL,
                                 DELETE_REASON_ NVARCHAR2(8000) NULL,
                                 PRIORITY_ INTEGER NULL,
                                 DUE_DATE_ TIMESTAMP NULL,
                                 FORM_KEY_ NVARCHAR2(1020) NULL,
                                 CATEGORY_ NVARCHAR2(1020) NULL,
                                 TENANT_ID_ NVARCHAR2(1020) DEFAULT '' NULL,
                                 CONSTRAINT CONS134219101 PRIMARY KEY (ID_)
);
CREATE INDEX ACT_IDX_HI_TASK_INST_PROCINST ON ACT_HI_TASKINST (PROC_INST_ID_);
CREATE UNIQUE INDEX INDEX33556030 ON ACT_HI_TASKINST (ID_);


-- SYSDBA.ACT_HI_VARINST definition

CREATE TABLE ACT_HI_VARINST (
                                ID_ NVARCHAR2(256) NOT NULL,
                                PROC_INST_ID_ NVARCHAR2(256) NULL,
                                EXECUTION_ID_ NVARCHAR2(256) NULL,
                                TASK_ID_ NVARCHAR2(256) NULL,
                                NAME_ NVARCHAR2(1020) NOT NULL,
                                VAR_TYPE_ NVARCHAR2(400) NULL,
                                REV_ INTEGER NULL,
                                BYTEARRAY_ID_ NVARCHAR2(256) NULL,
                                DOUBLE_ NUMBER(38,10) NULL,
                                LONG_ NUMBER(19,0) NULL,
                                TEXT_ NVARCHAR2(8000) NULL,
                                TEXT2_ NVARCHAR2(8000) NULL,
                                CREATE_TIME_ TIMESTAMP NULL,
                                LAST_UPDATED_TIME_ TIMESTAMP NULL,
                                CONSTRAINT CONS134219102 PRIMARY KEY (ID_)
);
CREATE INDEX ACT_IDX_HI_PROCVAR_NAME_TYPE ON ACT_HI_VARINST (NAME_,VAR_TYPE_);
CREATE INDEX ACT_IDX_HI_PROCVAR_PROC_INST ON ACT_HI_VARINST (PROC_INST_ID_);
CREATE INDEX ACT_IDX_HI_PROCVAR_TASK_ID ON ACT_HI_VARINST (TASK_ID_);
CREATE UNIQUE INDEX INDEX33556032 ON ACT_HI_VARINST (ID_);


-- SYSDBA.ACT_RE_DEPLOYMENT definition

CREATE TABLE ACT_RE_DEPLOYMENT (
                                   ID_ NVARCHAR2(256) NOT NULL,
                                   NAME_ NVARCHAR2(1020) NULL,
                                   CATEGORY_ NVARCHAR2(1020) NULL,
                                   KEY_ NVARCHAR2(1020) NULL,
                                   TENANT_ID_ NVARCHAR2(1020) DEFAULT '' NULL,
                                   DEPLOY_TIME_ TIMESTAMP NULL,
                                   ENGINE_VERSION_ NVARCHAR2(1020) NULL,
                                   PROJECT_RELEASE_VERSION_ VARCHAR(255) DEFAULT NULL NULL,
                                   VERSION_ VARCHAR(255) DEFAULT NULL NULL,
                                   CONSTRAINT CONS134219030 PRIMARY KEY (ID_)
);
CREATE UNIQUE INDEX INDEX33555893 ON ACT_RE_DEPLOYMENT (ID_);


-- SYSDBA.ACT_RE_PROCDEF definition

CREATE TABLE ACT_RE_PROCDEF (
                                ID_ NVARCHAR2(256) NOT NULL,
                                REV_ INTEGER NULL,
                                CATEGORY_ NVARCHAR2(1020) NULL,
                                NAME_ NVARCHAR2(1020) NULL,
                                KEY_ NVARCHAR2(1020) NOT NULL,
                                VERSION_ INTEGER NOT NULL,
                                DEPLOYMENT_ID_ NVARCHAR2(256) NULL,
                                RESOURCE_NAME_ NVARCHAR2(8000) NULL,
                                DGRM_RESOURCE_NAME_ VARCHAR(4000) NULL,
                                DESCRIPTION_ NVARCHAR2(8000) NULL,
                                HAS_START_FORM_KEY_ NUMBER(1,0) NULL,
                                HAS_GRAPHICAL_NOTATION_ NUMBER(1,0) NULL,
                                SUSPENSION_STATE_ INTEGER NULL,
                                TENANT_ID_ NVARCHAR2(1020) DEFAULT '' NULL,
                                ENGINE_VERSION_ NVARCHAR2(1020) NULL,
                                APP_VERSION_ VARCHAR(100) NULL,
                                CONSTRAINT CONS134219049 PRIMARY KEY (ID_)
);
CREATE UNIQUE INDEX INDEX33555907 ON ACT_RE_PROCDEF (ID_);
CREATE UNIQUE INDEX INDEX33555931 ON ACT_RE_PROCDEF (KEY_,VERSION_,TENANT_ID_);


-- SYSDBA.HISTOGRAMS_TABLE definition

CREATE TABLE HISTOGRAMS_TABLE (

);


-- SYSDBA.OAUTH_ACCESS_TOKEN definition

CREATE TABLE OAUTH_ACCESS_TOKEN (
                                    TOKEN_ID VARCHAR2(256) NULL,
                                    TOKEN BLOB NULL,
                                    AUTHENTICATION_ID VARCHAR2(128) NOT NULL,
                                    USER_NAME VARCHAR2(256) NULL,
                                    CLIENT_ID VARCHAR2(256) NULL,
                                    AUTHENTICATION BLOB NULL,
                                    REFRESH_TOKEN VARCHAR2(256) NULL,
                                    CONSTRAINT CONS134219108 PRIMARY KEY (AUTHENTICATION_ID)
);
CREATE UNIQUE INDEX INDEX33556062 ON OAUTH_ACCESS_TOKEN (AUTHENTICATION_ID);


-- SYSDBA.OAUTH_CLIENT_DETAILS definition

CREATE TABLE OAUTH_CLIENT_DETAILS (
                                      CLIENT_ID VARCHAR2(32) NOT NULL,
                                      RESOURCE_IDS VARCHAR2(256) NULL,
                                      CLIENT_SECRET VARCHAR2(256) NULL,
                                      "SCOPE" VARCHAR2(256) NULL,
                                      AUTHORIZED_GRANT_TYPES VARCHAR2(256) NULL,
                                      WEB_SERVER_REDIRECT_URI VARCHAR2(256) NULL,
                                      AUTHORITIES VARCHAR2(256) NULL,
                                      ACCESS_TOKEN_VALIDITY NUMBER(10,0) NULL,
                                      REFRESH_TOKEN_VALIDITY NUMBER(10,0) NULL,
                                      ADDITIONAL_INFORMATION VARCHAR2(4096) NULL,
                                      AUTOAPPROVE VARCHAR2(256) NULL,
                                      CONSTRAINT CONS134219107 PRIMARY KEY (CLIENT_ID)
);
CREATE UNIQUE INDEX INDEX33556060 ON OAUTH_CLIENT_DETAILS (CLIENT_ID);


-- SYSDBA.OAUTH_REFRESH_TOKEN definition

CREATE TABLE OAUTH_REFRESH_TOKEN (
                                     TOKEN_ID VARCHAR2(256) NULL,
                                     TOKEN BLOB NULL,
                                     AUTHENTICATION BLOB NULL
);


-- SYSDBA.ACT_GE_BYTEARRAY definition

CREATE TABLE ACT_GE_BYTEARRAY (
                                  ID_ NVARCHAR2(256) NOT NULL,
                                  REV_ INTEGER NULL,
                                  NAME_ NVARCHAR2(1020) NULL,
                                  DEPLOYMENT_ID_ NVARCHAR2(256) NULL,
                                  BYTES_ BLOB NULL,
                                  GENERATED_ NUMBER(1,0) NULL,
                                  CONSTRAINT CONS134219029 PRIMARY KEY (ID_),
                                  CONSTRAINT ACT_FK_BYTEARR_DEPL FOREIGN KEY (DEPLOYMENT_ID_) REFERENCES ACT_RE_DEPLOYMENT(ID_)
);
CREATE INDEX ACT_IDX_BYTEAR_DEPL ON ACT_GE_BYTEARRAY (DEPLOYMENT_ID_);
CREATE UNIQUE INDEX INDEX33555891 ON ACT_GE_BYTEARRAY (ID_);
CREATE INDEX INDEX33555930 ON ACT_GE_BYTEARRAY (DEPLOYMENT_ID_);


-- SYSDBA.ACT_PROCDEF_INFO definition

CREATE TABLE ACT_PROCDEF_INFO (
                                  ID_ NVARCHAR2(256) NOT NULL,
                                  PROC_DEF_ID_ NVARCHAR2(256) NOT NULL,
                                  REV_ INTEGER NULL,
                                  INFO_JSON_ID_ NVARCHAR2(256) NULL,
                                  CONSTRAINT CONS134219055 PRIMARY KEY (ID_),
                                  CONSTRAINT ACT_FK_INFO_JSON_BA FOREIGN KEY (INFO_JSON_ID_) REFERENCES ACT_GE_BYTEARRAY(ID_),
                                  CONSTRAINT ACT_FK_INFO_PROCDEF FOREIGN KEY (PROC_DEF_ID_) REFERENCES ACT_RE_PROCDEF(ID_)
);
CREATE INDEX ACT_IDX_PROCDEF_INFO_JSON ON ACT_PROCDEF_INFO (INFO_JSON_ID_);
CREATE INDEX ACT_IDX_PROCDEF_INFO_PROC ON ACT_PROCDEF_INFO (PROC_DEF_ID_);
CREATE UNIQUE INDEX INDEX33555919 ON ACT_PROCDEF_INFO (ID_);
CREATE INDEX INDEX33556017 ON ACT_PROCDEF_INFO (INFO_JSON_ID_);
CREATE INDEX INDEX33556019 ON ACT_PROCDEF_INFO (PROC_DEF_ID_);
CREATE UNIQUE INDEX INDEX33556020 ON ACT_PROCDEF_INFO (PROC_DEF_ID_);


-- SYSDBA.ACT_RE_MODEL definition

CREATE TABLE ACT_RE_MODEL (
                              ID_ NVARCHAR2(256) NOT NULL,
                              REV_ INTEGER NULL,
                              NAME_ NVARCHAR2(1020) NULL,
                              KEY_ NVARCHAR2(1020) NULL,
                              CATEGORY_ NVARCHAR2(1020) NULL,
                              CREATE_TIME_ TIMESTAMP NULL,
                              LAST_UPDATE_TIME_ TIMESTAMP NULL,
                              VERSION_ INTEGER NULL,
                              META_INFO_ NVARCHAR2(8000) NULL,
                              DEPLOYMENT_ID_ NVARCHAR2(256) NULL,
                              EDITOR_SOURCE_VALUE_ID_ NVARCHAR2(256) NULL,
                              EDITOR_SOURCE_EXTRA_VALUE_ID_ NVARCHAR2(256) NULL,
                              TENANT_ID_ NVARCHAR2(1020) DEFAULT '' NULL,
                              CONSTRAINT CONS134219031 PRIMARY KEY (ID_),
                              CONSTRAINT ACT_FK_MODEL_DEPLOYMENT FOREIGN KEY (DEPLOYMENT_ID_) REFERENCES ACT_RE_DEPLOYMENT(ID_),
                              CONSTRAINT ACT_FK_MODEL_SOURCE FOREIGN KEY (EDITOR_SOURCE_VALUE_ID_) REFERENCES ACT_GE_BYTEARRAY(ID_),
                              CONSTRAINT ACT_FK_MODEL_SOURCE_EXTRA FOREIGN KEY (EDITOR_SOURCE_EXTRA_VALUE_ID_) REFERENCES ACT_GE_BYTEARRAY(ID_)
);
CREATE INDEX ACT_IDX_MODEL_DEPLOYMENT ON ACT_RE_MODEL (DEPLOYMENT_ID_);
CREATE INDEX ACT_IDX_MODEL_SOURCE ON ACT_RE_MODEL (EDITOR_SOURCE_VALUE_ID_);
CREATE INDEX ACT_IDX_MODEL_SOURCE_EXTRA ON ACT_RE_MODEL (EDITOR_SOURCE_EXTRA_VALUE_ID_);
CREATE UNIQUE INDEX INDEX33555895 ON ACT_RE_MODEL (ID_);
CREATE INDEX INDEX33556011 ON ACT_RE_MODEL (EDITOR_SOURCE_VALUE_ID_);
CREATE INDEX INDEX33556013 ON ACT_RE_MODEL (EDITOR_SOURCE_EXTRA_VALUE_ID_);
CREATE INDEX INDEX33556015 ON ACT_RE_MODEL (DEPLOYMENT_ID_);


-- SYSDBA.ACT_RU_EXECUTION definition

CREATE TABLE ACT_RU_EXECUTION (
                                  ID_ NVARCHAR2(256) NOT NULL,
                                  REV_ INTEGER NULL,
                                  PROC_INST_ID_ NVARCHAR2(256) NULL,
                                  BUSINESS_KEY_ NVARCHAR2(1020) NULL,
                                  PARENT_ID_ NVARCHAR2(256) NULL,
                                  PROC_DEF_ID_ NVARCHAR2(256) NULL,
                                  SUPER_EXEC_ NVARCHAR2(256) NULL,
                                  ROOT_PROC_INST_ID_ NVARCHAR2(256) NULL,
                                  ACT_ID_ NVARCHAR2(1020) NULL,
                                  IS_ACTIVE_ NUMBER(1,0) NULL,
                                  IS_CONCURRENT_ NUMBER(1,0) NULL,
                                  IS_SCOPE_ NUMBER(1,0) NULL,
                                  IS_EVENT_SCOPE_ NUMBER(1,0) NULL,
                                  IS_MI_ROOT_ NUMBER(1,0) NULL,
                                  SUSPENSION_STATE_ INTEGER NULL,
                                  CACHED_ENT_STATE_ INTEGER NULL,
                                  TENANT_ID_ NVARCHAR2(1020) DEFAULT '' NULL,
                                  NAME_ NVARCHAR2(1020) NULL,
                                  START_TIME_ TIMESTAMP NULL,
                                  START_USER_ID_ NVARCHAR2(1020) NULL,
                                  LOCK_TIME_ TIMESTAMP NULL,
                                  IS_COUNT_ENABLED_ NUMBER(1,0) NULL,
                                  EVT_SUBSCR_COUNT_ INTEGER NULL,
                                  TASK_COUNT_ INTEGER NULL,
                                  JOB_COUNT_ INTEGER NULL,
                                  TIMER_JOB_COUNT_ INTEGER NULL,
                                  SUSP_JOB_COUNT_ INTEGER NULL,
                                  DEADLETTER_JOB_COUNT_ INTEGER NULL,
                                  VAR_COUNT_ INTEGER NULL,
                                  ID_LINK_COUNT_ INTEGER NULL,
                                  CONSTRAINT CONS134219038 PRIMARY KEY (ID_),
                                  CONSTRAINT ACT_FK_EXE_PARENT FOREIGN KEY (PARENT_ID_) REFERENCES ACT_RU_EXECUTION(ID_),
                                  CONSTRAINT ACT_FK_EXE_PROCDEF FOREIGN KEY (PROC_DEF_ID_) REFERENCES ACT_RE_PROCDEF(ID_),
                                  CONSTRAINT ACT_FK_EXE_PROCINST FOREIGN KEY (PROC_INST_ID_) REFERENCES ACT_RU_EXECUTION(ID_),
                                  CONSTRAINT ACT_FK_EXE_SUPER FOREIGN KEY (SUPER_EXEC_) REFERENCES ACT_RU_EXECUTION(ID_)
);
CREATE INDEX ACT_IDX_EXEC_BUSKEY ON ACT_RU_EXECUTION (BUSINESS_KEY_);
CREATE INDEX ACT_IDX_EXEC_ROOT ON ACT_RU_EXECUTION (ROOT_PROC_INST_ID_);
CREATE INDEX ACT_IDX_EXE_PARENT ON ACT_RU_EXECUTION (PARENT_ID_);
CREATE INDEX ACT_IDX_EXE_PROCDEF ON ACT_RU_EXECUTION (PROC_DEF_ID_);
CREATE INDEX ACT_IDX_EXE_PROCINST ON ACT_RU_EXECUTION (PROC_INST_ID_);
CREATE INDEX ACT_IDX_EXE_SUPER ON ACT_RU_EXECUTION (SUPER_EXEC_);
CREATE UNIQUE INDEX INDEX33555897 ON ACT_RU_EXECUTION (ID_);
CREATE INDEX INDEX33555933 ON ACT_RU_EXECUTION (PROC_INST_ID_);
CREATE INDEX INDEX33555941 ON ACT_RU_EXECUTION (PARENT_ID_);
CREATE INDEX INDEX33555949 ON ACT_RU_EXECUTION (SUPER_EXEC_);
CREATE INDEX INDEX33555957 ON ACT_RU_EXECUTION (PROC_DEF_ID_);


-- SYSDBA.ACT_RU_INTEGRATION definition

CREATE TABLE ACT_RU_INTEGRATION (
                                    ID_ NVARCHAR2(256) NOT NULL,
                                    EXECUTION_ID_ NVARCHAR2(256) NULL,
                                    PROCESS_INSTANCE_ID_ NVARCHAR2(256) NULL,
                                    PROC_DEF_ID_ NVARCHAR2(256) NULL,
                                    FLOW_NODE_ID_ NVARCHAR2(256) NULL,
                                    CREATED_DATE_ TIMESTAMP NULL,
                                    CONSTRAINT CONS134219056 PRIMARY KEY (ID_),
                                    CONSTRAINT ACT_FK_INT_EXECUTION FOREIGN KEY (EXECUTION_ID_) REFERENCES ACT_RU_EXECUTION(ID_) ON DELETE CASCADE,
                                    CONSTRAINT ACT_FK_INT_PROC_DEF FOREIGN KEY (PROC_DEF_ID_) REFERENCES ACT_RE_PROCDEF(ID_),
                                    CONSTRAINT ACT_FK_INT_PROC_INST FOREIGN KEY (PROCESS_INSTANCE_ID_) REFERENCES ACT_RU_EXECUTION(ID_)
);
CREATE UNIQUE INDEX INDEX33555921 ON ACT_RU_INTEGRATION (ID_);
CREATE INDEX INDEX33556021 ON ACT_RU_INTEGRATION (EXECUTION_ID_);
CREATE INDEX INDEX33556022 ON ACT_RU_INTEGRATION (PROCESS_INSTANCE_ID_);
CREATE INDEX INDEX33556023 ON ACT_RU_INTEGRATION (PROC_DEF_ID_);


-- SYSDBA.ACT_RU_JOB definition

CREATE TABLE ACT_RU_JOB (
                            ID_ NVARCHAR2(256) NOT NULL,
                            REV_ INTEGER NULL,
                            TYPE_ NVARCHAR2(1020) NOT NULL,
                            LOCK_EXP_TIME_ TIMESTAMP NULL,
                            LOCK_OWNER_ NVARCHAR2(1020) NULL,
                            EXCLUSIVE_ NUMBER(1,0) NULL,
                            EXECUTION_ID_ NVARCHAR2(256) NULL,
                            PROCESS_INSTANCE_ID_ NVARCHAR2(256) NULL,
                            PROC_DEF_ID_ NVARCHAR2(256) NULL,
                            RETRIES_ INTEGER NULL,
                            EXCEPTION_STACK_ID_ NVARCHAR2(256) NULL,
                            EXCEPTION_MSG_ NVARCHAR2(8000) NULL,
                            DUEDATE_ TIMESTAMP NULL,
                            REPEAT_ NVARCHAR2(1020) NULL,
                            HANDLER_TYPE_ NVARCHAR2(1020) NULL,
                            HANDLER_CFG_ NVARCHAR2(8000) NULL,
                            TENANT_ID_ NVARCHAR2(1020) DEFAULT '' NULL,
                            CONSTRAINT CONS134219040 PRIMARY KEY (ID_),
                            CONSTRAINT ACT_FK_JOB_EXCEPTION FOREIGN KEY (EXCEPTION_STACK_ID_) REFERENCES ACT_GE_BYTEARRAY(ID_),
                            CONSTRAINT ACT_FK_JOB_EXECUTION FOREIGN KEY (EXECUTION_ID_) REFERENCES ACT_RU_EXECUTION(ID_),
                            CONSTRAINT ACT_FK_JOB_PROCESS_INSTANCE FOREIGN KEY (PROCESS_INSTANCE_ID_) REFERENCES ACT_RU_EXECUTION(ID_),
                            CONSTRAINT ACT_FK_JOB_PROC_DEF FOREIGN KEY (PROC_DEF_ID_) REFERENCES ACT_RE_PROCDEF(ID_)
);
CREATE INDEX ACT_IDX_JOB_EXCEPTION ON ACT_RU_JOB (EXCEPTION_STACK_ID_);
CREATE INDEX ACT_IDX_JOB_EXECUTION_ID ON ACT_RU_JOB (EXECUTION_ID_);
CREATE INDEX ACT_IDX_JOB_PROC_DEF_ID ON ACT_RU_JOB (PROC_DEF_ID_);
CREATE INDEX ACT_IDX_JOB_PROC_INST_ID ON ACT_RU_JOB (PROCESS_INSTANCE_ID_);
CREATE UNIQUE INDEX INDEX33555899 ON ACT_RU_JOB (ID_);
CREATE INDEX INDEX33555977 ON ACT_RU_JOB (EXECUTION_ID_);
CREATE INDEX INDEX33555979 ON ACT_RU_JOB (PROCESS_INSTANCE_ID_);
CREATE INDEX INDEX33555981 ON ACT_RU_JOB (PROC_DEF_ID_);
CREATE INDEX INDEX33555983 ON ACT_RU_JOB (EXCEPTION_STACK_ID_);


-- SYSDBA.ACT_RU_SUSPENDED_JOB definition

CREATE TABLE ACT_RU_SUSPENDED_JOB (
                                      ID_ NVARCHAR2(256) NOT NULL,
                                      REV_ INTEGER NULL,
                                      TYPE_ NVARCHAR2(1020) NOT NULL,
                                      EXCLUSIVE_ NUMBER(1,0) NULL,
                                      EXECUTION_ID_ NVARCHAR2(256) NULL,
                                      PROCESS_INSTANCE_ID_ NVARCHAR2(256) NULL,
                                      PROC_DEF_ID_ NVARCHAR2(256) NULL,
                                      RETRIES_ INTEGER NULL,
                                      EXCEPTION_STACK_ID_ NVARCHAR2(256) NULL,
                                      EXCEPTION_MSG_ NVARCHAR2(8000) NULL,
                                      DUEDATE_ TIMESTAMP NULL,
                                      REPEAT_ NVARCHAR2(1020) NULL,
                                      HANDLER_TYPE_ NVARCHAR2(1020) NULL,
                                      HANDLER_CFG_ NVARCHAR2(8000) NULL,
                                      TENANT_ID_ NVARCHAR2(1020) DEFAULT '' NULL,
                                      CONSTRAINT CONS134219044 PRIMARY KEY (ID_),
                                      CONSTRAINT ACT_FK_SJOB_EXCEPTION FOREIGN KEY (EXCEPTION_STACK_ID_) REFERENCES ACT_GE_BYTEARRAY(ID_),
                                      CONSTRAINT ACT_FK_SJOB_EXECUTION FOREIGN KEY (EXECUTION_ID_) REFERENCES ACT_RU_EXECUTION(ID_),
                                      CONSTRAINT ACT_FK_SJOB_PROCESS_INSTANCE FOREIGN KEY (PROCESS_INSTANCE_ID_) REFERENCES ACT_RU_EXECUTION(ID_),
                                      CONSTRAINT ACT_FK_SJOB_PROC_DEF FOREIGN KEY (PROC_DEF_ID_) REFERENCES ACT_RE_PROCDEF(ID_)
);
CREATE INDEX ACT_IDX_SJOB_EXCEPTION ON ACT_RU_SUSPENDED_JOB (EXCEPTION_STACK_ID_);
CREATE INDEX ACT_IDX_SJOB_EXECUTION_ID ON ACT_RU_SUSPENDED_JOB (EXECUTION_ID_);
CREATE INDEX ACT_IDX_SJOB_PROC_DEF_ID ON ACT_RU_SUSPENDED_JOB (PROC_DEF_ID_);
CREATE INDEX ACT_IDX_SJOB_PROC_INST_ID ON ACT_RU_SUSPENDED_JOB (PROCESS_INSTANCE_ID_);
CREATE UNIQUE INDEX INDEX33555903 ON ACT_RU_SUSPENDED_JOB (ID_);
CREATE INDEX INDEX33555993 ON ACT_RU_SUSPENDED_JOB (EXECUTION_ID_);
CREATE INDEX INDEX33555995 ON ACT_RU_SUSPENDED_JOB (PROCESS_INSTANCE_ID_);
CREATE INDEX INDEX33555997 ON ACT_RU_SUSPENDED_JOB (PROC_DEF_ID_);
CREATE INDEX INDEX33555999 ON ACT_RU_SUSPENDED_JOB (EXCEPTION_STACK_ID_);


-- SYSDBA.ACT_RU_TASK definition

CREATE TABLE ACT_RU_TASK (
                             ID_ NVARCHAR2(256) NOT NULL,
                             REV_ INTEGER NULL,
                             EXECUTION_ID_ NVARCHAR2(256) NULL,
                             PROC_INST_ID_ NVARCHAR2(256) NULL,
                             PROC_DEF_ID_ NVARCHAR2(256) NULL,
                             NAME_ NVARCHAR2(1020) NULL,
                             PARENT_TASK_ID_ NVARCHAR2(256) NULL,
                             DESCRIPTION_ NVARCHAR2(8000) NULL,
                             TASK_DEF_KEY_ NVARCHAR2(1020) NULL,
                             OWNER_ NVARCHAR2(1020) NULL,
                             ASSIGNEE_ NVARCHAR2(1020) NULL,
                             DELEGATION_ NVARCHAR2(256) NULL,
                             PRIORITY_ INTEGER NULL,
                             CREATE_TIME_ TIMESTAMP NULL,
                             DUE_DATE_ TIMESTAMP NULL,
                             CATEGORY_ NVARCHAR2(1020) NULL,
                             SUSPENSION_STATE_ INTEGER NULL,
                             TENANT_ID_ NVARCHAR2(1020) DEFAULT '' NULL,
                             FORM_KEY_ NVARCHAR2(1020) NULL,
                             CLAIM_TIME_ TIMESTAMP NULL,
                             CONSTRAINT CONS134219050 PRIMARY KEY (ID_),
                             CONSTRAINT ACT_FK_TASK_EXE FOREIGN KEY (EXECUTION_ID_) REFERENCES ACT_RU_EXECUTION(ID_),
                             CONSTRAINT ACT_FK_TASK_PROCDEF FOREIGN KEY (PROC_DEF_ID_) REFERENCES ACT_RE_PROCDEF(ID_),
                             CONSTRAINT ACT_FK_TASK_PROCINST FOREIGN KEY (PROC_INST_ID_) REFERENCES ACT_RU_EXECUTION(ID_)
);
CREATE INDEX ACT_IDX_TASK_CREATE ON ACT_RU_TASK (CREATE_TIME_);
CREATE INDEX ACT_IDX_TASK_EXEC ON ACT_RU_TASK (EXECUTION_ID_);
CREATE INDEX ACT_IDX_TASK_PROCDEF ON ACT_RU_TASK (PROC_DEF_ID_);
CREATE INDEX ACT_IDX_TASK_PROCINST ON ACT_RU_TASK (PROC_INST_ID_);
CREATE UNIQUE INDEX INDEX33555909 ON ACT_RU_TASK (ID_);
CREATE INDEX INDEX33555965 ON ACT_RU_TASK (EXECUTION_ID_);
CREATE INDEX INDEX33555967 ON ACT_RU_TASK (PROC_INST_ID_);
CREATE INDEX INDEX33555969 ON ACT_RU_TASK (PROC_DEF_ID_);


-- SYSDBA.ACT_RU_TIMER_JOB definition

CREATE TABLE ACT_RU_TIMER_JOB (
                                  ID_ NVARCHAR2(256) NOT NULL,
                                  REV_ INTEGER NULL,
                                  TYPE_ NVARCHAR2(1020) NOT NULL,
                                  LOCK_EXP_TIME_ TIMESTAMP NULL,
                                  LOCK_OWNER_ NVARCHAR2(1020) NULL,
                                  EXCLUSIVE_ NUMBER(1,0) NULL,
                                  EXECUTION_ID_ NVARCHAR2(256) NULL,
                                  PROCESS_INSTANCE_ID_ NVARCHAR2(256) NULL,
                                  PROC_DEF_ID_ NVARCHAR2(256) NULL,
                                  RETRIES_ INTEGER NULL,
                                  EXCEPTION_STACK_ID_ NVARCHAR2(256) NULL,
                                  EXCEPTION_MSG_ NVARCHAR2(8000) NULL,
                                  DUEDATE_ TIMESTAMP NULL,
                                  REPEAT_ NVARCHAR2(1020) NULL,
                                  HANDLER_TYPE_ NVARCHAR2(1020) NULL,
                                  HANDLER_CFG_ NVARCHAR2(8000) NULL,
                                  TENANT_ID_ NVARCHAR2(1020) DEFAULT '' NULL,
                                  CONSTRAINT CONS134219042 PRIMARY KEY (ID_),
                                  CONSTRAINT ACT_FK_TJOB_EXCEPTION FOREIGN KEY (EXCEPTION_STACK_ID_) REFERENCES ACT_GE_BYTEARRAY(ID_),
                                  CONSTRAINT ACT_FK_TJOB_EXECUTION FOREIGN KEY (EXECUTION_ID_) REFERENCES ACT_RU_EXECUTION(ID_),
                                  CONSTRAINT ACT_FK_TJOB_PROCESS_INSTANCE FOREIGN KEY (PROCESS_INSTANCE_ID_) REFERENCES ACT_RU_EXECUTION(ID_),
                                  CONSTRAINT ACT_FK_TJOB_PROC_DEF FOREIGN KEY (PROC_DEF_ID_) REFERENCES ACT_RE_PROCDEF(ID_)
);
CREATE INDEX ACT_IDX_TJOB_EXCEPTION ON ACT_RU_TIMER_JOB (EXCEPTION_STACK_ID_);
CREATE INDEX ACT_IDX_TJOB_EXECUTION_ID ON ACT_RU_TIMER_JOB (EXECUTION_ID_);
CREATE INDEX ACT_IDX_TJOB_PROC_DEF_ID ON ACT_RU_TIMER_JOB (PROC_DEF_ID_);
CREATE INDEX ACT_IDX_TJOB_PROC_INST_ID ON ACT_RU_TIMER_JOB (PROCESS_INSTANCE_ID_);
CREATE UNIQUE INDEX INDEX33555901 ON ACT_RU_TIMER_JOB (ID_);
CREATE INDEX INDEX33555985 ON ACT_RU_TIMER_JOB (EXECUTION_ID_);
CREATE INDEX INDEX33555987 ON ACT_RU_TIMER_JOB (PROCESS_INSTANCE_ID_);
CREATE INDEX INDEX33555989 ON ACT_RU_TIMER_JOB (PROC_DEF_ID_);
CREATE INDEX INDEX33555991 ON ACT_RU_TIMER_JOB (EXCEPTION_STACK_ID_);


-- SYSDBA.ACT_RU_VARIABLE definition

CREATE TABLE ACT_RU_VARIABLE (
                                 ID_ NVARCHAR2(256) NOT NULL,
                                 REV_ INTEGER NULL,
                                 TYPE_ NVARCHAR2(1020) NOT NULL,
                                 NAME_ NVARCHAR2(1020) NOT NULL,
                                 EXECUTION_ID_ NVARCHAR2(256) NULL,
                                 PROC_INST_ID_ NVARCHAR2(256) NULL,
                                 TASK_ID_ NVARCHAR2(256) NULL,
                                 BYTEARRAY_ID_ NVARCHAR2(256) NULL,
                                 DOUBLE_ NUMBER(38,10) NULL,
                                 LONG_ NUMBER(19,0) NULL,
                                 TEXT_ NVARCHAR2(8000) NULL,
                                 TEXT2_ NVARCHAR2(8000) NULL,
                                 CONSTRAINT CONS134219052 PRIMARY KEY (ID_),
                                 CONSTRAINT ACT_FK_VAR_BYTEARRAY FOREIGN KEY (BYTEARRAY_ID_) REFERENCES ACT_GE_BYTEARRAY(ID_),
                                 CONSTRAINT ACT_FK_VAR_EXE FOREIGN KEY (EXECUTION_ID_) REFERENCES ACT_RU_EXECUTION(ID_),
                                 CONSTRAINT ACT_FK_VAR_PROCINST FOREIGN KEY (PROC_INST_ID_) REFERENCES ACT_RU_EXECUTION(ID_)
);
CREATE INDEX ACT_IDX_VARIABLE_TASK_ID ON ACT_RU_VARIABLE (TASK_ID_);
CREATE INDEX ACT_IDX_VAR_BYTEARRAY ON ACT_RU_VARIABLE (BYTEARRAY_ID_);
CREATE INDEX ACT_IDX_VAR_EXE ON ACT_RU_VARIABLE (EXECUTION_ID_);
CREATE INDEX ACT_IDX_VAR_PROCINST ON ACT_RU_VARIABLE (PROC_INST_ID_);
CREATE UNIQUE INDEX INDEX33555913 ON ACT_RU_VARIABLE (ID_);
CREATE INDEX INDEX33555971 ON ACT_RU_VARIABLE (EXECUTION_ID_);
CREATE INDEX INDEX33555973 ON ACT_RU_VARIABLE (PROC_INST_ID_);
CREATE INDEX INDEX33555975 ON ACT_RU_VARIABLE (BYTEARRAY_ID_);


-- SYSDBA.ACT_RU_DEADLETTER_JOB definition

CREATE TABLE ACT_RU_DEADLETTER_JOB (
                                       ID_ NVARCHAR2(256) NOT NULL,
                                       REV_ INTEGER NULL,
                                       TYPE_ NVARCHAR2(1020) NOT NULL,
                                       EXCLUSIVE_ NUMBER(1,0) NULL,
                                       EXECUTION_ID_ NVARCHAR2(256) NULL,
                                       PROCESS_INSTANCE_ID_ NVARCHAR2(256) NULL,
                                       PROC_DEF_ID_ NVARCHAR2(256) NULL,
                                       EXCEPTION_STACK_ID_ NVARCHAR2(256) NULL,
                                       EXCEPTION_MSG_ NVARCHAR2(8000) NULL,
                                       DUEDATE_ TIMESTAMP NULL,
                                       REPEAT_ NVARCHAR2(1020) NULL,
                                       HANDLER_TYPE_ NVARCHAR2(1020) NULL,
                                       HANDLER_CFG_ NVARCHAR2(8000) NULL,
                                       TENANT_ID_ NVARCHAR2(1020) DEFAULT '' NULL,
                                       CONSTRAINT CONS134219046 PRIMARY KEY (ID_),
                                       CONSTRAINT ACT_FK_DJOB_EXCEPTION FOREIGN KEY (EXCEPTION_STACK_ID_) REFERENCES ACT_GE_BYTEARRAY(ID_),
                                       CONSTRAINT ACT_FK_DJOB_EXECUTION FOREIGN KEY (EXECUTION_ID_) REFERENCES ACT_RU_EXECUTION(ID_),
                                       CONSTRAINT ACT_FK_DJOB_PROCESS_INSTANCE FOREIGN KEY (PROCESS_INSTANCE_ID_) REFERENCES ACT_RU_EXECUTION(ID_),
                                       CONSTRAINT ACT_FK_DJOB_PROC_DEF FOREIGN KEY (PROC_DEF_ID_) REFERENCES ACT_RE_PROCDEF(ID_)
);
CREATE INDEX ACT_IDX_DJOB_EXCEPTION ON ACT_RU_DEADLETTER_JOB (EXCEPTION_STACK_ID_);
CREATE INDEX ACT_IDX_DJOB_EXECUTION_ID ON ACT_RU_DEADLETTER_JOB (EXECUTION_ID_);
CREATE INDEX ACT_IDX_DJOB_PROC_DEF_ID ON ACT_RU_DEADLETTER_JOB (PROC_DEF_ID_);
CREATE INDEX ACT_IDX_DJOB_PROC_INST_ID ON ACT_RU_DEADLETTER_JOB (PROCESS_INSTANCE_ID_);
CREATE UNIQUE INDEX INDEX33555905 ON ACT_RU_DEADLETTER_JOB (ID_);
CREATE INDEX INDEX33556001 ON ACT_RU_DEADLETTER_JOB (EXECUTION_ID_);
CREATE INDEX INDEX33556003 ON ACT_RU_DEADLETTER_JOB (PROCESS_INSTANCE_ID_);
CREATE INDEX INDEX33556005 ON ACT_RU_DEADLETTER_JOB (PROC_DEF_ID_);
CREATE INDEX INDEX33556007 ON ACT_RU_DEADLETTER_JOB (EXCEPTION_STACK_ID_);


-- SYSDBA.ACT_RU_EVENT_SUBSCR definition

CREATE TABLE ACT_RU_EVENT_SUBSCR (
                                     ID_ NVARCHAR2(256) NOT NULL,
                                     REV_ INTEGER NULL,
                                     EVENT_TYPE_ NVARCHAR2(1020) NOT NULL,
                                     EVENT_NAME_ NVARCHAR2(1020) NULL,
                                     EXECUTION_ID_ NVARCHAR2(256) NULL,
                                     PROC_INST_ID_ NVARCHAR2(256) NULL,
                                     ACTIVITY_ID_ NVARCHAR2(256) NULL,
                                     CONFIGURATION_ NVARCHAR2(1020) NULL,
                                     CREATED_ TIMESTAMP NOT NULL,
                                     PROC_DEF_ID_ NVARCHAR2(256) NULL,
                                     TENANT_ID_ NVARCHAR2(1020) DEFAULT '' NULL,
                                     CONSTRAINT CONS134219053 PRIMARY KEY (ID_),
                                     CONSTRAINT ACT_FK_EVENT_EXEC FOREIGN KEY (EXECUTION_ID_) REFERENCES ACT_RU_EXECUTION(ID_)
);
CREATE INDEX ACT_IDX_EVENT_SUBSCR ON ACT_RU_EVENT_SUBSCR (EXECUTION_ID_);
CREATE INDEX ACT_IDX_EVENT_SUBSCR_CONFIG_ ON ACT_RU_EVENT_SUBSCR (CONFIGURATION_);
CREATE UNIQUE INDEX INDEX33555915 ON ACT_RU_EVENT_SUBSCR (ID_);
CREATE INDEX INDEX33556009 ON ACT_RU_EVENT_SUBSCR (EXECUTION_ID_);


-- SYSDBA.ACT_RU_IDENTITYLINK definition

CREATE TABLE ACT_RU_IDENTITYLINK (
                                     ID_ NVARCHAR2(256) NOT NULL,
                                     REV_ INTEGER NULL,
                                     GROUP_ID_ NVARCHAR2(1020) NULL,
                                     TYPE_ NVARCHAR2(1020) NULL,
                                     USER_ID_ NVARCHAR2(1020) NULL,
                                     TASK_ID_ NVARCHAR2(256) NULL,
                                     PROC_INST_ID_ NVARCHAR2(256) NULL,
                                     PROC_DEF_ID_ NVARCHAR2(256) NULL,
                                     CONSTRAINT CONS134219051 PRIMARY KEY (ID_),
                                     CONSTRAINT ACT_FK_ATHRZ_PROCEDEF FOREIGN KEY (PROC_DEF_ID_) REFERENCES ACT_RE_PROCDEF(ID_),
                                     CONSTRAINT ACT_FK_IDL_PROCINST FOREIGN KEY (PROC_INST_ID_) REFERENCES ACT_RU_EXECUTION(ID_),
                                     CONSTRAINT ACT_FK_TSKASS_TASK FOREIGN KEY (TASK_ID_) REFERENCES ACT_RU_TASK(ID_)
);
CREATE INDEX ACT_IDX_ATHRZ_PROCEDEF ON ACT_RU_IDENTITYLINK (PROC_DEF_ID_);
CREATE INDEX ACT_IDX_IDENT_LNK_GROUP ON ACT_RU_IDENTITYLINK (GROUP_ID_);
CREATE INDEX ACT_IDX_IDENT_LNK_USER ON ACT_RU_IDENTITYLINK (USER_ID_);
CREATE INDEX ACT_IDX_IDL_PROCINST ON ACT_RU_IDENTITYLINK (PROC_INST_ID_);
CREATE INDEX ACT_IDX_TSKASS_TASK ON ACT_RU_IDENTITYLINK (TASK_ID_);
CREATE UNIQUE INDEX INDEX33555911 ON ACT_RU_IDENTITYLINK (ID_);
CREATE INDEX INDEX33555959 ON ACT_RU_IDENTITYLINK (TASK_ID_);
CREATE INDEX INDEX33555961 ON ACT_RU_IDENTITYLINK (PROC_DEF_ID_);
CREATE INDEX INDEX33555963 ON ACT_RU_IDENTITYLINK (PROC_INST_ID_);




-- SYSDBA.SYS_DEPT definition

CREATE TABLE SYS_DEPT (
                          ID NUMBER(10,0) NOT NULL,
                          NAME VARCHAR2(30) NULL,
                          CODE VARCHAR2(50) NULL,
                          PID NUMBER(10,0) DEFAULT (-1) NULL,
                          ANCESTORS VARCHAR2(500) NULL,
                          STATUS NUMBER(1,0) DEFAULT 0 NULL,
                          SORT NUMBER(5,0) DEFAULT 0 NULL,
                          REMARK VARCHAR2(500) NULL,
                          CREATE_BY VARCHAR2(32) NULL,
                          CREATE_TIME TIMESTAMP NULL,
                          UPDATE_BY VARCHAR2(32) NULL,
                          UPDATE_TIME TIMESTAMP NULL,
                          CONSTRAINT CONS134219109 PRIMARY KEY (ID)
);
CREATE INDEX IDX_CODE ON SYS_DEPT (CODE);
CREATE INDEX IDX_PARENT_ID ON SYS_DEPT (PID);
CREATE UNIQUE INDEX INDEX33556065 ON SYS_DEPT (ID);


-- SYSDBA.SYS_MENU definition

CREATE TABLE SYS_MENU (
                          ID NUMBER(19,0) NOT NULL,
                          PID NUMBER(19,0) NULL,
                          NAME VARCHAR2(32) NULL,
                          URL VARCHAR2(128) NULL,
                          "PERM" VARCHAR2(128) NULL,
                          ICON VARCHAR2(32) NULL,
                          SEQ NUMBER(5,0) NULL,
                          REMARK VARCHAR2(128) NULL,
                          "TYPE" NUMBER(1,0) NULL,
                          CREATE_TIME TIMESTAMP NULL,
                          CREATE_BY VARCHAR2(32) NULL,
                          UPDATE_TIME TIMESTAMP NULL,
                          UPDATE_BY VARCHAR2(32) NULL,
                          CONSTRAINT CONS134219110 PRIMARY KEY (ID)
);
CREATE UNIQUE INDEX INDEX33556069 ON SYS_MENU (ID);


-- SYSDBA.SYS_ROLE definition

CREATE TABLE SYS_ROLE (
                          ID NUMBER(10,0) NOT NULL,
                          CODE VARCHAR2(100) NOT NULL,
                          NAME VARCHAR2(200) NULL,
                          STATUS NUMBER(1,0) DEFAULT 0 NULL,
                          REMARK VARCHAR2(500) NULL,
                          CREATE_BY VARCHAR2(32) NULL,
                          CREATE_TIME TIMESTAMP NULL,
                          UPDATE_BY VARCHAR2(32) NULL,
                          UPDATE_TIME TIMESTAMP NULL,
                          CONSTRAINT CONS134219111 PRIMARY KEY (ID)
);
CREATE UNIQUE INDEX INDEX33556071 ON SYS_ROLE (ID);
CREATE UNIQUE INDEX INDEX33556072 ON SYS_ROLE (CODE);


-- SYSDBA.SYS_ROLE_MENU definition

CREATE TABLE SYS_ROLE_MENU (
                               ID NUMBER(19,0) NOT NULL,
                               ROLE_ID NUMBER(19,0) NULL,
                               MENU_ID NUMBER(19,0) NULL,
                               REMARK VARCHAR2(128) NULL,
                               CREATE_TIME TIMESTAMP NULL,
                               CREATE_BY VARCHAR2(32) NULL,
                               UPDATE_TIME TIMESTAMP NULL,
                               UPDATE_BY VARCHAR2(32) NULL,
                               CONSTRAINT CONS134219113 PRIMARY KEY (ID)
);
CREATE UNIQUE INDEX INDEX33556074 ON SYS_ROLE_MENU (ID);


-- SYSDBA.SYS_USER definition

CREATE TABLE SYS_USER (
                          ID NUMBER(10,0) NOT NULL,
                          USERNAME VARCHAR2(255) NULL,
                          PASSWORD VARCHAR2(255) NULL,
                          NICK_NAME VARCHAR2(255) NULL,
                          EMAIL VARCHAR2(255) NULL,
                          PHONE VARCHAR2(255) NULL,
                          SEX VARCHAR2(255) NULL,
                          AVATAR VARCHAR2(200) NULL,
                          DEPT_ID NUMBER(10,0) NULL,
                          JOB_ID NUMBER(10,0) NULL,
                          STATE NUMBER(1,0) DEFAULT 0 NULL,
                          LAST_LOGIN_TIME TIMESTAMP NULL,
                          CREATE_TIME TIMESTAMP NULL,
                          UPDATE_TIME TIMESTAMP NULL,
                          CREATE_BY VARCHAR2(32) NULL,
                          UPDATE_BY VARCHAR2(32) NULL,
                          REMARK VARCHAR2(500) NULL,
                          SUPER_ADMIN NUMBER(1,0) NULL,
                          CONSTRAINT CONS134219118 PRIMARY KEY (ID)
);
CREATE INDEX CREATE_TIME_IDX ON SYS_USER (CREATE_TIME);
CREATE INDEX DEPT_IDX ON SYS_USER (DEPT_ID);
CREATE INDEX EMAIL_IDX ON SYS_USER (EMAIL);
CREATE UNIQUE INDEX INDEX33556082 ON SYS_USER (ID);
CREATE UNIQUE INDEX INDEX33556083 ON SYS_USER (USERNAME);
CREATE INDEX JOB_IDX ON SYS_USER (JOB_ID);
CREATE INDEX UPDATE_TIME_IDX ON SYS_USER (UPDATE_TIME);
CREATE INDEX USERNAME_IDX ON SYS_USER (USERNAME);


-- SYSDBA.SYS_USER_DEPT definition

CREATE TABLE SYS_USER_DEPT (
                               ID NUMBER(10,0) NOT NULL,
                               USER_ID NUMBER(10,0) NULL,
                               DEPT_ID NUMBER(10,0) NULL,
                               CREATE_BY VARCHAR2(32) NULL,
                               CREATE_TIME TIMESTAMP NULL,
                               UPDATE_BY VARCHAR2(32) NULL,
                               UPDATE_TIME TIMESTAMP NULL,
                               CONSTRAINT CONS134219120 PRIMARY KEY (ID)
);
CREATE UNIQUE INDEX INDEX33556091 ON SYS_USER_DEPT (ID);


-- SYSDBA.SYS_USER_ROLE definition

CREATE TABLE SYS_USER_ROLE (
                               ID NUMBER(10,0) NOT NULL,
                               USER_ID NUMBER(10,0) NOT NULL,
                               ROLE_ID NUMBER(10,0) NOT NULL,
                               CREATE_BY VARCHAR2(32) NULL,
                               CREATE_TIME TIMESTAMP NULL,
                               UPDATE_BY VARCHAR2(32) NULL,
                               UPDATE_TIME TIMESTAMP NULL,
                               CONSTRAINT CONS134219121 PRIMARY KEY (ID)
);
CREATE UNIQUE INDEX INDEX33556093 ON SYS_USER_ROLE (ID);






INSERT INTO ACT_EVT_LOG
(LOG_NR_, TYPE_, PROC_DEF_ID_, PROC_INST_ID_, EXECUTION_ID_, TASK_ID_, TIME_STAMP_, USER_ID_, DATA_, LOCK_OWNER_, LOCK_TIME_, IS_PROCESSED_)
VALUES(0, '', '', '', '', '', '', '', '', '', '', 0);
INSERT INTO ACT_GE_BYTEARRAY
(ID_, REV_, NAME_, DEPLOYMENT_ID_, BYTES_, GENERATED_)
VALUES('', 0, '', '', '', 0);
INSERT INTO ACT_GE_PROPERTY
(NAME_, VALUE_, REV_)
VALUES('', '', 0);
INSERT INTO ACT_HI_ACTINST
(ID_, PROC_DEF_ID_, PROC_INST_ID_, EXECUTION_ID_, ACT_ID_, TASK_ID_, CALL_PROC_INST_ID_, ACT_NAME_, ACT_TYPE_, ASSIGNEE_, START_TIME_, END_TIME_, DURATION_, DELETE_REASON_, TENANT_ID_)
VALUES('', '', '', '', '', '', '', '', '', '', '', '', 0, '', '');
INSERT INTO ACT_HI_ATTACHMENT
(ID_, REV_, USER_ID_, NAME_, DESCRIPTION_, TYPE_, TASK_ID_, PROC_INST_ID_, URL_, CONTENT_ID_, TIME_)
VALUES('', 0, '', '', '', '', '', '', '', '', '');
INSERT INTO ACT_HI_COMMENT
(ID_, TYPE_, TIME_, USER_ID_, TASK_ID_, PROC_INST_ID_, ACTION_, MESSAGE_, FULL_MSG_)
VALUES('', '', '', '', '', '', '', '', '');
INSERT INTO ACT_HI_DETAIL
(ID_, TYPE_, PROC_INST_ID_, EXECUTION_ID_, TASK_ID_, ACT_INST_ID_, NAME_, VAR_TYPE_, REV_, TIME_, BYTEARRAY_ID_, DOUBLE_, LONG_, TEXT_, TEXT2_)
VALUES('', '', '', '', '', '', '', '', 0, '', '', 0, 0, '', '');
INSERT INTO ACT_HI_IDENTITYLINK
(ID_, GROUP_ID_, TYPE_, USER_ID_, TASK_ID_, PROC_INST_ID_)
VALUES('', '', '', '', '', '');
INSERT INTO ACT_HI_PROCINST
(ID_, PROC_INST_ID_, BUSINESS_KEY_, PROC_DEF_ID_, START_TIME_, END_TIME_, DURATION_, START_USER_ID_, START_ACT_ID_, END_ACT_ID_, SUPER_PROCESS_INSTANCE_ID_, DELETE_REASON_, TENANT_ID_, NAME_)
VALUES('', '', '', '', '', '', 0, '', '', '', '', '', '', '');
INSERT INTO ACT_HI_TASKINST
(ID_, PROC_DEF_ID_, TASK_DEF_KEY_, PROC_INST_ID_, EXECUTION_ID_, PARENT_TASK_ID_, NAME_, DESCRIPTION_, OWNER_, ASSIGNEE_, START_TIME_, CLAIM_TIME_, END_TIME_, DURATION_, DELETE_REASON_, PRIORITY_, DUE_DATE_, FORM_KEY_, CATEGORY_, TENANT_ID_)
VALUES('', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', 0, '', '', '', '');
INSERT INTO ACT_HI_VARINST
(ID_, PROC_INST_ID_, EXECUTION_ID_, TASK_ID_, NAME_, VAR_TYPE_, REV_, BYTEARRAY_ID_, DOUBLE_, LONG_, TEXT_, TEXT2_, CREATE_TIME_, LAST_UPDATED_TIME_)
VALUES('', '', '', '', '', '', 0, '', 0, 0, '', '', '', '');
INSERT INTO ACT_PROCDEF_INFO
(ID_, PROC_DEF_ID_, REV_, INFO_JSON_ID_)
VALUES('', '', 0, '');
INSERT INTO ACT_RE_DEPLOYMENT
(ID_, NAME_, CATEGORY_, KEY_, TENANT_ID_, DEPLOY_TIME_, ENGINE_VERSION_, PROJECT_RELEASE_VERSION_, VERSION_)
VALUES('', '', '', '', '', '', '', NULL, NULL);
INSERT INTO ACT_RE_MODEL
(ID_, REV_, NAME_, KEY_, CATEGORY_, CREATE_TIME_, LAST_UPDATE_TIME_, VERSION_, META_INFO_, DEPLOYMENT_ID_, EDITOR_SOURCE_VALUE_ID_, EDITOR_SOURCE_EXTRA_VALUE_ID_, TENANT_ID_)
VALUES('', 0, '', '', '', '', '', 0, '', '', '', '', '');
INSERT INTO ACT_RE_PROCDEF
(ID_, REV_, CATEGORY_, NAME_, KEY_, VERSION_, DEPLOYMENT_ID_, RESOURCE_NAME_, DGRM_RESOURCE_NAME_, DESCRIPTION_, HAS_START_FORM_KEY_, HAS_GRAPHICAL_NOTATION_, SUSPENSION_STATE_, TENANT_ID_, ENGINE_VERSION_, APP_VERSION_)
VALUES('', 0, '', '', '', 0, '', '', '', '', 0, 0, 0, '', '', '');
INSERT INTO ACT_RU_DEADLETTER_JOB
(ID_, REV_, TYPE_, EXCLUSIVE_, EXECUTION_ID_, PROCESS_INSTANCE_ID_, PROC_DEF_ID_, EXCEPTION_STACK_ID_, EXCEPTION_MSG_, DUEDATE_, REPEAT_, HANDLER_TYPE_, HANDLER_CFG_, TENANT_ID_)
VALUES('', 0, '', 0, '', '', '', '', '', '', '', '', '', '');
INSERT INTO ACT_RU_EVENT_SUBSCR
(ID_, REV_, EVENT_TYPE_, EVENT_NAME_, EXECUTION_ID_, PROC_INST_ID_, ACTIVITY_ID_, CONFIGURATION_, CREATED_, PROC_DEF_ID_, TENANT_ID_)
VALUES('', 0, '', '', '', '', '', '', '', '', '');
INSERT INTO ACT_RU_EXECUTION
(ID_, REV_, PROC_INST_ID_, BUSINESS_KEY_, PARENT_ID_, PROC_DEF_ID_, SUPER_EXEC_, ROOT_PROC_INST_ID_, ACT_ID_, IS_ACTIVE_, IS_CONCURRENT_, IS_SCOPE_, IS_EVENT_SCOPE_, IS_MI_ROOT_, SUSPENSION_STATE_, CACHED_ENT_STATE_, TENANT_ID_, NAME_, START_TIME_, START_USER_ID_, LOCK_TIME_, IS_COUNT_ENABLED_, EVT_SUBSCR_COUNT_, TASK_COUNT_, JOB_COUNT_, TIMER_JOB_COUNT_, SUSP_JOB_COUNT_, DEADLETTER_JOB_COUNT_, VAR_COUNT_, ID_LINK_COUNT_)
VALUES('', 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO ACT_RU_IDENTITYLINK
(ID_, REV_, GROUP_ID_, TYPE_, USER_ID_, TASK_ID_, PROC_INST_ID_, PROC_DEF_ID_)
VALUES('', 0, '', '', '', '', '', '');
INSERT INTO ACT_RU_INTEGRATION
(ID_, EXECUTION_ID_, PROCESS_INSTANCE_ID_, PROC_DEF_ID_, FLOW_NODE_ID_, CREATED_DATE_)
VALUES('', '', '', '', '', '');
INSERT INTO ACT_RU_JOB
(ID_, REV_, TYPE_, LOCK_EXP_TIME_, LOCK_OWNER_, EXCLUSIVE_, EXECUTION_ID_, PROCESS_INSTANCE_ID_, PROC_DEF_ID_, RETRIES_, EXCEPTION_STACK_ID_, EXCEPTION_MSG_, DUEDATE_, REPEAT_, HANDLER_TYPE_, HANDLER_CFG_, TENANT_ID_)
VALUES('', 0, '', '', '', 0, '', '', '', 0, '', '', '', '', '', '', '');
INSERT INTO ACT_RU_SUSPENDED_JOB
(ID_, REV_, TYPE_, EXCLUSIVE_, EXECUTION_ID_, PROCESS_INSTANCE_ID_, PROC_DEF_ID_, RETRIES_, EXCEPTION_STACK_ID_, EXCEPTION_MSG_, DUEDATE_, REPEAT_, HANDLER_TYPE_, HANDLER_CFG_, TENANT_ID_)
VALUES('', 0, '', 0, '', '', '', 0, '', '', '', '', '', '', '');
INSERT INTO ACT_RU_TASK
(ID_, REV_, EXECUTION_ID_, PROC_INST_ID_, PROC_DEF_ID_, NAME_, PARENT_TASK_ID_, DESCRIPTION_, TASK_DEF_KEY_, OWNER_, ASSIGNEE_, DELEGATION_, PRIORITY_, CREATE_TIME_, DUE_DATE_, CATEGORY_, SUSPENSION_STATE_, TENANT_ID_, FORM_KEY_, CLAIM_TIME_)
VALUES('', 0, '', '', '', '', '', '', '', '', '', '', 0, '', '', '', 0, '', '', '');
INSERT INTO ACT_RU_TIMER_JOB
(ID_, REV_, TYPE_, LOCK_EXP_TIME_, LOCK_OWNER_, EXCLUSIVE_, EXECUTION_ID_, PROCESS_INSTANCE_ID_, PROC_DEF_ID_, RETRIES_, EXCEPTION_STACK_ID_, EXCEPTION_MSG_, DUEDATE_, REPEAT_, HANDLER_TYPE_, HANDLER_CFG_, TENANT_ID_)
VALUES('', 0, '', '', '', 0, '', '', '', 0, '', '', '', '', '', '', '');
INSERT INTO ACT_RU_VARIABLE
(ID_, REV_, TYPE_, NAME_, EXECUTION_ID_, PROC_INST_ID_, TASK_ID_, BYTEARRAY_ID_, DOUBLE_, LONG_, TEXT_, TEXT2_)
VALUES('', 0, '', '', '', '', '', '', 0, 0, '', '');
INSERT INTO HISTOGRAMS_TABLE
()
VALUES();
INSERT INTO OAUTH_ACCESS_TOKEN
(TOKEN_ID, TOKEN, AUTHENTICATION_ID, USER_NAME, CLIENT_ID, AUTHENTICATION, REFRESH_TOKEN)
VALUES('', '', '', '', '', '', '');
INSERT INTO OAUTH_CLIENT_DETAILS
(CLIENT_ID, RESOURCE_IDS, CLIENT_SECRET, "SCOPE", AUTHORIZED_GRANT_TYPES, WEB_SERVER_REDIRECT_URI, AUTHORITIES, ACCESS_TOKEN_VALIDITY, REFRESH_TOKEN_VALIDITY, ADDITIONAL_INFORMATION, AUTOAPPROVE)
VALUES('', '', '', '', '', '', '', 0, 0, '', '');
INSERT INTO OAUTH_REFRESH_TOKEN
(TOKEN_ID, TOKEN, AUTHENTICATION)
VALUES('', '', '');





INSERT INTO SYS_DEPT
(ID, NAME, CODE, PID, ANCESTORS, STATUS, SORT, REMARK, CREATE_BY, CREATE_TIME, UPDATE_BY, UPDATE_TIME)
VALUES(0, '', '', (-1), '', 0, 0, '', '', '', '', '');
INSERT INTO SYS_MENU
(ID, PID, NAME, URL, "PERM", ICON, SEQ, REMARK, "TYPE", CREATE_TIME, CREATE_BY, UPDATE_TIME, UPDATE_BY)
VALUES(0, 0, '', '', '', '', 0, '', 0, '', '', '', '');
INSERT INTO SYS_ROLE
(ID, CODE, NAME, STATUS, REMARK, CREATE_BY, CREATE_TIME, UPDATE_BY, UPDATE_TIME)
VALUES(0, '', '', 0, '', '', '', '', '');
INSERT INTO SYS_ROLE_MENU
(ID, ROLE_ID, MENU_ID, REMARK, CREATE_TIME, CREATE_BY, UPDATE_TIME, UPDATE_BY)
VALUES(0, 0, 0, '', '', '', '', '');
INSERT INTO SYS_USER
(ID, USERNAME, PASSWORD, NICK_NAME, EMAIL, PHONE, SEX, AVATAR, DEPT_ID, JOB_ID, STATE, LAST_LOGIN_TIME, CREATE_TIME, UPDATE_TIME, CREATE_BY, UPDATE_BY, REMARK, SUPER_ADMIN)
VALUES(0, '', '', '', '', '', '', '', 0, 0, 0, '', '', '', '', '', '', 0);
INSERT INTO SYS_USER_DEPT
(ID, USER_ID, DEPT_ID, CREATE_BY, CREATE_TIME, UPDATE_BY, UPDATE_TIME)
VALUES(0, 0, 0, '', '', '', '');
INSERT INTO SYS_USER_ROLE
(ID, USER_ID, ROLE_ID, CREATE_BY, CREATE_TIME, UPDATE_BY, UPDATE_TIME)
VALUES(0, 0, 0, '', '', '', '');