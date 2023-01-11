--------------------------------------------------------
--  ������ ������ - �����-12��-29-2022   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table PROJECT_CATEGORY
--------------------------------------------------------

  CREATE TABLE "HR"."PROJECT_CATEGORY" 
   (	"CNO" NUMBER, 
	"TITLE" VARCHAR2(100 BYTE), 
	"SUBJECT" VARCHAR2(200 BYTE), 
	"POSTER" VARCHAR2(300 BYTE), 
	"LINK" VARCHAR2(200 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into HR.PROJECT_CATEGORY
SET DEFINE OFF;
Insert into HR.PROJECT_CATEGORY (CNO,TITLE,SUBJECT,POSTER,LINK) values (1,'���� ���� ����Ʈ 50��','"�λ� ���� ���ֿ��� ã�ƺ��� �� �?"','https://mp-seoul-image-production-s3.mangoplate.com/keyword_search/meta/pictures/i_ng3lfxfjim_chq.jpg?fit=around|600:400&crop=600:400;*,*&output-format=jpg&output-quality=80','/top_lists/891_paju');
Insert into HR.PROJECT_CATEGORY (CNO,TITLE,SUBJECT,POSTER,LINK) values (2,'���ڳ�̾߳� ���� ����Ʈ 20��','"ö�ǿ� �������� ���ڳ�̾߳� ����?"','https://mp-seoul-image-production-s3.mangoplate.com/keyword_search/meta/pictures/ryuuuziem5xog5by.jpg?fit=around|600:400&crop=600:400;*,*&output-format=jpg&output-quality=80','/top_lists/1027_okonomiyaki');
Insert into HR.PROJECT_CATEGORY (CNO,TITLE,SUBJECT,POSTER,LINK) values (3,'���Ա� ���� ����Ʈ 20��','"���Ա��� ���ζ� ������ �������� ��~"','https://mp-seoul-image-production-s3.mangoplate.com/keyword_search/meta/pictures/amj33lbbodnv-t7g.jpg?fit=around|600:400&crop=600:400;*,*&output-format=jpg&output-quality=80','/top_lists/1933_manduguk');
Insert into HR.PROJECT_CATEGORY (CNO,TITLE,SUBJECT,POSTER,LINK) values (4,'�Ϻ� ī�� ���� ����Ʈ 30��','"���� ǳ�̰� ������ �Ϻ��� ī�� �ѱ׸�!"','https://mp-seoul-image-production-s3.mangoplate.com/keyword_search/meta/pictures/pzps5jrvbib8sjkw.jpg?fit=around|600:400&crop=600:400;*,*&output-format=jpg&output-quality=80','/top_lists/1037_curry_japanese');
Insert into HR.PROJECT_CATEGORY (CNO,TITLE,SUBJECT,POSTER,LINK) values (5,'ġ�ƹ�Ÿ ���� ����Ʈ 20��','"�ѹټ����� ���� ġ�ƹ�Ÿ"','https://mp-seoul-image-production-s3.mangoplate.com/keyword_search/meta/pictures/kywnedxx-2czy4aw.jpg?fit=around|600:400&crop=600:400;*,*&output-format=jpg&output-quality=80','/top_lists/975_ciabatta');
Insert into HR.PROJECT_CATEGORY (CNO,TITLE,SUBJECT,POSTER,LINK) values (6,'�簥�� ���� ����Ʈ 35��','"���� ������! �ε巯�� ���ǿ�!"','https://mp-seoul-image-production-s3.mangoplate.com/keyword_search/meta/pictures/81dkqdumcgxbhqsy.jpg?fit=around|600:400&crop=600:400;*,*&output-format=jpg&output-quality=80','/top_lists/662_lambgalbi');
Insert into HR.PROJECT_CATEGORY (CNO,TITLE,SUBJECT,POSTER,LINK) values (7,'û���� ���� ����Ʈ 20��','"�����ڰ� �θ��� �� ��, û����"','https://mp-seoul-image-production-s3.mangoplate.com/keyword_search/meta/pictures/6ju4yxohox66gb0x.jpg?fit=around|600:400&crop=600:400;*,*&output-format=jpg&output-quality=80','/top_lists/938_cheonggukjang');
Insert into HR.PROJECT_CATEGORY (CNO,TITLE,SUBJECT,POSTER,LINK) values (8,'�ᳪ�� ���� ���� ����Ʈ 7��','"�������� �Ŀ� �ᳪ�����屹���� �����ؾ���~"','https://mp-seoul-image-production-s3.mangoplate.com/keyword_search/meta/pictures/4bx3ojbpj_xludyo.jpg?fit=around|600:400&crop=600:400;*,*&output-format=jpg&output-quality=80','/top_lists/926_kongnamul');
Insert into HR.PROJECT_CATEGORY (CNO,TITLE,SUBJECT,POSTER,LINK) values (9,'Ĭ���� ���� ����Ʈ 45��','"���� ����Ʈ�� Ĭ���Ϸ� ������ ��!"','https://mp-seoul-image-production-s3.mangoplate.com/keyword_search/meta/pictures/fbay3ghp-amc5le7.jpg?fit=around|600:400&crop=600:400;*,*&output-format=jpg&output-quality=80','/top_lists/1600_cocktail');
Insert into HR.PROJECT_CATEGORY (CNO,TITLE,SUBJECT,POSTER,LINK) values (10,'�ϻ� ȣ������ ���� ����Ʈ 20��','"�ϻ꿡�� ȣ�������� �ְ� ������ ������~��"','https://mp-seoul-image-production-s3.mangoplate.com/keyword_search/meta/pictures/zivnotwwa_apkous.jpg?fit=around|600:400&crop=600:400;*,*&output-format=jpg&output-quality=80','/top_lists/lisan_lakepark_matjib');
Insert into HR.PROJECT_CATEGORY (CNO,TITLE,SUBJECT,POSTER,LINK) values (11,'������ ���� ����Ʈ 45��','"�� �� �Ļ�ε� ����� ������ "','https://mp-seoul-image-production-s3.mangoplate.com/keyword_search/meta/pictures/xc7hkqknklayyr2k.jpg?fit=around|600:400&crop=600:400;*,*&output-format=jpg&output-quality=80','/top_lists/708_salad');
Insert into HR.PROJECT_CATEGORY (CNO,TITLE,SUBJECT,POSTER,LINK) values (12,'���� ���� ����Ʈ 30��','"�����ϰ� ����� ���� �ѱ׸�!"','https://mp-seoul-image-production-s3.mangoplate.com/keyword_search/meta/pictures/dma_clzh32qiwgyb.jpg?fit=around|600:400&crop=600:400;*,*&output-format=jpg&output-quality=80','/top_lists/675_gomtang');
Insert into HR.PROJECT_CATEGORY (CNO,TITLE,SUBJECT,POSTER,LINK) values (13,'2022 ���� �α� ���� TOP 100','"�پ��� �԰Ÿ��� ã�´ٸ� ��������!"','https://mp-seoul-image-production-s3.mangoplate.com/keyword_search/meta/pictures/dvaufslcozevpwkv.png?fit=around|600:400&crop=600:400;*,*&output-format=jpg&output-quality=80','/top_lists/2962_gangbuk2022');
Insert into HR.PROJECT_CATEGORY (CNO,TITLE,SUBJECT,POSTER,LINK) values (14,'2022 ������ �α� ���� TOP 100','"���� ������ ������ ���� ���־�"','https://mp-seoul-image-production-s3.mangoplate.com/keyword_search/meta/pictures/3hi_xaieyp3lid5j.jpg?fit=around|600:400&crop=600:400;*,*&output-format=jpg&output-quality=80','/top_lists/2963_gangwondo2022');
Insert into HR.PROJECT_CATEGORY (CNO,TITLE,SUBJECT,POSTER,LINK) values (15,'2022 �λ� �α� ���� TOP 100','"�� ������ �λ��̶� ��ī��"','https://mp-seoul-image-production-s3.mangoplate.com/keyword_search/meta/pictures/f5jk1vyxzriepaco.png?fit=around|600:400&crop=600:400;*,*&output-format=jpg&output-quality=80','/top_lists/2965_busan2022');
Insert into HR.PROJECT_CATEGORY (CNO,TITLE,SUBJECT,POSTER,LINK) values (16,'2022 ��⵵ �α� ���� TOP 100','"��⵵ ����� ���� �� �ֳ�!"','https://mp-seoul-image-production-s3.mangoplate.com/keyword_search/meta/pictures/id4to4jnp44e6znn.jpg?fit=around|600:400&crop=600:400;*,*&output-format=jpg&output-quality=80','/top_lists/2966_gyeonggido2022');
Insert into HR.PROJECT_CATEGORY (CNO,TITLE,SUBJECT,POSTER,LINK) values (17,'2022 ���ֵ� �α� ���� TOP 100','"���ش� �� ���ֵ� ������ ���� ���׾�"','https://mp-seoul-image-production-s3.mangoplate.com/keyword_search/meta/pictures/0ldxucaltk07wrbi.png?fit=around|600:400&crop=600:400;*,*&output-format=jpg&output-quality=80','/top_lists/2964_jejudo2022');
Insert into HR.PROJECT_CATEGORY (CNO,TITLE,SUBJECT,POSTER,LINK) values (18,'2022 ���� �α� ���� TOP 100','"�����ϸ� ����, �����ϸ� ����!"','https://mp-seoul-image-production-s3.mangoplate.com/keyword_search/meta/pictures/egkhvudo5otau7as.png?fit=around|600:400&crop=600:400;*,*&output-format=jpg&output-quality=80','/top_lists/2961_gangnam2022');
Insert into HR.PROJECT_CATEGORY (CNO,TITLE,SUBJECT,POSTER,LINK) values (19,'2022 ��â �α� ���� TOP 30','"�� ��â �� ������ RGRG?"','https://mp-seoul-image-production-s3.mangoplate.com/keyword_search/meta/pictures/zclmkfuclkli41io.png?fit=around|600:400&crop=600:400;*,*&output-format=jpg&output-quality=80','/top_lists/2984_gobchang2022');
Insert into HR.PROJECT_CATEGORY (CNO,TITLE,SUBJECT,POSTER,LINK) values (20,'2022 �Ľ�Ÿ �α� ���� TOP 50','"2022 ���� �Ľ�Ÿ ������ �ñ��ϴٸ� �ָ�!"','https://mp-seoul-image-production-s3.mangoplate.com/keyword_search/meta/pictures/yzper-jags7yl3do.png?fit=around|600:400&crop=600:400;*,*&output-format=jpg&output-quality=80','/top_lists/2981_pasta2022');
Insert into HR.PROJECT_CATEGORY (CNO,TITLE,SUBJECT,POSTER,LINK) values (21,'2022 ��� �α� ���� TOP 30','"����� �ҽ� ��� �ѷ��ּ���!"','https://mp-seoul-image-production-s3.mangoplate.com/keyword_search/meta/pictures/fwo03mch9tfat2nw.png?fit=around|600:400&crop=600:400;*,*&output-format=jpg&output-quality=80','/top_lists/2985_donkatsu2022');
Insert into HR.PROJECT_CATEGORY (CNO,TITLE,SUBJECT,POSTER,LINK) values (22,'2022 ���� �α� ���� TOP 50','"2022�⿣ ���ִ� ���� �԰� ��� ����!"','https://mp-seoul-image-production-s3.mangoplate.com/keyword_search/meta/pictures/y0i-_ucmbz5bj2lr.png?fit=around|600:400&crop=600:400;*,*&output-format=jpg&output-quality=80','/top_lists/2980_pizza2022');
Insert into HR.PROJECT_CATEGORY (CNO,TITLE,SUBJECT,POSTER,LINK) values (23,'2022 ������� �α� ���� TOP 50','"�ѱ����� �ҿ�Ǫ��� �ٷ� ������Ⱑ �ƴұ�?"','https://mp-seoul-image-production-s3.mangoplate.com/keyword_search/meta/pictures/dsmx8j0wayojijk9.png?fit=around|600:400&crop=600:400;*,*&output-format=jpg&output-quality=80','/top_lists/2987_Pork2022');
Insert into HR.PROJECT_CATEGORY (CNO,TITLE,SUBJECT,POSTER,LINK) values (24,'2022 ��� �α� ���� TOP 50','"�������� �߿� �� ��� �� �׸��� �׷��� ������"','https://mp-seoul-image-production-s3.mangoplate.com/keyword_search/meta/pictures/gdu43nitdmvcjhs2.png?fit=around|600:400&crop=600:400;*,*&output-format=jpg&output-quality=80','/top_lists/2983_ramen2022');
Insert into HR.PROJECT_CATEGORY (CNO,TITLE,SUBJECT,POSTER,LINK) values (25,'2022 �귱ġ �α� ���� TOP 50','"�Ϸ��� ������ ���ִ� �귱ġ��!"','https://mp-seoul-image-production-s3.mangoplate.com/keyword_search/meta/pictures/eqns4saot3qoyezl.png?fit=around|600:400&crop=600:400;*,*&output-format=jpg&output-quality=80','/top_lists/2982_brunch2022');
Insert into HR.PROJECT_CATEGORY (CNO,TITLE,SUBJECT,POSTER,LINK) values (26,'2022 ���̴� �α� ���� TOP 30','"Ư���� ���� ���� Ư���ϰ� ������� ���̴� ����!"','https://mp-seoul-image-production-s3.mangoplate.com/keyword_search/meta/pictures/hjvuj_te8gr_yusm.png?fit=around|600:400&crop=600:400;*,*&output-format=jpg&output-quality=80','/top_lists/2989_dining2022');
Insert into HR.PROJECT_CATEGORY (CNO,TITLE,SUBJECT,POSTER,LINK) values (27,'2022 �α� ī�� TOP 100','"2022�⿡�� ī�� ������ �غ� �Ƴ�?"','https://mp-seoul-image-production-s3.mangoplate.com/keyword_search/meta/pictures/ide6xiq6irnkvl8a.png?fit=around|600:400&crop=600:400;*,*&output-format=jpg&output-quality=80','/top_lists/2970_cafe2022');
Insert into HR.PROJECT_CATEGORY (CNO,TITLE,SUBJECT,POSTER,LINK) values (28,'2022 ���� �α� ���� TOP 50','"���� ���� ���� ���⿡ �� �𿴴�!"','https://mp-seoul-image-production-s3.mangoplate.com/keyword_search/meta/pictures/cujisntrsxmesxuz.png?fit=around|600:400&crop=600:400;*,*&output-format=jpg&output-quality=80','/top_lists/2979_sushi2022');
Insert into HR.PROJECT_CATEGORY (CNO,TITLE,SUBJECT,POSTER,LINK) values (29,'2022 ������ �α� ���� TOP 20','"���� ������ �����̰� ������ ���Ѵ�!!"','https://mp-seoul-image-production-s3.mangoplate.com/keyword_search/meta/pictures/u_wnwxhouitspdzq.png?fit=around|600:400&crop=600:400;*,*&output-format=jpg&output-quality=80','/top_lists/2988_ttokbokki2022');
Insert into HR.PROJECT_CATEGORY (CNO,TITLE,SUBJECT,POSTER,LINK) values (30,'2022 �Ұ�� �α� ���� TOP 40','"�Ұ�� �Դ� ������ ���󿡼� ���� �ູ��"','https://mp-seoul-image-production-s3.mangoplate.com/keyword_search/meta/pictures/hdlt0tolh0mpvmqg.png?fit=around|600:400&crop=600:400;*,*&output-format=jpg&output-quality=80','/top_lists/2986_beef2022');
--------------------------------------------------------
--  DDL for Index PC_CNO_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."PC_CNO_PK" ON "HR"."PROJECT_CATEGORY" ("CNO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table PROJECT_CATEGORY
--------------------------------------------------------

  ALTER TABLE "HR"."PROJECT_CATEGORY" MODIFY ("TITLE" CONSTRAINT "PC_TITLE_NN" NOT NULL ENABLE);
  ALTER TABLE "HR"."PROJECT_CATEGORY" MODIFY ("SUBJECT" CONSTRAINT "PC_SUBJECT_NN" NOT NULL ENABLE);
  ALTER TABLE "HR"."PROJECT_CATEGORY" MODIFY ("POSTER" CONSTRAINT "PC_POSTER_NN" NOT NULL ENABLE);
  ALTER TABLE "HR"."PROJECT_CATEGORY" MODIFY ("LINK" CONSTRAINT "PC_LINK_NN" NOT NULL ENABLE);
  ALTER TABLE "HR"."PROJECT_CATEGORY" ADD CONSTRAINT "PC_CNO_PK" PRIMARY KEY ("CNO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
