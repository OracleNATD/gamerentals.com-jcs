--------------------------------------------------------
--  File created - Wednesday-June-14-2017   
--------------------------------------------------------
-- DROP TABLE "ADMINISTRATORS"; 
-- DROP TABLE "CATEGORY";
-- DROP TABLE "EXPENSES";
-- DROP TABLE "IMAGES";
-- DROP TABLE "ORDER_DETAILS";
-- DROP TABLE "PRODUCTS";
-- DROP TABLE "USER_AUTH";
-- DROP SEQUENCE "SEQ1";
-- DROP SEQUENCE "USER_SEQ";
-- DROP PROCEDURE "ADD_ORDER";
--------------------------------------------------------
--  DDL for Sequence SEQ1
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ1"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 50 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence USER_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "USER_SEQ"  MINVALUE 100 MAXVALUE 1000 INCREMENT BY 1 START WITH 105 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Table ADMINISTRATORS
--------------------------------------------------------

  CREATE TABLE "ADMINISTRATORS" 
   (	"ADMIN_ID" NUMBER(10,0), 
	"EMAIL" VARCHAR2(45), 
	"PASSWORD" VARCHAR2(45)
   ) ;
--------------------------------------------------------
--  DDL for Table CATEGORY
--------------------------------------------------------

  CREATE TABLE "CATEGORY" 
   (	"CATEGORY_ID" NUMBER(2,0), 
	"CATEGORY_NAME" VARCHAR2(30)
   ) ;
--------------------------------------------------------
--  DDL for Table EXPENSES
--------------------------------------------------------

  CREATE TABLE "EXPENSES" 
   (	"EXPENSES_ID" NUMBER(3,0), 
	"PRODUCT_ID" NUMBER(3,0), 
	"PRODUCT_NAME" VARCHAR2(255), 
	"PRICE" NUMBER(4,2), 
	"PURCHASE_DATE" DATE
   ) ;
--------------------------------------------------------
--  DDL for Table IMAGES
--------------------------------------------------------

  CREATE TABLE "IMAGES" 
   (	"IMAGE_ID" NUMBER(3,0), 
	"IMAGE_NAME" VARCHAR2(255), 
	"PRODUCT_NAME" VARCHAR2(255), 
	"ISTHUMBNAIL" NUMBER(1,0) DEFAULT 0
   ) ;
--------------------------------------------------------
--  DDL for Table ORDER_DETAILS
--------------------------------------------------------

  CREATE TABLE "ORDER_DETAILS" 
   (	"ORDER_ID" RAW(32), 
	"USER_ID" NUMBER(3,0), 
	"STATUS" VARCHAR2(30), 
	"SHIPPERS_NAME" VARCHAR2(30), 
	"ADDRESS" VARCHAR2(120), 
	"MOBILE_NUMBER" VARCHAR2(10), 
	"SHIPPERS_EMAIL" VARCHAR2(45), 
	"ORDERED_ON" DATE DEFAULT sysdate, 
	"TOTAL_ORDER_PRICE" NUMBER(6,2)
   ) ;
--------------------------------------------------------
--  DDL for Table PRODUCTS
--------------------------------------------------------

  CREATE TABLE "PRODUCTS" 
   (	"PRODUCT_ID" NUMBER(3,0), 
	"PRODUCT_NAME" VARCHAR2(60), 
	"SUB_CATEGORY_NAME" VARCHAR2(40), 
	"CATEGORY_NAME" VARCHAR2(40), 
	"COMPANY_NAME" VARCHAR2(40), 
	"PRICE" NUMBER(8,2), 
	"SUMMARY" VARCHAR2(4000), 
	"TAGS" VARCHAR2(255), 
	"PRODUCT_QTY" NUMBER(2,0), 
	"LASTUPDATED" DATE DEFAULT sysdate, 
	"HITS" NUMBER(3,0)
   ) ;
--------------------------------------------------------
--  DDL for Table USER_AUTH
--------------------------------------------------------

  CREATE TABLE "USER_AUTH" 
   (	"USER_ID" NUMBER(10,0), 
	"EMAIL" VARCHAR2(50), 
	"PASS" VARCHAR2(1024), 
	"REGISTEREDON" DATE DEFAULT sysdate
   ) ;
--INSERTING into ADMINISTRATORS
SET DEFINE OFF;
Insert into ADMINISTRATORS (ADMIN_ID,EMAIL,PASSWORD) values (1,'krisb99@gmail.com','aaaa1111');
-- INSERTING into CATEGORY
SET DEFINE OFF;
Insert into CATEGORY (CATEGORY_ID,CATEGORY_NAME) values (3,'Movies');
Insert into CATEGORY (CATEGORY_ID,CATEGORY_NAME) values (4,'Computers');
Insert into CATEGORY (CATEGORY_ID,CATEGORY_NAME) values (5,'Stationaries');
Insert into CATEGORY (CATEGORY_ID,CATEGORY_NAME) values (1,'Games');
-- INSERTING into EXPENSES
SET DEFINE OFF;
Insert into EXPENSES (EXPENSES_ID,PRODUCT_ID,PRODUCT_NAME,PRICE,PURCHASE_DATE) values (1,1,'Assassins Creed',10.5,to_date('04-MAY-17','DD-MON-RR'));
Insert into EXPENSES (EXPENSES_ID,PRODUCT_ID,PRODUCT_NAME,PRICE,PURCHASE_DATE) values (2,18,'Sherlock Holmes',7.8,to_date('04-MAY-17','DD-MON-RR'));
Insert into EXPENSES (EXPENSES_ID,PRODUCT_ID,PRODUCT_NAME,PRICE,PURCHASE_DATE) values (3,18,'Sherlock Holmes',0,to_date('04-MAY-17','DD-MON-RR'));
Insert into EXPENSES (EXPENSES_ID,PRODUCT_ID,PRODUCT_NAME,PRICE,PURCHASE_DATE) values (4,38,'Samsung XYDO',50,to_date('04-MAY-17','DD-MON-RR'));
Insert into EXPENSES (EXPENSES_ID,PRODUCT_ID,PRODUCT_NAME,PRICE,PURCHASE_DATE) values (5,38,'Samsung XYDO',50,to_date('04-MAY-17','DD-MON-RR'));
Insert into EXPENSES (EXPENSES_ID,PRODUCT_ID,PRODUCT_NAME,PRICE,PURCHASE_DATE) values (6,18,'Complete Reference J2EE',45,to_date('04-MAY-17','DD-MON-RR'));
Insert into EXPENSES (EXPENSES_ID,PRODUCT_ID,PRODUCT_NAME,PRICE,PURCHASE_DATE) values (7,19,'Complete Reference Java',45,to_date('04-MAY-17','DD-MON-RR'));
Insert into EXPENSES (EXPENSES_ID,PRODUCT_ID,PRODUCT_NAME,PRICE,PURCHASE_DATE) values (30,39,'Assassins Creed I (2007)',34,to_date('04-MAY-17','DD-MON-RR'));
Insert into EXPENSES (EXPENSES_ID,PRODUCT_ID,PRODUCT_NAME,PRICE,PURCHASE_DATE) values (32,3,'Assassins Creed III',18,to_date('04-MAY-17','DD-MON-RR'));
-- INSERTING into IMAGES
SET DEFINE OFF;
Insert into IMAGES (IMAGE_ID,IMAGE_NAME,PRODUCT_NAME,ISTHUMBNAIL) values (1,'uploads/66795616grand-theft-auto-vice-city-400x400-imad9tdseyzn2ygf.jpeg','Grand theft Auto Vice City',1);
Insert into IMAGES (IMAGE_ID,IMAGE_NAME,PRODUCT_NAME,ISTHUMBNAIL) values (2,'uploads/582003697gta-vice-city-400x400-imadfgu8qc5xmt4h.jpeg','Grand theft Auto Vice City',1);
Insert into IMAGES (IMAGE_ID,IMAGE_NAME,PRODUCT_NAME,ISTHUMBNAIL) values (6,'uploads/675975633gta-iv-400x400-imad89f2pggtrfhk.jpeg','Grand Theft Auto IV',1);
Insert into IMAGES (IMAGE_ID,IMAGE_NAME,PRODUCT_NAME,ISTHUMBNAIL) values (4,'uploads/7778632gta-vice-city-400x400-imadfgu8quzzguhj.jpeg','Grand theft Auto Vice City',1);
Insert into IMAGES (IMAGE_ID,IMAGE_NAME,PRODUCT_NAME,ISTHUMBNAIL) values (5,'uploads/112437579gta-vice-city-400x400-imadfhxy4ewbk2fy.jpeg','Grand theft Auto Vice City',1);
Insert into IMAGES (IMAGE_ID,IMAGE_NAME,PRODUCT_NAME,ISTHUMBNAIL) values (7,'uploads/135277833grand-theft-auto-iv-complete-edition-400x400-imadf3y5vgqycf6h.jpeg','Grand Theft Auto IV',1);
Insert into IMAGES (IMAGE_ID,IMAGE_NAME,PRODUCT_NAME,ISTHUMBNAIL) values (8,'uploads/586241535grand-theft-auto-iv-400x400-imadf3y5abwgr2gy.jpeg','Grand Theft Auto IV',1);
Insert into IMAGES (IMAGE_ID,IMAGE_NAME,PRODUCT_NAME,ISTHUMBNAIL) values (9,'uploads/362646331grand-theft-auto-iv-400x400-imadf3y3exzgpr5k.jpeg','Grand Theft Auto IV',1);
Insert into IMAGES (IMAGE_ID,IMAGE_NAME,PRODUCT_NAME,ISTHUMBNAIL) values (10,'uploads/787275717assassin-s-creed-iii-400x400-imadfwj4mfnanp5m.jpeg','Assassins Creed III',1);
Insert into IMAGES (IMAGE_ID,IMAGE_NAME,PRODUCT_NAME,ISTHUMBNAIL) values (11,'uploads/612349603assassin-s-creed-iii-400x400-imad8ccuzjn88erm.jpeg','Assassins Creed III',1);
Insert into IMAGES (IMAGE_ID,IMAGE_NAME,PRODUCT_NAME,ISTHUMBNAIL) values (12,'uploads/232616902assassin-s-creed-iii-400x400-imad8ccuwz8xnsfy.jpeg','Assassins Creed III',1);
Insert into IMAGES (IMAGE_ID,IMAGE_NAME,PRODUCT_NAME,ISTHUMBNAIL) values (13,'uploads/511470388assassin-s-creed-iii-400x400-imad8ccutrzrd3ys.jpeg','Assassins Creed III',1);
Insert into IMAGES (IMAGE_ID,IMAGE_NAME,PRODUCT_NAME,ISTHUMBNAIL) values (14,'uploads/844418678assassin-s-creed-iii-400x400-imad8ccufyr4tzcc.jpeg','Assassins Creed III',1);
Insert into IMAGES (IMAGE_ID,IMAGE_NAME,PRODUCT_NAME,ISTHUMBNAIL) values (17,'uploads/914895368assassin-s-creed-revelations-400x400-imaczsg6egwau3fa.jpeg','Assassins Creed Revalations',1);
Insert into IMAGES (IMAGE_ID,IMAGE_NAME,PRODUCT_NAME,ISTHUMBNAIL) values (18,'uploads/547383985assassin-s-creed-revelations-400x400-imaczsg5nmcfzy8h.jpeg','Assassins Creed Revalations',1);
Insert into IMAGES (IMAGE_ID,IMAGE_NAME,PRODUCT_NAME,ISTHUMBNAIL) values (141,'uploads/204867706main.jpeg','Philips Jester Headset Sets',1);
Insert into IMAGES (IMAGE_ID,IMAGE_NAME,PRODUCT_NAME,ISTHUMBNAIL) values (20,'uploads/164673361batman-arkham-city-400x400-imadyncrdzh462nr.jpeg','Batman Arkham City',1);
Insert into IMAGES (IMAGE_ID,IMAGE_NAME,PRODUCT_NAME,ISTHUMBNAIL) values (21,'uploads/732734145batman-arkham-city-400x400-imacztghxwjjf8rb.jpeg','Batman Arkham City',1);
Insert into IMAGES (IMAGE_ID,IMAGE_NAME,PRODUCT_NAME,ISTHUMBNAIL) values (22,'uploads/692175872batman-arkham-city-400x400-imacztggreq9rddz.jpeg','Batman Arkham City',1);
Insert into IMAGES (IMAGE_ID,IMAGE_NAME,PRODUCT_NAME,ISTHUMBNAIL) values (23,'uploads/241494861batman-arkham-city-400x400-imacztggreq9rddz.jpeg','Batman Arkham City',1);
Insert into IMAGES (IMAGE_ID,IMAGE_NAME,PRODUCT_NAME,ISTHUMBNAIL) values (26,'uploads/638923611spider-man-3-400x400-imad8n8zhmfy5yez.jpeg','The Amazing Spiderman (Game)',1);
Insert into IMAGES (IMAGE_ID,IMAGE_NAME,PRODUCT_NAME,ISTHUMBNAIL) values (25,'uploads/208281828batman-arkham-city-400x400-imacztggp8ewjjah.jpeg','Batman Arkham City',1);
Insert into IMAGES (IMAGE_ID,IMAGE_NAME,PRODUCT_NAME,ISTHUMBNAIL) values (27,'uploads/908729385spider-man-3-the-game-400x400-imadfn63smqtucyf.jpeg','The Amazing Spiderman (Game)',1);
Insert into IMAGES (IMAGE_ID,IMAGE_NAME,PRODUCT_NAME,ISTHUMBNAIL) values (28,'uploads/583963674spider-man-3-the-game-400x400-imadfn6bykcymvjw.jpeg','The Amazing Spiderman (Game)',0);
Insert into IMAGES (IMAGE_ID,IMAGE_NAME,PRODUCT_NAME,ISTHUMBNAIL) values (29,'uploads/890453695spider-man-3-the-game-400x400-imadfeezhvtke3bm.jpeg','The Amazing Spiderman (Game)',0);
Insert into IMAGES (IMAGE_ID,IMAGE_NAME,PRODUCT_NAME,ISTHUMBNAIL) values (30,'uploads/497039085spider-man-3-the-game-400x400-imadfef2pfznfguh.jpeg','The Amazing Spiderman (Game)',0);
Insert into IMAGES (IMAGE_ID,IMAGE_NAME,PRODUCT_NAME,ISTHUMBNAIL) values (31,'uploads/741250321prototype-2-400x400-imadf7saewdra6n9.jpeg','Prototype 2',0);
Insert into IMAGES (IMAGE_ID,IMAGE_NAME,PRODUCT_NAME,ISTHUMBNAIL) values (32,'uploads/762492421prototype-2-400x400-imad7cp97dghj5hg.jpeg','Prototype 2',0);
--INSERTING into ORDER_DETAILS
SET DEFINE OFF;
Insert into ORDER_DETAILS (ORDER_ID,USER_ID,STATUS,SHIPPERS_NAME,ADDRESS,MOBILE_NUMBER,SHIPPERS_EMAIL,ORDERED_ON,TOTAL_ORDER_PRICE) values ('50D2DE787CFA23CFE05306BCC40ABB0F',10,'paid','W Brian Leonard','368 Sawmill Lane','6502557767','william.leonard@oracle.com',to_date('31-MAY-17','DD-MON-RR'),460);
Insert into ORDER_DETAILS (ORDER_ID,USER_ID,STATUS,SHIPPERS_NAME,ADDRESS,MOBILE_NUMBER,SHIPPERS_EMAIL,ORDERED_ON,TOTAL_ORDER_PRICE) values ('50D2DE787CFB23CFE05306BCC40ABB0F',11,'paid','bdbdgbdgb','fbdfbdfbdfb','23232323','jimj6@hotmail.com',to_date('31-MAY-17','DD-MON-RR'),460);
Insert into ORDER_DETAILS (ORDER_ID,USER_ID,STATUS,SHIPPERS_NAME,ADDRESS,MOBILE_NUMBER,SHIPPERS_EMAIL,ORDERED_ON,TOTAL_ORDER_PRICE) values ('51F4BCDB727F414FE05306BCC40A8807',11,'paid','Kris Bhanushali','506 Adriatic Ct','9255673716','jimj6@hotmail.com',to_date('14-JUN-17','DD-MON-RR'),19.99);
--INSERTING into PRODUCTS
--DEFINE OFF;
Insert into PRODUCTS (PRODUCT_ID,PRODUCT_NAME,SUB_CATEGORY_NAME,CATEGORY_NAME,COMPANY_NAME,PRICE,SUMMARY,TAGS,PRODUCT_QTY,LASTUPDATED,HITS) values (1,'Grand theft Auto Vice City','Sandbox','Games','Rockstar',10.99,'<div>\r\nWhen a young street hustler, a retired bank robber and a terrifying psychopath find themselves entangled with some of the most frightening and deranged elements of the criminal underworld, the U.S. government and the entertainment industry, they must pull off a series of dangerous heists to survive in a ruthless city in which they can trust nobody, least of all each other.\r\n</div>',null,null,to_date('11-MAY-17','DD-MON-RR'),4);
Insert into PRODUCTS (PRODUCT_ID,PRODUCT_NAME,SUB_CATEGORY_NAME,CATEGORY_NAME,COMPANY_NAME,PRICE,SUMMARY,TAGS,PRODUCT_QTY,LASTUPDATED,HITS) values (2,'Grand Theft Auto IV','Sandbox','Games','Rockstar',12.95,'<div>\r\n    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\r\n</div>\r\n<div>\r\n    Curabitur pretium tincidunt lacus. Nulla gravida orci a odio. Nullam varius, turpis et commodo pharetra, est eros bibendum elit, nec luctus magna felis sollicitudin mauris. Integer in mauris eu nibh euismod gravida. Duis ac tellus et risus vulputate vehicula. Donec lobortis risus a elit. Etiam tempor. Ut ullamcorper, ligula eu tempor congue, eros est euismod turpis, id tincidunt sapien risus a quam. Maecenas fermentum consequat mi. Donec fermentum. Pellentesque malesuada nulla a mi. Duis sapien sem, aliquet nec, commodo eget, consequat quis, neque. Aliquam faucibus, elit ut dictum aliquet, felis nisl adipiscing sapien, sed malesuada diam lacus eget erat. Cras mollis scelerisque nunc. Nullam arcu. Aliquam consequat. Curabitur augue lorem, dapibus quis, laoreet et, pretium ac, nisi. Aenean magna nisl, mollis quis, molestie eu, feugiat in, orci. In hac habitasse platea dictumst.\r\n</div>\r\n<div>\r\n    Fusce convallis, mauris imperdiet gravida bibendum, nisl turpis suscipit mauris, sed placerat ipsum urna sed risus. In convallis tellus a mauris. Curabitur non elit ut libero tristique sodales. Mauris a lacus. Donec mattis semper leo. In hac habitasse platea dictumst. Vivamus facilisis diam at odio. Mauris dictum, nisi eget consequat elementum, lacus ligula molestie metus, non feugiat orci magna ac sem. Donec turpis. Donec vitae metus. Morbi tristique neque eu mauris. Quisque gravida ipsum non sapien. Proin turpis lacus, scelerisque vitae, elementum at, lobortis ac, quam. Aliquam dictum eleifend risus. In hac habitasse platea dictumst. Etiam sit amet diam. Suspendisse odio. Suspendisse nunc. In semper bibendum libero.\r\n</div>\r\n<div>\r\n    Proin nonummy, lacus eget pulvinar lacinia, pede felis dignissim leo, vitae tristique magna lacus sit amet eros. Nullam ornare. Praesent odio ligula, dapibus sed, tincidunt eget, dictum ac, nibh. Nam quis lacus. Nunc eleifend molestie velit. Morbi lobortis quam eu velit. Donec euismod vestibulum massa. Donec non lectus. Aliquam commodo lacus sit amet nulla. Cras dignissim elit et augue. Nullam non diam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. In hac habitasse platea dictumst. Aenean vestibulum. Sed lobortis elit quis lectus. Nunc sed lacus at augue bibendum dapibus.\r\n</div>\r\n<div>\r\n    Aliquam vehicula sem ut pede. Cras purus lectus, egestas eu, vehicula at, imperdiet sed, nibh. Morbi consectetuer luctus felis. Donec vitae nisi. Aliquam tincidunt feugiat elit. Duis sed elit ut turpis ullamcorper feugiat. Praesent pretium, mauris sed fermentum hendrerit, nulla lorem iaculis magna, pulvinar scelerisque urna tellus a justo. Suspendisse pulvinar massa in metus. Duis quis quam. Proin justo. Curabitur ac sapien. Nam erat. Praesent ut quam.\r\n</div>','Grand Theft Auto IV',19,to_date('25-MAY-17','DD-MON-RR'),26);
Insert into PRODUCTS (PRODUCT_ID,PRODUCT_NAME,SUB_CATEGORY_NAME,CATEGORY_NAME,COMPANY_NAME,PRICE,SUMMARY,TAGS,PRODUCT_QTY,LASTUPDATED,HITS) values (3,'Assassins Creed III','Adventure','Games','Ubisoft',19.99,'<div>\r\n    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\r\n</div>\r\n<div>\r\n    Curabitur pretium tincidunt lacus. Nulla gravida orci a odio. Nullam varius, turpis et commodo pharetra, est eros bibendum elit, nec luctus magna felis sollicitudin mauris. Integer in mauris eu nibh euismod gravida. Duis ac tellus et risus vulputate vehicula. Donec lobortis risus a elit. Etiam tempor. Ut ullamcorper, ligula eu tempor congue, eros est euismod turpis, id tincidunt sapien risus a quam. Maecenas fermentum consequat mi. Donec fermentum. Pellentesque malesuada nulla a mi. Duis sapien sem, aliquet nec, commodo eget, consequat quis, neque. Aliquam faucibus, elit ut dictum aliquet, felis nisl adipiscing sapien, sed malesuada diam lacus eget erat. Cras mollis scelerisque nunc. Nullam arcu. Aliquam consequat. Curabitur augue lorem, dapibus quis, laoreet et, pretium ac, nisi. Aenean magna nisl, mollis quis, molestie eu, feugiat in, orci. In hac habitasse platea dictumst.\r\n</div>\r\n<div>\r\n    Fusce convallis, mauris imperdiet gravida bibendum, nisl turpis suscipit mauris, sed placerat ipsum urna sed risus. In convallis tellus a mauris. Curabitur non elit ut libero tristique sodales. Mauris a lacus. Donec mattis semper leo. In hac habitasse platea dictumst. Vivamus facilisis diam at odio. Mauris dictum, nisi eget consequat elementum, lacus ligula molestie metus, non feugiat orci magna ac sem. Donec turpis. Donec vitae metus. Morbi tristique neque eu mauris. Quisque gravida ipsum non sapien. Proin turpis lacus, scelerisque vitae, elementum at, lobortis ac, quam. Aliquam dictum eleifend risus. In hac habitasse platea dictumst. Etiam sit amet diam. Suspendisse odio. Suspendisse nunc. In semper bibendum libero.\r\n</div>\r\n<div>\r\n    Proin nonummy, lacus eget pulvinar lacinia, pede felis dignissim leo, vitae tristique magna lacus sit amet eros. Nullam ornare. Praesent odio ligula, dapibus sed, tincidunt eget, dictum ac, nibh. Nam quis lacus. Nunc eleifend molestie velit. Morbi lobortis quam eu velit. Donec euismod vestibulum massa. Donec non lectus. Aliquam commodo lacus sit amet nulla. Cras dignissim elit et augue. Nullam non diam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. In hac habitasse platea dictumst. Aenean vestibulum. Sed lobortis elit quis lectus. Nunc sed lacus at augue bibendum dapibus.\r\n</div>\r\n<div>\r\n    Aliquam vehicula sem ut pede. Cras purus lectus, egestas eu, vehicula at, imperdiet sed, nibh. Morbi consectetuer luctus felis. Donec vitae nisi. Aliquam tincidunt feugiat elit. Duis sed elit ut turpis ullamcorper feugiat. Praesent pretium, mauris sed fermentum hendrerit, nulla lorem iaculis magna, pulvinar scelerisque urna tellus a justo. Suspendisse pulvinar massa in metus. Duis quis quam. Proin justo. Curabitur ac sapien. Nam erat. Praesent ut quam.\r\n</div>','Assassins Creed III',25,to_date('25-MAY-17','DD-MON-RR'),52);
Insert into PRODUCTS (PRODUCT_ID,PRODUCT_NAME,SUB_CATEGORY_NAME,CATEGORY_NAME,COMPANY_NAME,PRICE,SUMMARY,TAGS,PRODUCT_QTY,LASTUPDATED,HITS) values (4,'Assassins Creed Revalations','Adventure','Games','Ubisoft',14.99,'<div>\r\n    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\r\n</div>\r\n<div>\r\n    Curabitur pretium tincidunt lacus. Nulla gravida orci a odio. Nullam varius, turpis et commodo pharetra, est eros bibendum elit, nec luctus magna felis sollicitudin mauris. Integer in mauris eu nibh euismod gravida. Duis ac tellus et risus vulputate vehicula. Donec lobortis risus a elit. Etiam tempor. Ut ullamcorper, ligula eu tempor congue, eros est euismod turpis, id tincidunt sapien risus a quam. Maecenas fermentum consequat mi. Donec fermentum. Pellentesque malesuada nulla a mi. Duis sapien sem, aliquet nec, commodo eget, consequat quis, neque. Aliquam faucibus, elit ut dictum aliquet, felis nisl adipiscing sapien, sed malesuada diam lacus eget erat. Cras mollis scelerisque nunc. Nullam arcu. Aliquam consequat. Curabitur augue lorem, dapibus quis, laoreet et, pretium ac, nisi. Aenean magna nisl, mollis quis, molestie eu, feugiat in, orci. In hac habitasse platea dictumst.\r\n</div>\r\n<div>\r\n    Fusce convallis, mauris imperdiet gravida bibendum, nisl turpis suscipit mauris, sed placerat ipsum urna sed risus. In convallis tellus a mauris. Curabitur non elit ut libero tristique sodales. Mauris a lacus. Donec mattis semper leo. In hac habitasse platea dictumst. Vivamus facilisis diam at odio. Mauris dictum, nisi eget consequat elementum, lacus ligula molestie metus, non feugiat orci magna ac sem. Donec turpis. Donec vitae metus. Morbi tristique neque eu mauris. Quisque gravida ipsum non sapien. Proin turpis lacus, scelerisque vitae, elementum at, lobortis ac, quam. Aliquam dictum eleifend risus. In hac habitasse platea dictumst. Etiam sit amet diam. Suspendisse odio. Suspendisse nunc. In semper bibendum libero.\r\n</div>\r\n<div>\r\n    Proin nonummy, lacus eget pulvinar lacinia, pede felis dignissim leo, vitae tristique magna lacus sit amet eros. Nullam ornare. Praesent odio ligula, dapibus sed, tincidunt eget, dictum ac, nibh. Nam quis lacus. Nunc eleifend molestie velit. Morbi lobortis quam eu velit. Donec euismod vestibulum massa. Donec non lectus. Aliquam commodo lacus sit amet nulla. Cras dignissim elit et augue. Nullam non diam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. In hac habitasse platea dictumst. Aenean vestibulum. Sed lobortis elit quis lectus. Nunc sed lacus at augue bibendum dapibus.\r\n</div>\r\n<div>\r\n    Aliquam vehicula sem ut pede. Cras purus lectus, egestas eu, vehicula at, imperdiet sed, nibh. Morbi consectetuer luctus felis. Donec vitae nisi. Aliquam tincidunt feugiat elit. Duis sed elit ut turpis ullamcorper feugiat. Praesent pretium, mauris sed fermentum hendrerit, nulla lorem iaculis magna, pulvinar scelerisque urna tellus a justo. Suspendisse pulvinar massa in metus. Duis quis quam. Proin justo. Curabitur ac sapien. Nam erat. Praesent ut quam.\r\n</div>','Assassins Creed Revalations',23,to_date('25-MAY-17','DD-MON-RR'),28);
Insert into PRODUCTS (PRODUCT_ID,PRODUCT_NAME,SUB_CATEGORY_NAME,CATEGORY_NAME,COMPANY_NAME,PRICE,SUMMARY,TAGS,PRODUCT_QTY,LASTUPDATED,HITS) values (5,'Batman Arkham City','Action','Games','Eidos',7.99,'<div>\r\n    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\r\n</div>\r\n<div>\r\n    Curabitur pretium tincidunt lacus. Nulla gravida orci a odio. Nullam varius, turpis et commodo pharetra, est eros bibendum elit, nec luctus magna felis sollicitudin mauris. Integer in mauris eu nibh euismod gravida. Duis ac tellus et risus vulputate vehicula. Donec lobortis risus a elit. Etiam tempor. Ut ullamcorper, ligula eu tempor congue, eros est euismod turpis, id tincidunt sapien risus a quam. Maecenas fermentum consequat mi. Donec fermentum. Pellentesque malesuada nulla a mi. Duis sapien sem, aliquet nec, commodo eget, consequat quis, neque. Aliquam faucibus, elit ut dictum aliquet, felis nisl adipiscing sapien, sed malesuada diam lacus eget erat. Cras mollis scelerisque nunc. Nullam arcu. Aliquam consequat. Curabitur augue lorem, dapibus quis, laoreet et, pretium ac, nisi. Aenean magna nisl, mollis quis, molestie eu, feugiat in, orci. In hac habitasse platea dictumst.\r\n</div>\r\n<div>\r\n    Fusce convallis, mauris imperdiet gravida bibendum, nisl turpis suscipit mauris, sed placerat ipsum urna sed risus. In convallis tellus a mauris. Curabitur non elit ut libero tristique sodales. Mauris a lacus. Donec mattis semper leo. In hac habitasse platea dictumst. Vivamus facilisis diam at odio. Mauris dictum, nisi eget consequat elementum, lacus ligula molestie metus, non feugiat orci magna ac sem. Donec turpis. Donec vitae metus. Morbi tristique neque eu mauris. Quisque gravida ipsum non sapien. Proin turpis lacus, scelerisque vitae, elementum at, lobortis ac, quam. Aliquam dictum eleifend risus. In hac habitasse platea dictumst. Etiam sit amet diam. Suspendisse odio. Suspendisse nunc. In semper bibendum libero.\r\n</div>\r\n<div>\r\n    Proin nonummy, lacus eget pulvinar lacinia, pede felis dignissim leo, vitae tristique magna lacus sit amet eros. Nullam ornare. Praesent odio ligula, dapibus sed, tincidunt eget, dictum ac, nibh. Nam quis lacus. Nunc eleifend molestie velit. Morbi lobortis quam eu velit. Donec euismod vestibulum massa. Donec non lectus. Aliquam commodo lacus sit amet nulla. Cras dignissim elit et augue. Nullam non diam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. In hac habitasse platea dictumst. Aenean vestibulum. Sed lobortis elit quis lectus. Nunc sed lacus at augue bibendum dapibus.\r\n</div>\r\n<div>\r\n    Aliquam vehicula sem ut pede. Cras purus lectus, egestas eu, vehicula at, imperdiet sed, nibh. Morbi consectetuer luctus felis. Donec vitae nisi. Aliquam tincidunt feugiat elit. Duis sed elit ut turpis ullamcorper feugiat. Praesent pretium, mauris sed fermentum hendrerit, nulla lorem iaculis magna, pulvinar scelerisque urna tellus a justo. Suspendisse pulvinar massa in metus. Duis quis quam. Proin justo. Curabitur ac sapien. Nam erat. Praesent ut quam.\r\n</div>','Batman Arkham City',25,to_date('25-MAY-17','DD-MON-RR'),0);
Insert into PRODUCTS (PRODUCT_ID,PRODUCT_NAME,SUB_CATEGORY_NAME,CATEGORY_NAME,COMPANY_NAME,PRICE,SUMMARY,TAGS,PRODUCT_QTY,LASTUPDATED,HITS) values (6,'The Amazing Spiderman (Game)','Action','Games','Activision',6.99,'<div>\r\n    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\r\n</div>\r\n<div>\r\n    Curabitur pretium tincidunt lacus. Nulla gravida orci a odio. Nullam varius, turpis et commodo pharetra, est eros bibendum elit, nec luctus magna felis sollicitudin mauris. Integer in mauris eu nibh euismod gravida. Duis ac tellus et risus vulputate vehicula. Donec lobortis risus a elit. Etiam tempor. Ut ullamcorper, ligula eu tempor congue, eros est euismod turpis, id tincidunt sapien risus a quam. Maecenas fermentum consequat mi. Donec fermentum. Pellentesque malesuada nulla a mi. Duis sapien sem, aliquet nec, commodo eget, consequat quis, neque. Aliquam faucibus, elit ut dictum aliquet, felis nisl adipiscing sapien, sed malesuada diam lacus eget erat. Cras mollis scelerisque nunc. Nullam arcu. Aliquam consequat. Curabitur augue lorem, dapibus quis, laoreet et, pretium ac, nisi. Aenean magna nisl, mollis quis, molestie eu, feugiat in, orci. In hac habitasse platea dictumst.\r\n</div>\r\n<div>\r\n    Fusce convallis, mauris imperdiet gravida bibendum, nisl turpis suscipit mauris, sed placerat ipsum urna sed risus. In convallis tellus a mauris. Curabitur non elit ut libero tristique sodales. Mauris a lacus. Donec mattis semper leo. In hac habitasse platea dictumst. Vivamus facilisis diam at odio. Mauris dictum, nisi eget consequat elementum, lacus ligula molestie metus, non feugiat orci magna ac sem. Donec turpis. Donec vitae metus. Morbi tristique neque eu mauris. Quisque gravida ipsum non sapien. Proin turpis lacus, scelerisque vitae, elementum at, lobortis ac, quam. Aliquam dictum eleifend risus. In hac habitasse platea dictumst. Etiam sit amet diam. Suspendisse odio. Suspendisse nunc. In semper bibendum libero.\r\n</div>\r\n<div>\r\n    Proin nonummy, lacus eget pulvinar lacinia, pede felis dignissim leo, vitae tristique magna lacus sit amet eros. Nullam ornare. Praesent odio ligula, dapibus sed, tincidunt eget, dictum ac, nibh. Nam quis lacus. Nunc eleifend molestie velit. Morbi lobortis quam eu velit. Donec euismod vestibulum massa. Donec non lectus. Aliquam commodo lacus sit amet nulla. Cras dignissim elit et augue. Nullam non diam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. In hac habitasse platea dictumst. Aenean vestibulum. Sed lobortis elit quis lectus. Nunc sed lacus at augue bibendum dapibus.\r\n</div>\r\n<div>\r\n    Aliquam vehicula sem ut pede. Cras purus lectus, egestas eu, vehicula at, imperdiet sed, nibh. Morbi consectetuer luctus felis. Donec vitae nisi. Aliquam tincidunt feugiat elit. Duis sed elit ut turpis ullamcorper feugiat. Praesent pretium, mauris sed fermentum hendrerit, nulla lorem iaculis magna, pulvinar scelerisque urna tellus a justo. Suspendisse pulvinar massa in metus. Duis quis quam. Proin justo. Curabitur ac sapien. Nam erat. Praesent ut quam.\r\n</div>','The Amazing Spiderman (Game)',45,to_date('25-MAY-17','DD-MON-RR'),6);
--INSERTING into USER_AUTH
SET DEFINE OFF;
Insert into USER_AUTH (USER_ID,EMAIL,PASS,REGISTEREDON) values (10,'admin','admin',to_date('25-MAY-17','DD-MON-RR'));

--------------------------------------------------------
--  Constraints for Table ADMINISTRATORS
--------------------------------------------------------

  ALTER TABLE "ADMINISTRATORS" MODIFY ("ADMIN_ID" NOT NULL ENABLE);
  ALTER TABLE "ADMINISTRATORS" MODIFY ("EMAIL" NOT NULL ENABLE);
  ALTER TABLE "ADMINISTRATORS" MODIFY ("PASSWORD" NOT NULL ENABLE);
  ALTER TABLE "ADMINISTRATORS" ADD PRIMARY KEY ("ADMIN_ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table IMAGES
--------------------------------------------------------

  ALTER TABLE "IMAGES" MODIFY ("IMAGE_ID" NOT NULL ENABLE);
  ALTER TABLE "IMAGES" MODIFY ("IMAGE_NAME" NOT NULL ENABLE);
  ALTER TABLE "IMAGES" MODIFY ("PRODUCT_NAME" NOT NULL ENABLE);
  ALTER TABLE "IMAGES" ADD PRIMARY KEY ("IMAGE_ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table ORDER_DETAILS
--------------------------------------------------------

  ALTER TABLE "ORDER_DETAILS" MODIFY ("ORDER_ID" NOT NULL ENABLE);
  ALTER TABLE "ORDER_DETAILS" MODIFY ("USER_ID" NOT NULL ENABLE);
  ALTER TABLE "ORDER_DETAILS" MODIFY ("STATUS" NOT NULL ENABLE);
  ALTER TABLE "ORDER_DETAILS" MODIFY ("SHIPPERS_NAME" NOT NULL ENABLE);
  ALTER TABLE "ORDER_DETAILS" MODIFY ("ADDRESS" NOT NULL ENABLE);
  ALTER TABLE "ORDER_DETAILS" MODIFY ("MOBILE_NUMBER" NOT NULL ENABLE);
  ALTER TABLE "ORDER_DETAILS" MODIFY ("SHIPPERS_EMAIL" NOT NULL ENABLE);
  ALTER TABLE "ORDER_DETAILS" MODIFY ("TOTAL_ORDER_PRICE" NOT NULL ENABLE);
  ALTER TABLE "ORDER_DETAILS" ADD PRIMARY KEY ("ORDER_ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table USER_AUTH
--------------------------------------------------------

  ALTER TABLE "USER_AUTH" MODIFY ("USER_ID" NOT NULL ENABLE);
  ALTER TABLE "USER_AUTH" MODIFY ("EMAIL" NOT NULL ENABLE);
  ALTER TABLE "USER_AUTH" MODIFY ("PASS" NOT NULL ENABLE);
  ALTER TABLE "USER_AUTH" ADD PRIMARY KEY ("USER_ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table CATEGORY
--------------------------------------------------------

  ALTER TABLE "CATEGORY" MODIFY ("CATEGORY_ID" NOT NULL ENABLE);
  ALTER TABLE "CATEGORY" MODIFY ("CATEGORY_NAME" NOT NULL ENABLE);
  ALTER TABLE "CATEGORY" ADD PRIMARY KEY ("CATEGORY_ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table PRODUCTS
--------------------------------------------------------

  ALTER TABLE "PRODUCTS" MODIFY ("PRODUCT_ID" NOT NULL ENABLE);
  ALTER TABLE "PRODUCTS" ADD PRIMARY KEY ("PRODUCT_ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table EXPENSES
--------------------------------------------------------

  ALTER TABLE "EXPENSES" MODIFY ("EXPENSES_ID" NOT NULL ENABLE);
  ALTER TABLE "EXPENSES" MODIFY ("PRODUCT_ID" NOT NULL ENABLE);
  ALTER TABLE "EXPENSES" MODIFY ("PRODUCT_NAME" NOT NULL ENABLE);
  ALTER TABLE "EXPENSES" MODIFY ("PRICE" NOT NULL ENABLE);
  ALTER TABLE "EXPENSES" MODIFY ("PURCHASE_DATE" NOT NULL ENABLE);
  ALTER TABLE "EXPENSES" ADD PRIMARY KEY ("EXPENSES_ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  DDL for Procedure ADD_ORDER
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "ADD_ORDER" ( user_id IN NUMBER, user_realname IN VARCHAR2, user_address IN VARCHAR2, user_phone In NUMBER, user_email IN VARCHAR2, order_price IN NUMBER)
IS
BEGIN
  INSERT INTO order_details(order_id, user_id, status, shippers_name, address, MOBILE_NUMBER,SHIPPERS_EMAIL,ORDERED_ON,TOTAL_ORDER_PRICE) VALUES(
    SYS_GUID(),
    user_id,
    'paid',
    user_realname,
    user_address,
    user_phone,
    user_email,
    CURRENT_DATE,
    order_price
  );
END;

