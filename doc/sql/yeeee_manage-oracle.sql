
create table ACT_GE_PROPERTY (
                                 NAME_ NVARCHAR2(64),
                                 VALUE_ NVARCHAR2(300),
                                 REV_ INTEGER,
                                 primary key (NAME_)
);

insert into ACT_GE_PROPERTY
values ('schema.version', '7.0.0.0', 1);

insert into ACT_GE_PROPERTY
values ('schema.history', 'create(7.0.0.0)', 1);

insert into ACT_GE_PROPERTY
values ('next.dbid', '1', 1);

create table ACT_GE_BYTEARRAY (
                                  ID_ NVARCHAR2(64),
                                  REV_ INTEGER,
                                  NAME_ NVARCHAR2(255),
                                  DEPLOYMENT_ID_ NVARCHAR2(64),
                                  BYTES_ BLOB,
                                  GENERATED_ NUMBER(1,0) CHECK (GENERATED_ IN (1,0)),
                                  primary key (ID_)
);

create table ACT_RE_DEPLOYMENT (
                                   ID_ NVARCHAR2(64),
                                   NAME_ NVARCHAR2(255),
                                   CATEGORY_ NVARCHAR2(255),
                                   KEY_ NVARCHAR2(255),
                                   TENANT_ID_ NVARCHAR2(255) DEFAULT '',
                                   DEPLOY_TIME_ TIMESTAMP(6),
                                   ENGINE_VERSION_ NVARCHAR2(255),
                                   PROJECT_RELEASE_VERSION_ VARCHAR(255) DEFAULT NULL NULL,
                                   VERSION_ VARCHAR(255) DEFAULT NULL NULL,
                                   primary key (ID_)
);

create table ACT_RE_MODEL (
                              ID_ NVARCHAR2(64) not null,
                              REV_ INTEGER,
                              NAME_ NVARCHAR2(255),
                              KEY_ NVARCHAR2(255),
                              CATEGORY_ NVARCHAR2(255),
                              CREATE_TIME_ TIMESTAMP(6),
                              LAST_UPDATE_TIME_ TIMESTAMP(6),
                              VERSION_ INTEGER,
                              META_INFO_ NVARCHAR2(2000),
                              DEPLOYMENT_ID_ NVARCHAR2(64),
                              EDITOR_SOURCE_VALUE_ID_ NVARCHAR2(64),
                              EDITOR_SOURCE_EXTRA_VALUE_ID_ NVARCHAR2(64),
                              TENANT_ID_ NVARCHAR2(255) DEFAULT '',
                              primary key (ID_)
);

create table ACT_RU_EXECUTION (
                                  ID_ NVARCHAR2(64),
                                  REV_ INTEGER,
                                  PROC_INST_ID_ NVARCHAR2(64),
                                  BUSINESS_KEY_ NVARCHAR2(255),
                                  PARENT_ID_ NVARCHAR2(64),
                                  PROC_DEF_ID_ NVARCHAR2(64),
                                  SUPER_EXEC_ NVARCHAR2(64),
                                  ROOT_PROC_INST_ID_ NVARCHAR2(64),
                                  ACT_ID_ NVARCHAR2(255),
                                  IS_ACTIVE_ NUMBER(1,0) CHECK (IS_ACTIVE_ IN (1,0)),
                                  IS_CONCURRENT_ NUMBER(1,0) CHECK (IS_CONCURRENT_ IN (1,0)),
                                  IS_SCOPE_ NUMBER(1,0) CHECK (IS_SCOPE_ IN (1,0)),
                                  IS_EVENT_SCOPE_ NUMBER(1,0) CHECK (IS_EVENT_SCOPE_ IN (1,0)),
                                  IS_MI_ROOT_ NUMBER(1,0) CHECK (IS_MI_ROOT_ IN (1,0)),
                                  SUSPENSION_STATE_ INTEGER,
                                  CACHED_ENT_STATE_ INTEGER,
                                  TENANT_ID_ NVARCHAR2(255) DEFAULT '',
                                  NAME_ NVARCHAR2(255),
                                  START_TIME_ TIMESTAMP(6),
                                  START_USER_ID_ NVARCHAR2(255),
                                  LOCK_TIME_ TIMESTAMP(6),
                                  IS_COUNT_ENABLED_ NUMBER(1,0) CHECK (IS_COUNT_ENABLED_ IN (1,0)),
                                  EVT_SUBSCR_COUNT_ INTEGER,
                                  TASK_COUNT_ INTEGER,
                                  JOB_COUNT_ INTEGER,
                                  TIMER_JOB_COUNT_ INTEGER,
                                  SUSP_JOB_COUNT_ INTEGER,
                                  DEADLETTER_JOB_COUNT_ INTEGER,
                                  VAR_COUNT_ INTEGER,
                                  ID_LINK_COUNT_ INTEGER,
                                  primary key (ID_)
);

create table ACT_RU_JOB (
                            ID_ NVARCHAR2(64) NOT NULL,
                            REV_ INTEGER,
                            TYPE_ NVARCHAR2(255) NOT NULL,
                            LOCK_EXP_TIME_ TIMESTAMP(6),
                            LOCK_OWNER_ NVARCHAR2(255),
                            EXCLUSIVE_ NUMBER(1,0) CHECK (EXCLUSIVE_ IN (1,0)),
                            EXECUTION_ID_ NVARCHAR2(64),
                            PROCESS_INSTANCE_ID_ NVARCHAR2(64),
                            PROC_DEF_ID_ NVARCHAR2(64),
                            RETRIES_ INTEGER,
                            EXCEPTION_STACK_ID_ NVARCHAR2(64),
                            EXCEPTION_MSG_ NVARCHAR2(2000),
                            DUEDATE_ TIMESTAMP(6),
                            REPEAT_ NVARCHAR2(255),
                            HANDLER_TYPE_ NVARCHAR2(255),
                            HANDLER_CFG_ NVARCHAR2(2000),
                            TENANT_ID_ NVARCHAR2(255) DEFAULT '',
                            primary key (ID_)
);

create table ACT_RU_TIMER_JOB (
                                  ID_ NVARCHAR2(64) NOT NULL,
                                  REV_ INTEGER,
                                  TYPE_ NVARCHAR2(255) NOT NULL,
                                  LOCK_EXP_TIME_ TIMESTAMP(6),
                                  LOCK_OWNER_ NVARCHAR2(255),
                                  EXCLUSIVE_ NUMBER(1,0) CHECK (EXCLUSIVE_ IN (1,0)),
                                  EXECUTION_ID_ NVARCHAR2(64),
                                  PROCESS_INSTANCE_ID_ NVARCHAR2(64),
                                  PROC_DEF_ID_ NVARCHAR2(64),
                                  RETRIES_ INTEGER,
                                  EXCEPTION_STACK_ID_ NVARCHAR2(64),
                                  EXCEPTION_MSG_ NVARCHAR2(2000),
                                  DUEDATE_ TIMESTAMP(6),
                                  REPEAT_ NVARCHAR2(255),
                                  HANDLER_TYPE_ NVARCHAR2(255),
                                  HANDLER_CFG_ NVARCHAR2(2000),
                                  TENANT_ID_ NVARCHAR2(255) DEFAULT '',
                                  primary key (ID_)
);

create table ACT_RU_SUSPENDED_JOB (
                                      ID_ NVARCHAR2(64) NOT NULL,
                                      REV_ INTEGER,
                                      TYPE_ NVARCHAR2(255) NOT NULL,
                                      EXCLUSIVE_ NUMBER(1,0) CHECK (EXCLUSIVE_ IN (1,0)),
                                      EXECUTION_ID_ NVARCHAR2(64),
                                      PROCESS_INSTANCE_ID_ NVARCHAR2(64),
                                      PROC_DEF_ID_ NVARCHAR2(64),
                                      RETRIES_ INTEGER,
                                      EXCEPTION_STACK_ID_ NVARCHAR2(64),
                                      EXCEPTION_MSG_ NVARCHAR2(2000),
                                      DUEDATE_ TIMESTAMP(6),
                                      REPEAT_ NVARCHAR2(255),
                                      HANDLER_TYPE_ NVARCHAR2(255),
                                      HANDLER_CFG_ NVARCHAR2(2000),
                                      TENANT_ID_ NVARCHAR2(255) DEFAULT '',
                                      primary key (ID_)
);

create table ACT_RU_DEADLETTER_JOB (
                                       ID_ NVARCHAR2(64) NOT NULL,
                                       REV_ INTEGER,
                                       TYPE_ NVARCHAR2(255) NOT NULL,
                                       EXCLUSIVE_ NUMBER(1,0) CHECK (EXCLUSIVE_ IN (1,0)),
                                       EXECUTION_ID_ NVARCHAR2(64),
                                       PROCESS_INSTANCE_ID_ NVARCHAR2(64),
                                       PROC_DEF_ID_ NVARCHAR2(64),
                                       EXCEPTION_STACK_ID_ NVARCHAR2(64),
                                       EXCEPTION_MSG_ NVARCHAR2(2000),
                                       DUEDATE_ TIMESTAMP(6),
                                       REPEAT_ NVARCHAR2(255),
                                       HANDLER_TYPE_ NVARCHAR2(255),
                                       HANDLER_CFG_ NVARCHAR2(2000),
                                       TENANT_ID_ NVARCHAR2(255) DEFAULT '',
                                       primary key (ID_)
);

create table ACT_RE_PROCDEF (
                                ID_ NVARCHAR2(64) NOT NULL,
                                REV_ INTEGER,
                                CATEGORY_ NVARCHAR2(255),
                                NAME_ NVARCHAR2(255),
                                KEY_ NVARCHAR2(255) NOT NULL,
                                VERSION_ INTEGER NOT NULL,
                                DEPLOYMENT_ID_ NVARCHAR2(64),
                                RESOURCE_NAME_ NVARCHAR2(2000),
                                DGRM_RESOURCE_NAME_ varchar(4000),
                                DESCRIPTION_ NVARCHAR2(2000),
                                HAS_START_FORM_KEY_ NUMBER(1,0) CHECK (HAS_START_FORM_KEY_ IN (1,0)),
                                HAS_GRAPHICAL_NOTATION_ NUMBER(1,0) CHECK (HAS_GRAPHICAL_NOTATION_ IN (1,0)),
                                SUSPENSION_STATE_ INTEGER,
                                TENANT_ID_ NVARCHAR2(255) DEFAULT '',
                                ENGINE_VERSION_ NVARCHAR2(255),
                                VERSION_ VARCHAR(255) DEFAULT NULL NULL,
                                primary key (ID_)
);

create table ACT_RU_TASK (
                             ID_ NVARCHAR2(64),
                             REV_ INTEGER,
                             EXECUTION_ID_ NVARCHAR2(64),
                             PROC_INST_ID_ NVARCHAR2(64),
                             PROC_DEF_ID_ NVARCHAR2(64),
                             NAME_ NVARCHAR2(255),
                             PARENT_TASK_ID_ NVARCHAR2(64),
                             DESCRIPTION_ NVARCHAR2(2000),
                             TASK_DEF_KEY_ NVARCHAR2(255),
                             OWNER_ NVARCHAR2(255),
                             ASSIGNEE_ NVARCHAR2(255),
                             DELEGATION_ NVARCHAR2(64),
                             PRIORITY_ INTEGER,
                             CREATE_TIME_ TIMESTAMP(6),
                             DUE_DATE_ TIMESTAMP(6),
                             CATEGORY_ NVARCHAR2(255),
                             SUSPENSION_STATE_ INTEGER,
                             TENANT_ID_ NVARCHAR2(255) DEFAULT '',
                             FORM_KEY_ NVARCHAR2(255),
                             CLAIM_TIME_ TIMESTAMP(6),
                             primary key (ID_)
);

create table ACT_RU_IDENTITYLINK (
                                     ID_ NVARCHAR2(64),
                                     REV_ INTEGER,
                                     GROUP_ID_ NVARCHAR2(255),
                                     TYPE_ NVARCHAR2(255),
                                     USER_ID_ NVARCHAR2(255),
                                     TASK_ID_ NVARCHAR2(64),
                                     PROC_INST_ID_ NVARCHAR2(64),
                                     PROC_DEF_ID_ NVARCHAR2(64),
                                     primary key (ID_)
);

create table ACT_RU_VARIABLE (
                                 ID_ NVARCHAR2(64) not null,
                                 REV_ INTEGER,
                                 TYPE_ NVARCHAR2(255) not null,
                                 NAME_ NVARCHAR2(255) not null,
                                 EXECUTION_ID_ NVARCHAR2(64),
                                 PROC_INST_ID_ NVARCHAR2(64),
                                 TASK_ID_ NVARCHAR2(64),
                                 BYTEARRAY_ID_ NVARCHAR2(64),
                                 DOUBLE_ NUMBER(*,10),
                                 LONG_ NUMBER(19,0),
                                 TEXT_ NVARCHAR2(2000),
                                 TEXT2_ NVARCHAR2(2000),
                                 primary key (ID_)
);

create table ACT_RU_EVENT_SUBSCR (
                                     ID_ NVARCHAR2(64) not null,
                                     REV_ integer,
                                     EVENT_TYPE_ NVARCHAR2(255) not null,
                                     EVENT_NAME_ NVARCHAR2(255),
                                     EXECUTION_ID_ NVARCHAR2(64),
                                     PROC_INST_ID_ NVARCHAR2(64),
                                     ACTIVITY_ID_ NVARCHAR2(64),
                                     CONFIGURATION_ NVARCHAR2(255),
                                     CREATED_ TIMESTAMP(6) not null,
                                     PROC_DEF_ID_ NVARCHAR2(64),
                                     TENANT_ID_ NVARCHAR2(255) DEFAULT '',
                                     primary key (ID_)
);

create table ACT_EVT_LOG (
                             LOG_NR_ NUMBER(19),
                             TYPE_ NVARCHAR2(64),
                             PROC_DEF_ID_ NVARCHAR2(64),
                             PROC_INST_ID_ NVARCHAR2(64),
                             EXECUTION_ID_ NVARCHAR2(64),
                             TASK_ID_ NVARCHAR2(64),
                             TIME_STAMP_ TIMESTAMP(6) not null,
                             USER_ID_ NVARCHAR2(255),
                             DATA_ BLOB,
                             LOCK_OWNER_ NVARCHAR2(255),
                             LOCK_TIME_ TIMESTAMP(6) null,
                             IS_PROCESSED_ NUMBER(3) default 0,
                             primary key (LOG_NR_)
);

create sequence act_evt_log_seq;

create table ACT_PROCDEF_INFO (
                                  ID_ NVARCHAR2(64) not null,
                                  PROC_DEF_ID_ NVARCHAR2(64) not null,
                                  REV_ integer,
                                  INFO_JSON_ID_ NVARCHAR2(64),
                                  primary key (ID_)
);

create table ACT_RU_INTEGRATION (
                                    ID_ NVARCHAR2(64) not null,
                                    EXECUTION_ID_ NVARCHAR2(64),
                                    PROCESS_INSTANCE_ID_ NVARCHAR2(64),
                                    PROC_DEF_ID_ NVARCHAR2(64),
                                    FLOW_NODE_ID_ NVARCHAR2(64),
                                    CREATED_DATE_ TIMESTAMP(6),
                                    primary key (ID_)
);

create index ACT_IDX_EXEC_BUSKEY on ACT_RU_EXECUTION(BUSINESS_KEY_);
create index ACT_IDX_EXEC_ROOT on ACT_RU_EXECUTION(ROOT_PROC_INST_ID_);
create index ACT_IDX_TASK_CREATE on ACT_RU_TASK(CREATE_TIME_);
create index ACT_IDX_IDENT_LNK_USER on ACT_RU_IDENTITYLINK(USER_ID_);
create index ACT_IDX_IDENT_LNK_GROUP on ACT_RU_IDENTITYLINK(GROUP_ID_);
create index ACT_IDX_EVENT_SUBSCR_CONFIG_ on ACT_RU_EVENT_SUBSCR(CONFIGURATION_);
create index ACT_IDX_VARIABLE_TASK_ID on ACT_RU_VARIABLE(TASK_ID_);

create index ACT_IDX_BYTEAR_DEPL on ACT_GE_BYTEARRAY(DEPLOYMENT_ID_);
alter table ACT_GE_BYTEARRAY
    add constraint ACT_FK_BYTEARR_DEPL
        foreign key (DEPLOYMENT_ID_)
            references ACT_RE_DEPLOYMENT (ID_);

alter table ACT_RE_PROCDEF
    add constraint ACT_UNIQ_PROCDEF
        unique (KEY_,VERSION_, TENANT_ID_);

create index ACT_IDX_EXE_PROCINST on ACT_RU_EXECUTION(PROC_INST_ID_);
alter table ACT_RU_EXECUTION
    add constraint ACT_FK_EXE_PROCINST
        foreign key (PROC_INST_ID_)
            references ACT_RU_EXECUTION (ID_);

create index ACT_IDX_EXE_PARENT on ACT_RU_EXECUTION(PARENT_ID_);
alter table ACT_RU_EXECUTION
    add constraint ACT_FK_EXE_PARENT
        foreign key (PARENT_ID_)
            references ACT_RU_EXECUTION (ID_);

create index ACT_IDX_EXE_SUPER on ACT_RU_EXECUTION(SUPER_EXEC_);
alter table ACT_RU_EXECUTION
    add constraint ACT_FK_EXE_SUPER
        foreign key (SUPER_EXEC_)
            references ACT_RU_EXECUTION (ID_);

create index ACT_IDX_EXE_PROCDEF on ACT_RU_EXECUTION(PROC_DEF_ID_);
alter table ACT_RU_EXECUTION
    add constraint ACT_FK_EXE_PROCDEF
        foreign key (PROC_DEF_ID_)
            references ACT_RE_PROCDEF (ID_);

create index ACT_IDX_TSKASS_TASK on ACT_RU_IDENTITYLINK(TASK_ID_);
alter table ACT_RU_IDENTITYLINK
    add constraint ACT_FK_TSKASS_TASK
        foreign key (TASK_ID_)
            references ACT_RU_TASK (ID_);

create index ACT_IDX_ATHRZ_PROCEDEF  on ACT_RU_IDENTITYLINK(PROC_DEF_ID_);
alter table ACT_RU_IDENTITYLINK
    add constraint ACT_FK_ATHRZ_PROCEDEF
        foreign key (PROC_DEF_ID_)
            references ACT_RE_PROCDEF (ID_);

create index ACT_IDX_IDL_PROCINST on ACT_RU_IDENTITYLINK(PROC_INST_ID_);
alter table ACT_RU_IDENTITYLINK
    add constraint ACT_FK_IDL_PROCINST
        foreign key (PROC_INST_ID_)
            references ACT_RU_EXECUTION (ID_);

create index ACT_IDX_TASK_EXEC on ACT_RU_TASK(EXECUTION_ID_);
alter table ACT_RU_TASK
    add constraint ACT_FK_TASK_EXE
        foreign key (EXECUTION_ID_)
            references ACT_RU_EXECUTION (ID_);

create index ACT_IDX_TASK_PROCINST on ACT_RU_TASK(PROC_INST_ID_);
alter table ACT_RU_TASK
    add constraint ACT_FK_TASK_PROCINST
        foreign key (PROC_INST_ID_)
            references ACT_RU_EXECUTION (ID_);

create index ACT_IDX_TASK_PROCDEF on ACT_RU_TASK(PROC_DEF_ID_);
alter table ACT_RU_TASK
    add constraint ACT_FK_TASK_PROCDEF
        foreign key (PROC_DEF_ID_)
            references ACT_RE_PROCDEF (ID_);

create index ACT_IDX_VAR_EXE on ACT_RU_VARIABLE(EXECUTION_ID_);
alter table ACT_RU_VARIABLE
    add constraint ACT_FK_VAR_EXE
        foreign key (EXECUTION_ID_)
            references ACT_RU_EXECUTION (ID_);

create index ACT_IDX_VAR_PROCINST on ACT_RU_VARIABLE(PROC_INST_ID_);
alter table ACT_RU_VARIABLE
    add constraint ACT_FK_VAR_PROCINST
        foreign key (PROC_INST_ID_)
            references ACT_RU_EXECUTION(ID_);

create index ACT_IDX_VAR_BYTEARRAY on ACT_RU_VARIABLE(BYTEARRAY_ID_);
alter table ACT_RU_VARIABLE
    add constraint ACT_FK_VAR_BYTEARRAY
        foreign key (BYTEARRAY_ID_)
            references ACT_GE_BYTEARRAY (ID_);

create index ACT_IDX_JOB_EXECUTION_ID on ACT_RU_JOB(EXECUTION_ID_);
alter table ACT_RU_JOB
    add constraint ACT_FK_JOB_EXECUTION
        foreign key (EXECUTION_ID_)
            references ACT_RU_EXECUTION (ID_);

create index ACT_IDX_JOB_PROC_INST_ID on ACT_RU_JOB(PROCESS_INSTANCE_ID_);
alter table ACT_RU_JOB
    add constraint ACT_FK_JOB_PROCESS_INSTANCE
        foreign key (PROCESS_INSTANCE_ID_)
            references ACT_RU_EXECUTION (ID_);

create index ACT_IDX_JOB_PROC_DEF_ID on ACT_RU_JOB(PROC_DEF_ID_);
alter table ACT_RU_JOB
    add constraint ACT_FK_JOB_PROC_DEF
        foreign key (PROC_DEF_ID_)
            references ACT_RE_PROCDEF (ID_);

create index ACT_IDX_JOB_EXCEPTION on ACT_RU_JOB(EXCEPTION_STACK_ID_);
alter table ACT_RU_JOB
    add constraint ACT_FK_JOB_EXCEPTION
        foreign key (EXCEPTION_STACK_ID_)
            references ACT_GE_BYTEARRAY (ID_);

create index ACT_IDX_TJOB_EXECUTION_ID on ACT_RU_TIMER_JOB(EXECUTION_ID_);
alter table ACT_RU_TIMER_JOB
    add constraint ACT_FK_TJOB_EXECUTION
        foreign key (EXECUTION_ID_)
            references ACT_RU_EXECUTION (ID_);

create index ACT_IDX_TJOB_PROC_INST_ID on ACT_RU_TIMER_JOB(PROCESS_INSTANCE_ID_);
alter table ACT_RU_TIMER_JOB
    add constraint ACT_FK_TJOB_PROCESS_INSTANCE
        foreign key (PROCESS_INSTANCE_ID_)
            references ACT_RU_EXECUTION (ID_);

create index ACT_IDX_TJOB_PROC_DEF_ID on ACT_RU_TIMER_JOB(PROC_DEF_ID_);
alter table ACT_RU_TIMER_JOB
    add constraint ACT_FK_TJOB_PROC_DEF
        foreign key (PROC_DEF_ID_)
            references ACT_RE_PROCDEF (ID_);

create index ACT_IDX_TJOB_EXCEPTION on ACT_RU_TIMER_JOB(EXCEPTION_STACK_ID_);
alter table ACT_RU_TIMER_JOB
    add constraint ACT_FK_TJOB_EXCEPTION
        foreign key (EXCEPTION_STACK_ID_)
            references ACT_GE_BYTEARRAY (ID_);

create index ACT_IDX_SJOB_EXECUTION_ID on ACT_RU_SUSPENDED_JOB(EXECUTION_ID_);
alter table ACT_RU_SUSPENDED_JOB
    add constraint ACT_FK_SJOB_EXECUTION
        foreign key (EXECUTION_ID_)
            references ACT_RU_EXECUTION (ID_);

create index ACT_IDX_SJOB_PROC_INST_ID on ACT_RU_SUSPENDED_JOB(PROCESS_INSTANCE_ID_);
alter table ACT_RU_SUSPENDED_JOB
    add constraint ACT_FK_SJOB_PROCESS_INSTANCE
        foreign key (PROCESS_INSTANCE_ID_)
            references ACT_RU_EXECUTION (ID_);

create index ACT_IDX_SJOB_PROC_DEF_ID on ACT_RU_SUSPENDED_JOB(PROC_DEF_ID_);
alter table ACT_RU_SUSPENDED_JOB
    add constraint ACT_FK_SJOB_PROC_DEF
        foreign key (PROC_DEF_ID_)
            references ACT_RE_PROCDEF (ID_);

create index ACT_IDX_SJOB_EXCEPTION on ACT_RU_SUSPENDED_JOB(EXCEPTION_STACK_ID_);
alter table ACT_RU_SUSPENDED_JOB
    add constraint ACT_FK_SJOB_EXCEPTION
        foreign key (EXCEPTION_STACK_ID_)
            references ACT_GE_BYTEARRAY (ID_);

create index ACT_IDX_DJOB_EXECUTION_ID on ACT_RU_DEADLETTER_JOB(EXECUTION_ID_);
alter table ACT_RU_DEADLETTER_JOB
    add constraint ACT_FK_DJOB_EXECUTION
        foreign key (EXECUTION_ID_)
            references ACT_RU_EXECUTION (ID_);

create index ACT_IDX_DJOB_PROC_INST_ID on ACT_RU_DEADLETTER_JOB(PROCESS_INSTANCE_ID_);
alter table ACT_RU_DEADLETTER_JOB
    add constraint ACT_FK_DJOB_PROCESS_INSTANCE
        foreign key (PROCESS_INSTANCE_ID_)
            references ACT_RU_EXECUTION (ID_);

create index ACT_IDX_DJOB_PROC_DEF_ID on ACT_RU_DEADLETTER_JOB(PROC_DEF_ID_);
alter table ACT_RU_DEADLETTER_JOB
    add constraint ACT_FK_DJOB_PROC_DEF
        foreign key (PROC_DEF_ID_)
            references ACT_RE_PROCDEF (ID_);

create index ACT_IDX_DJOB_EXCEPTION on ACT_RU_DEADLETTER_JOB(EXCEPTION_STACK_ID_);
alter table ACT_RU_DEADLETTER_JOB
    add constraint ACT_FK_DJOB_EXCEPTION
        foreign key (EXCEPTION_STACK_ID_)
            references ACT_GE_BYTEARRAY (ID_);

create index ACT_IDX_EVENT_SUBSCR on ACT_RU_EVENT_SUBSCR(EXECUTION_ID_);
alter table ACT_RU_EVENT_SUBSCR
    add constraint ACT_FK_EVENT_EXEC
        foreign key (EXECUTION_ID_)
            references ACT_RU_EXECUTION(ID_);

create index ACT_IDX_MODEL_SOURCE on ACT_RE_MODEL(EDITOR_SOURCE_VALUE_ID_);
alter table ACT_RE_MODEL
    add constraint ACT_FK_MODEL_SOURCE
        foreign key (EDITOR_SOURCE_VALUE_ID_)
            references ACT_GE_BYTEARRAY (ID_);

create index ACT_IDX_MODEL_SOURCE_EXTRA on ACT_RE_MODEL(EDITOR_SOURCE_EXTRA_VALUE_ID_);
alter table ACT_RE_MODEL
    add constraint ACT_FK_MODEL_SOURCE_EXTRA
        foreign key (EDITOR_SOURCE_EXTRA_VALUE_ID_)
            references ACT_GE_BYTEARRAY (ID_);

create index ACT_IDX_MODEL_DEPLOYMENT on ACT_RE_MODEL(DEPLOYMENT_ID_);
alter table ACT_RE_MODEL
    add constraint ACT_FK_MODEL_DEPLOYMENT
        foreign key (DEPLOYMENT_ID_)
            references ACT_RE_DEPLOYMENT (ID_);

create index ACT_IDX_PROCDEF_INFO_JSON on ACT_PROCDEF_INFO(INFO_JSON_ID_);
alter table ACT_PROCDEF_INFO
    add constraint ACT_FK_INFO_JSON_BA
        foreign key (INFO_JSON_ID_)
            references ACT_GE_BYTEARRAY (ID_);

create index ACT_IDX_PROCDEF_INFO_PROC on ACT_PROCDEF_INFO(PROC_DEF_ID_);
alter table ACT_PROCDEF_INFO
    add constraint ACT_FK_INFO_PROCDEF
        foreign key (PROC_DEF_ID_)
            references ACT_RE_PROCDEF (ID_);

alter table ACT_PROCDEF_INFO
    add constraint ACT_UNIQ_INFO_PROCDEF
        unique (PROC_DEF_ID_);

alter table ACT_RU_INTEGRATION
    add constraint ACT_FK_INT_EXECUTION
        foreign key (EXECUTION_ID_)
            references ACT_RU_EXECUTION (ID_)
            on delete cascade;

alter table ACT_RU_INTEGRATION
    add constraint ACT_FK_INT_PROC_INST
        foreign key (PROCESS_INSTANCE_ID_)
            references ACT_RU_EXECUTION (ID_);

alter table ACT_RU_INTEGRATION
    add constraint ACT_FK_INT_PROC_DEF
        foreign key (PROC_DEF_ID_)
            references ACT_RE_PROCDEF (ID_);




create table ACT_HI_PROCINST (
                                 ID_ NVARCHAR2(64) not null,
                                 PROC_INST_ID_ NVARCHAR2(64) not null,
                                 BUSINESS_KEY_ NVARCHAR2(255),
                                 PROC_DEF_ID_ NVARCHAR2(64) not null,
                                 START_TIME_ TIMESTAMP(6) not null,
                                 END_TIME_ TIMESTAMP(6),
                                 DURATION_ NUMBER(19,0),
                                 START_USER_ID_ NVARCHAR2(255),
                                 START_ACT_ID_ NVARCHAR2(255),
                                 END_ACT_ID_ NVARCHAR2(255),
                                 SUPER_PROCESS_INSTANCE_ID_ NVARCHAR2(64),
                                 DELETE_REASON_ NVARCHAR2(2000),
                                 TENANT_ID_ NVARCHAR2(255) default '',
                                 NAME_ NVARCHAR2(255),
                                 primary key (ID_),
                                 unique (PROC_INST_ID_)
);

create table ACT_HI_ACTINST (
                                ID_ NVARCHAR2(64) not null,
                                PROC_DEF_ID_ NVARCHAR2(64) not null,
                                PROC_INST_ID_ NVARCHAR2(64) not null,
                                EXECUTION_ID_ NVARCHAR2(64) not null,
                                ACT_ID_ NVARCHAR2(255) not null,
                                TASK_ID_ NVARCHAR2(64),
                                CALL_PROC_INST_ID_ NVARCHAR2(64),
                                ACT_NAME_ NVARCHAR2(255),
                                ACT_TYPE_ NVARCHAR2(255) not null,
                                ASSIGNEE_ NVARCHAR2(255),
                                START_TIME_ TIMESTAMP(6) not null,
                                END_TIME_ TIMESTAMP(6),
                                DURATION_ NUMBER(19,0),
                                DELETE_REASON_ NVARCHAR2(2000),
                                TENANT_ID_ NVARCHAR2(255) default '',
                                primary key (ID_)
);

create table ACT_HI_TASKINST (
                                 ID_ NVARCHAR2(64) not null,
                                 PROC_DEF_ID_ NVARCHAR2(64),
                                 TASK_DEF_KEY_ NVARCHAR2(255),
                                 PROC_INST_ID_ NVARCHAR2(64),
                                 EXECUTION_ID_ NVARCHAR2(64),
                                 PARENT_TASK_ID_ NVARCHAR2(64),
                                 NAME_ NVARCHAR2(255),
                                 DESCRIPTION_ NVARCHAR2(2000),
                                 OWNER_ NVARCHAR2(255),
                                 ASSIGNEE_ NVARCHAR2(255),
                                 START_TIME_ TIMESTAMP(6) not null,
                                 CLAIM_TIME_ TIMESTAMP(6),
                                 END_TIME_ TIMESTAMP(6),
                                 DURATION_ NUMBER(19,0),
                                 DELETE_REASON_ NVARCHAR2(2000),
                                 PRIORITY_ INTEGER,
                                 DUE_DATE_ TIMESTAMP(6),
                                 FORM_KEY_ NVARCHAR2(255),
                                 CATEGORY_ NVARCHAR2(255),
                                 TENANT_ID_ NVARCHAR2(255) default '',
                                 primary key (ID_)
);

create table ACT_HI_VARINST (
                                ID_ NVARCHAR2(64) not null,
                                PROC_INST_ID_ NVARCHAR2(64),
                                EXECUTION_ID_ NVARCHAR2(64),
                                TASK_ID_ NVARCHAR2(64),
                                NAME_ NVARCHAR2(255) not null,
                                VAR_TYPE_ NVARCHAR2(100),
                                REV_ INTEGER,
                                BYTEARRAY_ID_ NVARCHAR2(64),
                                DOUBLE_ NUMBER(*,10),
                                LONG_ NUMBER(19,0),
                                TEXT_ NVARCHAR2(2000),
                                TEXT2_ NVARCHAR2(2000),
                                CREATE_TIME_ TIMESTAMP(6),
                                LAST_UPDATED_TIME_ TIMESTAMP(6),
                                primary key (ID_)
);

create table ACT_HI_DETAIL (
                               ID_ NVARCHAR2(64) not null,
                               TYPE_ NVARCHAR2(255) not null,
                               PROC_INST_ID_ NVARCHAR2(64),
                               EXECUTION_ID_ NVARCHAR2(64),
                               TASK_ID_ NVARCHAR2(64),
                               ACT_INST_ID_ NVARCHAR2(64),
                               NAME_ NVARCHAR2(255) not null,
                               VAR_TYPE_ NVARCHAR2(64),
                               REV_ INTEGER,
                               TIME_ TIMESTAMP(6) not null,
                               BYTEARRAY_ID_ NVARCHAR2(64),
                               DOUBLE_ NUMBER(*,10),
                               LONG_ NUMBER(19,0),
                               TEXT_ NVARCHAR2(2000),
                               TEXT2_ NVARCHAR2(2000),
                               primary key (ID_)
);

create table ACT_HI_COMMENT (
                                ID_ NVARCHAR2(64) not null,
                                TYPE_ NVARCHAR2(255),
                                TIME_ TIMESTAMP(6) not null,
                                USER_ID_ NVARCHAR2(255),
                                TASK_ID_ NVARCHAR2(64),
                                PROC_INST_ID_ NVARCHAR2(64),
                                ACTION_ NVARCHAR2(255),
                                MESSAGE_ NVARCHAR2(2000),
                                FULL_MSG_ BLOB,
                                primary key (ID_)
);

create table ACT_HI_ATTACHMENT (
                                   ID_ NVARCHAR2(64) not null,
                                   REV_ INTEGER,
                                   USER_ID_ NVARCHAR2(255),
                                   NAME_ NVARCHAR2(255),
                                   DESCRIPTION_ NVARCHAR2(2000),
                                   TYPE_ NVARCHAR2(255),
                                   TASK_ID_ NVARCHAR2(64),
                                   PROC_INST_ID_ NVARCHAR2(64),
                                   URL_ NVARCHAR2(2000),
                                   CONTENT_ID_ NVARCHAR2(64),
                                   TIME_ TIMESTAMP(6),
                                   primary key (ID_)
);

create table ACT_HI_IDENTITYLINK (
                                     ID_ NVARCHAR2(64),
                                     GROUP_ID_ NVARCHAR2(255),
                                     TYPE_ NVARCHAR2(255),
                                     USER_ID_ NVARCHAR2(255),
                                     TASK_ID_ NVARCHAR2(64),
                                     PROC_INST_ID_ NVARCHAR2(64),
                                     primary key (ID_)
);

create index ACT_IDX_HI_PRO_INST_END on ACT_HI_PROCINST(END_TIME_);
create index ACT_IDX_HI_PRO_I_BUSKEY on ACT_HI_PROCINST(BUSINESS_KEY_);
create index ACT_IDX_HI_ACT_INST_START on ACT_HI_ACTINST(START_TIME_);
create index ACT_IDX_HI_ACT_INST_END on ACT_HI_ACTINST(END_TIME_);
create index ACT_IDX_HI_DETAIL_PROC_INST on ACT_HI_DETAIL(PROC_INST_ID_);
create index ACT_IDX_HI_DETAIL_ACT_INST on ACT_HI_DETAIL(ACT_INST_ID_);
create index ACT_IDX_HI_DETAIL_TIME on ACT_HI_DETAIL(TIME_);
create index ACT_IDX_HI_DETAIL_NAME on ACT_HI_DETAIL(NAME_);
create index ACT_IDX_HI_DETAIL_TASK_ID on ACT_HI_DETAIL(TASK_ID_);
create index ACT_IDX_HI_PROCVAR_PROC_INST on ACT_HI_VARINST(PROC_INST_ID_);
create index ACT_IDX_HI_PROCVAR_NAME_TYPE on ACT_HI_VARINST(NAME_, VAR_TYPE_);
create index ACT_IDX_HI_PROCVAR_TASK_ID on ACT_HI_VARINST(TASK_ID_);
create index ACT_IDX_HI_IDENT_LNK_USER on ACT_HI_IDENTITYLINK(USER_ID_);
create index ACT_IDX_HI_IDENT_LNK_TASK on ACT_HI_IDENTITYLINK(TASK_ID_);
create index ACT_IDX_HI_IDENT_LNK_PROCINST on ACT_HI_IDENTITYLINK(PROC_INST_ID_);

create index ACT_IDX_HI_ACT_INST_PROCINST on ACT_HI_ACTINST(PROC_INST_ID_, ACT_ID_);
create index ACT_IDX_HI_ACT_INST_EXEC on ACT_HI_ACTINST(EXECUTION_ID_, ACT_ID_);
create index ACT_IDX_HI_TASK_INST_PROCINST on ACT_HI_TASKINST(PROC_INST_ID_);












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
                          PRIMARY KEY (ID)
);
CREATE INDEX IDX_CODE ON SYS_DEPT (CODE);
CREATE INDEX IDX_PARENT_ID ON SYS_DEPT (PID);


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
                          PRIMARY KEY (ID)
);


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
                          PRIMARY KEY (ID)
);


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
                               PRIMARY KEY (ID)
);


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
                          PRIMARY KEY (ID)
);
CREATE INDEX CREATE_TIME_IDX ON SYS_USER (CREATE_TIME);
CREATE INDEX DEPT_IDX ON SYS_USER (DEPT_ID);
CREATE INDEX EMAIL_IDX ON SYS_USER (EMAIL);
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
                               PRIMARY KEY (ID)
);


-- SYSDBA.SYS_USER_ROLE definition

CREATE TABLE SYS_USER_ROLE (
                               ID NUMBER(10,0) NOT NULL,
                               USER_ID NUMBER(10,0) NOT NULL,
                               ROLE_ID NUMBER(10,0) NOT NULL,
                               CREATE_BY VARCHAR2(32) NULL,
                               CREATE_TIME TIMESTAMP NULL,
                               UPDATE_BY VARCHAR2(32) NULL,
                               UPDATE_TIME TIMESTAMP NULL,
                               PRIMARY KEY (ID)
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
                                    PRIMARY KEY (AUTHENTICATION_ID)
);


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
                                      PRIMARY KEY (CLIENT_ID)
);


-- SYSDBA.OAUTH_REFRESH_TOKEN definition

CREATE TABLE OAUTH_REFRESH_TOKEN (
                                     TOKEN_ID VARCHAR2(256) NULL,
                                     TOKEN BLOB NULL,
                                     AUTHENTICATION BLOB NULL
);


INSERT INTO SYS_DEPT
(ID, NAME, CODE, PID, ANCESTORS, STATUS, SORT, REMARK, CREATE_BY, CREATE_TIME, UPDATE_BY, UPDATE_TIME)
VALUES(433, '部门1', 'bumeng1', -1, NULL, 0, 0, '', 'admin', '2024-01-04 11:40:16.000', 'admin', '2024-01-04 11:40:16.000');
INSERT INTO SYS_DEPT
(ID, NAME, CODE, PID, ANCESTORS, STATUS, SORT, REMARK, CREATE_BY, CREATE_TIME, UPDATE_BY, UPDATE_TIME)
VALUES(434, '部门2', 'bumeng2', -1, NULL, 0, 0, '', 'admin', '2024-01-04 11:40:26.000', 'admin', '2024-01-04 11:40:26.000');
INSERT INTO SYS_DEPT
(ID, NAME, CODE, PID, ANCESTORS, STATUS, SORT, REMARK, CREATE_BY, CREATE_TIME, UPDATE_BY, UPDATE_TIME)
VALUES(435, '部门3', 'bumeng3', -1, NULL, 0, 0, '', 'admin', '2024-01-04 11:40:37.000', 'admin', '2024-01-04 11:40:37.000');

INSERT INTO SYS_MENU
(ID, PID, NAME, URL, "PERM", ICON, SEQ, REMARK, "TYPE", CREATE_TIME, CREATE_BY, UPDATE_TIME, UPDATE_BY)
VALUES(4059916341400576, NULL, '系统管理', '', NULL, 'icon-system', 100, '', 0, NULL, NULL, '2019-02-13 23:24:22.000', NULL);
INSERT INTO SYS_MENU
(ID, PID, NAME, URL, "PERM", ICON, SEQ, REMARK, "TYPE", CREATE_TIME, CREATE_BY, UPDATE_TIME, UPDATE_BY)
VALUES(4059916791092224, 4059916341400576, '用户管理', 'sys/user/user', NULL, 'icon-admin', 5, 'view/sys/user/user.html', 0, NULL, NULL, '2019-02-11 15:16:48.000', NULL);
INSERT INTO SYS_MENU
(ID, PID, NAME, URL, "PERM", ICON, SEQ, REMARK, "TYPE", CREATE_TIME, CREATE_BY, UPDATE_TIME, UPDATE_BY)
VALUES(4059917154079744, 4059916341400576, '角色管理', 'sys/role/role', NULL, 'icon-geren', 10, 'view/sys/role/role.html', 0, NULL, NULL, '2019-02-11 15:42:24.000', NULL);
INSERT INTO SYS_MENU
(ID, PID, NAME, URL, "PERM", ICON, SEQ, REMARK, "TYPE", CREATE_TIME, CREATE_BY, UPDATE_TIME, UPDATE_BY)
VALUES(4059917584143360, 4059916341400576, '菜单管理', 'sys/menu/menu', NULL, 'icon-editor', 15, 'view/sys/menu/menu.html', 0, NULL, NULL, '2019-02-11 15:42:45.000', NULL);
INSERT INTO SYS_MENU
(ID, PID, NAME, URL, "PERM", ICON, SEQ, REMARK, "TYPE", CREATE_TIME, CREATE_BY, UPDATE_TIME, UPDATE_BY)
VALUES(4297179758302211, 4059919704003584, '修改', NULL, 'sys:param:upd', NULL, 30, '', 1, NULL, NULL, NULL, NULL);
INSERT INTO SYS_MENU
(ID, PID, NAME, URL, "PERM", ICON, SEQ, REMARK, "TYPE", CREATE_TIME, CREATE_BY, UPDATE_TIME, UPDATE_BY)
VALUES(4297735991448577, 4059917154079744, '查看', NULL, 'sys:role:page, sys:role:list , sys:role:info ,sys:role:listSet ,sys:role:exist', NULL, 10, NULL, 1, NULL, NULL, NULL, NULL);
INSERT INTO SYS_MENU
(ID, PID, NAME, URL, "PERM", ICON, SEQ, REMARK, "TYPE", CREATE_TIME, CREATE_BY, UPDATE_TIME, UPDATE_BY)
VALUES(4297735991448578, 4059917154079744, '新增', NULL, 'sys:role:add', NULL, 20, NULL, 1, NULL, NULL, NULL, NULL);
INSERT INTO SYS_MENU
(ID, PID, NAME, URL, "PERM", ICON, SEQ, REMARK, "TYPE", CREATE_TIME, CREATE_BY, UPDATE_TIME, UPDATE_BY)
VALUES(4297735991448579, 4059917154079744, '修改', NULL, 'sys:role:upd', NULL, 30, NULL, 1, NULL, 'auto', NULL, 'auto');
INSERT INTO SYS_MENU
(ID, PID, NAME, URL, "PERM", ICON, SEQ, REMARK, "TYPE", CREATE_TIME, CREATE_BY, UPDATE_TIME, UPDATE_BY)
VALUES(4297735991448580, 4059917154079744, '删除', NULL, 'sys:role:del', NULL, 40, NULL, 1, NULL, 'auto', NULL, 'auto');
INSERT INTO SYS_MENU
(ID, PID, NAME, URL, "PERM", ICON, SEQ, REMARK, "TYPE", CREATE_TIME, CREATE_BY, UPDATE_TIME, UPDATE_BY)
VALUES(4297735992218625, 4059917584143360, '查看', NULL, 'sys:menu:page, sys:menu:list , sys:menu:info ,sys:menu:listSet', NULL, 10, NULL, 1, NULL, 'auto', '2024-01-18 17:41:19.000', 'admin');
INSERT INTO SYS_MENU
(ID, PID, NAME, URL, "PERM", ICON, SEQ, REMARK, "TYPE", CREATE_TIME, CREATE_BY, UPDATE_TIME, UPDATE_BY)
VALUES(4297735992218626, 4059917584143360, '新增', NULL, 'sys:menu:add', NULL, 20, NULL, 1, NULL, 'auto', NULL, 'auto');
INSERT INTO SYS_MENU
(ID, PID, NAME, URL, "PERM", ICON, SEQ, REMARK, "TYPE", CREATE_TIME, CREATE_BY, UPDATE_TIME, UPDATE_BY)
VALUES(4297735992218627, 4059917584143360, '修改', NULL, 'sys:menu:upd', NULL, 30, '', 1, NULL, 'auto', NULL, 'auto');
INSERT INTO SYS_MENU
(ID, PID, NAME, URL, "PERM", ICON, SEQ, REMARK, "TYPE", CREATE_TIME, CREATE_BY, UPDATE_TIME, UPDATE_BY)
VALUES(4297735992218628, 4059917584143360, '删除', NULL, 'sys:menu:del', NULL, 40, '', 1, NULL, NULL, NULL, NULL);
INSERT INTO SYS_MENU
(ID, PID, NAME, URL, "PERM", ICON, SEQ, REMARK, "TYPE", CREATE_TIME, CREATE_BY, UPDATE_TIME, UPDATE_BY)
VALUES(4297735995577345, 4059916791092224, '查看', NULL, 'sys:user:page, sys:user:list, sys:user:info,sys:user:exist,sys:user:getUserInfo', NULL, 10, NULL, 1, NULL, 'auto', '2024-01-18 17:37:47.000', 'admin');
INSERT INTO SYS_MENU
(ID, PID, NAME, URL, "PERM", ICON, SEQ, REMARK, "TYPE", CREATE_TIME, CREATE_BY, UPDATE_TIME, UPDATE_BY)
VALUES(4297735995577346, 4059916791092224, '新增', NULL, 'sys:user:add', NULL, 20, NULL, 1, NULL, 'auto', NULL, 'auto');
INSERT INTO SYS_MENU
(ID, PID, NAME, URL, "PERM", ICON, SEQ, REMARK, "TYPE", CREATE_TIME, CREATE_BY, UPDATE_TIME, UPDATE_BY)
VALUES(4297735995577347, 4059916791092224, '修改', NULL, 'sys:user:upd', NULL, 30, NULL, 1, NULL, 'auto', NULL, 'auto');
INSERT INTO SYS_MENU
(ID, PID, NAME, URL, "PERM", ICON, SEQ, REMARK, "TYPE", CREATE_TIME, CREATE_BY, UPDATE_TIME, UPDATE_BY)
VALUES(4297735995577348, 4059916791092224, '删除', NULL, 'sys:user:del', NULL, 40, NULL, 1, NULL, 'auto', NULL, 'auto');
INSERT INTO SYS_MENU
(ID, PID, NAME, URL, "PERM", ICON, SEQ, REMARK, "TYPE", CREATE_TIME, CREATE_BY, UPDATE_TIME, UPDATE_BY)
VALUES(4298067236262912, 4059916791092224, '修改密码', '', 'sys:user:updPwd', '', 80, '', 1, '2019-02-26 16:03:00.000', 'admin', '2019-02-26 16:03:00.000', 'admin');
INSERT INTO SYS_MENU
(ID, PID, NAME, URL, "PERM", ICON, SEQ, REMARK, "TYPE", CREATE_TIME, CREATE_BY, UPDATE_TIME, UPDATE_BY)
VALUES(4347326007383040, 4059916341400576, '组织机构', 'sys/org/org', NULL, 'icon-cluster', 30, NULL, 0, NULL, 'auto', '2019-04-02 12:34:22.000', 'admin');
INSERT INTO SYS_MENU
(ID, PID, NAME, URL, "PERM", ICON, SEQ, REMARK, "TYPE", CREATE_TIME, CREATE_BY, UPDATE_TIME, UPDATE_BY)
VALUES(4353221119792134, 4347326007383040, '详情', '', 'sys:dept:info,sys:dept:page,sys:dept:exist,sys:dept:listSet', '', 1, NULL, 1, '2022-05-29 14:52:26.000', 'admin', '2024-01-18 17:30:29.000', 'admin');
INSERT INTO SYS_MENU
(ID, PID, NAME, URL, "PERM", ICON, SEQ, REMARK, "TYPE", CREATE_TIME, CREATE_BY, UPDATE_TIME, UPDATE_BY)
VALUES(4353221119792135, 4347326007383040, '删除', '', 'sys:dept:del', '', 1, NULL, 1, '2022-05-29 14:53:00.000', 'admin', '2022-05-29 14:53:00.000', 'admin');
INSERT INTO SYS_MENU
(ID, PID, NAME, URL, "PERM", ICON, SEQ, REMARK, "TYPE", CREATE_TIME, CREATE_BY, UPDATE_TIME, UPDATE_BY)
VALUES(4353221119792136, 4347326007383040, '编辑', '', 'sys:dept:upd', '', 1, '', 1, '2022-05-29 14:53:18.000', 'admin', '2022-05-29 14:53:18.000', 'admin');
INSERT INTO SYS_MENU
(ID, PID, NAME, URL, "PERM", ICON, SEQ, REMARK, "TYPE", CREATE_TIME, CREATE_BY, UPDATE_TIME, UPDATE_BY)
VALUES(4353221119792137, 4347326007383040, '新增', '', 'sys:dept:add', '', 1, NULL, 1, '2022-05-29 14:53:53.000', 'admin', '2022-05-29 14:53:53.000', 'admin');
INSERT INTO SYS_MENU
(ID, PID, NAME, URL, "PERM", ICON, SEQ, REMARK, "TYPE", CREATE_TIME, CREATE_BY, UPDATE_TIME, UPDATE_BY)
VALUES(4353221119792138, NULL, '工作流', '', '', 'icon-appstore', 1, NULL, 0, '2023-12-22 10:39:00.000', 'admin', '2023-12-22 10:39:35.000', 'admin');
INSERT INTO SYS_MENU
(ID, PID, NAME, URL, "PERM", ICON, SEQ, REMARK, "TYPE", CREATE_TIME, CREATE_BY, UPDATE_TIME, UPDATE_BY)
VALUES(4353221119792139, 4353221119792138, '流程定义', 'activiti/definition/definition', '', 'icon-check-circle', 1, NULL, 0, '2023-12-22 10:40:44.000', 'admin', '2023-12-22 10:42:28.000', 'admin');
INSERT INTO SYS_MENU
(ID, PID, NAME, URL, "PERM", ICON, SEQ, REMARK, "TYPE", CREATE_TIME, CREATE_BY, UPDATE_TIME, UPDATE_BY)
VALUES(4353221119792140, 4353221119792138, '流程实例', 'activiti/instance/instance', '', 'icon-check-circle', 1, NULL, 0, '2023-12-22 10:41:33.000', 'admin', '2023-12-22 10:41:33.000', 'admin');
INSERT INTO SYS_MENU
(ID, PID, NAME, URL, "PERM", ICON, SEQ, REMARK, "TYPE", CREATE_TIME, CREATE_BY, UPDATE_TIME, UPDATE_BY)
VALUES(4353221119792141, 4353221119792138, '代1办任务', 'activiti/task/task', '', 'icon-check-circle', 1, NULL, 0, '2023-12-22 10:42:17.000', 'admin', '2023-12-22 10:42:17.000', 'admin');
INSERT INTO SYS_MENU
(ID, PID, NAME, URL, "PERM", ICON, SEQ, REMARK, "TYPE", CREATE_TIME, CREATE_BY, UPDATE_TIME, UPDATE_BY)
VALUES(4353221119792142, 4353221119792138, '历史实例', 'activiti/historyInstance/historyInstance', '', '', 1, NULL, 0, '2024-01-27 23:33:56.000', 'admin', '2024-01-27 23:33:56.000', 'admin');

INSERT INTO SYS_ROLE
(ID, CODE, NAME, STATUS, REMARK, CREATE_BY, CREATE_TIME, UPDATE_BY, UPDATE_TIME)
VALUES(1, 'ADMIN', '管理员', 0, '管理员', '1', '2021-11-24 11:33:10.000', 'admin', NULL);
INSERT INTO SYS_ROLE
(ID, CODE, NAME, STATUS, REMARK, CREATE_BY, CREATE_TIME, UPDATE_BY, UPDATE_TIME)
VALUES(2, 'ACTIVITI_USER', 'ACTIVITI_USER', 0, NULL, 'admin', '2023-12-22 15:28:13.000', 'admin', '2023-12-22 15:28:13.000');

INSERT INTO SYS_ROLE_MENU
(ID, ROLE_ID, MENU_ID, REMARK, CREATE_TIME, CREATE_BY, UPDATE_TIME, UPDATE_BY)
VALUES(1742756061720842241, 2, 4353221119792141, NULL, '2024-01-04 11:53:19.000', 'admin', '2024-01-04 11:53:19.000', 'admin');
INSERT INTO SYS_ROLE_MENU
(ID, ROLE_ID, MENU_ID, REMARK, CREATE_TIME, CREATE_BY, UPDATE_TIME, UPDATE_BY)
VALUES(1742756061733425153, 2, 4353221119792138, NULL, '2024-01-04 11:53:19.000', 'admin', '2024-01-04 11:53:19.000', 'admin');

INSERT INTO SYS_USER
(ID, USERNAME, PASSWORD, NICK_NAME, EMAIL, PHONE, SEX, AVATAR, DEPT_ID, JOB_ID, STATE, LAST_LOGIN_TIME, CREATE_TIME, UPDATE_TIME, CREATE_BY, UPDATE_BY, REMARK, SUPER_ADMIN)
VALUES(1, 'admin', '9db06bcff9248837f86d1a6bcf41c9e7', '超级管理员', NULL, '13888888888', NULL, NULL, 8, NULL, 0, NULL, '2021-07-12 11:24:02.000', '2023-12-28 15:57:34.000', 'admin', 'admin', '管理员', 1);
INSERT INTO SYS_USER
(ID, USERNAME, PASSWORD, NICK_NAME, EMAIL, PHONE, SEX, AVATAR, DEPT_ID, JOB_ID, STATE, LAST_LOGIN_TIME, CREATE_TIME, UPDATE_TIME, CREATE_BY, UPDATE_BY, REMARK, SUPER_ADMIN)
VALUES(3, 'yonghu1', '9db06bcff9248837f86d1a6bcf41c9e7', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO SYS_USER
(ID, USERNAME, PASSWORD, NICK_NAME, EMAIL, PHONE, SEX, AVATAR, DEPT_ID, JOB_ID, STATE, LAST_LOGIN_TIME, CREATE_TIME, UPDATE_TIME, CREATE_BY, UPDATE_BY, REMARK, SUPER_ADMIN)
VALUES(4, 'yonghu2', '9db06bcff9248837f86d1a6bcf41c9e7', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO SYS_USER
(ID, USERNAME, PASSWORD, NICK_NAME, EMAIL, PHONE, SEX, AVATAR, DEPT_ID, JOB_ID, STATE, LAST_LOGIN_TIME, CREATE_TIME, UPDATE_TIME, CREATE_BY, UPDATE_BY, REMARK, SUPER_ADMIN)
VALUES(5, 'yonghu3', '9db06bcff9248837f86d1a6bcf41c9e7', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO SYS_USER_DEPT
(ID, USER_ID, DEPT_ID, CREATE_BY, CREATE_TIME, UPDATE_BY, UPDATE_TIME)
VALUES(1, 1, 432, 'admin', '2023-12-28 15:57:34.000', 'admin', '2023-12-28 15:57:34.000');
INSERT INTO SYS_USER_DEPT
(ID, USER_ID, DEPT_ID, CREATE_BY, CREATE_TIME, UPDATE_BY, UPDATE_TIME)
VALUES(2, 1, 431, 'admin', '2023-12-28 15:57:34.000', 'admin', '2023-12-28 15:57:34.000');
INSERT INTO SYS_USER_DEPT
(ID, USER_ID, DEPT_ID, CREATE_BY, CREATE_TIME, UPDATE_BY, UPDATE_TIME)
VALUES(3, 3, 433, 'admin', '2024-01-04 11:51:27.000', 'admin', '2024-01-04 11:51:27.000');
INSERT INTO SYS_USER_DEPT
(ID, USER_ID, DEPT_ID, CREATE_BY, CREATE_TIME, UPDATE_BY, UPDATE_TIME)
VALUES(4, 4, 434, 'admin', '2024-01-04 11:51:37.000', 'admin', '2024-01-04 11:51:37.000');
INSERT INTO SYS_USER_DEPT
(ID, USER_ID, DEPT_ID, CREATE_BY, CREATE_TIME, UPDATE_BY, UPDATE_TIME)
VALUES(5, 5, 435, 'admin', '2024-01-04 11:51:47.000', 'admin', '2024-01-04 11:51:47.000');

INSERT INTO SYS_USER_ROLE
(ID, USER_ID, ROLE_ID, CREATE_BY, CREATE_TIME, UPDATE_BY, UPDATE_TIME)
VALUES(1, 1, 1, 'admin', '2023-12-28 15:57:34.000', 'admin', '2023-12-28 15:57:34.000');
INSERT INTO SYS_USER_ROLE
(ID, USER_ID, ROLE_ID, CREATE_BY, CREATE_TIME, UPDATE_BY, UPDATE_TIME)
VALUES(2, 1, 2, 'admin', '2023-12-28 15:57:34.000', 'admin', '2023-12-28 15:57:34.000');
INSERT INTO SYS_USER_ROLE
(ID, USER_ID, ROLE_ID, CREATE_BY, CREATE_TIME, UPDATE_BY, UPDATE_TIME)
VALUES(3, 3, 2, 'admin', '2024-01-04 11:51:27.000', 'admin', '2024-01-04 11:51:27.000');
INSERT INTO SYS_USER_ROLE
(ID, USER_ID, ROLE_ID, CREATE_BY, CREATE_TIME, UPDATE_BY, UPDATE_TIME)
VALUES(4, 4, 2, 'admin', '2024-01-04 11:51:37.000', 'admin', '2024-01-04 11:51:37.000');
INSERT INTO SYS_USER_ROLE
(ID, USER_ID, ROLE_ID, CREATE_BY, CREATE_TIME, UPDATE_BY, UPDATE_TIME)
VALUES(5, 5, 2, 'admin', '2024-01-04 11:51:47.000', 'admin', '2024-01-04 11:51:47.000');

INSERT INTO OAUTH_CLIENT_DETAILS
(CLIENT_ID, RESOURCE_IDS, CLIENT_SECRET, "SCOPE", AUTHORIZED_GRANT_TYPES, WEB_SERVER_REDIRECT_URI, AUTHORITIES, ACCESS_TOKEN_VALIDITY, REFRESH_TOKEN_VALIDITY, ADDITIONAL_INFORMATION, AUTOAPPROVE)
VALUES('yeee-activiti7', NULL, '96e79218965eb72c92a549dd5a330112', 'all', 'password,refresh_token,authorization_code,client_credentials', '', NULL, 864000, 6048000, NULL, 'true');
