/*
 *  File name:  setup.sql
 *  Function:   to create the initial database schema for the CMPUT 391 project,
 *				and populate its tables
 *              Winter Term, 2012
 *  Author:     Prof. Li-Yan Yuan
 */
DROP TABLE persons;
DROP TABLE family_doctor;
DROP TABLE pacs_images;
DROP TABLE radiology_record;
DROP TABLE users;
DROP INDEX radindex;
DROP SEQUENCE image_id_sequence;
DROP SEQUENCE record_id_sequence;


CREATE TABLE users (
   user_name varchar(24),
   password  varchar(24),
   class     char(1),
   date_registered date,
   CHECK (class in ('a','p','d','r')),
   PRIMARY KEY(user_name)
);

CREATE TABLE persons (
   user_name  varchar(24),
   first_name varchar(24),
   last_name  varchar(24),
   address    varchar(128),
   email      varchar(128),
   phone      char(10),
   PRIMARY KEY(user_name),
   UNIQUE (email),
   FOREIGN KEY (user_name) REFERENCES users
);


CREATE TABLE family_doctor (
   doctor_name  varchar(24),
   patient_name varchar(24),
   FOREIGN KEY(doctor_name) REFERENCES users,
   FOREIGN KEY(patient_name) REFERENCES users,
   PRIMARY KEY(doctor_name,patient_name)
);


CREATE TABLE radiology_record (
   record_id   int,
   patient_name varchar(24),
   doctor_name varchar(24),
   radiologist_name varchar(24),
   test_type   varchar(24),
   prescribing_date date,
   test_date    date,
   diagnosis    varchar(128),
   description   varchar(1024),
   PRIMARY KEY(record_id),
   FOREIGN KEY(patient_name) REFERENCES users,
   FOREIGN KEY(doctor_name) REFERENCES users,
   FOREIGN KEY(radiologist_name) REFERENCES users
);

CREATE TABLE pacs_images (
   record_id   int,
   image_id    int,
   thumbnail   blob,
   regular_size blob,
   full_size    blob,
   PRIMARY KEY(record_id,image_id),
   FOREIGN KEY(record_id) REFERENCES radiology_record
);


INSERT INTO users VALUES( 'jon', '123', 'a', SYSDATE );

INSERT INTO persons VALUES( 'jon', 'jon', 'emery', '9908 123 street, calgary, alberta', 'jon@radiology.com', '7804567891' );


CREATE SEQUENCE image_id_sequence;
CREATE SEQUENCE record_id_sequence;


commit;


CREATE INDEX descindex ON radiology_record(description) INDEXTYPE IS CTXSYS.CONTEXT;
CREATE INDEX userindex ON radiology_record(patient_name) INDEXTYPE IS CTXSYS.CONTEXT;
CREATE INDEX diagindex ON radiology_record(diagnosis) INDEXTYPE IS CTXSYS.CONTEXT;

commit;

define idxname = "descindex"
define idxname2 = "userindex"
define idxname3 = "diagindex"
define interval = "15"

set serveroutput on
declare
  job number;
begin
  dbms_job.submit(job, 'ctx_ddl.sync_index(''&idxname'');',
                  interval=>'SYSDATE+&interval/1440');
  commit;
  dbms_output.put_line('job '||job||' has been submitted.');
  
  dbms_job.submit(job, 'ctx_ddl.sync_index(''&idxname2'');',
                  interval=>'SYSDATE+&interval/1440');
  commit;
  dbms_output.put_line('job '||job||' has been submitted.');
  
  dbms_job.submit(job, 'ctx_ddl.sync_index(''&idxname3'');',
                  interval=>'SYSDATE+&interval/1440');
  commit;
  dbms_output.put_line('job '||job||' has been submitted.');
end;
/


