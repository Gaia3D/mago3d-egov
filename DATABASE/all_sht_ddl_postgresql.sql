DROP TABLE if exists IDS CASCADE;
CREATE TABLE IDS  (
  TABLE_NAME varchar(20) NOT NULL,
  NEXT_ID numeric(30,0)DEFAULT 0 NOT NULL ,
  CONSTRAINT IDS_PK PRIMARY KEY (TABLE_NAME)
);


DROP TABLE if exists LETTCCMMNCLCODE CASCADE;
CREATE TABLE LETTCCMMNCLCODE (
  CL_CODE char(3) NOT NULL,
  CL_CODE_NM char(60) ,
  CL_CODE_DC char(200) ,
  USE_AT char(1) ,
  FRST_REGIST_PNTTM DATE ,
  FRST_REGISTER_ID char(20) ,
  LAST_UPDT_PNTTM DATE ,
  LAST_UPDUSR_ID char(20) ,
  CONSTRAINT LETTCCMMNCLCODE_PK PRIMARY KEY (CL_CODE)
) ;


DROP TABLE if exists LETTCCMMNCODE CASCADE;
CREATE TABLE LETTCCMMNCODE  (
  CODE_ID char(6) NOT NULL,
  CODE_ID_NM char(60) ,
  CODE_ID_DC char(200) ,
  USE_AT char(1) ,
  CL_CODE char(3) ,
  FRST_REGIST_PNTTM DATE ,
  FRST_REGISTER_ID char(20) ,
  LAST_UPDT_PNTTM DATE ,
  LAST_UPDUSR_ID char(20) ,
  CONSTRAINT LETTCCMMNCODE_PK PRIMARY KEY (CODE_ID),
  CONSTRAINT LETTCCMMNCODE_ibfk_1 FOREIGN KEY (CL_CODE) REFERENCES LETTCCMMNCLCODE (CL_CODE)
) ;


DROP TABLE if exists LETTCCMMNDETAILCODE CASCADE;
CREATE TABLE LETTCCMMNDETAILCODE  (
  CODE_ID char(6) NOT NULL,
  CODE char(15) NOT NULL,
  CODE_NM char(60) ,
  CODE_DC char(200) ,
  USE_AT char(1) ,
  FRST_REGIST_PNTTM DATE ,
  FRST_REGISTER_ID char(20) ,
  LAST_UPDT_PNTTM DATE ,
  LAST_UPDUSR_ID char(20) ,
  CONSTRAINT LETTCCMMNDETAILCODE_PK PRIMARY KEY (CODE_ID,CODE),
  CONSTRAINT LETTCCMMNDETAILCODE_ibfk_1 FOREIGN KEY (CODE_ID) REFERENCES LETTCCMMNCODE (CODE_ID)
) ;


DROP TABLE if exists LETTNORGNZTINFO CASCADE;
CREATE TABLE LETTNORGNZTINFO  (
  ORGNZT_ID char(20) DEFAULT '' NOT NULL,
  ORGNZT_NM char(20) NOT NULL,
  ORGNZT_DC char(100) ,
  CONSTRAINT LETTNORGNZTINFO_PK PRIMARY KEY (ORGNZT_ID)
) ;


DROP TABLE if exists LETTNAUTHORGROUPINFO CASCADE;
CREATE TABLE LETTNAUTHORGROUPINFO  (
  GROUP_ID char(20) DEFAULT '' NOT NULL,
  GROUP_NM char(60) NOT NULL,
  GROUP_CREAT_DE char(20) NOT NULL,
  GROUP_DC char(100) ,
  CONSTRAINT LETTNAUTHORGROUPINFO_PK PRIMARY KEY (GROUP_ID)
) ;


DROP TABLE if exists LETTNEMPLYRINFO CASCADE;
CREATE TABLE LETTNEMPLYRINFO  (
  EMPLYR_ID char(20) NOT NULL,
  ORGNZT_ID char(20) ,
  USER_NM char(60) NOT NULL,
  PASSWORD char(200) NOT NULL,
  EMPL_NO char(20) ,
  IHIDNUM char(200) ,
  SEXDSTN_CODE char(1) ,
  BRTHDY char(20) ,
  FXNUM char(20) ,
  HOUSE_ADRES char(100) ,
  PASSWORD_HINT char(100) NOT NULL,
  PASSWORD_CNSR char(100) NOT NULL,
  HOUSE_END_TELNO char(4) ,
  AREA_NO char(4) ,
  DETAIL_ADRES char(100) ,
  ZIP char(6) ,
  OFFM_TELNO char(20) ,
  MBTLNUM char(20) ,
  EMAIL_ADRES char(50) ,
  OFCPS_NM char(60) ,
  HOUSE_MIDDLE_TELNO char(4) ,
  GROUP_ID char(20) ,
  PSTINST_CODE char(8) ,
  EMPLYR_STTUS_CODE char(15) NOT NULL,
  ESNTL_ID char(20) NOT NULL,
  CRTFC_DN_VALUE char(20) ,
  SBSCRB_DE DATE ,
  CONSTRAINT LETTNEMPLYRINFO_PK PRIMARY KEY (EMPLYR_ID),
  CONSTRAINT LETTNEMPLYRINFO_ibfk_2 FOREIGN KEY (GROUP_ID) REFERENCES LETTNAUTHORGROUPINFO (GROUP_ID) ON DELETE CASCADE,
  CONSTRAINT LETTNEMPLYRINFO_ibfk_1 FOREIGN KEY (ORGNZT_ID) REFERENCES LETTNORGNZTINFO (ORGNZT_ID) ON DELETE CASCADE
) ;


DROP TABLE if exists LETTNTMPLATINFO CASCADE;
CREATE TABLE LETTNTMPLATINFO  (
  TMPLAT_ID char(20) DEFAULT '' NOT NULL,
  TMPLAT_NM char(255) ,
  TMPLAT_COURS char(2000) ,
  USE_AT char(1) ,
  TMPLAT_SE_CODE char(6) ,
  FRST_REGISTER_ID char(20) ,
  FRST_REGIST_PNTTM DATE ,
  LAST_UPDUSR_ID char(20) ,
  LAST_UPDT_PNTTM DATE ,
  CONSTRAINT LETTNTMPLATINFO_PK PRIMARY KEY (TMPLAT_ID)
) ;


DROP TABLE if exists LETTNBBSMASTER CASCADE;
CREATE TABLE LETTNBBSMASTER  (
  BBS_ID char(20) NOT NULL,
  BBS_NM char(255) NOT NULL,
  BBS_INTRCN char(2400) ,
  BBS_TY_CODE char(6) NOT NULL,
  BBS_ATTRB_CODE char(6) NOT NULL,
  REPLY_POSBL_AT char(1) ,
  FILE_ATCH_POSBL_AT char(1) NOT NULL,
  ATCH_POSBL_FILE_NUMBER numeric(2,0) NOT NULL,
  ATCH_POSBL_FILE_SIZE numeric(8,0) ,
  USE_AT char(1) NOT NULL,
  TMPLAT_ID char(20) ,
  FRST_REGISTER_ID char(20) NOT NULL,
  FRST_REGIST_PNTTM DATE NOT NULL,
  LAST_UPDUSR_ID char(20) ,
  LAST_UPDT_PNTTM DATE ,
  CONSTRAINT LETTNBBSMASTER_PK PRIMARY KEY (BBS_ID)
) ;


DROP TABLE if exists LETTNBBSUSE CASCADE;
CREATE TABLE LETTNBBSUSE  (
  BBS_ID char(20) NOT NULL,
  TRGET_ID char(20) DEFAULT '' NOT NULL,
  USE_AT char(1) NOT NULL,
  REGIST_SE_CODE char(6) ,
  FRST_REGIST_PNTTM DATE ,
  FRST_REGISTER_ID char(20) NOT NULL,
  LAST_UPDT_PNTTM DATE ,
  LAST_UPDUSR_ID char(20) ,
  CONSTRAINT LETTNBBSUSE_PK PRIMARY KEY (BBS_ID,TRGET_ID),
  CONSTRAINT LETTNBBSUSE_ibfk_1 FOREIGN KEY (BBS_ID) REFERENCES LETTNBBSMASTER (BBS_ID)
) ;


DROP TABLE if exists LETTNBBS CASCADE;
CREATE TABLE LETTNBBS (
  NTT_ID numeric(20,0) NOT NULL,
  BBS_ID char(20) NOT NULL,
  NTT_NO numeric(20,0) ,
  NTT_SJ char(2000) ,
  NTT_CN bytea,
  ANSWER_AT char(1) ,
  PARNTSCTT_NO numeric(10,0) ,
  ANSWER_LC numeric(11) ,
  SORT_ORDR numeric(8,0) ,
  RDCNT numeric(10,0) ,
  USE_AT char(1) NOT NULL,
  NTCE_BGNDE char(20) ,
  NTCE_ENDDE char(20) ,
  NTCR_ID char(20) ,
  NTCR_NM char(20) ,
  PASSWORD char(200) ,
  ATCH_FILE_ID char(20) ,
  FRST_REGIST_PNTTM DATE NOT NULL,
  FRST_REGISTER_ID char(20) NOT NULL,
  LAST_UPDT_PNTTM DATE ,
  LAST_UPDUSR_ID char(20) ,
  CONSTRAINT LETTNBBS_PK PRIMARY KEY (NTT_ID,BBS_ID),
  CONSTRAINT LETTNBBS_ibfk_1 FOREIGN KEY (BBS_ID) REFERENCES LETTNBBSMASTER (BBS_ID)
) ;


DROP TABLE if exists LETTNBBSMASTEROPTN CASCADE;
CREATE TABLE LETTNBBSMASTEROPTN (
  BBS_ID char(20) DEFAULT '' NOT NULL,
  ANSWER_AT char(1) DEFAULT '' NOT NULL,
  STSFDG_AT char(1) DEFAULT '' NOT NULL,
  FRST_REGIST_PNTTM DATE DEFAULT current_date NOT NULL,
  LAST_UPDT_PNTTM DATE ,
  FRST_REGISTER_ID char(20) DEFAULT '' NOT NULL,
  LAST_UPDUSR_ID char(20) ,
  CONSTRAINT LETTNBBSMASTEROPTN_PK PRIMARY KEY (BBS_ID)
) ;


DROP TABLE if exists LETTNENTRPRSMBER CASCADE;
CREATE TABLE LETTNENTRPRSMBER (
  ENTRPRS_MBER_ID char(20) DEFAULT '' NOT NULL,
  ENTRPRS_SE_CODE char(15) ,
  BIZRNO char(10) ,
  JURIRNO char(13) ,
  CMPNY_NM char(60) NOT NULL,
  CXFC char(50) ,
  ZIP char(6) ,
  ADRES char(100) ,
  ENTRPRS_MIDDLE_TELNO char(4) ,
  FXNUM char(20) ,
  INDUTY_CODE char(15) ,
  APPLCNT_NM char(50) NOT NULL,
  APPLCNT_IHIDNUM char(200) ,
  SBSCRB_DE DATE ,
  ENTRPRS_MBER_STTUS char(15) ,
  ENTRPRS_MBER_PASSWORD char(200) NOT NULL,
  ENTRPRS_MBER_PASSWORD_HINT char(100) NOT NULL,
  ENTRPRS_MBER_PASSWORD_CNSR char(100) NOT NULL,
  GROUP_ID char(20) ,
  DETAIL_ADRES char(100) ,
  ENTRPRS_END_TELNO char(4) ,
  AREA_NO char(4) ,
  APPLCNT_EMAIL_ADRES char(50) ,
  ESNTL_ID char(20) NOT NULL,
  CONSTRAINT LETTNENTRPRSMBER_PK PRIMARY KEY (ENTRPRS_MBER_ID),
  CONSTRAINT LETTNENTRPRSMBER_ibfk_1 FOREIGN KEY (GROUP_ID) REFERENCES LETTNAUTHORGROUPINFO (GROUP_ID) ON DELETE CASCADE
) ;


DROP TABLE if exists LETTNFILE CASCADE;
CREATE TABLE LETTNFILE (
  ATCH_FILE_ID char(20) NOT NULL,
  CREAT_DT DATE NOT NULL,
  USE_AT char(1) ,
  CONSTRAINT LETTNFILE_PK PRIMARY KEY (ATCH_FILE_ID)
) ;


DROP TABLE if exists LETTNFILEDETAIL CASCADE;
CREATE TABLE LETTNFILEDETAIL (
  ATCH_FILE_ID char(20) NOT NULL,
  FILE_SN numeric(10,0) NOT NULL,
  FILE_STRE_COURS char(2000) NOT NULL,
  STRE_FILE_NM char(255) NOT NULL,
  ORIGNL_FILE_NM char(255) ,
  FILE_EXTSN char(20) NOT NULL,
  FILE_CN bytea,
  FILE_SIZE numeric(8,0) ,
  CONSTRAINT LETTNFILEDETAIL_PK PRIMARY KEY (ATCH_FILE_ID,FILE_SN),
  CONSTRAINT LETTNFILEDETAIL_ibfk_1 FOREIGN KEY (ATCH_FILE_ID) REFERENCES LETTNFILE (ATCH_FILE_ID)
) ;


DROP TABLE if exists LETTNGNRLMBER CASCADE;
CREATE TABLE LETTNGNRLMBER (
  MBER_ID char(20) DEFAULT '' NOT NULL,
  PASSWORD char(200) NOT NULL,
  PASSWORD_HINT char(100) NOT NULL,
  PASSWORD_CNSR char(100) NOT NULL,
  IHIDNUM char(200) ,
  MBER_NM char(50) NOT NULL,
  ZIP char(6) ,
  ADRES char(100) ,
  AREA_NO char(4) ,
  MBER_STTUS char(15) ,
  DETAIL_ADRES char(100) ,
  END_TELNO char(4) ,
  MBTLNUM char(20) ,
  GROUP_ID char(20) ,
  MBER_FXNUM char(20) ,
  MBER_EMAIL_ADRES char(50) ,
  MIDDLE_TELNO char(4) ,
  SBSCRB_DE DATE ,
  SEXDSTN_CODE char(1) ,
  ESNTL_ID char(20) NOT NULL,
  CONSTRAINT LETTNGNRLMBER_PK PRIMARY KEY (MBER_ID),
  CONSTRAINT LETTNGNRLMBER_ibfk_1 FOREIGN KEY (GROUP_ID) REFERENCES LETTNAUTHORGROUPINFO (GROUP_ID) ON DELETE CASCADE
) ;


DROP TABLE if exists LETTNSCHDULINFO CASCADE;
CREATE TABLE LETTNSCHDULINFO (
  SCHDUL_ID char(20) NOT NULL,
  SCHDUL_SE char(1) ,
  SCHDUL_DEPT_ID char(20) ,
  SCHDUL_KND_CODE char(20) ,
  SCHDUL_BEGINDE char(20) ,
  SCHDUL_ENDDE char(20) ,
  SCHDUL_NM char(255) ,
  SCHDUL_CN char(2500) ,
  SCHDUL_PLACE char(255) ,
  SCHDUL_IPCR_CODE char(1) ,
  SCHDUL_CHARGER_ID char(20) ,
  ATCH_FILE_ID char(20) ,
  FRST_REGIST_PNTTM DATE ,
  FRST_REGISTER_ID char(20) ,
  LAST_UPDT_PNTTM DATE ,
  LAST_UPDUSR_ID char(20) ,
  REPTIT_SE_CODE char(3) ,
  CONSTRAINT LETTNSCHDULINFO_PK PRIMARY KEY (SCHDUL_ID)
) ;


CREATE OR REPLACE VIEW COMVNUSERMASTER ( ESNTL_ID,USER_ID,PASSWORD,USER_NM,USER_ZIP,USER_ADRES,USER_EMAIL,GROUP_ID, USER_SE, ORGNZT_ID ) 
AS  
        SELECT ESNTL_ID, MBER_ID,PASSWORD,MBER_NM,ZIP,ADRES,MBER_EMAIL_ADRES,' ','GNR' AS USER_SE, ' ' ORGNZT_ID
        FROM LETTNGNRLMBER
    UNION ALL
        SELECT ESNTL_ID,EMPLYR_ID,PASSWORD,USER_NM,ZIP,HOUSE_ADRES,EMAIL_ADRES,GROUP_ID ,'USR' AS USER_SE, ORGNZT_ID
        FROM LETTNEMPLYRINFO
    UNION ALL
        SELECT ESNTL_ID,ENTRPRS_MBER_ID,ENTRPRS_MBER_PASSWORD,CMPNY_NM,ZIP,ADRES,APPLCNT_EMAIL_ADRES,' ' ,'ENT' AS USER_SE, ' ' ORGNZT_ID
        FROM LETTNENTRPRSMBER 
;


DROP TABLE if exists project CASCADE;
CREATE TABLE project(
	project_id				int,
	project_key				varchar(60)							not null ,
	project_name			varchar(100)						not null,
	view_order				int									default 1,
	default_yn				char(1)								default 'N',
	use_yn					char(1)								default 'Y',
	latitude				numeric(13,10),
	longitude				numeric(13,10),
	height					numeric(7,3),
	duration				int,
	description				varchar(256),
	insert_date				timestamp with time zone			default now(),
	CONSTRAINT project_pk 	PRIMARY KEY (project_id)	
);

comment on table project is 'project(F4D Data) 그룹';
comment on column project.project_id is '고유번호';
comment on column project.project_key is '링크 활용 등을 위한 확장 컬럼';
comment on column project.project_name is '프로젝트';
comment on column project.view_order is '나열 순서';
comment on column project.default_yn is '삭제 불가, Y : 기본, N : 선택';
comment on column project.use_yn is '사용유무, Y : 사용, N : 사용안함';
comment on column project.latitude is '위도';
comment on column project.longitude is '경도';
comment on column project.height is '높이';
comment on column project.duration is 'flyTo 이동시간';
comment on column project.description is '설명';
comment on column project.insert_date is '등록일';


DROP TABLE if exists data_info CASCADE;
CREATE TABLE data_info(
	data_id						bigint,
	project_id					int									not null,
	data_key					varchar(128)						not null,
	data_name					varchar(64),
	parent						bigint								default 1,
	depth						int									default 1,
	view_order					int									default 1,
	child_yn					char(1)								default 'N',
	mapping_type				varchar(30)							default 'origin',
	location		 			GEOGRAPHY(POINT, 4326),
	latitude					numeric(13,10),
	longitude					numeric(13,10),
	height						numeric(7,3),
	heading						numeric(8,5),
	pitch						numeric(8,5),
	roll						numeric(8,5),
	attributes					jsonb,
	status						char(1)								default '0',
	public_yn					char(1)								default 'N',
	data_insert_type			varchar(30)							default 'SELF',
	description					varchar(256),
	update_date					timestamp with time zone,
	insert_date					timestamp with time zone			default now(),
	CONSTRAINT data_info_pk 	PRIMARY KEY(data_id)
);

comment on table data_info is 'Data 정보';
comment on column data_info.data_id is '고유번호';
comment on column data_info.project_id is 'project 고유번호';
comment on column data_info.data_key is 'data 고유 식별번호';
comment on column data_info.data_name is 'data 이름';
comment on column data_info.parent is '부모 data_id';
comment on column data_info.depth is 'depth';
comment on column data_info.view_order is '정렬 순서';
comment on column data_info.child_yn is '자식 존재 유무';
comment on column data_info.mapping_type is '기본값 origin : latitude, longitude, height를 origin에 맞춤. boundingboxcenter : latitude, longitude, height를 boundingboxcenter 맞춤';
comment on column data_info.location is '위도, 경도 정보';
comment on column data_info.latitude is '위도';
comment on column data_info.longitude is '경도';
comment on column data_info.height is '높이';
comment on column data_info.heading is 'heading';
comment on column data_info.pitch is 'pitch';
comment on column data_info.roll is 'roll';
comment on column data_info.attributes is 'Data Control 속성';
comment on column data_info.public_yn is '공개 유무. 기본값 N(비공개)';
comment on column data_info.status is 'Data 상태. 0:사용중, 1:사용중지(관리자), 2:기타';
comment on column data_info.data_insert_type is 'data 등록 방법. 기본 : SELF';
comment on column data_info.description is '설명';
comment on column data_info.update_date is '수정일';
comment on column data_info.insert_date is '등록일';


DROP TABLE if exists policy CASCADE;
CREATE TABLE policy(
	policy_id								int,
	
	user_id_min_length						int					default 5,
	user_fail_login_count					int					default 3,
	user_fail_lock_release					varchar(3)			default '30',
	user_last_login_lock					varchar(3)			default '90',
	user_duplication_login_yn				char(1)				default 'N',
	user_login_type							char(1)				default '0',
	user_update_check						char(1)				default '0',
	user_delete_check						char(1)				default '0',
	user_delete_type						char(1)				default '0',
	
	password_change_term 					varchar(3)			default '30',
	password_min_length						int					default 8,
	password_max_length						int					default 32,
	password_eng_upper_count 				int					default 1,
	password_eng_lower_count 				int					default 1,
	password_number_count 					int					default 1,
	password_special_char_count 			int					default 1,
	password_continuous_char_count 			int					default 3,
	password_create_type					char(1)				default '0',
	password_create_char					varchar(32)			default '!@#',
	password_exception_char					varchar(10)			default '<>&',
	
	geo_view_library						varchar(20)			default 'cesium',
	geo_data_path							varchar(100)		default '/f4d',
	geo_data_default_projects				varchar(30)[],
	geo_data_change_request_decision		char(1)				default '1',
	geo_cull_face_enable					varchar(5)			default 'false',
	geo_time_line_enable					varchar(5)			default 'false',
	
	geo_init_camera_enable					varchar(5)			default 'true',
	geo_init_latitude						varchar(30)			default '37.521168',
	geo_init_longitude						varchar(30)			default '126.924185',
	geo_init_height							varchar(30)			default '3000.0',
	geo_init_duration						int					default 3,
	geo_init_default_terrain				varchar(64),
	geo_init_default_fov					int					default 0,
	
	geo_lod0								varchar(20)			default '15',
	geo_lod1								varchar(20)			default '60',
	geo_lod2								varchar(20)			default '90',
	geo_lod3								varchar(20)			default '200',
	geo_lod4								varchar(20)			default '1000',
	geo_lod5								varchar(20)			default '50000',
	geo_ambient_reflection_coef				varchar(10)			default '0.5',
	geo_diffuse_reflection_coef				varchar(10)			default '1.0',
	geo_specular_reflection_coef			varchar(10)			default '1.0',
	geo_specular_color						varchar(11)			default '#d8d8d8',
	geo_ambient_color						varchar(11)			default '#d8d8d8',
	geo_ssao_radius							varchar(20)			default '0.15',
	
	geo_server_enable						varchar(5)			default 'false',
	geo_server_url							varchar(256),
	geo_server_layers						varchar(60),
	geo_server_parameters_service			varchar(30),
	geo_server_parameters_version			varchar(30),
	geo_server_parameters_request			varchar(30),
	geo_server_parameters_transparent		varchar(30),
	geo_server_parameters_format			varchar(30),
	geo_server_add_url						varchar(256),
	geo_server_add_layers					varchar(60),
	geo_server_add_parameters_service		varchar(30),
	geo_server_add_parameters_version		varchar(30),
	geo_server_add_parameters_request		varchar(30),
	geo_server_add_parameters_transparent	varchar(30),
	geo_server_add_parameters_format		varchar(30),
	
	geo_callback_enable 					varchar(5)			default 'false',
	geo_callback_apiresult					varchar(64),
	geo_callback_dataInfo					varchar(64),
	geo_callback_selectedobject				varchar(64),
	geo_callback_moveddata					varchar(64),
	geo_callback_insertIssue				varchar(64),
	geo_callback_listIssue					varchar(64),
	geo_callback_clickposition				varchar(64),
	
	notice_service_yn						char(1)				default 'Y',
	notice_service_send_type				char(1)				default '0',
	notice_approval_request_yn				char(1)				default 'N',
	notice_approval_sign_yn					char(1)				default 'N',
	notice_password_update_yn				char(1)				default 'N',
	notice_approval_delay_yn				char(1)				default 'N',
	notice_risk_yn							char(1)				default 'N',
	notice_risk_send_type					char(1)				default '0',
	notice_risk_grade						char(1)				default '0',
	
	security_session_timeout_yn				char(1)				default 'N',
	security_session_timeout				varchar(4)			default '30',
	security_user_ip_check_yn				char(1)				default 'N',
	security_session_hijacking				char(1)				default '0',
	security_sso							char(1)				default '0',
	security_sso_token_verify_time			int					default 3,
	security_log_save_type					char(1)				default '0',
	security_log_save_term					varchar(3)			default '2',
	security_dynamic_block_yn				char(1)				default 'N',
	security_api_result_secure_yn			char(1)				default 'N',
	security_masking_yn						char(1)				default 'Y',
	
	content_cache_version					int					default 1,
	content_main_widget_count				int					default 6,
	content_main_widget_interval			int					default 65,
	content_monitoring_interval				int					default 1,
	content_statistics_interval				char(1)				default '0',
	content_load_balancing_interval			int					default 10,
	content_menu_group_root					varchar(60)			default 'Mago3D',
	content_user_group_root					varchar(60)			default 'Mago3D',
	content_server_group_root				varchar(60)			default 'Mago3D',
	content_data_group_root					varchar(60)			default 'Mago3D',
	
	site_name								varchar(60),
	site_admin_name							varchar(64),
	site_admin_mobile_phone					varchar(256),
	site_admin_email						varchar(256),
	site_product_log						varchar(256),
	site_company_log						varchar(256),
	
	backoffice_email_host					varchar(30),
	backoffice_email_port					int,
	backoffice_email_user					varchar(32),
	backoffice_email_password				varchar(256),
	backoffice_user_db_driver				varchar(20),
	backoffice_user_db_url					varchar(256),
	backoffice_user_db_user					varchar(32),
	backoffice_user_db_password				varchar(256),
	
	solution_name							varchar(64),
	solution_version						varchar(30),
	solution_company						varchar(45),
	solution_company_phone					varchar(256),
	solution_manager						varchar(60),
	solution_manager_phone					varchar(256),
	solution_manager_email					varchar(256),
	
	insert_date								timestamp with time zone	default now(),
	CONSTRAINT policy_pk PRIMARY KEY (policy_id)	
);

comment on table policy is '운영정책';
comment on column policy.policy_id is '고유번호';

comment on column policy.user_id_min_length is '사용자 아이디 최소 길이. 기본값 5';
comment on column policy.user_fail_login_count is '사용자 로그인 실패 횟수';
comment on column policy.user_fail_lock_release is '사용자 로그인 실패 잠금 해제 기간';
comment on column policy.user_last_login_lock is '사용자 마지막 로그인으로 부터 잠금 기간';
comment on column policy.user_duplication_login_yn is '중복 로그인 허용 여부. Y : 허용, N : 허용안함(기본값)';
comment on column policy.user_login_type is '사용자 로그인 인증 방법. 0 : 일반(아이디/비밀번호(기본값)), 1 : 기업용(사번추가), 2 : 일반 + OTP, 3 : 일반 + 인증서, 4 : OTP + 인증서, 5 : 일반 + OTP + 인증서';
comment on column policy.user_update_check is '사용자 정보 수정시 확인';
comment on column policy.user_delete_check is '사용자 정보 삭제시 확인';
comment on column policy.user_delete_type is '사용자 정보 삭제 방법. 0 : 논리적(기본값), 1 : 물리적(DB 삭제)';

comment on column policy.password_change_term is '패스워드 변경 주기 기본 30일';
comment on column policy.password_min_length is '패스워드 최소 길이 기본 8';
comment on column policy.password_max_length is '패스워드 최대 길이 기본 32';
comment on column policy.password_eng_upper_count is '패스워드 영문 대문자 개수 기본 1';
comment on column policy.password_eng_lower_count is '패스워드 영문 소문자 개수 기본 1';
comment on column policy.password_number_count is '패스워드 숫자 개수 기본 1';
comment on column policy.password_special_char_count is '패스워드 특수 문자 개수 1';
comment on column policy.password_continuous_char_count is '패스워드 연속문자 제한 개수 3';
comment on column policy.password_create_type is '초기 패스워드 생성 방법. 0 : 사용자 아이디 + 초기문자(기본값), 1 : 초기문자';
comment on column policy.password_create_char is '초기 패스워드 생성 문자열. 엑셀 업로드 등';
comment on column policy.password_exception_char is '패스워드로 사용할수 없는 특수문자(XSS). <,>,&,작은따음표,큰따움표';

comment on column policy.geo_view_library is 'view library. 기본 cesium';
comment on column policy.geo_data_path is 'data 폴더. 기본 /data';
comment on column policy.geo_data_default_projects is '시작시 로딩 프로젝트. 배열로 저장';
comment on column policy.geo_data_change_request_decision is '데이터 정보 변경 요청에 대한 처리. 0 : 자동승인, 1 : 결재(초기값)';
comment on column policy.geo_cull_face_enable is 'cullFace 사용유무. 기본 false';
comment on column policy.geo_time_line_enable is 'timeLine 사용유무. 기본 false';
	
comment on column policy.geo_init_camera_enable is '초기 카메라 이동 유무. 기본 true';
comment on column policy.geo_init_latitude is '초기 카메라 이동 위도';
comment on column policy.geo_init_longitude is '초기 카메라 이동 경도';
comment on column policy.geo_init_height is '초기 카메라 이동 높이';
comment on column policy.geo_init_duration is '초기 카메라 이동 시간. 초 단위';
comment on column policy.geo_init_default_terrain is '기본 Terrain';
comment on column policy.geo_init_default_fov is 'field of view. 기본값 0(1.8 적용)';
comment on column policy.geo_lod0 is 'LOD0. 기본값 15M';
comment on column policy.geo_lod1 is 'LOD1. 기본값 60M';
comment on column policy.geo_lod2 is 'LOD2. 기본값 90M';
comment on column policy.geo_lod3 is 'LOD3. 기본값 200M';
comment on column policy.geo_lod4 is 'LOD4. 기본값 1000M';
comment on column policy.geo_lod5 is 'LOD5. 기본값 50000M';
comment on column policy.geo_ambient_reflection_coef is '다이렉트 빛이 아닌 반사율 범위. 기본값 0.5';
comment on column policy.geo_diffuse_reflection_coef is '자기 색깔의 반사율 범위. 기본값 1.0';
comment on column policy.geo_specular_reflection_coef is '표면의 반질거림 범위. 기본값 1.0';
comment on column policy.geo_ambient_color is '다이렉트 빛이 아닌 반사율 RGB, 콤마로 연결';
comment on column policy.geo_specular_color is '표면의 반질거림 색깔. RGB, 콤마로 연결';
comment on column policy.geo_ssao_radius is '그림자 반경';
	
comment on column policy.geo_server_enable is 'geo server 사용유무';
comment on column policy.geo_server_url is 'geo server 기본 Layers url';
comment on column policy.geo_server_layers is 'geo server 기본 layers';
comment on column policy.geo_server_parameters_service is 'geo server 기본 Layers service 변수값';
comment on column policy.geo_server_parameters_version is 'geo server 기본 Layers version 변수값';
comment on column policy.geo_server_parameters_request is 'geo server 기본 Layers request 변수값';
comment on column policy.geo_server_parameters_transparent is 'geo server 기본 Layers transparent 변수값';
comment on column policy.geo_server_parameters_format is 'geo server 기본 Layers format 변수값';
comment on column policy.geo_server_add_url is 'geo server 추가 Layers url';
comment on column policy.geo_server_add_layers is 'geo server 추가 Layers';
comment on column policy.geo_server_add_parameters_service is 'geo server 추가 Layers service 변수값';
comment on column policy.geo_server_add_parameters_version is 'geo server 추가 Layers version 변수값';
comment on column policy.geo_server_add_parameters_request is 'geo server 추가 Layers request 변수값';
comment on column policy.geo_server_add_parameters_transparent is 'geo server 추가 Layers transparent 변수값';
comment on column policy.geo_server_add_parameters_format is 'geo server 추가 Layers format 변수값';
	
comment on column policy.geo_callback_enable is '콜백 function 사용유무. 기본값 false';
comment on column policy.geo_callback_apiresult is 'api 처리 결과 callback function 이름';
comment on column policy.geo_callback_datainfo is 'data info 표시 callback function 이름';
comment on column policy.geo_callback_moveddata is 'moved data callback function 이름';
comment on column policy.geo_callback_selectedobject is 'object 선택 callback function 이름';
comment on column policy.geo_callback_insertissue is 'issue 등록 callback function 이름';
comment on column policy.geo_callback_listissue is 'issue 목록 callback function 이름';
comment on column policy.geo_callback_clickposition is 'mouse click 시 위치 정보 callback function 이름';

comment on column policy.notice_service_yn is '알림 서비스 사용 유무. Y : 사용, N : 사용안함(기본값)';
comment on column policy.notice_service_send_type is '알림 발송 매체. 0 : SMS(기본값), 1 : 이메일, 2 : 메신저';
comment on column policy.notice_risk_yn is '알림 장애 발생시. Y : 사용, N 사용안함(기본값)';
comment on column policy.notice_risk_send_type is '알림 장애 발송 매체. 0 : SMS(기본값), 1 : 이메일, 2 : 메신저';
comment on column policy.notice_risk_grade is '알림 발송 장애 등급. 1 : 1등급(기본값), 2 : 2등급, 3 : 3등급';

comment on column policy.security_session_timeout_yn is '보안 세션 타임아웃. Y : 사용, N 사용안함(기본값)';
comment on column policy.security_session_timeout is '보안 세션 타임아웃 시간. 기본값 30분';
comment on column policy.security_user_ip_check_yn is '로그인 사용자 IP 체크 유무. Y : 사용, N 사용안함(기본값)';
comment on column policy.security_session_hijacking is '보안 세션 하이재킹 처리. 0 : 사용안함, 1 : 사용(기본값), 2 : OTP 추가 인증 ';
comment on column policy.security_sso is '보안 SSO. 0 : 사용안함(기본값), 1 : TOKEN 인증';
comment on column policy.security_sso_token_verify_time is '보안 Single Sign-On 토큰 유효시간(분단위). 기본 3분';
comment on column policy.security_log_save_type is '보안 로그 저장 방법. 0 : DB(기본값), 1 : 파일';
comment on column policy.security_log_save_term is '보안 로그 보존 기간. 2년 기본값';
comment on column policy.security_dynamic_block_yn is '보안 동적 차단. Y : 사용, N 사용안함(기본값)';
comment on column policy.security_api_result_secure_yn is 'API 결과 암호화 사용. Y : 사용, N 사용안함(기본값)';
comment on column policy.security_masking_yn is '개인정보 마스킹 처리. Y : 사용(기본값), N 사용안함';

comment on column policy.content_cache_version is 'css, js 갱신용 cache version.';
comment on column policy.content_main_widget_count is '메인 화면 위젯 표시 갯수. 기본 6개';
comment on column policy.content_main_widget_interval is '메인 화면 위젯 Refresh 간격. 기본 65초(모니터링 간격 60초에 대한 시간 간격 고려)';
comment on column policy.content_statistics_interval is '통계 기본 검색 기간. 0 : 1년 단위, 1 : 상/하반기, 2 : 분기 단위, 3 : 월 단위';
comment on column policy.content_menu_group_root is '메뉴 그룹 최상위 그룹명';
comment on column policy.content_user_group_root is '사용자 그룹 최상위 그룹명';
comment on column policy.content_data_group_root is '데이터 그룹 최상위 그룹명';

comment on column policy.site_name is '서비스명';
comment on column policy.site_admin_name is '사이트 관리자명';
comment on column policy.site_admin_mobile_phone is '사이트 관리자 핸드폰 번호';
comment on column policy.site_admin_email is '사이트 관리자 이메일';
comment on column policy.site_product_log is '상단 솔루션 로고 이미지';
comment on column policy.site_company_log is 'Footer 회사 로고 이미지';

comment on column policy.backoffice_email_host IS 'Email 연동 서버 host';
comment on column policy.backoffice_email_port IS 'Email 연동 서버 포트';
comment on column policy.backoffice_email_user IS 'Email 연동 서버 사용자';
comment on column policy.backoffice_email_password IS 'Email 연동 서버 비밀번호';
comment on column policy.backoffice_user_db_driver IS '사용자 DB 연동 Driver';
comment on column policy.backoffice_user_db_url IS '사용자 DB 연동 URL';
comment on column policy.backoffice_user_db_user IS '사용자 DB 연동 사용자';
comment on column policy.backoffice_user_db_password IS '사용자 DB 연동 비밀번호';

comment on column policy.solution_name IS '제품명';
comment on column policy.solution_version IS '제품 버전';
comment on column policy.solution_company IS '제품 회사명';
comment on column policy.solution_company_phone IS '제품 회사 연락처';
comment on column policy.solution_manager IS '제품 회사 담당자';
comment on column policy.solution_manager_phone IS '제품 회사 담당자 전화번호';
comment on column policy.solution_manager_email IS '제품 회사 담당자 이메일';

comment on column policy.insert_date is '등록일';
