package egovframework.let.mago3d.service;

public class PolicyVO {
public static final String Y = "Y";
	
	// 서버 시간 설정 쉘
	public static final String SERVER_DATE_SHELL = "config_date.sh";
	// 서버 하드웨어 시간 설정 쉘
	public static final String SERVER_DATE_HWCLOCK_SHELL = "config_date_hwclock.sh";
	
	// 사용자 논리적/물리적 삭제
	public static final String LOGICAL_DELETE_USER = "0";
	public static final String PHYSICAL_DELETE_USER = "1";
	
	// 보안 세션 하이재킹 처리. 0 : 미사용, 1 : 사용(기본값), 2 : OTP 추가 인증
	public static final String SECURITY_SESSION_HIJACKING_NOT_USE = "0";
	public static final String SECURITY_SESSION_HIJACKING_USE = "1";
	public static final String SECURITY_SESSION_HIJACKING_OTP = "2";
	
	// 데이터 정보 변경 요청 자동 승인
	public static final String DATA_CHANGE_REQUEST_DECISION_AUTO = "0";
	public static final String DATA_CHANGE_REQUEST_DECISION_CONFIRM = "1";
	
	// Single Sign-On 사용 안함
	public static final String SECURITY_SSO_USE_N = "0";
	// Single Sign-On Token 사용
	public static final String SECURITY_SSO_TOKEN = "1";
	
	// 통계 기본 검색 기간. 0 : 1년단위
	public static final String STATISTICS_YEAR = "0";
	// 통계 기본 검색 기간. 1 : 상/하반기
	public static final String STATISTICS_YEAR_HALF = "1";
	// 통계 기본 검색 기간. 2 : 분기별
	public static final String STATISTICS_QUARTER = "2";
	// 통계 기본 검색 기간. 3 : 월별
	public static final String STATISTICS_MONTH = "3";
	
	// 초기 패스워드 생성 방법. 0 : 사용자 아이디 + 초기문자(기본값), 1 : 초기문자
	public static final String PASSWORD_CREATE_WITH_USER_ID = "0";
	public static final String PASSWORD_CREATE_CREATE_CHAR = "1";
	
	// 서버 IP
	private String server_ip;
	// 고유번호
	private Long policy_id;
	
	// 사용자 아이디 최소 길이. 기본값 5
	private Integer user_id_min_length;
	// 사용자 로그인 실패 횟수
	private Integer user_fail_login_count;
	// 사용자 로그인 실패 잠금 해제 기간
	private String user_fail_lock_release;
	// 사용자 마지막 로그인으로 부터 잠금 기간
	private String user_last_login_lock;
	// 사용자 중복 로그인 허용 여부. Y : 허용, N : 허용안함(기본값)
	private String user_duplication_login_yn;
	// 사용자 로그인 인증 방법. 0 : 일반(아이디/비밀번호(기본값)), 1 : 기업용(사번추가), 2 : 일반 + OTP, 3 : 일반 + 인증서, 4 : OTP + 인증서, 5 : 일반 + OTP + 인증서
	private String user_login_type;
	// 사용자 정보 수정시 확인
	private String user_update_check;
	// 사용자 정보 삭제시 확인
	private String user_delete_check;
	// 사용자 정보 삭제 방법. 0 : 논리적(기본값), 1 : 물리적(DB 삭제)
	private String user_delete_type;
	
	// 패스워드 변경 주기 기본 30일
	private String password_change_term;
	// 패스워드 최소 길이 기본 8
	private Integer password_min_length;
	// 패스워드 최대 길이 기본 32
	private Integer password_max_length;
	// 패스워드 영문 대문자 개수 기본 1
	private Integer password_eng_upper_count;
	// 패스워드 영문 소문자 개수 기본 1
	private Integer password_eng_lower_count;
	// 패스워드 숫자 개수 기본 1
	private Integer password_number_count;
	// 패스워드 특수 문자 개수 1
	private Integer password_special_char_count;
	// 패스워드 연속문자 제한 개수 3
	private Integer password_continuous_char_count;
	// 초기 패스워드 생성 방법. 0 : 사용자 아이디 + 초기문자(기본값), 1 : 초기문자
	private String password_create_type;
	// 초기 패스워드 생성 문자열. 엑셀 업로드 등
	private String password_create_char;
	// 패스워드로 사용할수 없는 특수문자(XSS). <,>,&,작은따음표,큰따움표
	private String password_exception_char;
	
	// view library. 기본 cesium
	private String geo_view_library;
	// data 폴더. 기본 /data
	private String geo_data_path;
	// 초기 로딩 프로젝트

	private String geo_data_default_projects;
	private String geo_data_default_projects_view;
	// 데이터 정보 변경 요청에 대한 처리. 0 : 자동승인, 1 : 결재(초기값)
	private String geo_data_change_request_decision;
	// cullFace 사용유무. 기본 false
	private String geo_cull_face_enable;
	// timeLine 사용유무. 기본 false
	private String geo_time_line_enable;
	
	// 초기 카메라 이동 유무. 기본 true
	private String geo_init_camera_enable;
	// 초기 카메라 이동 위도
	private String geo_init_latitude;
	// 초기 카메라 이동 경도
	private String geo_init_longitude;
	// 초기 카메라 이동 높이
	private String geo_init_height;
	// 초기 카메라 이동 시간. 초 단위
	private Long geo_init_duration;
	// 기본 Terrain
	private String geo_init_default_terrain;
	// field of view. 기본값 0(1.8 적용)
	private Long geo_init_default_fov;
	
	// LOD0. 기본값 15M
	private String geo_lod0;
	// LOD1. 기본값 60M
	private String geo_lod1;
	// LOD2. 기본값 900M
	private String geo_lod2;
	// LOD3. 기본값 200M
	private String geo_lod3;
	// LOD3. 기본값 1000M
	private String geo_lod4;
	// LOD3. 기본값 50000M
	private String geo_lod5;
	
	// 다이렉트 빛이 아닌 반사율 범위. 기본값 0.5
	private String geo_ambient_reflection_coef;
	// 자기 색깔의 반사율 범위. 기본값 1.0
	private String geo_diffuse_reflection_coef;
	// 표면의 반질거림 범위. 기본값 1.0
	private String geo_specular_reflection_coef;
	// 다이렉트 빛이 아닌 반사율 RGB, 콤마로 연결
	private String geo_ambient_color;
	private String geo_ambient_colorR;
	private String geo_ambient_colorG;
	private String geo_ambient_colorB;
	// 표면의 반질거림 색깔. RGB, 콤마로 연결
	private String geo_specular_color;
	private String geo_specular_colorR;
	private String geo_specular_colorG;
	private String geo_specular_colorB;
	// 그림자 반경
	private String geo_ssao_radius;
	
	// geo server 사용유무
	private String geo_server_enable;
	// geo server 기본 layers url
	private String geo_server_url;
	// geo server 기본 layers
	private String geo_server_layers;
	// geo server 기본 layers service 변수값
	private String geo_server_parameters_service;
	// geo server 기본 layers version 변수값
	private String geo_server_parameters_version;
	// geo server 기본 layers request 변수값
	private String geo_server_parameters_request;
	// geo server 기본 layers transparent 변수값
	private String geo_server_parameters_transparent;
	// geo server 기본 layers format 변수값
	private String geo_server_parameters_format;
	// geo server 추가 layers url
	private String geo_server_add_url;
	// geo server 추가 layers layers
	private String geo_server_add_layers;
	// geo server 추가 layers service 변수값
	private String geo_server_add_parameters_service;
	// geo server 추가 layers version 변수값
	private String geo_server_add_parameters_version;
	// geo server 추가 layers request 변수값
	private String geo_server_add_parameters_request;
	// geo server 추가 layers transparent 변수값
	private String geo_server_add_parameters_transparent;
	// geo server 추가 layers format 변수값
	private String geo_server_add_parameters_format;
	
	// 콜백 function 사용유무. 기본값 false
	private String geo_callback_enable;
	// api 처리 결과 callback function 이름
	private String geo_callback_apiresult;
	// data info 표시 callback function 이름
	private String geo_callback_dataInfo;
	// moved data callback function 이름
	private String geo_callback_moveddata;
	// object 선택 callback function 이름
	private String geo_callback_selectedobject;
	// issue 등록 callback function 이름
	private String geo_callback_insertissue;
	// issue list callback function 이름
	private String geo_callback_listissue;
	// mouse click 시 위치 정보 callback function 이름
	private String geo_callback_clickposition;
	
	// 알림 서비스 사용 유무. Y : 사용, N : 미사용(기본값)
	private String notice_service_yn;
	// 알림 발송 매체. 0 : SMS(기본값), 1 : 이메일, 2 : 메신저
	private String notice_service_send_type;
	// 알림 결재 요청/대기시. Y : 사용, N 미사용(기본값)
	private String notice_approval_request_yn;
	// 알림 결재 완료시. Y : 사용, N 미사용(기본값)
	private String notice_approval_sign_yn;
	// 알림 관리 계정 패스워드 변경시. Y : 사용, N 미사용(기본값)
	private String notice_password_update_yn;
	// 알림 결재 대기시. Y : 사용, N 미사용(기본값)
	private String notice_approval_delay_yn;
	// 알림 장애 발생시. Y : 사용, N 미사용(기본값)
	private String notice_risk_yn;
	// 알림 장애 발송 매체. 0 : SMS(기본값), 1 : 이메일, 2 : 메신저
	private String notice_risk_send_type;
	// 알림 발송 장애 등급. 1 : 1등급(기본값), 2 : 2등급, 3 : 3등급
	private String notice_risk_grade;
	
	// 보안 세션 타임아웃. Y : 사용, N 미사용(기본값)
	private String security_session_timeout_yn;
	// 보안 세션 타임아웃 시간. 30분
	private String security_session_timeout;
	// 로그인 시 사용자 등록 IP 체크 유무. Y : 사용, N 미사용(기본값)
	private String security_user_ip_check_yn;
	// 보안 세션 하이재킹 처리. 0 : 미사용, 1 : 사용(기본값), 2 : OTP 추가 인증
	private String security_session_hijacking;
	// 보안 SSO. 0 : 사용안함(기본값), 1 : TOKEN 인증
	private String security_sso;
	// 보안 Single Sign-On 토큰 유효시간(분단위). 기본 3분
	private Integer security_sso_token_verify_time;
	// 보안 로그 보존 방법. 1 : DB(기본값), 2 : 파일
	private String security_log_save_type;
	// 보안 로그 보존 기간. 2년 기본값
	private String security_log_save_term;
	// 보안 동적 차단. Y : 사용, N 미사용(기본값)
	private String security_dynamic_block_yn;
	// API 결과 암호화 사용. Y : 사용, N 사용안함(기본값)
	private String security_api_result_secure_yn;
	// 개인정보 마스킹 처리. Y : 사용(기본값), N 사용안함
	private String security_masking_yn;
	
	// css, js 갱신용 cache version.
	private Integer content_cache_version;
	// 메인 화면 위젯 표시 갯수. 기본 6개
	private Integer content_main_widget_count;
	// 메인 화면 위젯 Refresh 간격. 기본 65초(모니터링 간격 60초에 대한 시간 간격 고려)
	private Integer content_main_widget_interval;
	// 대몬에서 WAS 모니터링 감시 간격(분단위). 기본 1분
	private Integer content_monitoring_interval;
	// 통계 기본 검색 기간. 0 : 1년단위, 1 : 상/하반기, 2 : 분기별, 3 : 월별
	private String content_statistics_interval;
	// 현재 서버가 Active, Standby 인지 상태를 표시하는 주기
	private Integer content_load_balancing_interval;
	// 메뉴 그룹 최상위 그룹명
	private String content_menu_group_root;
	// 사용자 그룹 최상위 그룹명
	private String content_user_group_root;
	// 서버 그룹 최상위 그룹명
	private String content_server_group_root;
	// 계정 그룹 최상위 그룹명
	private String content_data_group_root;
	
	// Java TimeZone 설정. Asia/Seoul(기본), UTC(Universal Time Coordinated, 세계협정시)
	private String os_timezone;
	// 서버 시간 설정 방법. 0 : 직접 이력, 1 : KT, 2 : LG, 3 : 아이네트, 4 : 마이크로소프트
	private String os_ntp;
	// 시스템 시간 설정을 위한 임시 파라미터
	private String os_ntp_day;
	private String os_ntp_hour;
	private String os_ntp_minute;
	// Radius Key
	private String os_radius_secret;
	
	// 서비스명
	private String site_name;
	// 사이트 관리자명
	private String site_admin_name;
	// 사이트 관리자 핸드폰 번호
	private String site_admin_mobile_phone;
	// 사이트 관리자 이메일
	private String site_admin_email;
//	private MultipartFile uploadfile_top;
//	private MultipartFile uploadfile_bottom;
	private String uploadfile_top_value;
	private String uploadfile_bottom_value;
	private String site_product_log;
	private String site_company_log;
	
	// Email 연동 서버 host
	private String backoffice_email_host;
	// Email 연동 서버 포트
	private Integer backoffice_email_port;
	// Email 연동 서버 사용자
	private String backoffice_email_user;
	// Email 연동 서버 비밀번호
	private String backoffice_email_password;
	// 사용자 DB 연동 Driver
	private String backoffice_user_db_driver;
	// 사용자 DB 연동 URL
	private String backoffice_user_db_url;
	// 사용자 DB 연동 사용자
	private String backoffice_user_db_user;
	// 사용자 DB 연동 비밀번호
	private String backoffice_user_db_password;
	
	// 제품명
	private String solution_name;
	// 제품 버전
	private String solution_version;
	// 제품 회사명
	private String solution_company;
	// 제품 회사 연락처
	private String solution_company_phone;
	// 제품 회사 담당자
	private String solution_manager;
	// 제품 회사 담당자 전화번호
	private String solution_manager_phone;
	// 제품 회사 담당자 이메일
	private String solution_manager_email;
	
	// 등록일
	private String insert_date;
	
	public String getGeo_data_default_projects() {
		return geo_data_default_projects;
	}

	public void setGeo_data_default_projects(String geo_data_default_projects) {
		this.geo_data_default_projects = geo_data_default_projects;
		if(this.geo_data_default_projects != null && !("").equals(this.geo_data_default_projects)) {
			this.geo_data_default_projects = this.geo_data_default_projects.replace("{", "");
			this.geo_data_default_projects = this.geo_data_default_projects.replace("}", "");
			this.geo_data_default_projects = this.geo_data_default_projects.replaceAll("\"", "");
		}
	}
	
//	public String getViewSiteAdminMobilePhone() {
//		return Crypt.decrypt(site_admin_mobile_phone);
//	}
//	
//	public String getMaskingSiteAdminMobilePhone() {
//		return getMaskingData(site_admin_mobile_phone, "PHONE");
//	}
//	
//	public String getViewMaskingSiteAdminMobilePhone() {
//		return getMaskingData(Crypt.decrypt(site_admin_mobile_phone), "PHONE");
//	}
//
//	public String getViewSiteAdminEmail() {
//		return Crypt.decrypt(site_admin_email);
//	}
//	
//	public String getMaskingSiteAdminEmail() {
//		return getMaskingData(site_admin_email, "EMAIL");
//	}
//	
//	public String getViewMaskingSiteAdminEmail() {
//		return getMaskingData(Crypt.decrypt(site_admin_email), "EMAIL");
//	}
//	
//	public String getViewSolutionCompanyPhone() {
//		return Crypt.decrypt(solution_company_phone);
//	}
//	
//	public String getMaskingSolutionCompanyPhone() {
//		return getMaskingData(solution_company_phone, "PHONE");
//	}
//	
//	public String getViewMaskingSolutionCompanyPhone() {
//		return getMaskingData(Crypt.decrypt(solution_company_phone), "PHONE");
//	}
//	
//	public String getViewSolutionManagerPhone() {
//		return Crypt.decrypt(solution_manager_phone);
//	}
//	
//	public String getMaskingSolutionManagerPhone() {
//		return getMaskingData(solution_manager_phone, "PHONE");
//	}
//	
//	public String getViewMaskingSolutionManagerPhone() {
//		return getMaskingData(Crypt.decrypt(solution_manager_phone), "PHONE");
//	}
//	
//	public String getViewSolutionManagerEmail() {
//		return Crypt.decrypt(solution_manager_email);
//	}
//	
//	public String getMaskingSolutionManagerEmail() {
//		return getMaskingData(solution_manager_email, "EMAIL");
//	}
//	
//	public String getViewMaskingSolutionManagerEmail() {
//		return getMaskingData(Crypt.decrypt(solution_manager_email), "EMAIL");
//	}
	
	/**
	 * 개인정보 마스킹 처리
	 * @param value
	 * @param type
	 * @return
	 */
//	public String getMaskingData(String value, String type) {
//		if(CacheManager.isUserInfoMasking()) {
//			return Masking.getMasking(value, type);
//		}
//		return value;
//	}
	
	public String getViewInsertDate() {
		if(this.insert_date == null || "".equals( insert_date)) {
			return "";
		}
		return insert_date.substring(0, 19);
	}

	public String getServer_ip() {
		return server_ip;
	}

	public void setServer_ip(String server_ip) {
		this.server_ip = server_ip;
	}

	public Long getPolicy_id() {
		return policy_id;
	}

	public void setPolicy_id(Long policy_id) {
		this.policy_id = policy_id;
	}

	public Integer getUser_id_min_length() {
		return user_id_min_length;
	}

	public void setUser_id_min_length(Integer user_id_min_length) {
		this.user_id_min_length = user_id_min_length;
	}

	public Integer getUser_fail_login_count() {
		return user_fail_login_count;
	}

	public void setUser_fail_login_count(Integer user_fail_login_count) {
		this.user_fail_login_count = user_fail_login_count;
	}

	public String getUser_fail_lock_release() {
		return user_fail_lock_release;
	}

	public void setUser_fail_lock_release(String user_fail_lock_release) {
		this.user_fail_lock_release = user_fail_lock_release;
	}

	public String getUser_last_login_lock() {
		return user_last_login_lock;
	}

	public void setUser_last_login_lock(String user_last_login_lock) {
		this.user_last_login_lock = user_last_login_lock;
	}

	public String getUser_duplication_login_yn() {
		return user_duplication_login_yn;
	}

	public void setUser_duplication_login_yn(String user_duplication_login_yn) {
		this.user_duplication_login_yn = user_duplication_login_yn;
	}

	public String getUser_login_type() {
		return user_login_type;
	}

	public void setUser_login_type(String user_login_type) {
		this.user_login_type = user_login_type;
	}

	public String getUser_update_check() {
		return user_update_check;
	}

	public void setUser_update_check(String user_update_check) {
		this.user_update_check = user_update_check;
	}

	public String getUser_delete_check() {
		return user_delete_check;
	}

	public void setUser_delete_check(String user_delete_check) {
		this.user_delete_check = user_delete_check;
	}

	public String getUser_delete_type() {
		return user_delete_type;
	}

	public void setUser_delete_type(String user_delete_type) {
		this.user_delete_type = user_delete_type;
	}

	public String getPassword_change_term() {
		return password_change_term;
	}

	public void setPassword_change_term(String password_change_term) {
		this.password_change_term = password_change_term;
	}

	public Integer getPassword_min_length() {
		return password_min_length;
	}

	public void setPassword_min_length(Integer password_min_length) {
		this.password_min_length = password_min_length;
	}

	public Integer getPassword_max_length() {
		return password_max_length;
	}

	public void setPassword_max_length(Integer password_max_length) {
		this.password_max_length = password_max_length;
	}

	public Integer getPassword_eng_upper_count() {
		return password_eng_upper_count;
	}

	public void setPassword_eng_upper_count(Integer password_eng_upper_count) {
		this.password_eng_upper_count = password_eng_upper_count;
	}

	public Integer getPassword_eng_lower_count() {
		return password_eng_lower_count;
	}

	public void setPassword_eng_lower_count(Integer password_eng_lower_count) {
		this.password_eng_lower_count = password_eng_lower_count;
	}

	public Integer getPassword_number_count() {
		return password_number_count;
	}

	public void setPassword_number_count(Integer password_number_count) {
		this.password_number_count = password_number_count;
	}

	public Integer getPassword_special_char_count() {
		return password_special_char_count;
	}

	public void setPassword_special_char_count(Integer password_special_char_count) {
		this.password_special_char_count = password_special_char_count;
	}

	public Integer getPassword_continuous_char_count() {
		return password_continuous_char_count;
	}

	public void setPassword_continuous_char_count(Integer password_continuous_char_count) {
		this.password_continuous_char_count = password_continuous_char_count;
	}

	public String getPassword_create_type() {
		return password_create_type;
	}

	public void setPassword_create_type(String password_create_type) {
		this.password_create_type = password_create_type;
	}

	public String getPassword_create_char() {
		return password_create_char;
	}

	public void setPassword_create_char(String password_create_char) {
		this.password_create_char = password_create_char;
	}

	public String getPassword_exception_char() {
		return password_exception_char;
	}

	public void setPassword_exception_char(String password_exception_char) {
		this.password_exception_char = password_exception_char;
	}

	public String getGeo_view_library() {
		return geo_view_library;
	}

	public void setGeo_view_library(String geo_view_library) {
		this.geo_view_library = geo_view_library;
	}

	public String getGeo_data_path() {
		return geo_data_path;
	}

	public void setGeo_data_path(String geo_data_path) {
		this.geo_data_path = geo_data_path;
	}

	public String getGeo_data_default_projects_view() {
		return geo_data_default_projects_view;
	}

	public void setGeo_data_default_projects_view(String geo_data_default_projects_view) {
		this.geo_data_default_projects_view = geo_data_default_projects_view;
	}

	public String getGeo_data_change_request_decision() {
		return geo_data_change_request_decision;
	}

	public void setGeo_data_change_request_decision(String geo_data_change_request_decision) {
		this.geo_data_change_request_decision = geo_data_change_request_decision;
	}

	public String getGeo_cull_face_enable() {
		return geo_cull_face_enable;
	}

	public void setGeo_cull_face_enable(String geo_cull_face_enable) {
		this.geo_cull_face_enable = geo_cull_face_enable;
	}

	public String getGeo_time_line_enable() {
		return geo_time_line_enable;
	}

	public void setGeo_time_line_enable(String geo_time_line_enable) {
		this.geo_time_line_enable = geo_time_line_enable;
	}

	public String getGeo_init_camera_enable() {
		return geo_init_camera_enable;
	}

	public void setGeo_init_camera_enable(String geo_init_camera_enable) {
		this.geo_init_camera_enable = geo_init_camera_enable;
	}

	public String getGeo_init_latitude() {
		return geo_init_latitude;
	}

	public void setGeo_init_latitude(String geo_init_latitude) {
		this.geo_init_latitude = geo_init_latitude;
	}

	public String getGeo_init_longitude() {
		return geo_init_longitude;
	}

	public void setGeo_init_longitude(String geo_init_longitude) {
		this.geo_init_longitude = geo_init_longitude;
	}

	public String getGeo_init_height() {
		return geo_init_height;
	}

	public void setGeo_init_height(String geo_init_height) {
		this.geo_init_height = geo_init_height;
	}

	public Long getGeo_init_duration() {
		return geo_init_duration;
	}

	public void setGeo_init_duration(Long geo_init_duration) {
		this.geo_init_duration = geo_init_duration;
	}

	public String getGeo_init_default_terrain() {
		return geo_init_default_terrain;
	}

	public void setGeo_init_default_terrain(String geo_init_default_terrain) {
		this.geo_init_default_terrain = geo_init_default_terrain;
	}

	public Long getGeo_init_default_fov() {
		return geo_init_default_fov;
	}

	public void setGeo_init_default_fov(Long geo_init_default_fov) {
		this.geo_init_default_fov = geo_init_default_fov;
	}

	public String getGeo_lod0() {
		return geo_lod0;
	}

	public void setGeo_lod0(String geo_lod0) {
		this.geo_lod0 = geo_lod0;
	}

	public String getGeo_lod1() {
		return geo_lod1;
	}

	public void setGeo_lod1(String geo_lod1) {
		this.geo_lod1 = geo_lod1;
	}

	public String getGeo_lod2() {
		return geo_lod2;
	}

	public void setGeo_lod2(String geo_lod2) {
		this.geo_lod2 = geo_lod2;
	}

	public String getGeo_lod3() {
		return geo_lod3;
	}

	public void setGeo_lod3(String geo_lod3) {
		this.geo_lod3 = geo_lod3;
	}

	public String getGeo_lod4() {
		return geo_lod4;
	}

	public void setGeo_lod4(String geo_lod4) {
		this.geo_lod4 = geo_lod4;
	}

	public String getGeo_lod5() {
		return geo_lod5;
	}

	public void setGeo_lod5(String geo_lod5) {
		this.geo_lod5 = geo_lod5;
	}

	public String getGeo_ambient_reflection_coef() {
		return geo_ambient_reflection_coef;
	}

	public void setGeo_ambient_reflection_coef(String geo_ambient_reflection_coef) {
		this.geo_ambient_reflection_coef = geo_ambient_reflection_coef;
	}

	public String getGeo_diffuse_reflection_coef() {
		return geo_diffuse_reflection_coef;
	}

	public void setGeo_diffuse_reflection_coef(String geo_diffuse_reflection_coef) {
		this.geo_diffuse_reflection_coef = geo_diffuse_reflection_coef;
	}

	public String getGeo_specular_reflection_coef() {
		return geo_specular_reflection_coef;
	}

	public void setGeo_specular_reflection_coef(String geo_specular_reflection_coef) {
		this.geo_specular_reflection_coef = geo_specular_reflection_coef;
	}

	public String getGeo_ambient_color() {
		return geo_ambient_color;
	}

	public void setGeo_ambient_color(String geo_ambient_color) {
		this.geo_ambient_color = geo_ambient_color;
	}

	public String getGeo_ambient_colorR() {
		return geo_ambient_colorR;
	}

	public void setGeo_ambient_colorR(String geo_ambient_colorR) {
		this.geo_ambient_colorR = geo_ambient_colorR;
	}

	public String getGeo_ambient_colorG() {
		return geo_ambient_colorG;
	}

	public void setGeo_ambient_colorG(String geo_ambient_colorG) {
		this.geo_ambient_colorG = geo_ambient_colorG;
	}

	public String getGeo_ambient_colorB() {
		return geo_ambient_colorB;
	}

	public void setGeo_ambient_colorB(String geo_ambient_colorB) {
		this.geo_ambient_colorB = geo_ambient_colorB;
	}

	public String getGeo_specular_color() {
		return geo_specular_color;
	}

	public void setGeo_specular_color(String geo_specular_color) {
		this.geo_specular_color = geo_specular_color;
	}

	public String getGeo_specular_colorR() {
		return geo_specular_colorR;
	}

	public void setGeo_specular_colorR(String geo_specular_colorR) {
		this.geo_specular_colorR = geo_specular_colorR;
	}

	public String getGeo_specular_colorG() {
		return geo_specular_colorG;
	}

	public void setGeo_specular_colorG(String geo_specular_colorG) {
		this.geo_specular_colorG = geo_specular_colorG;
	}

	public String getGeo_specular_colorB() {
		return geo_specular_colorB;
	}

	public void setGeo_specular_colorB(String geo_specular_colorB) {
		this.geo_specular_colorB = geo_specular_colorB;
	}

	public String getGeo_ssao_radius() {
		return geo_ssao_radius;
	}

	public void setGeo_ssao_radius(String geo_ssao_radius) {
		this.geo_ssao_radius = geo_ssao_radius;
	}

	public String getGeo_server_enable() {
		return geo_server_enable;
	}

	public void setGeo_server_enable(String geo_server_enable) {
		this.geo_server_enable = geo_server_enable;
	}

	public String getGeo_server_url() {
		return geo_server_url;
	}

	public void setGeo_server_url(String geo_server_url) {
		this.geo_server_url = geo_server_url;
	}

	public String getGeo_server_layers() {
		return geo_server_layers;
	}

	public void setGeo_server_layers(String geo_server_layers) {
		this.geo_server_layers = geo_server_layers;
	}

	public String getGeo_server_parameters_service() {
		return geo_server_parameters_service;
	}

	public void setGeo_server_parameters_service(String geo_server_parameters_service) {
		this.geo_server_parameters_service = geo_server_parameters_service;
	}

	public String getGeo_server_parameters_version() {
		return geo_server_parameters_version;
	}

	public void setGeo_server_parameters_version(String geo_server_parameters_version) {
		this.geo_server_parameters_version = geo_server_parameters_version;
	}

	public String getGeo_server_parameters_request() {
		return geo_server_parameters_request;
	}

	public void setGeo_server_parameters_request(String geo_server_parameters_request) {
		this.geo_server_parameters_request = geo_server_parameters_request;
	}

	public String getGeo_server_parameters_transparent() {
		return geo_server_parameters_transparent;
	}

	public void setGeo_server_parameters_transparent(String geo_server_parameters_transparent) {
		this.geo_server_parameters_transparent = geo_server_parameters_transparent;
	}

	public String getGeo_server_parameters_format() {
		return geo_server_parameters_format;
	}

	public void setGeo_server_parameters_format(String geo_server_parameters_format) {
		this.geo_server_parameters_format = geo_server_parameters_format;
	}

	public String getGeo_server_add_url() {
		return geo_server_add_url;
	}

	public void setGeo_server_add_url(String geo_server_add_url) {
		this.geo_server_add_url = geo_server_add_url;
	}

	public String getGeo_server_add_layers() {
		return geo_server_add_layers;
	}

	public void setGeo_server_add_layers(String geo_server_add_layers) {
		this.geo_server_add_layers = geo_server_add_layers;
	}

	public String getGeo_server_add_parameters_service() {
		return geo_server_add_parameters_service;
	}

	public void setGeo_server_add_parameters_service(String geo_server_add_parameters_service) {
		this.geo_server_add_parameters_service = geo_server_add_parameters_service;
	}

	public String getGeo_server_add_parameters_version() {
		return geo_server_add_parameters_version;
	}

	public void setGeo_server_add_parameters_version(String geo_server_add_parameters_version) {
		this.geo_server_add_parameters_version = geo_server_add_parameters_version;
	}

	public String getGeo_server_add_parameters_request() {
		return geo_server_add_parameters_request;
	}

	public void setGeo_server_add_parameters_request(String geo_server_add_parameters_request) {
		this.geo_server_add_parameters_request = geo_server_add_parameters_request;
	}

	public String getGeo_server_add_parameters_transparent() {
		return geo_server_add_parameters_transparent;
	}

	public void setGeo_server_add_parameters_transparent(String geo_server_add_parameters_transparent) {
		this.geo_server_add_parameters_transparent = geo_server_add_parameters_transparent;
	}

	public String getGeo_server_add_parameters_format() {
		return geo_server_add_parameters_format;
	}

	public void setGeo_server_add_parameters_format(String geo_server_add_parameters_format) {
		this.geo_server_add_parameters_format = geo_server_add_parameters_format;
	}

	public String getGeo_callback_enable() {
		return geo_callback_enable;
	}

	public void setGeo_callback_enable(String geo_callback_enable) {
		this.geo_callback_enable = geo_callback_enable;
	}

	public String getGeo_callback_apiresult() {
		return geo_callback_apiresult;
	}

	public void setGeo_callback_apiresult(String geo_callback_apiresult) {
		this.geo_callback_apiresult = geo_callback_apiresult;
	}

	public String getGeo_callback_dataInfo() {
		return geo_callback_dataInfo;
	}

	public void setGeo_callback_dataInfo(String geo_callback_dataInfo) {
		this.geo_callback_dataInfo = geo_callback_dataInfo;
	}

	public String getGeo_callback_moveddata() {
		return geo_callback_moveddata;
	}

	public void setGeo_callback_moveddata(String geo_callback_moveddata) {
		this.geo_callback_moveddata = geo_callback_moveddata;
	}

	public String getGeo_callback_selectedobject() {
		return geo_callback_selectedobject;
	}

	public void setGeo_callback_selectedobject(String geo_callback_selectedobject) {
		this.geo_callback_selectedobject = geo_callback_selectedobject;
	}

	public String getGeo_callback_insertissue() {
		return geo_callback_insertissue;
	}

	public void setGeo_callback_insertissue(String geo_callback_insertissue) {
		this.geo_callback_insertissue = geo_callback_insertissue;
	}

	public String getGeo_callback_listissue() {
		return geo_callback_listissue;
	}

	public void setGeo_callback_listissue(String geo_callback_listissue) {
		this.geo_callback_listissue = geo_callback_listissue;
	}

	public String getGeo_callback_clickposition() {
		return geo_callback_clickposition;
	}

	public void setGeo_callback_clickposition(String geo_callback_clickposition) {
		this.geo_callback_clickposition = geo_callback_clickposition;
	}

	public String getNotice_service_yn() {
		return notice_service_yn;
	}

	public void setNotice_service_yn(String notice_service_yn) {
		this.notice_service_yn = notice_service_yn;
	}

	public String getNotice_service_send_type() {
		return notice_service_send_type;
	}

	public void setNotice_service_send_type(String notice_service_send_type) {
		this.notice_service_send_type = notice_service_send_type;
	}

	public String getNotice_approval_request_yn() {
		return notice_approval_request_yn;
	}

	public void setNotice_approval_request_yn(String notice_approval_request_yn) {
		this.notice_approval_request_yn = notice_approval_request_yn;
	}

	public String getNotice_approval_sign_yn() {
		return notice_approval_sign_yn;
	}

	public void setNotice_approval_sign_yn(String notice_approval_sign_yn) {
		this.notice_approval_sign_yn = notice_approval_sign_yn;
	}

	public String getNotice_password_update_yn() {
		return notice_password_update_yn;
	}

	public void setNotice_password_update_yn(String notice_password_update_yn) {
		this.notice_password_update_yn = notice_password_update_yn;
	}

	public String getNotice_approval_delay_yn() {
		return notice_approval_delay_yn;
	}

	public void setNotice_approval_delay_yn(String notice_approval_delay_yn) {
		this.notice_approval_delay_yn = notice_approval_delay_yn;
	}

	public String getNotice_risk_yn() {
		return notice_risk_yn;
	}

	public void setNotice_risk_yn(String notice_risk_yn) {
		this.notice_risk_yn = notice_risk_yn;
	}

	public String getNotice_risk_send_type() {
		return notice_risk_send_type;
	}

	public void setNotice_risk_send_type(String notice_risk_send_type) {
		this.notice_risk_send_type = notice_risk_send_type;
	}

	public String getNotice_risk_grade() {
		return notice_risk_grade;
	}

	public void setNotice_risk_grade(String notice_risk_grade) {
		this.notice_risk_grade = notice_risk_grade;
	}

	public String getSecurity_session_timeout_yn() {
		return security_session_timeout_yn;
	}

	public void setSecurity_session_timeout_yn(String security_session_timeout_yn) {
		this.security_session_timeout_yn = security_session_timeout_yn;
	}

	public String getSecurity_session_timeout() {
		return security_session_timeout;
	}

	public void setSecurity_session_timeout(String security_session_timeout) {
		this.security_session_timeout = security_session_timeout;
	}

	public String getSecurity_user_ip_check_yn() {
		return security_user_ip_check_yn;
	}

	public void setSecurity_user_ip_check_yn(String security_user_ip_check_yn) {
		this.security_user_ip_check_yn = security_user_ip_check_yn;
	}

	public String getSecurity_session_hijacking() {
		return security_session_hijacking;
	}

	public void setSecurity_session_hijacking(String security_session_hijacking) {
		this.security_session_hijacking = security_session_hijacking;
	}

	public String getSecurity_sso() {
		return security_sso;
	}

	public void setSecurity_sso(String security_sso) {
		this.security_sso = security_sso;
	}

	public Integer getSecurity_sso_token_verify_time() {
		return security_sso_token_verify_time;
	}

	public void setSecurity_sso_token_verify_time(Integer security_sso_token_verify_time) {
		this.security_sso_token_verify_time = security_sso_token_verify_time;
	}

	public String getSecurity_log_save_type() {
		return security_log_save_type;
	}

	public void setSecurity_log_save_type(String security_log_save_type) {
		this.security_log_save_type = security_log_save_type;
	}

	public String getSecurity_log_save_term() {
		return security_log_save_term;
	}

	public void setSecurity_log_save_term(String security_log_save_term) {
		this.security_log_save_term = security_log_save_term;
	}

	public String getSecurity_dynamic_block_yn() {
		return security_dynamic_block_yn;
	}

	public void setSecurity_dynamic_block_yn(String security_dynamic_block_yn) {
		this.security_dynamic_block_yn = security_dynamic_block_yn;
	}

	public String getSecurity_api_result_secure_yn() {
		return security_api_result_secure_yn;
	}

	public void setSecurity_api_result_secure_yn(String security_api_result_secure_yn) {
		this.security_api_result_secure_yn = security_api_result_secure_yn;
	}

	public String getSecurity_masking_yn() {
		return security_masking_yn;
	}

	public void setSecurity_masking_yn(String security_masking_yn) {
		this.security_masking_yn = security_masking_yn;
	}

	public Integer getContent_cache_version() {
		return content_cache_version;
	}

	public void setContent_cache_version(Integer content_cache_version) {
		this.content_cache_version = content_cache_version;
	}

	public Integer getContent_main_widget_count() {
		return content_main_widget_count;
	}

	public void setContent_main_widget_count(Integer content_main_widget_count) {
		this.content_main_widget_count = content_main_widget_count;
	}

	public Integer getContent_main_widget_interval() {
		return content_main_widget_interval;
	}

	public void setContent_main_widget_interval(Integer content_main_widget_interval) {
		this.content_main_widget_interval = content_main_widget_interval;
	}

	public Integer getContent_monitoring_interval() {
		return content_monitoring_interval;
	}

	public void setContent_monitoring_interval(Integer content_monitoring_interval) {
		this.content_monitoring_interval = content_monitoring_interval;
	}

	public String getContent_statistics_interval() {
		return content_statistics_interval;
	}

	public void setContent_statistics_interval(String content_statistics_interval) {
		this.content_statistics_interval = content_statistics_interval;
	}

	public Integer getContent_load_balancing_interval() {
		return content_load_balancing_interval;
	}

	public void setContent_load_balancing_interval(Integer content_load_balancing_interval) {
		this.content_load_balancing_interval = content_load_balancing_interval;
	}

	public String getContent_menu_group_root() {
		return content_menu_group_root;
	}

	public void setContent_menu_group_root(String content_menu_group_root) {
		this.content_menu_group_root = content_menu_group_root;
	}

	public String getContent_user_group_root() {
		return content_user_group_root;
	}

	public void setContent_user_group_root(String content_user_group_root) {
		this.content_user_group_root = content_user_group_root;
	}

	public String getContent_server_group_root() {
		return content_server_group_root;
	}

	public void setContent_server_group_root(String content_server_group_root) {
		this.content_server_group_root = content_server_group_root;
	}

	public String getContent_data_group_root() {
		return content_data_group_root;
	}

	public void setContent_data_group_root(String content_data_group_root) {
		this.content_data_group_root = content_data_group_root;
	}

	public String getOs_timezone() {
		return os_timezone;
	}

	public void setOs_timezone(String os_timezone) {
		this.os_timezone = os_timezone;
	}

	public String getOs_ntp() {
		return os_ntp;
	}

	public void setOs_ntp(String os_ntp) {
		this.os_ntp = os_ntp;
	}

	public String getOs_ntp_day() {
		return os_ntp_day;
	}

	public void setOs_ntp_day(String os_ntp_day) {
		this.os_ntp_day = os_ntp_day;
	}

	public String getOs_ntp_hour() {
		return os_ntp_hour;
	}

	public void setOs_ntp_hour(String os_ntp_hour) {
		this.os_ntp_hour = os_ntp_hour;
	}

	public String getOs_ntp_minute() {
		return os_ntp_minute;
	}

	public void setOs_ntp_minute(String os_ntp_minute) {
		this.os_ntp_minute = os_ntp_minute;
	}

	public String getOs_radius_secret() {
		return os_radius_secret;
	}

	public void setOs_radius_secret(String os_radius_secret) {
		this.os_radius_secret = os_radius_secret;
	}

	public String getSite_name() {
		return site_name;
	}

	public void setSite_name(String site_name) {
		this.site_name = site_name;
	}

	public String getSite_admin_name() {
		return site_admin_name;
	}

	public void setSite_admin_name(String site_admin_name) {
		this.site_admin_name = site_admin_name;
	}

	public String getSite_admin_mobile_phone() {
		return site_admin_mobile_phone;
	}

	public void setSite_admin_mobile_phone(String site_admin_mobile_phone) {
		this.site_admin_mobile_phone = site_admin_mobile_phone;
	}

	public String getSite_admin_email() {
		return site_admin_email;
	}

	public void setSite_admin_email(String site_admin_email) {
		this.site_admin_email = site_admin_email;
	}

	public String getUploadfile_top_value() {
		return uploadfile_top_value;
	}

	public void setUploadfile_top_value(String uploadfile_top_value) {
		this.uploadfile_top_value = uploadfile_top_value;
	}

	public String getUploadfile_bottom_value() {
		return uploadfile_bottom_value;
	}

	public void setUploadfile_bottom_value(String uploadfile_bottom_value) {
		this.uploadfile_bottom_value = uploadfile_bottom_value;
	}

	public String getSite_product_log() {
		return site_product_log;
	}

	public void setSite_product_log(String site_product_log) {
		this.site_product_log = site_product_log;
	}

	public String getSite_company_log() {
		return site_company_log;
	}

	public void setSite_company_log(String site_company_log) {
		this.site_company_log = site_company_log;
	}

	public String getBackoffice_email_host() {
		return backoffice_email_host;
	}

	public void setBackoffice_email_host(String backoffice_email_host) {
		this.backoffice_email_host = backoffice_email_host;
	}

	public Integer getBackoffice_email_port() {
		return backoffice_email_port;
	}

	public void setBackoffice_email_port(Integer backoffice_email_port) {
		this.backoffice_email_port = backoffice_email_port;
	}

	public String getBackoffice_email_user() {
		return backoffice_email_user;
	}

	public void setBackoffice_email_user(String backoffice_email_user) {
		this.backoffice_email_user = backoffice_email_user;
	}

	public String getBackoffice_email_password() {
		return backoffice_email_password;
	}

	public void setBackoffice_email_password(String backoffice_email_password) {
		this.backoffice_email_password = backoffice_email_password;
	}

	public String getBackoffice_user_db_driver() {
		return backoffice_user_db_driver;
	}

	public void setBackoffice_user_db_driver(String backoffice_user_db_driver) {
		this.backoffice_user_db_driver = backoffice_user_db_driver;
	}

	public String getBackoffice_user_db_url() {
		return backoffice_user_db_url;
	}

	public void setBackoffice_user_db_url(String backoffice_user_db_url) {
		this.backoffice_user_db_url = backoffice_user_db_url;
	}

	public String getBackoffice_user_db_user() {
		return backoffice_user_db_user;
	}

	public void setBackoffice_user_db_user(String backoffice_user_db_user) {
		this.backoffice_user_db_user = backoffice_user_db_user;
	}

	public String getBackoffice_user_db_password() {
		return backoffice_user_db_password;
	}

	public void setBackoffice_user_db_password(String backoffice_user_db_password) {
		this.backoffice_user_db_password = backoffice_user_db_password;
	}

	public String getSolution_name() {
		return solution_name;
	}

	public void setSolution_name(String solution_name) {
		this.solution_name = solution_name;
	}

	public String getSolution_version() {
		return solution_version;
	}

	public void setSolution_version(String solution_version) {
		this.solution_version = solution_version;
	}

	public String getSolution_company() {
		return solution_company;
	}

	public void setSolution_company(String solution_company) {
		this.solution_company = solution_company;
	}

	public String getSolution_company_phone() {
		return solution_company_phone;
	}

	public void setSolution_company_phone(String solution_company_phone) {
		this.solution_company_phone = solution_company_phone;
	}

	public String getSolution_manager() {
		return solution_manager;
	}

	public void setSolution_manager(String solution_manager) {
		this.solution_manager = solution_manager;
	}

	public String getSolution_manager_phone() {
		return solution_manager_phone;
	}

	public void setSolution_manager_phone(String solution_manager_phone) {
		this.solution_manager_phone = solution_manager_phone;
	}

	public String getSolution_manager_email() {
		return solution_manager_email;
	}

	public void setSolution_manager_email(String solution_manager_email) {
		this.solution_manager_email = solution_manager_email;
	}

	public String getInsert_date() {
		return insert_date;
	}

	public void setInsert_date(String insert_date) {
		this.insert_date = insert_date;
	}

	public static String getY() {
		return Y;
	}

	public static String getServerDateShell() {
		return SERVER_DATE_SHELL;
	}

	public static String getServerDateHwclockShell() {
		return SERVER_DATE_HWCLOCK_SHELL;
	}

	public static String getLogicalDeleteUser() {
		return LOGICAL_DELETE_USER;
	}

	public static String getPhysicalDeleteUser() {
		return PHYSICAL_DELETE_USER;
	}

	public static String getSecuritySessionHijackingNotUse() {
		return SECURITY_SESSION_HIJACKING_NOT_USE;
	}

	public static String getSecuritySessionHijackingUse() {
		return SECURITY_SESSION_HIJACKING_USE;
	}

	public static String getSecuritySessionHijackingOtp() {
		return SECURITY_SESSION_HIJACKING_OTP;
	}

	public static String getDataChangeRequestDecisionAuto() {
		return DATA_CHANGE_REQUEST_DECISION_AUTO;
	}

	public static String getDataChangeRequestDecisionConfirm() {
		return DATA_CHANGE_REQUEST_DECISION_CONFIRM;
	}

	public static String getSecuritySsoUseN() {
		return SECURITY_SSO_USE_N;
	}

	public static String getSecuritySsoToken() {
		return SECURITY_SSO_TOKEN;
	}

	public static String getStatisticsYear() {
		return STATISTICS_YEAR;
	}

	public static String getStatisticsYearHalf() {
		return STATISTICS_YEAR_HALF;
	}

	public static String getStatisticsQuarter() {
		return STATISTICS_QUARTER;
	}

	public static String getStatisticsMonth() {
		return STATISTICS_MONTH;
	}

	public static String getPasswordCreateWithUserId() {
		return PASSWORD_CREATE_WITH_USER_ID;
	}

	public static String getPasswordCreateCreateChar() {
		return PASSWORD_CREATE_CREATE_CHAR;
	}

	@Override
	public String toString() {
		return "PolicyVO [server_ip=" + server_ip + ", policy_id=" + policy_id + ", user_id_min_length="
				+ user_id_min_length + ", user_fail_login_count=" + user_fail_login_count + ", user_fail_lock_release="
				+ user_fail_lock_release + ", user_last_login_lock=" + user_last_login_lock
				+ ", user_duplication_login_yn=" + user_duplication_login_yn + ", user_login_type=" + user_login_type
				+ ", user_update_check=" + user_update_check + ", user_delete_check=" + user_delete_check
				+ ", user_delete_type=" + user_delete_type + ", password_change_term=" + password_change_term
				+ ", password_min_length=" + password_min_length + ", password_max_length=" + password_max_length
				+ ", password_eng_upper_count=" + password_eng_upper_count + ", password_eng_lower_count="
				+ password_eng_lower_count + ", password_number_count=" + password_number_count
				+ ", password_special_char_count=" + password_special_char_count + ", password_continuous_char_count="
				+ password_continuous_char_count + ", password_create_type=" + password_create_type
				+ ", password_create_char=" + password_create_char + ", password_exception_char="
				+ password_exception_char + ", geo_view_library=" + geo_view_library + ", geo_data_path="
				+ geo_data_path + ", geo_data_default_projects=" + geo_data_default_projects
				+ ", geo_data_default_projects_view=" + geo_data_default_projects_view
				+ ", geo_data_change_request_decision=" + geo_data_change_request_decision + ", geo_cull_face_enable="
				+ geo_cull_face_enable + ", geo_time_line_enable=" + geo_time_line_enable + ", geo_init_camera_enable="
				+ geo_init_camera_enable + ", geo_init_latitude=" + geo_init_latitude + ", geo_init_longitude="
				+ geo_init_longitude + ", geo_init_height=" + geo_init_height + ", geo_init_duration="
				+ geo_init_duration + ", geo_init_default_terrain=" + geo_init_default_terrain
				+ ", geo_init_default_fov=" + geo_init_default_fov + ", geo_lod0=" + geo_lod0 + ", geo_lod1=" + geo_lod1
				+ ", geo_lod2=" + geo_lod2 + ", geo_lod3=" + geo_lod3 + ", geo_lod4=" + geo_lod4 + ", geo_lod5="
				+ geo_lod5 + ", geo_ambient_reflection_coef=" + geo_ambient_reflection_coef
				+ ", geo_diffuse_reflection_coef=" + geo_diffuse_reflection_coef + ", geo_specular_reflection_coef="
				+ geo_specular_reflection_coef + ", geo_ambient_color=" + geo_ambient_color + ", geo_ambient_colorR="
				+ geo_ambient_colorR + ", geo_ambient_colorG=" + geo_ambient_colorG + ", geo_ambient_colorB="
				+ geo_ambient_colorB + ", geo_specular_color=" + geo_specular_color + ", geo_specular_colorR="
				+ geo_specular_colorR + ", geo_specular_colorG=" + geo_specular_colorG + ", geo_specular_colorB="
				+ geo_specular_colorB + ", geo_ssao_radius=" + geo_ssao_radius + ", geo_server_enable="
				+ geo_server_enable + ", geo_server_url=" + geo_server_url + ", geo_server_layers=" + geo_server_layers
				+ ", geo_server_parameters_service=" + geo_server_parameters_service
				+ ", geo_server_parameters_version=" + geo_server_parameters_version
				+ ", geo_server_parameters_request=" + geo_server_parameters_request
				+ ", geo_server_parameters_transparent=" + geo_server_parameters_transparent
				+ ", geo_server_parameters_format=" + geo_server_parameters_format + ", geo_server_add_url="
				+ geo_server_add_url + ", geo_server_add_layers=" + geo_server_add_layers
				+ ", geo_server_add_parameters_service=" + geo_server_add_parameters_service
				+ ", geo_server_add_parameters_version=" + geo_server_add_parameters_version
				+ ", geo_server_add_parameters_request=" + geo_server_add_parameters_request
				+ ", geo_server_add_parameters_transparent=" + geo_server_add_parameters_transparent
				+ ", geo_server_add_parameters_format=" + geo_server_add_parameters_format + ", geo_callback_enable="
				+ geo_callback_enable + ", geo_callback_apiresult=" + geo_callback_apiresult
				+ ", geo_callback_dataInfo=" + geo_callback_dataInfo + ", geo_callback_moveddata="
				+ geo_callback_moveddata + ", geo_callback_selectedobject=" + geo_callback_selectedobject
				+ ", geo_callback_insertissue=" + geo_callback_insertissue + ", geo_callback_listissue="
				+ geo_callback_listissue + ", geo_callback_clickposition=" + geo_callback_clickposition
				+ ", notice_service_yn=" + notice_service_yn + ", notice_service_send_type=" + notice_service_send_type
				+ ", notice_approval_request_yn=" + notice_approval_request_yn + ", notice_approval_sign_yn="
				+ notice_approval_sign_yn + ", notice_password_update_yn=" + notice_password_update_yn
				+ ", notice_approval_delay_yn=" + notice_approval_delay_yn + ", notice_risk_yn=" + notice_risk_yn
				+ ", notice_risk_send_type=" + notice_risk_send_type + ", notice_risk_grade=" + notice_risk_grade
				+ ", security_session_timeout_yn=" + security_session_timeout_yn + ", security_session_timeout="
				+ security_session_timeout + ", security_user_ip_check_yn=" + security_user_ip_check_yn
				+ ", security_session_hijacking=" + security_session_hijacking + ", security_sso=" + security_sso
				+ ", security_sso_token_verify_time=" + security_sso_token_verify_time + ", security_log_save_type="
				+ security_log_save_type + ", security_log_save_term=" + security_log_save_term
				+ ", security_dynamic_block_yn=" + security_dynamic_block_yn + ", security_api_result_secure_yn="
				+ security_api_result_secure_yn + ", security_masking_yn=" + security_masking_yn
				+ ", content_cache_version=" + content_cache_version + ", content_main_widget_count="
				+ content_main_widget_count + ", content_main_widget_interval=" + content_main_widget_interval
				+ ", content_monitoring_interval=" + content_monitoring_interval + ", content_statistics_interval="
				+ content_statistics_interval + ", content_load_balancing_interval=" + content_load_balancing_interval
				+ ", content_menu_group_root=" + content_menu_group_root + ", content_user_group_root="
				+ content_user_group_root + ", content_server_group_root=" + content_server_group_root
				+ ", content_data_group_root=" + content_data_group_root + ", os_timezone=" + os_timezone + ", os_ntp="
				+ os_ntp + ", os_ntp_day=" + os_ntp_day + ", os_ntp_hour=" + os_ntp_hour + ", os_ntp_minute="
				+ os_ntp_minute + ", os_radius_secret=" + os_radius_secret + ", site_name=" + site_name
				+ ", site_admin_name=" + site_admin_name + ", site_admin_mobile_phone=" + site_admin_mobile_phone
				+ ", site_admin_email=" + site_admin_email + ", uploadfile_top_value=" + uploadfile_top_value
				+ ", uploadfile_bottom_value=" + uploadfile_bottom_value + ", site_product_log=" + site_product_log
				+ ", site_company_log=" + site_company_log + ", backoffice_email_host=" + backoffice_email_host
				+ ", backoffice_email_port=" + backoffice_email_port + ", backoffice_email_user="
				+ backoffice_email_user + ", backoffice_email_password=" + backoffice_email_password
				+ ", backoffice_user_db_driver=" + backoffice_user_db_driver + ", backoffice_user_db_url="
				+ backoffice_user_db_url + ", backoffice_user_db_user=" + backoffice_user_db_user
				+ ", backoffice_user_db_password=" + backoffice_user_db_password + ", solution_name=" + solution_name
				+ ", solution_version=" + solution_version + ", solution_company=" + solution_company
				+ ", solution_company_phone=" + solution_company_phone + ", solution_manager=" + solution_manager
				+ ", solution_manager_phone=" + solution_manager_phone + ", solution_manager_email="
				+ solution_manager_email + ", insert_date=" + insert_date + "]";
	}
	
	
	
	
}
