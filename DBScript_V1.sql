CREATE TABLE `user_information` (
  `CUSTOMER_ID` varchar(100) NOT NULL,
  `USER_ID` varchar(45) NOT NULL,
  `PASSWORD` varchar(200) NOT NULL,
  `EMAIL_ID` varchar(100) NOT NULL,
  `FIRST_NAME` varchar(50) NOT NULL,
  `LAST_NAME` varchar(50) NOT NULL,
  `ADDRESS` varchar(500) NOT NULL,
  `ZIP_CODE` varchar(15) DEFAULT NULL,
  `PHONE_NUMBER` varchar(15) NOT NULL,
  `COUNTRY_CODE` varchar(3) NOT NULL,
  `SOCIAL_MEDIA_TYPE` varchar(45) DEFAULT NULL,
  `ACCOUNT_STATUS` varchar(45) NOT NULL,
  `PHONE_VERIFIED` varchar(45) NOT NULL,
  `UPDATE_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`CUSTOMER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `error_msg_master` (
  `MSG_CODE` varchar(9) NOT NULL,
  `LOCALE` varchar(6) DEFAULT NULL,
  `TIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `MSG_TYPE` varchar(45) NOT NULL,
  PRIMARY KEY (`MSG_CODE`,`MSG_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `error_msg` (
  `MSG_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `MSG_CODE` varchar(9) DEFAULT NULL,
  `MSG_TEXT` varchar(200) DEFAULT NULL,
  `LAST_UPDATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`MSG_ID`),
  KEY `idx_error_msg_MSG_CODE` (`MSG_CODE`),
  CONSTRAINT `MSG_CODE` FOREIGN KEY (`MSG_CODE`) REFERENCES `error_msg_master` (`MSG_CODE`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `one_time_password` (
  `ID` bigint(15) NOT NULL AUTO_INCREMENT,
  `OTP` varchar(45) NOT NULL,
  `PHONE_NUMBER` varchar(45) NOT NULL,
  `FLOW_ID` varchar(45) NOT NULL,
  `UPDATE_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `STATUS` varchar(45) NOT NULL,
  `OTP_GENERATION_TIME` varchar(45) DEFAULT NULL,
  `CUSTOMER_ID` varchar(100) NOT NULL,
  `PHONE_NUMBER_COUNTRY_CODE` varchar(5) DEFAULT NULL,
  `ATTEMPT_COUNT` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `CUSTOMER_ID_idx` (`CUSTOMER_ID`),
  CONSTRAINT `CUSTOMER_ID` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `user_information` (`CUSTOMER_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `device_app_registration` (
  `APP_ID` varchar(200) NOT NULL,
  `DEVICE_TYPE` varchar(200) NOT NULL,
  `OS` varchar(45) NOT NULL,
  `OS_VERSION` varchar(45) NOT NULL,
  `CURRENT_COUNTRY_CODE` varchar(3) NOT NULL,
  `ISP` varchar(200) NOT NULL,
  `IP_ADDRESS` varchar(20) NOT NULL,
  `TIMESTAMP` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `CUSTOMER_ID` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`APP_ID`),
  KEY `CUSTOMER_ID_FK_idx` (`CUSTOMER_ID`),
  CONSTRAINT `CUSTOMER_ID_FK` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `user_information` (`CUSTOMER_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `audit_activity` (
  `CUSTOMER_ID` varchar(50) DEFAULT NULL,
  `REQUEST_URI` varchar(45) NOT NULL,
  `ACTIVITY_TYPE` varchar(45) NOT NULL,
  `ACTIVITY_DATA` text,
  `TIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `RESPONSE_CODE` varchar(45) DEFAULT NULL,
  `EXCEPTION` varchar(500) DEFAULT NULL,
  `AUDIT_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `DEVICE_ID` varchar(200) DEFAULT NULL,
  `OS` varchar(45) DEFAULT NULL,
  `OS_VERSION` varchar(45) DEFAULT NULL,
  `ISP` varchar(200) DEFAULT NULL,
  `IP_ADDRESS` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`AUDIT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;




