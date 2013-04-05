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


GRANT ALL ON users TO hwen3;
GRANT ALL ON persons TO hwen3;
GRANT ALL ON family_doctor TO hwen3;
GRANT ALL ON radiology_record TO hwen3;
GRANT ALL ON pacs_images TO hwen3;

GRANT ALL ON users TO fangyu2;
GRANT ALL ON persons TO fangyu2;
GRANT ALL ON family_doctor TO fangyu2;
GRANT ALL ON radiology_record TO fangyu2;
GRANT ALL ON pacs_images TO fangyu2;



INSERT INTO users VALUES( 'jim', '123', 'a', SYSDATE );
INSERT INTO users VALUES( 'jon', '123', 'a', SYSDATE );
INSERT INTO users VALUES( 'fang', '123', 'a', SYSDATE );
INSERT INTO users VALUES( 'adam', '123', 'p', SYSDATE );
INSERT INTO users VALUES( 'bob', '123', 'p', SYSDATE );
INSERT INTO users VALUES( 'charlie', '123', 'p', SYSDATE );
INSERT INTO users VALUES( 'jill', '123', 'p', SYSDATE );
INSERT INTO users VALUES( 'bill', '123', 'p', SYSDATE );
INSERT INTO users VALUES( 'jake', '123', 'p', SYSDATE );
INSERT INTO users VALUES( 'tory', '123', 'p', SYSDATE );
INSERT INTO users VALUES( 'susane', '123', 'p', SYSDATE );
INSERT INTO users VALUES( 'jordan', '123', 'p', SYSDATE );
INSERT INTO users VALUES( 'terry', '123', 'p', SYSDATE );
INSERT INTO users VALUES( 'sid', '123', 'p', SYSDATE );
INSERT INTO users VALUES( 'austin', '123', 'p', SYSDATE );
INSERT INTO users VALUES( 'eric', '123', 'p', SYSDATE );
INSERT INTO users VALUES( 'henry', '123', 'p', SYSDATE );
INSERT INTO users VALUES( 'ikov', '123', 'p', SYSDATE );
INSERT INTO users VALUES( 'donna', '123', 'd', SYSDATE );
INSERT INTO users VALUES( 'evan', '123', 'd', SYSDATE );
INSERT INTO users VALUES( 'fiona', '123', 'd', SYSDATE );
INSERT INTO users VALUES( 'gia', '123', 'r', SYSDATE );
INSERT INTO users VALUES( 'hon', '123', 'r', SYSDATE );
INSERT INTO users VALUES( 'ivan', '123', 'r', SYSDATE );


INSERT INTO persons VALUES( 'jim', 'jim', 'wen', '1234 main street, edmonton, alberta', 'jim@radiology.com', '7804444444' );
INSERT INTO persons VALUES( 'jon', 'jon', 'emery', '9908 123 street, calgary, alberta', 'jon@radiology.com', '7804567891' );
INSERT INTO persons VALUES( 'fang', 'fang', 'li', '745 victoria avenue, victoria, british columbia', 'fang@radiology.com', '7806985964' );
INSERT INTO persons VALUES( 'adam', 'adam', 'anderson', '999 wayne gretzky drive, toronto, ontario', 'adamanderson@hotmail.com', '7802561478' );
INSERT INTO persons VALUES( 'bob', 'bob', 'job', '9956 148 street, edmonton, alberta', 'bob@gmail.com', '7086541238' );
INSERT INTO persons VALUES( 'charlie', 'charlie', 'chaser', '9635 12 street, calgary, alberta', 'charlie@yahoo.com', '4034836008' );
INSERT INTO persons VALUES( 'jill', 'jill', 'gall', '4028 Stohlton rd se, port orchard, washington', 'jilliane@hotmail.com', '7854012365' );
INSERT INTO persons VALUES( 'bill', 'bill', 'tong', '1815 Keeney St, evanston, illinois', 'billtong@hotmail.com', '7854045665' );
INSERT INTO persons VALUES( 'jake', 'jake', 'wang', '3240 Stanton Rd SE, port orchard washington', 'jakewang@hotmail.com', '7854654321' );
INSERT INTO persons VALUES( 'tory', 'tory', 'lee', '212 Oak St, lancaster, ohio', 'torylee@hotmail.com', '7756548987' );
INSERT INTO persons VALUES( 'susane', 'susane', 'li', '618 Wynn St, johnstown, saskatchewan', 'susaneli@hotmail.com', '3021569874' );
INSERT INTO persons VALUES( 'jordan', 'jordan', 'ketchum', '5712 State Route 23, saskatoon, saskatchewan', 'jordan@hotmail.com', '4625645489' );
INSERT INTO persons VALUES( 'terry', 'terry', 'saur', '77 Frost Ave, yellowknife, northwest territories', 'terrysaur@hotmail.com', '8796542548' );
INSERT INTO persons VALUES( 'sid', 'sid', 'mon', '17521 Railroad St, whitehorse, yukon', 'sidmody@hotmail.com', '6523145887' );
INSERT INTO persons VALUES( 'austin', 'austin', 'more', '357 S Barrington Rd, edmonton, alberta', 'austinmore@hotmail.com', '9763128973' );
INSERT INTO persons VALUES( 'eric', 'eric', 'maury', '2256 Ferncliff Ln, edmonton, alberta', 'ericmaury@hotmail.com', '1024568433' );
INSERT INTO persons VALUES( 'henry', 'henry', 'rosevelt', '40 New Bond St, saskatoon, saskatchewan', 'henry@hotmail.com', '9632587446' );
INSERT INTO persons VALUES( 'ikov', 'ikov', 'kennedy', '41 Wellington St, calgary, alberta', 'ikovkennedy@hotmail.com', '6023546974' );
INSERT INTO persons VALUES( 'donna', 'donna', 'williams', '745 victor avenue, victoria, british columbia', 'd.williams@ualberta.ca', '5603698521' );
INSERT INTO persons VALUES( 'evan', 'evan', 'binder', '9 wayne gretzky drive, toronto, ontario', 'evan@hotmail.com', '5439814561' );
INSERT INTO persons VALUES( 'fiona', 'fiona', 'garden', '659 wayne gretzky drive, toronto, ontario', 'fiona.g@msn.ca', '7809028159' );
INSERT INTO persons VALUES( 'gia', 'gia', 'hound', '9876 sunridge blvd, toronto, ontario', 'giahound69@bing.ca', '7809065961' );
INSERT INTO persons VALUES( 'hon', 'hon', 'chu', '789 charleston avenue, toronto, ontario', 'hon99@hotmail.com', '7896549878' );
INSERT INTO persons VALUES( 'ivan', 'ivan', 'day', '9120 149 street, edmonton alberta', 'ivan@yahoo.com', '8884561230' );


INSERT INTO family_doctor VALUES( 'donna', 'adam' );
INSERT INTO family_doctor VALUES( 'donna', 'bob' );
INSERT INTO family_doctor VALUES( 'donna', 'eric' );
INSERT INTO family_doctor VALUES( 'donna', 'jill' );
INSERT INTO family_doctor VALUES( 'donna', 'terry' );
INSERT INTO family_doctor VALUES( 'donna', 'sid' );
INSERT INTO family_doctor VALUES( 'fiona', 'tory' );
INSERT INTO family_doctor VALUES( 'fiona', 'susane' );
INSERT INTO family_doctor VALUES( 'fiona', 'bill' );
INSERT INTO family_doctor VALUES( 'fiona', 'austin' );
INSERT INTO family_doctor VALUES( 'evan', 'jake' );
INSERT INTO family_doctor VALUES( 'evan', 'henry' );
INSERT INTO family_doctor VALUES( 'evan', 'ikov' );
INSERT INTO family_doctor VALUES( 'evan', 'charlie' );
INSERT INTO family_doctor VALUES( 'evan', 'jordan' );


INSERT INTO radiology_record VALUES( 1, 'jill', 'donna', 'ivan', 'MRI', to_date('15/03/2006:12:00:00AM', 'dd/mm/yyyy:hh:mi:ssam'), to_date('04/03/2013:12:00:00AM', 'dd/mm/yyyy:hh:mi:ssam'), 'clear', 'Nothing suspicious was found on the MRI.' );

INSERT INTO radiology_record VALUES( 2, 'adam', 'evan', 'hon', 'US', to_date('15/03/2006:12:00:00AM', 'dd/mm/yyyy:hh:mi:ssam'), to_date('04/03/2013:12:00:00AM', 'dd/mm/yyyy:hh:mi:ssam'), 'ulcer', 'Found a stage 3 ulcer, needs surgery' );

INSERT INTO radiology_record VALUES( 3, 'jill', 'fiona', 'gia', 'US', to_date('20/02/2010:12:00:00AM', 'dd/mm/yyyy:hh:mi:ssam'), to_date('01/01/2010:12:00:00AM', 'dd/mm/yyyy:hh:mi:ssam'), 'baby', 'Baby, 6 months along. Nothing suspicious found.' );

INSERT INTO radiology_record VALUES( 4, 'jake', 'donna', 'ivan', 'CAT', to_date('21/05/2010:12:00:00AM', 'dd/mm/yyyy:hh:mi:ssam'), to_date('01/04/2009:12:00:00AM', 'dd/mm/yyyy:hh:mi:ssam'), 'brain', 'Heavy brain damage found, needs surgery.' );

INSERT INTO radiology_record VALUES( 5, 'adam', 'donna', 'hon', 'CT', to_date('13/12/2014:12:00:00AM', 'dd/mm/yyyy:hh:mi:ssam'), to_date('26/05/2013:12:00:00AM', 'dd/mm/yyyy:hh:mi:ssam'), 'clear', 'Nothing suspicious was found on the MRI.' );

INSERT INTO radiology_record VALUES( 6, 'jake', 'evan', 'gia', 'US', to_date('15/03/2013:12:00:00AM', 'dd/mm/yyyy:hh:mi:ssam'), to_date('30/06/2006:12:00:00AM', 'dd/mm/yyyy:hh:mi:ssam'), 'ulcer', 'Found a stage 3 ulcer, needs surgery' );

INSERT INTO radiology_record VALUES( 7, 'adam', 'austin', 'hon', 'CAT', to_date('15/03/2006:12:00:00AM', 'dd/mm/yyyy:hh:mi:ssam'), to_date('29/07/2007:12:00:00AM', 'dd/mm/yyyy:hh:mi:ssam'), 'ulcer', 'Found a stage 3 ulcer, needs surgery to remove ulcer before it causes even more damage with spreading the ulcer' );

INSERT INTO radiology_record VALUES( 8, 'austin', 'donna', 'ivan', 'X-Ray', to_date('20/02/2010:12:00:00AM', 'dd/mm/yyyy:hh:mi:ssam'), to_date('23/12/2005:12:00:00AM', 'dd/mm/yyyy:hh:mi:ssam'), 'broken collar bone', 'collar bone was broken in three places, immediate surgery has been ordered. extreme bone pain.' );

INSERT INTO radiology_record VALUES( 9, 'austin', 'evan', 'gia', 'X-Ray', to_date('20/02/2010:12:00:00AM', 'dd/mm/yyyy:hh:mi:ssam'), to_date('11/11/2010:12:00:00AM', 'dd/mm/yyyy:hh:mi:ssam'), 'brain', 'Nothing was able to be found on the X-Ray scan' );

INSERT INTO radiology_record VALUES( 10, 'austin', 'donna', 'gia', 'X-Ray', to_date('21/05/2010:12:00:00AM', 'dd/mm/yyyy:hh:mi:ssam'), to_date('12/10/2013:12:00:00AM', 'dd/mm/yyyy:hh:mi:ssam'), 'brain, bone', 'X-Ray X-Ray X-Ray X-Ray X-Ray X-Ray X-Ray X-Ray X-Ray X-Ray X-Ray' );

INSERT INTO radiology_record VALUES( 11, 'austin', 'fiona', 'gia', 'MRI MRI MRI', to_date('21/05/2010:12:00:00AM', 'dd/mm/yyyy:hh:mi:ssam'), to_date('15/09/2006:12:00:00AM', 'dd/mm/yyyy:hh:mi:ssam'), 'clear, austin, baby', 'Nothing suspicious was found on the MRI. MRI MRI MRI' );

INSERT INTO radiology_record VALUES( 12, 'austin', 'fiona', 'hon', 'MRI', to_date('03/11/2001:12:00:00AM', 'dd/mm/yyyy:hh:mi:ssam'), to_date('25/08/2010:12:00:00AM', 'dd/mm/yyyy:hh:mi:ssam'), 'clear, baby, brain, ulcer', 'Nothing suspicious was austin austin austin austin austin austin on the MRI.' );


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
define interval = "30"

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


