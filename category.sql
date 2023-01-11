--------------------------------------------------------
--  파일이 생성됨 - 목요일-12월-29-2022   
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
Insert into HR.PROJECT_CATEGORY (CNO,TITLE,SUBJECT,POSTER,LINK) values (1,'파주 맛집 베스트 50곳','"인생 맛집 파주에서 찾아보는 건 어때?"','https://mp-seoul-image-production-s3.mangoplate.com/keyword_search/meta/pictures/i_ng3lfxfjim_chq.jpg?fit=around|600:400&crop=600:400;*,*&output-format=jpg&output-quality=80','/top_lists/891_paju');
Insert into HR.PROJECT_CATEGORY (CNO,TITLE,SUBJECT,POSTER,LINK) values (2,'오코노미야끼 맛집 베스트 20곳','"철판에 지글지글 오코노미야끼 땡겨?"','https://mp-seoul-image-production-s3.mangoplate.com/keyword_search/meta/pictures/ryuuuziem5xog5by.jpg?fit=around|600:400&crop=600:400;*,*&output-format=jpg&output-quality=80','/top_lists/1027_okonomiyaki');
Insert into HR.PROJECT_CATEGORY (CNO,TITLE,SUBJECT,POSTER,LINK) values (3,'만둣국 맛집 베스트 20곳','"만둣국은 만두랑 국물이 맛있으면 끝~"','https://mp-seoul-image-production-s3.mangoplate.com/keyword_search/meta/pictures/amj33lbbodnv-t7g.jpg?fit=around|600:400&crop=600:400;*,*&output-format=jpg&output-quality=80','/top_lists/1933_manduguk');
Insert into HR.PROJECT_CATEGORY (CNO,TITLE,SUBJECT,POSTER,LINK) values (4,'일본 카레 맛집 베스트 30곳','"진한 풍미가 가득한 일본식 카레 한그릇!"','https://mp-seoul-image-production-s3.mangoplate.com/keyword_search/meta/pictures/pzps5jrvbib8sjkw.jpg?fit=around|600:400&crop=600:400;*,*&output-format=jpg&output-quality=80','/top_lists/1037_curry_japanese');
Insert into HR.PROJECT_CATEGORY (CNO,TITLE,SUBJECT,POSTER,LINK) values (5,'치아바타 맛집 베스트 20곳','"겉바속쫄의 정석 치아바타"','https://mp-seoul-image-production-s3.mangoplate.com/keyword_search/meta/pictures/kywnedxx-2czy4aw.jpg?fit=around|600:400&crop=600:400;*,*&output-format=jpg&output-quality=80','/top_lists/975_ciabatta');
Insert into HR.PROJECT_CATEGORY (CNO,TITLE,SUBJECT,POSTER,LINK) values (6,'양갈비 맛집 베스트 35곳','"양은 갈비지! 부드러움 끝판왕!"','https://mp-seoul-image-production-s3.mangoplate.com/keyword_search/meta/pictures/81dkqdumcgxbhqsy.jpg?fit=around|600:400&crop=600:400;*,*&output-format=jpg&output-quality=80','/top_lists/662_lambgalbi');
Insert into HR.PROJECT_CATEGORY (CNO,TITLE,SUBJECT,POSTER,LINK) values (7,'청국장 맛집 베스트 20곳','"유전자가 부르는 그 맛, 청국장"','https://mp-seoul-image-production-s3.mangoplate.com/keyword_search/meta/pictures/6ju4yxohox66gb0x.jpg?fit=around|600:400&crop=600:400;*,*&output-format=jpg&output-quality=80','/top_lists/938_cheonggukjang');
Insert into HR.PROJECT_CATEGORY (CNO,TITLE,SUBJECT,POSTER,LINK) values (8,'콩나물 국밥 맛집 베스트 7곳','"연말모임 후에 콩나물해장국으로 해장해야지~"','https://mp-seoul-image-production-s3.mangoplate.com/keyword_search/meta/pictures/4bx3ojbpj_xludyo.jpg?fit=around|600:400&crop=600:400;*,*&output-format=jpg&output-quality=80','/top_lists/926_kongnamul');
Insert into HR.PROJECT_CATEGORY (CNO,TITLE,SUBJECT,POSTER,LINK) values (9,'칵테일 맛집 베스트 45곳','"연말 데이트는 칵테일로 분위기 업!"','https://mp-seoul-image-production-s3.mangoplate.com/keyword_search/meta/pictures/fbay3ghp-amc5le7.jpg?fit=around|600:400&crop=600:400;*,*&output-format=jpg&output-quality=80','/top_lists/1600_cocktail');
Insert into HR.PROJECT_CATEGORY (CNO,TITLE,SUBJECT,POSTER,LINK) values (10,'일산 호수공원 맛집 베스트 20곳','"일산에는 호수공원도 있고 맛집도 많지요~♪"','https://mp-seoul-image-production-s3.mangoplate.com/keyword_search/meta/pictures/zivnotwwa_apkous.jpg?fit=around|600:400&crop=600:400;*,*&output-format=jpg&output-quality=80','/top_lists/lisan_lakepark_matjib');
Insert into HR.PROJECT_CATEGORY (CNO,TITLE,SUBJECT,POSTER,LINK) values (11,'샐러드 맛집 베스트 45곳','"한 끼 식사로도 충분한 샐러드 "','https://mp-seoul-image-production-s3.mangoplate.com/keyword_search/meta/pictures/xc7hkqknklayyr2k.jpg?fit=around|600:400&crop=600:400;*,*&output-format=jpg&output-quality=80','/top_lists/708_salad');
Insert into HR.PROJECT_CATEGORY (CNO,TITLE,SUBJECT,POSTER,LINK) values (12,'곰탕 맛집 베스트 30곳','"따끈하고 든든한 곰탕 한그릇!"','https://mp-seoul-image-production-s3.mangoplate.com/keyword_search/meta/pictures/dma_clzh32qiwgyb.jpg?fit=around|600:400&crop=600:400;*,*&output-format=jpg&output-quality=80','/top_lists/675_gomtang');
Insert into HR.PROJECT_CATEGORY (CNO,TITLE,SUBJECT,POSTER,LINK) values (13,'2022 강북 인기 맛집 TOP 100','"다양한 먹거리를 찾는다면 강북으로!"','https://mp-seoul-image-production-s3.mangoplate.com/keyword_search/meta/pictures/dvaufslcozevpwkv.png?fit=around|600:400&crop=600:400;*,*&output-format=jpg&output-quality=80','/top_lists/2962_gangbuk2022');
Insert into HR.PROJECT_CATEGORY (CNO,TITLE,SUBJECT,POSTER,LINK) values (14,'2022 강원도 인기 맛집 TOP 100','"역시 강원도 음식이 제일 맛있어"','https://mp-seoul-image-production-s3.mangoplate.com/keyword_search/meta/pictures/3hi_xaieyp3lid5j.jpg?fit=around|600:400&crop=600:400;*,*&output-format=jpg&output-quality=80','/top_lists/2963_gangwondo2022');
Insert into HR.PROJECT_CATEGORY (CNO,TITLE,SUBJECT,POSTER,LINK) values (15,'2022 부산 인기 맛집 TOP 100','"마 맛집은 부산이라 안카나"','https://mp-seoul-image-production-s3.mangoplate.com/keyword_search/meta/pictures/f5jk1vyxzriepaco.png?fit=around|600:400&crop=600:400;*,*&output-format=jpg&output-quality=80','/top_lists/2965_busan2022');
Insert into HR.PROJECT_CATEGORY (CNO,TITLE,SUBJECT,POSTER,LINK) values (16,'2022 경기도 인기 맛집 TOP 100','"경기도 찐맛집 여기 다 있네!"','https://mp-seoul-image-production-s3.mangoplate.com/keyword_search/meta/pictures/id4to4jnp44e6znn.jpg?fit=around|600:400&crop=600:400;*,*&output-format=jpg&output-quality=80','/top_lists/2966_gyeonggido2022');
Insert into HR.PROJECT_CATEGORY (CNO,TITLE,SUBJECT,POSTER,LINK) values (17,'2022 제주도 인기 맛집 TOP 100','"올해는 꼭 제주도 여행을 가고 말테야"','https://mp-seoul-image-production-s3.mangoplate.com/keyword_search/meta/pictures/0ldxucaltk07wrbi.png?fit=around|600:400&crop=600:400;*,*&output-format=jpg&output-quality=80','/top_lists/2964_jejudo2022');
Insert into HR.PROJECT_CATEGORY (CNO,TITLE,SUBJECT,POSTER,LINK) values (18,'2022 강남 인기 맛집 TOP 100','"맛집하면 강남, 강남하면 맛집!"','https://mp-seoul-image-production-s3.mangoplate.com/keyword_search/meta/pictures/egkhvudo5otau7as.png?fit=around|600:400&crop=600:400;*,*&output-format=jpg&output-quality=80','/top_lists/2961_gangnam2022');
Insert into HR.PROJECT_CATEGORY (CNO,TITLE,SUBJECT,POSTER,LINK) values (19,'2022 곱창 인기 맛집 TOP 30','"선 곱창 후 볶음밥 RGRG?"','https://mp-seoul-image-production-s3.mangoplate.com/keyword_search/meta/pictures/zclmkfuclkli41io.png?fit=around|600:400&crop=600:400;*,*&output-format=jpg&output-quality=80','/top_lists/2984_gobchang2022');
Insert into HR.PROJECT_CATEGORY (CNO,TITLE,SUBJECT,POSTER,LINK) values (20,'2022 파스타 인기 맛집 TOP 50','"2022 핫한 파스타 맛집이 궁금하다면 주목!"','https://mp-seoul-image-production-s3.mangoplate.com/keyword_search/meta/pictures/yzper-jags7yl3do.png?fit=around|600:400&crop=600:400;*,*&output-format=jpg&output-quality=80','/top_lists/2981_pasta2022');
Insert into HR.PROJECT_CATEGORY (CNO,TITLE,SUBJECT,POSTER,LINK) values (21,'2022 돈까스 인기 맛집 TOP 30','"돈까스에 소스 듬뿍 뿌려주세요!"','https://mp-seoul-image-production-s3.mangoplate.com/keyword_search/meta/pictures/fwo03mch9tfat2nw.png?fit=around|600:400&crop=600:400;*,*&output-format=jpg&output-quality=80','/top_lists/2985_donkatsu2022');
Insert into HR.PROJECT_CATEGORY (CNO,TITLE,SUBJECT,POSTER,LINK) values (22,'2022 피자 인기 맛집 TOP 50','"2022년엔 맛있는 피자 먹고 어깨 피자!"','https://mp-seoul-image-production-s3.mangoplate.com/keyword_search/meta/pictures/y0i-_ucmbz5bj2lr.png?fit=around|600:400&crop=600:400;*,*&output-format=jpg&output-quality=80','/top_lists/2980_pizza2022');
Insert into HR.PROJECT_CATEGORY (CNO,TITLE,SUBJECT,POSTER,LINK) values (23,'2022 돼지고기 인기 맛집 TOP 50','"한국인의 소울푸드는 바로 돼지고기가 아닐까?"','https://mp-seoul-image-production-s3.mangoplate.com/keyword_search/meta/pictures/dsmx8j0wayojijk9.png?fit=around|600:400&crop=600:400;*,*&output-format=jpg&output-quality=80','/top_lists/2987_Pork2022');
Insert into HR.PROJECT_CATEGORY (CNO,TITLE,SUBJECT,POSTER,LINK) values (24,'2022 라멘 인기 맛집 TOP 50','"으슬으슬 추울 땐 라멘 한 그릇이 그렇게 좋더라"','https://mp-seoul-image-production-s3.mangoplate.com/keyword_search/meta/pictures/gdu43nitdmvcjhs2.png?fit=around|600:400&crop=600:400;*,*&output-format=jpg&output-quality=80','/top_lists/2983_ramen2022');
Insert into HR.PROJECT_CATEGORY (CNO,TITLE,SUBJECT,POSTER,LINK) values (25,'2022 브런치 인기 맛집 TOP 50','"하루의 시작은 맛있는 브런치로!"','https://mp-seoul-image-production-s3.mangoplate.com/keyword_search/meta/pictures/eqns4saot3qoyezl.png?fit=around|600:400&crop=600:400;*,*&output-format=jpg&output-quality=80','/top_lists/2982_brunch2022');
Insert into HR.PROJECT_CATEGORY (CNO,TITLE,SUBJECT,POSTER,LINK) values (26,'2022 다이닝 인기 맛집 TOP 30','"특별한 날을 더욱 특별하게 만들어줄 다이닝 맛집!"','https://mp-seoul-image-production-s3.mangoplate.com/keyword_search/meta/pictures/hjvuj_te8gr_yusm.png?fit=around|600:400&crop=600:400;*,*&output-format=jpg&output-quality=80','/top_lists/2989_dining2022');
Insert into HR.PROJECT_CATEGORY (CNO,TITLE,SUBJECT,POSTER,LINK) values (27,'2022 인기 카페 TOP 100','"2022년에도 카페 투어할 준비 됐나?"','https://mp-seoul-image-production-s3.mangoplate.com/keyword_search/meta/pictures/ide6xiq6irnkvl8a.png?fit=around|600:400&crop=600:400;*,*&output-format=jpg&output-quality=80','/top_lists/2970_cafe2022');
Insert into HR.PROJECT_CATEGORY (CNO,TITLE,SUBJECT,POSTER,LINK) values (28,'2022 스시 인기 맛집 TOP 50','"핫한 스시 맛집 여기에 다 모였다!"','https://mp-seoul-image-production-s3.mangoplate.com/keyword_search/meta/pictures/cujisntrsxmesxuz.png?fit=around|600:400&crop=600:400;*,*&output-format=jpg&output-quality=80','/top_lists/2979_sushi2022');
Insert into HR.PROJECT_CATEGORY (CNO,TITLE,SUBJECT,POSTER,LINK) values (29,'2022 떡볶이 인기 맛집 TOP 20','"달콤 매콤한 떡볶이가 세상을 구한다!!"','https://mp-seoul-image-production-s3.mangoplate.com/keyword_search/meta/pictures/u_wnwxhouitspdzq.png?fit=around|600:400&crop=600:400;*,*&output-format=jpg&output-quality=80','/top_lists/2988_ttokbokki2022');
Insert into HR.PROJECT_CATEGORY (CNO,TITLE,SUBJECT,POSTER,LINK) values (30,'2022 소고기 인기 맛집 TOP 40','"소고기 먹는 순간이 세상에서 제일 행복해"','https://mp-seoul-image-production-s3.mangoplate.com/keyword_search/meta/pictures/hdlt0tolh0mpvmqg.png?fit=around|600:400&crop=600:400;*,*&output-format=jpg&output-quality=80','/top_lists/2986_beef2022');
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
