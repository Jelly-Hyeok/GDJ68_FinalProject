CREATE TABLE `HUMAN_RESOURCE` (
	`EMPLOYEE_ID`			VARCHAR(255)	NOT NULL,
	`JOIN_DATE`				DATETIME		NOT NULL,
	`JOIN_TYPE`				TINYINT(1)		NOT NULL,
	`NAME`					VARCHAR(255)	NOT NULL,
	`BIRTH`					VARCHAR(255)	NOT NULL,
	`DEPARTMENT_CD`			VARCHAR(255)	NOT NULL,
	`POSITION_CD`			VARCHAR(255)	NOT NULL,
	`PHONE`					VARCHAR(255)	NOT NULL,
	`EMAIL`					VARCHAR(255)	NOT NULL,
	`ZIP_CODE`				VARCHAR(255)	NOT NULL,
	`ADDRESS`				VARCHAR(255)	NOT NULL,
	`ADDRESS_DETAIL`		VARCHAR(255)	NOT NULL,
	`BANK`					VARCHAR(255)	NOT NULL,
	`ACCOUNT_NUMBER`		VARCHAR(255)	NOT NULL,
	`ACCOUNT_HOLDER`		VARCHAR(255)	NOT NULL,
	`APPROVAL_AUTHORITY`	TINYINT(1)		NOT NULL,
	`QUIT_DATE`				DATETIME		NULL,
	`QUIT_REASON`			VARCHAR(255)	NULL,
	`REG_ID`				VARCHAR(255)	NOT NULL,
	`REG_DATE`				DATETIME		NOT NULL,
	`REG_MENU`				VARCHAR(255)	NOT NULL,
	`MOD_ID`				VARCHAR(255)	NOT NULL,
	`MOD_DATE`				DATETIME		NOT NULL,
	`MOD_MENU`				VARCHAR(255)	NOT NULL,
	`EXTENSION_NUMBER`		VARCHAR(255)	NULL,
	`MAIN_NUMBER`			VARCHAR(255)	NULL,
	`PASSWORD`				VARCHAR(255)	NOT NULL,
	CONSTRAINT PRIMARY KEY(EMPLOYEE_ID)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;


CREATE TABLE ROLE(
	ROLE_NUM INT AUTO_INCREMENT NOT NULL,
	ROLE_NAME VARCHAR(255) NOT NULL,
	CONSTRAINT PRIMARY KEY(ROLE_NUM)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;

INSERT INTO ROLE VALUES(NULL, 'R001');
INSERT INTO ROLE VALUES(NULL, 'R002');
INSERT INTO ROLE VALUES(NULL, 'R003');


CREATE TABLE ACCOUNT_ROLE(
	ROLE_NUM INT,
	EMPLOYEE_ID VARCHAR(255),
	CONSTRAINT PRIMARY KEY(ROLE_NUM, EMPLOYEE_ID),
	CONSTRAINT FOREIGN KEY(ROLE_NUM) REFERENCES ROLE(ROLE_NUM) ON DELETE CASCADE,
	CONSTRAINT FOREIGN KEY(EMPLOYEE_ID) REFERENCES HUMAN_RESOURCE(EMPLOYEE_ID) ON DELETE CASCADE
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;


CREATE TABLE `SCHEDULE` (
	`SCHEDULE_NO`		BIGINT	  		NOT NULL,
	`EMPLOYEE_ID`		VARCHAR(255)	NOT NULL,
	`SCHEDULE_DATE`		DATETIME 		NOT NULL,
	`SCHEDULE_PLACE`	VARCHAR(255)  	NOT NULL,
	`SCHEDULE_CONTENTS`	VARCHAR(255)	NOT NULL,
	`SCHEDULE_TYPE`		TINYINT(1)		NOT NULL,
	`REG_ID`			VARCHAR(255)	NOT NULL,
	`REG_DATE`			DATETIME		NOT NULL,
	`REG_MENU`			VARCHAR(255)	NOT NULL,
	`MOD_ID`			VARCHAR(255)	NOT NULL,
	`MOD_DATE`			DATETIME		NOT NULL,
	`MOD_MENU`			VARCHAR(255)	NOT NULL,
	CONSTRAINT PRIMARY KEY(SCHEDULE_NO),
	CONSTRAINT FOREIGN KEY(EMPLOYEE_ID) REFERENCES HUMAN_RESOURCE(EMPLOYEE_ID) ON DELETE CASCADE
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;


CREATE TABLE `SCHEDULE_ATTENDEES` (
	`SCHEDULE_NO`	BIGINT			NOT NULL,
	`EMPLOYEE_ID`	VARCHAR(255)	NOT NULL,
	CONSTRAINT PRIMARY KEY(SCHEDULE_NO, EMPLOYEE_ID),
	CONSTRAINT FOREIGN KEY(SCHEDULE_NO) REFERENCES SCHEDULE(SCHEDULE_NO) ON DELETE CASCADE,
	CONSTRAINT FOREIGN KEY(EMPLOYEE_ID) REFERENCES HUMAN_RESOURCE(EMPLOYEE_ID) ON DELETE CASCADE
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;


CREATE TABLE `ANNUAL_LEAVE` (
	`ANNUAL_LEAVE_NO`			BIGINT			NOT NULL,
	`EMPLOYEE_ID`				VARCHAR(255)	NOT NULL,
	`YEARS_OF_SERVICE`			INT				NOT NULL,
	`OCCURRENCE_ANNUAL_LEAVE`	INT				NOT NULL,
	`OCCURRENCE_MONTHLY_LEAVE`	INT				NOT NULL,
	`DELAY_MONTHLY_LEAVE`		INT				NOT NULL,
	`ADJUST_ANNUAL_LEAVE`		INT				NOT NULL,
	`USE_ANNUAL_LEAVE`			INT				NOT NULL,
	`REG_ID`					VARCHAR(255)	NOT NULL,
	`REG_DATE`					DATETIME		NOT NULL,
	`REG_MENU`					VARCHAR(255)	NOT NULL,
	`MOD_ID`					VARCHAR(255)	NOT NULL,
	`MOD_DATE`					DATETIME		NOT NULL,
	`MOD_MENU`					VARCHAR(255)	NOT NULL,
	CONSTRAINT PRIMARY KEY(ANNUAL_LEAVE_NO),
	CONSTRAINT FOREIGN KEY(EMPLOYEE_ID) REFERENCES HUMAN_RESOURCE(EMPLOYEE_ID) ON DELETE CASCADE
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;


CREATE TABLE `ATTENDANCE` (
	`ATTENDANCE_NO`		BIGINT			AUTO_INCREMENT NOT NULL,
	`EMPLOYEE_ID`		VARCHAR(255)	NOT NULL,
	`ATTENDANCE_DATE`	DATETIME		NOT NULL,
	`ATTENDANCE_START`	DATETIME		NOT NULL,
	`ATTENDANCE_END`	DATETIME		NULL,
	`REG_ID`			VARCHAR(255)	NOT NULL,
	`REG_DATE`			DATETIME		NOT NULL,
	`REG_MENU`			VARCHAR(255)	NOT NULL,
	`MOD_ID`			VARCHAR(255)	NOT NULL,
	`MOD_DATE`			DATETIME		NOT NULL,
	`MOD_MENU`			VARCHAR(255)	NOT NULL,
	CONSTRAINT PRIMARY KEY(ATTENDANCE_NO),
	CONSTRAINT FOREIGN KEY(EMPLOYEE_ID) REFERENCES HUMAN_RESOURCE(EMPLOYEE_ID) ON DELETE CASCADE
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;


CREATE TABLE `TRANSFER` (
	`TRANSFER_NO`				BIGINT			NOT NULL,
	`EMPLOYEE_ID`				VARCHAR(255)	NOT NULL,
	`TRANSFER_TYPE_CD`			VARCHAR(255)	NOT NULL,
	`TRANSFER_DEPARTMENT_CD`	VARCHAR(255)	NOT NULL,
	`TRANSFER_POSITION_CD`		VARCHAR(255)	NOT NULL,
	`TRANSFER_DATE`				DATETIME		NOT NULL,
	`DESCRIPTION`				VARCHAR(255)	NULL,
	`REG_DATE`					DATETIME		NOT NULL,
	`REG_MENU`					VARCHAR(255)	NOT NULL,
	`MOD_ID`					VARCHAR(255)	NOT NULL,
	`MOD_DATE`					DATETIME		NOT NULL,
	`MOD_MENU`					VARCHAR(255)	NOT NULL,
	CONSTRAINT PRIMARY KEY(TRANSFER_NO),
	CONSTRAINT FOREIGN KEY(EMPLOYEE_ID) REFERENCES HUMAN_RESOURCE(EMPLOYEE_ID) ON DELETE CASCADE
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;


CREATE TABLE `NOTIFICATION` (
	`NOTIFICATION_NO`		BIGINT			NOT NULL,
	`EMPLOYEE_ID`			VARCHAR(255)	NOT NULL,
	`NOTIFICATION_DATE`		DATETIME		NOT NULL,
	`NOTIFICATION_TITLE`	VARCHAR(255)	NOT NULL,
	`NOTIFICATION_CONTENTS`	VARCHAR(255)	NOT NULL,
	`REG_ID`				VARCHAR(255)	NOT NULL,
	`REG_DATE`				DATETIME		NOT NULL,
	`REG_MENU`				VARCHAR(255)	NOT NULL,
	`MOD_ID`				VARCHAR(255)	NOT NULL,
	`MOD_DATE`				DATETIME		NOT NULL,
	`MOD_MENU`				VARCHAR(255)	NOT NULL,
	CONSTRAINT PRIMARY KEY(NOTIFICATION_NO),
	CONSTRAINT FOREIGN KEY(EMPLOYEE_ID) REFERENCES HUMAN_RESOURCE(EMPLOYEE_ID) ON DELETE CASCADE
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;

/* ------------------------------------------------------------------------------------------------ */

INSERT INTO CODE VALUES('R001', 'R00', 'ADMIN', '', NOW(), '', '', NOW(), '');
INSERT INTO CODE VALUES('R002', 'R00', 'APPROVER', '', NOW(), '', '', NOW(), '');
INSERT INTO CODE VALUES('R003', 'R00', 'USER', '', NOW(), '', '', NOW(), '');
COMMIT;


INSERT INTO ATTENDANCE VALUES(NULL, '2023001', NOW(),
											   STR_TO_DATE('2021-10-10 08:50:00', '%Y-%m-%d %H:%i:%S'),
											   STR_TO_DATE('2021-10-10 18:10:10', '%Y-%m-%d %H:%i:%S'),
											   '2023001',
											   STR_TO_DATE('2021-10-10 08:50:00', '%Y-%m-%d %H:%i:%S'),
											   'Test',
											   '2023001',
											   STR_TO_DATE('2021-10-10 08:50:00', '%Y-%m-%d %H:%i:%S'),
											   'Test');