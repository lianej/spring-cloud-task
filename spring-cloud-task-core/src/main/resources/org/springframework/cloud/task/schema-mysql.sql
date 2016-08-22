
CREATE TABLE TASK_EXECUTION  (
	TASK_EXECUTION_ID BIGINT NOT NULL PRIMARY KEY ,
	START_TIME DATETIME DEFAULT NULL ,
	END_TIME DATETIME DEFAULT NULL ,
	TASK_NAME  VARCHAR(100) ,
	EXIT_CODE INTEGER ,
	EXIT_MESSAGE VARCHAR(2500) ,
	ERROR_MESSAGE VARCHAR(2500) ,
	LAST_UPDATED TIMESTAMP,
	EXTERNAL_EXECUTION_ID VARCHAR(255)
) ENGINE=InnoDB;

CREATE TABLE TASK_EXECUTION_PARAMS  (
	TASK_EXECUTION_ID BIGINT NOT NULL ,
	TASK_PARAM VARCHAR(2500) ,
	constraint TASK_EXEC_PARAMS_FK foreign key (TASK_EXECUTION_ID)
	references TASK_EXECUTION(TASK_EXECUTION_ID)
) ENGINE=InnoDB;

CREATE TABLE TASK_TASK_BATCH (
 TASK_EXECUTION_ID BIGINT NOT NULL ,
 JOB_EXECUTION_ID BIGINT NOT NULL ,
	constraint TASK_EXEC_BATCH_FK foreign key (TASK_EXECUTION_ID)
	references TASK_EXECUTION(TASK_EXECUTION_ID)
)  ENGINE=InnoDB;

CREATE TABLE TASK_SEQ (
	ID BIGINT NOT NULL,
	UNIQUE_KEY CHAR(1) NOT NULL,
	constraint UNIQUE_KEY_UN unique (UNIQUE_KEY)
) ENGINE=MYISAM;

INSERT INTO TASK_SEQ (ID, UNIQUE_KEY) select * from (select 0 as ID, '0' as UNIQUE_KEY) as tmp;
