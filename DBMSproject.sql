-----------------------------------------------CREATE USER-----------------------------------------------
   --user_group#
   CREATE USER user_group# identified by IS123;
                                        --IS321
   GRANT CONNECT TO user_group#;
   GRANT ALL PRIVILEGES TO  user_group#;
  
   --user_amal
   CREATE USER user_amal IDENTIFIED BY IS890;
                                     --IS567
   GRANT CONNECT TO user_amal;
   grant insert , select on Donor to user_amal; --Error**
   
   ------------------------------------------TABLESPACE------------------------------------------------
   --TABLESPACE PROJECT_TABLE
   CREATE TABLESPACE Project_Table  DATAFILE 'DBMS' SIZE 300M;
   alter user user_group# default tablespace Project_Table;
   alter user user_amal default tablespace Project_Table;
   ----TABLESPACE PROJECT_INDEX
   CREATE TABLESPACE Project_INDX DATAFILE 'DBMS.SQL' SIZE 300M;
   --c.	Show all users with their default tablespace
   select username ,default_tablespace from dba_users where lower(username) in ('user_group#','user_amal') ;
   ----------------------------------------D AND E ,F,G----------------------------
   
   connect user_group#;
   ----D------------------
   create table Doctor(
   ID char(4) primary key,
   name varchar2(25) );



     CREATE TABLE Recipient(
     File_No char(6)PRIMARY key,
     name VARCHAR2(40),
     DOB DATE ,
     Blood_type char(2),
     Doc_ID char(4),
     CONSTRAINT FR1 FOREIGN KEY (Doc_ID) REFERENCES Doctor(ID));

     
  CREATE TABLE Donor(
  File_no CHAR(6)PRIMARY KEY,
  DOB DATE ,
  Blood_type CHAR(2),
  Life_status VARCHAR2(70),
  DOC_ID CHAR(4),
  CONSTRAINT FR2 FOREIGN KEY (Doc_ID) REFERENCES Doctor(ID));
  
  
  
  CREATE TABLE Donor_UNF(
  File_no CHAR(6),
  name VARCHAR2(25)PRIMARY KEY,
  CONSTRAINT FR3 FOREIGN KEY (File_no) REFERENCES Donor(File_no));
  
  CREATE TABLE Organ(
  organ_ID CHAR(5)PRIMARY KEY,
  size_ number(3),
  Rec_File_No CHAR(6),
  Don_File_No CHAR(6),
  CONSTRAINT FR4 FOREIGN KEY (Rec_File_No) REFERENCES Recipient(File_No),
  CONSTRAINT FR5 FOREIGN KEY (Don_File_No) REFERENCES Donor(File_no));
  
  CREATE TABLE Surgery(
  Surgery_no CHAR(5),
  result VARCHAR2(10),
  date_SUR DATE ,
  time_SUR TIMESTAMP ,
  lacation VARCHAR2(30),
  Rec_File_No CHAR(6),
  Don_File_No CHAR(6),
  CONSTRAINT FR6 FOREIGN KEY (Rec_File_No) REFERENCES Recipient(File_No),
  CONSTRAINT FR7 FOREIGN KEY (Don_File_No) REFERENCES Donor(File_no));
  
  --insert:--------------------
  
INSERT INTO Doctor (ID,name) VALUES ('123','Dr_Mohammed');
INSERT INTO Doctor (ID,name) VALUES ('456','Dr_Sarah');
INSERT INTO Doctor (ID,name) VALUES ('789','Dr_Ali');
INSERT INTO Doctor (ID,name) VALUES('112','Dr_Noura');
INSERT INTO Doctor (ID,name) VALUES('116','Dr_raghad');
INSERT INTO Doctor (ID,name) VALUES('119','Dr_lama');

————-

INSERT INTO Recipient (File_No,name,DOB,Blood_type,Doc_ID) VALUES ('1','Sultan','01-DEC-2000','A','123'); 
INSERT INTO Recipient (File_No,name,DOB,Blood_type,Doc_ID) VALUES ('2','Bader','03-DEC-1998','B','456'); 
INSERT INTO Recipient (File_No,name,DOB,Blood_type,Doc_ID) VALUES ('3','Rema','03-DEC-2002','O','789'); 
INSERT INTO Recipient (File_No,name,DOB,Blood_type,Doc_ID) VALUES ('4','Basel','03-DEC-1990','A','112'); 
INSERT INTO Recipient (File_No,name,DOB,Blood_type,Doc_ID) VALUES ('5','dina','01-JAN-1999','A+','119');
INSERT INTO Recipient (File_No,name,DOB,Blood_type,Doc_ID) VALUES ('6','RAMA','11-JAN-2003','B-','116'); 
INSERT INTO Recipient (File_No,name,DOB,Blood_type,Doc_ID) VALUES ('6','RAMA','11-JAN-2003','B-','116');
——————-

INSERT INTO Donor(File_no,DOB , Blood_type , Life_status,DOC_ID) VALUES ('11111','01-DEC-2008', 'AB' ,'stable','123' );
INSERT INTO Donor(File_no,DOB , Blood_type , Life_status,DOC_ID) VALUES ('3224','01-DEC-2000', 'O+' ,'unstable','456');
INSERT INTO Donor(File_no,DOB , Blood_type , Life_status,DOC_ID) VALUES ('3994','01-DEC-1999', 'A' ,'unstable','789');
INSERT INTO Donor(File_no,DOB , Blood_type , Life_status,DOC_ID) VALUES ('3454','01-DEC-1990', 'A' ,'unstable','112');
INSERT INTO Donor(File_no,DOB , Blood_type , Life_status,DOC_ID) VALUES ('3984','01-JAN-1999', 'A+' ,'stable','119');
INSERT INTO Donor(File_no,DOB , Blood_type , Life_status,DOC_ID) VALUES ('3464','11-JAN-2003', 'B-' ,'stable','116');




——————-
INSERT INTO Donor_UNF(File_no,name) VALUES ('11111','FAHAD');
INSERT INTO Donor_UNF(File_no,name) VALUES ('3224','AHMAD');
INSERT INTO Donor_UNF(File_no,name) VALUES ('3994','NOOR');
INSERT INTO Donor_UNF(File_no,name) VALUES ('3454','REEM');
INSERT INTO Donor_UNF(File_no,name) VALUES ('3984','HAILA');
INSERT INTO Donor_UNF(File_no,name) VALUES ('3464','DANA');


INSERT INTO Organ(organ_ID,size_, Rec_File_No,Don_File_No) VALUES ('5050',20,'1','11111');
INSERT INTO Organ(organ_ID,size_, Rec_File_No,Don_File_No) VALUES ('1987',60,'2','3224');
INSERT INTO Organ(organ_ID,size_, Rec_File_No,Don_File_No) VALUES ('0987',70,'3','3994');
INSERT INTO Organ(organ_ID,size_, Rec_File_No,Don_File_No) VALUES ('9876',99 ,'4','3454');
INSERT INTO Organ(organ_ID,size_, Rec_File_No,Don_File_No) VALUES ('0988',80,'5','3984');
INSERT INTO Organ(organ_ID,size_, Rec_File_No,Don_File_No) VALUES ('9877',90 ,'6','3464');
INSERT INTO Organ(organ_ID,size_, Rec_File_No,Don_File_No) VALUES ('9807',98,'8','3464');

————————

INSERT INTO Surgery(Surgery_no,result,date_SUR,time_SUR,lacation,Rec_File_NO,Don_File_NO) VALUES ('1','success','01-DEC-2019','','Riyadh','1','11111');
INSERT INTO Surgery(Surgery_no,result,date_SUR,time_SUR,lacation,Rec_File_NO,Don_File_NO) VALUES ('2','success','22-JAN-2019','','Riyadh','2','3224');
INSERT INTO Surgery(Surgery_no,result,date_SUR,time_SUR,lacation,Rec_File_NO,Don_File_NO) VALUES ('3','success','31-AUG-2019','','Riyadh','3','3994');
INSERT INTO Surgery(Surgery_no,result,date_SUR,time_SUR,lacation,Rec_File_NO,Don_File_NO) VALUES ('4','success','01-JAN-2020','','Riyadh','4','3454');
INSERT INTO Surgery(Surgery_no,result,date_SUR,time_SUR,lacation,Rec_File_NO,Don_File_NO) VALUES ('5','success','21-DEC-2020','','Riyadh','5','3984');
INSERT INTO Surgery(Surgery_no,result,date_SUR,time_SUR,lacation,Rec_File_NO,Don_File_NO) VALUES ('6','success','11-JAN-2023','','Riyadh','6','3464');
INSERT INTO Surgery(Surgery_no,result,date_SUR,time_SUR,lacation,Rec_File_NO,Don_File_NO) VALUES ('9','success','11-JAN-2023','','Riyadh','6','3464');
-----------------------------------------------------
   
 --E-------------------------------------------------------------------
   create index ix_doc on Doctor(name) tablespace Project_INDX;
    create index ix_don on Donor(Blood_type) tablespace Project_INDX;
 --f----------------------------------------------------------------------------------------
    alter user user_amal identified by IS567 replace IS890;
---------------------------------------------------------------------------------------------
   
   ------------------------------h.	each student in the group should create a function or procedure------------------------------
 CREATE PROCEDURE Check_donor_age(donor_age IN DATE)
IS
BEGIN
IF donor_age > '01-DEC-2005' THEN 
  dbms_output.put_line('Rejected');
 ELSE 
  dbms_output.put_line('Accepted');

 END IF;
 END;
 /
 --CALL****************************************
 set serveroutput on;
DECLARE 
d DATE;
BEGIN
d:= &d;

Check_donor_age(d);
End;
/
 -----------------------------------*
CREATE OR REPLACE FUNCTION get_max_organ_size RETURN NUMBER
IS
  v_max_size NUMBER;
BEGIN
  SELECT MAX(size_) INTO v_max_size FROM Organ;
  RETURN v_max_size;
END;
---CALL****************************************
set serveroutput on;
DECLARE
  v_max_organ_size NUMBER;
BEGIN
  v_max_organ_size := get_max_organ_size();
  DBMS_OUTPUT.PUT_LINE('The maximum size number for an organ is: ' || v_max_organ_size);
END;
----------------------------------------------------*
 
 --*
 create or replace function count_recipients
return NUMBER
IS 
recipient_count NUMBER;
BEGIN
  
    SELECT COUNT(*) INTO recipient_count FROM Recipient;
    RETURN recipient_count;
END;
/
---CALL**********************************************
set serveroutput on;
DECLARE
 Resultt NUMBER;
BEGIN
Resultt:=count_recipients;
dbms_output.put_line('Total:'||Resultt);
END;
/
-------------------------------------------
-------------------------------------------------------------------------------------
CREATE FUNCTION match_donor_blood (donor_blood_type VARCHAR2, recipient_blood_type VARCHAR2) 
	RETURN BOOLEAN AS
    donor_type CHAR(2);
    recipient_type CHAR(2);
BEGIN
    donor_type := SUBSTR(donor_blood_type, 1, 2);
    recipient_type := SUBSTR(recipient_blood_type, 1, 2);
    
    IF donor_type = 'O-' THEN
        RETURN TRUE;
    ELSIF donor_type = 'O+' AND (recipient_type IN ('O+', 'A+', 'B+', 'AB+')) THEN
        RETURN TRUE;
    ELSIF donor_type = 'A-' AND (recipient_type IN ('A-', 'A+', 'AB-', 'AB+')) THEN
        RETURN TRUE;
    ELSIF donor_type = 'A+' AND (recipient_type IN ('A+', 'AB+')) THEN
        RETURN TRUE;
    ELSIF donor_type = 'B-' AND (recipient_type IN ('B-', 'B+', 'AB-', 'AB+')) THEN
        RETURN TRUE;
    ELSIF donor_type = 'B+' AND (recipient_type IN ('B+', 'AB+')) THEN
        RETURN TRUE;
    ELSIF donor_type = 'AB-' AND (recipient_type IN ('AB-', 'AB+')) THEN
        RETURN TRUE;
    ELSIF donor_type = 'AB+' AND (recipient_type = 'AB+') THEN
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    END IF;
END;
/
--CALL*********************************************************
set serveroutput on;
DECLARE
    donor_blood_type VARCHAR2(4);
    recipient_blood_type VARCHAR2(4);
    is_match BOOLEAN;
BEGIN
    -- Set the values for donor_blood_type and recipient_blood_type
    donor_blood_type := &donor_blood_type;
    recipient_blood_type := &recipient_blood_type;

    -- Call the match_donor_blood function and store the result in is_match
    is_match := match_donor_blood(donor_blood_type, recipient_blood_type);

    -- Print the result
    IF is_match THEN
        DBMS_OUTPUT.PUT_LINE('The donor and recipient blood types match.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('The donor and recipient blood types do not match.');
    END IF;
END;
/
------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION get_recipient_info(p_file_no IN recipient.file_no%TYPE)
RETURN VARCHAR2
IS
  v_info VARCHAR2(200);
BEGIN
  SELECT name || ', born on ' || TO_CHAR(dob, 'DD-MON-YYYY') || ', has blood type ' || blood_type || ', and is under the care of doctor ' || doc_id
  INTO v_info
  FROM recipient
  WHERE file_no = p_file_no;
  
  RETURN v_info;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RETURN 'Recipient with file number ' || p_file_no || ' not found.';
END;
/
--CALL****************************************
set serveroutput on;
 SELECT get_recipient_info(1) FROM dual;
--------------------------------i.Each student in-group should create a Trigger----------------------
CREATE OR REPLACE TRIGGER LIFE
AFTER UPDATE ON Donor
FOR EACH ROW 
DECLARE
 status VARCHAR2(70);
 BEGIN
 status := :OLD.Life_status;
if status ='unstable' THEN   dbms_output.put_line('state of emergency');
ELSE  dbms_output.put_line('no emergency ');
END if;
 END;
/ --update Donor set Life_status='unstable' where File_no='3984';
-----------------------
create trigger delete_donor
 BEFORE
 DELETE ON Donor_UNF
 for each row 
 BEGIN 
 dbms_output.put_line('*After deleting you wont have access to this information again*');
 END;
 /
 --delete from Donor_UNF where name='AHMAD';
 --------------------------------
 create trigger insert_donor
 after
 INSERT ON Donor
 for each row 
 BEGIN 
 dbms_output.put_line('New donor has been inserted');
 END;
 /
 --INSERT INTO Donor(File_no,DOB , Blood_type , Life_status,DOC_ID) VALUES ('3333','01-DEC-2000', 'O+' ,'unstable','112');
 ----------------------------
 CREATE OR REPLACE TRIGGER Msg
AFTER 
 UPDATE ON Donor 
FOR EACH ROW 
WHEN(new.DOB>'1-DEC-2009') 
BEGIN
RAISE_APPLICATION_ERROR(-20001,'You are not allowed to donate');
END;
/ --update Donor set DOB='1-DEC-2010' where File_no='3464';
--------------------------------
CREATE OR REPLACE TRIGGER same_date_surgery_trigger
BEFORE INSERT OR UPDATE OF date_SUR ON surgery
FOR EACH ROW
DECLARE
  v_count NUMBER(10);
BEGIN
  SELECT COUNT(*) INTO v_count FROM Surgery 
  WHERE date_SUR = :new.date_SUR;
  IF v_count > 1 THEN
    RAISE_APPLICATION_ERROR(-20001, 'Two surgeries cannot be scheduled on the same date.');
  END IF;
END;
/
--INSERT INTO Surgery(Surgery_no,result,date_SUR,time_SUR,lacation,Rec_File_NO,Don_File_NO) VALUES ('7','success','11-JAN-2023','','Riyadh','6','3464');
----------------------------------------------------------------------------------------------------------------------------------------------------------------------