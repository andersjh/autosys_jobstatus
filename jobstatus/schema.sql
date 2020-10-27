DROP TABLE IF EXISTS est_jobst;
DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS post;

CREATE TABLE "est_jobst" (
	"ALARM_IF_FAIL"	INTEGER,
	"APPL_NTRY"	INTEGER,
	"AUTO_DELETE"	INTEGER,
	"AUTO_HOLD"	INTEGER,
	"BOX_FAILURE"	TEXT,
	"BOX_SUCCESS"	TEXT,
	"BOX_JOID"	INTEGER,
	"BOX_NAME"	TEXT,
	"BOX_TERMINATOR"	INTEGER,
	"CHK_FILES"	TEXT,
	"COMMAND"	TEXT,
	"DATE_CONDITIONS"	INTEGER,
	"DAYS_OF_WEEK"	TEXT,
	"DEPTH"	INTEGER,
	"DESCRIPTION"	TEXT,
	"EXCLUDE_CALENDAR"	TEXT,
	"EXIT_CODE"	INTEGER,
	"HAS_BLOB"	INTEGER,
	"HAS_BOX_FAILURE"	INTEGER,
	"HAS_BOX_SUCCESS"	INTEGER,
	"HAS_CONDITION"	INTEGER,
	"HAS_NOTIFICATION"	INTEGER,
	"HAS_OVERRIDE"	INTEGER,
	"HAS_SERVICE_DESK"	INTEGER,
	"HEARTBEAT_INTERVAL"	TEXT,
	"IS_CURRVER"	INTEGER,
	"JC_PID"	INTEGER,
	"JOB_LOAD"	INTEGER,
	"JOB_NAME"	TEXT,
	"JOB_GROUP"	TEXT,
	"JOB_TERMINATOR"	INTEGER,
	"JOB_TYPE"	INTEGER,
	"JOB_TYPE_TXT"	TEXT,
	"JOB_VER"	INTEGER,
	"JOID"	INTEGER NOT NULL,
	"LAST_END"	INTEGER,
	"LAST_END_DATE"	TEXT,
	"LAST_END_STR"	TEXT,
	"LAST_HEARTBEAT"	INTEGER,
	"LAST_START"	INTEGER,
	"LAST_START_DATE"	TEXT,
	"LAST_START_STR"	TEXT,
	"LINEAGE"	TEXT,
	"MACH_NAME"	TEXT,
	"MAX_EXIT_SUCCESS"	INTEGER,
	"MAX_RUN_ALARM"	INTEGER,
	"MIN_RUN_ALARM"	INTEGER,
	"N_RETRYS"	INTEGER,
	"NEXT_PRIORITY"	TEXT,
	"NEXT_START"	INTEGER,
	"NEXT_START_DATE"	TEXT,
	"NEXT_START_STR"	TEXT,
	"NTRY"	INTEGER,
	"NUMERO"	INTEGER,
	"OVER_NUM"	INTEGER,
	"PERMISSION"	TEXT,
	"PID"	INTEGER,
	"PRIORITY"	INTEGER,
	"PROFILE"	TEXT,
	"QUE_NAME"	TEXT,
	"RUN_CALENDAR"	TEXT,
	"RUN_MACHINE"	TEXT,
	"RUN_NUM"	INTEGER,
	"RUN_PRIORITY"	INTEGER,
	"RUN_WINDOW"	TEXT,
	"START_MINS"	TEXT,
	"START_TIMES"	TEXT,
	"STATUS"	INTEGER,
	"STATUS_TIME"	INTEGER,
	"STATUS_TIME_DATE"	TEXT,
	"STATUS_TIMESTR"	TEXT,
	"STATUS_TEXT"	TEXT,
	"STD_ERR_FILE"	TEXT,
	"STD_IN_FILE"	TEXT,
	"STD_OUT_FILE"	TEXT,
	"TERM_RUN_TIME"	INTEGER,
	"TIME_OK"	INTEGER,
	"TIMEZONE"	TEXT,
	"WATCH_FILE"	TEXT,
	"WATCH_FILE_MIN_SIZE"	TEXT,
	"WATCH_INTERVAL"	TEXT,
	"WF_JOID"	INTEGER,
	"AS_GROUP"	TEXT,
	"CI_DESC"	TEXT,
	PRIMARY KEY("JOID")
);

CREATE TABLE user (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  username TEXT UNIQUE NOT NULL,
  password TEXT NOT NULL
);

CREATE TABLE post (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  author_id INTEGER NOT NULL,
  created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  title TEXT NOT NULL,
  body TEXT NOT NULL,
  FOREIGN KEY (author_id) REFERENCES user (id)
);