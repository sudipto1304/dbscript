ALTER TABLE `poolcardb`.`device_app_registration` 
DROP FOREIGN KEY `CUSTOMER_ID_FK`;
ALTER TABLE `poolcardb`.`device_app_registration` 
DROP COLUMN `CUSTOMER_ID`,
DROP INDEX `CUSTOMER_ID_FK_idx` ;


CREATE TABLE `poolcardb`.`session_data` (
  `CUSTOMER_ID` VARCHAR(100) NOT NULL,
  `OAUTH_TOKEN` VARCHAR(450) NOT NULL,
  `SID` VARCHAR(100) NOT NULL,
  `DEVICE_ID` VARCHAR(200) NOT NULL,
  `CREATE_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`CUSTOMER_ID`)) ENGINE=InnoDB DEFAULT CHARSET=utf8;
  
  ALTER TABLE `poolcardb`.`session_data` 
DROP PRIMARY KEY,
ADD PRIMARY KEY (`SID`);

ALTER TABLE `poolcardb`.`session_data` 
ADD INDEX `CUSTOMER_ID_FK_idx` (`CUSTOMER_ID` ASC);
ALTER TABLE `poolcardb`.`session_data` 
ADD CONSTRAINT `CUSTOMER_ID_FK`
  FOREIGN KEY (`CUSTOMER_ID`)
  REFERENCES `poolcardb`.`user_information` (`CUSTOMER_ID`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


ALTER TABLE `poolcardb`.`session_data` 
ADD INDEX `DEVICE_ID_FK_idx` (`DEVICE_ID` ASC);
ALTER TABLE `poolcardb`.`session_data` 
ADD CONSTRAINT `DEVICE_ID_FK`
  FOREIGN KEY (`DEVICE_ID`)
  REFERENCES `poolcardb`.`device_app_registration` (`APP_ID`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
  
  ALTER TABLE `poolcardb`.`audit_activity` 
ADD INDEX `DEVICE_ID_PK_idx` (`DEVICE_ID` ASC);
ALTER TABLE `poolcardb`.`audit_activity` 
ADD CONSTRAINT `DEVICE_ID_PK`
  FOREIGN KEY (`DEVICE_ID`)
  REFERENCES `poolcardb`.`device_app_registration` (`APP_ID`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


