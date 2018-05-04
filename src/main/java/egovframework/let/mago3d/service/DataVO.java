package egovframework.let.mago3d.service;

import java.util.Arrays;

public class DataVO {

	// data_group 에 등록되지 않은 Data
	private String[] data_all_id;
	// data_group 에 등록된 Data
	private String[] data_select_id;

	/******** 화면 오류 표시용 ********/
	private String message_code;
	private String error_code;
	// 아이디 중복 확인 hidden 값
	private String duplication_value;
	// 논리 삭제
	private String delete_flag;

	// 페이지 처리를 위한 시작
	private Long offset;
	// 페이지별 표시할 건수
	private Long limit;

	/********** 검색 조건 ************/
	private String search_word;
	// 검색 옵션. 0 : 일치, 1 : 포함
	private String search_option;
	private String search_value;
	private String start_date;
	private String end_date;
	private String order_word;
	private String order_value;
	private Long list_counter = 10l;

	// 사용자명
	private String user_id;
	private String user_name;

	/****** validator ********/
	private String method_mode;

	// 고유번호
	private Long data_id;
	// Data project 고유번호
	private Long project_id;
	// Data project 이름
	private String project_name;
	// data 고유 식별번호
	private String data_key;
	// data 고유 식별번호
	private String old_data_key;
	// 부모 data 고유 식별번호
	private String parent_data_key;
	// data 이름
	private String data_name;
	// 부모 고유번호
	private Long parent;
	// 부모 이름(화면 표시용)
	private String parent_name;
	// 부모 깊이
	private Integer parent_depth;
	// 깊이
	private Integer depth;
	// 나열 순서
	private Integer view_order;
	// 자식 존재 유무, Y : 존재, N : 존재안함(기본)
	private String child_yn;
	// origin : latitude, longitude, height 를 origin에 맟춤. boundingboxcenter :
	// latitude, longitude, height 를 boundingboxcenter에 맟춤.
	private String mapping_type;
	// 위도, 경도 정보 geometry 타입
	private String location;
	// 위도
	private double latitude;
	// 경도
	private double longitude;
	// 높이
	private double height;
	// heading
	private double heading;
	// pitch
	private double pitch;
	// roll
	private double roll;
	// Data Control 속성
	private String attributes;
	// data 상태. 0:사용중, 1:사용중지(관리자), 2:기타
	private String status;
	// 사용유무, Y : 사용, N : 사용안함
	private String use_yn;
	// 공개 유무. 기본값 비공개 N
	private String public_yn;
	// data 등록 방법. 기본 : SELF
	private String data_insert_type;
	// 설명
	private String description;
	// 수정일
	private String update_date;
	// 등록일
	private String insert_date;

	private String search_data_name;
	private String search_except_data_name;

	public String getViewInsertDate() {
		if (this.insert_date == null || "".equals(insert_date)) {
			return "";
		}
		return insert_date.substring(0, 19);
	}

	public String[] getData_all_id() {
		return data_all_id;
	}

	public void setData_all_id(String[] data_all_id) {
		this.data_all_id = data_all_id;
	}

	public String[] getData_select_id() {
		return data_select_id;
	}

	public void setData_select_id(String[] data_select_id) {
		this.data_select_id = data_select_id;
	}

	public String getMessage_code() {
		return message_code;
	}

	public void setMessage_code(String message_code) {
		this.message_code = message_code;
	}

	public String getError_code() {
		return error_code;
	}

	public void setError_code(String error_code) {
		this.error_code = error_code;
	}

	public String getDuplication_value() {
		return duplication_value;
	}

	public void setDuplication_value(String duplication_value) {
		this.duplication_value = duplication_value;
	}

	public String getDelete_flag() {
		return delete_flag;
	}

	public void setDelete_flag(String delete_flag) {
		this.delete_flag = delete_flag;
	}

	public Long getOffset() {
		return offset;
	}

	public void setOffset(Long offset) {
		this.offset = offset;
	}

	public Long getLimit() {
		return limit;
	}

	public void setLimit(Long limit) {
		this.limit = limit;
	}

	public String getSearch_word() {
		return search_word;
	}

	public void setSearch_word(String search_word) {
		this.search_word = search_word;
	}

	public String getSearch_option() {
		return search_option;
	}

	public void setSearch_option(String search_option) {
		this.search_option = search_option;
	}

	public String getSearch_value() {
		return search_value;
	}

	public void setSearch_value(String search_value) {
		this.search_value = search_value;
	}

	public String getStart_date() {
		return start_date;
	}

	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}

	public String getEnd_date() {
		return end_date;
	}

	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}

	public String getOrder_word() {
		return order_word;
	}

	public void setOrder_word(String order_word) {
		this.order_word = order_word;
	}

	public String getOrder_value() {
		return order_value;
	}

	public void setOrder_value(String order_value) {
		this.order_value = order_value;
	}

	public Long getList_counter() {
		return list_counter;
	}

	public void setList_counter(Long list_counter) {
		this.list_counter = list_counter;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getMethod_mode() {
		return method_mode;
	}

	public void setMethod_mode(String method_mode) {
		this.method_mode = method_mode;
	}

	public Long getData_id() {
		return data_id;
	}

	public void setData_id(Long data_id) {
		this.data_id = data_id;
	}

	public Long getProject_id() {
		return project_id;
	}

	public void setProject_id(Long project_id) {
		this.project_id = project_id;
	}

	public String getProject_name() {
		return project_name;
	}

	public void setProject_name(String project_name) {
		this.project_name = project_name;
	}

	public String getData_key() {
		return data_key;
	}

	public void setData_key(String data_key) {
		this.data_key = data_key;
	}

	public String getOld_data_key() {
		return old_data_key;
	}

	public void setOld_data_key(String old_data_key) {
		this.old_data_key = old_data_key;
	}

	public String getParent_data_key() {
		return parent_data_key;
	}

	public void setParent_data_key(String parent_data_key) {
		this.parent_data_key = parent_data_key;
	}

	public String getData_name() {
		return data_name;
	}

	public void setData_name(String data_name) {
		this.data_name = data_name;
	}

	public Long getParent() {
		return parent;
	}

	public void setParent(Long parent) {
		this.parent = parent;
	}

	public String getParent_name() {
		return parent_name;
	}

	public void setParent_name(String parent_name) {
		this.parent_name = parent_name;
	}

	public Integer getParent_depth() {
		return parent_depth;
	}

	public void setParent_depth(Integer parent_depth) {
		this.parent_depth = parent_depth;
	}

	public Integer getDepth() {
		return depth;
	}

	public void setDepth(Integer depth) {
		this.depth = depth;
	}

	public Integer getView_order() {
		return view_order;
	}

	public void setView_order(Integer view_order) {
		this.view_order = view_order;
	}

	public String getChild_yn() {
		return child_yn;
	}

	public void setChild_yn(String child_yn) {
		this.child_yn = child_yn;
	}

	public String getMapping_type() {
		return mapping_type;
	}

	public void setMapping_type(String mapping_type) {
		this.mapping_type = mapping_type;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public double getLatitude() {
		return latitude;
	}

	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}

	public double getLongitude() {
		return longitude;
	}

	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}

	public double getHeight() {
		return height;
	}

	public void setHeight(double height) {
		this.height = height;
	}

	public double getHeading() {
		return heading;
	}

	public void setHeading(double heading) {
		this.heading = heading;
	}

	public double getPitch() {
		return pitch;
	}

	public void setPitch(double pitch) {
		this.pitch = pitch;
	}

	public double getRoll() {
		return roll;
	}

	public void setRoll(double roll) {
		this.roll = roll;
	}

	public String getAttributes() {
		return attributes;
	}

	public void setAttributes(String attributes) {
		this.attributes = attributes;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getUse_yn() {
		return use_yn;
	}

	public void setUse_yn(String use_yn) {
		this.use_yn = use_yn;
	}

	public String getPublic_yn() {
		return public_yn;
	}

	public void setPublic_yn(String public_yn) {
		this.public_yn = public_yn;
	}

	public String getData_insert_type() {
		return data_insert_type;
	}

	public void setData_insert_type(String data_insert_type) {
		this.data_insert_type = data_insert_type;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getUpdate_date() {
		return update_date;
	}

	public void setUpdate_date(String update_date) {
		this.update_date = update_date;
	}

	public String getInsert_date() {
		return insert_date;
	}

	public void setInsert_date(String insert_date) {
		this.insert_date = insert_date;
	}

	public String getSearch_data_name() {
		return search_data_name;
	}

	public void setSearch_data_name(String search_data_name) {
		this.search_data_name = search_data_name;
	}

	public String getSearch_except_data_name() {
		return search_except_data_name;
	}

	public void setSearch_except_data_name(String search_except_data_name) {
		this.search_except_data_name = search_except_data_name;
	}

	@Override
	public String toString() {
		return "DataVO [data_all_id=" + Arrays.toString(data_all_id) + ", data_select_id="
				+ Arrays.toString(data_select_id) + ", message_code=" + message_code + ", error_code=" + error_code
				+ ", duplication_value=" + duplication_value + ", delete_flag=" + delete_flag + ", offset=" + offset
				+ ", limit=" + limit + ", search_word=" + search_word + ", search_option=" + search_option
				+ ", search_value=" + search_value + ", start_date=" + start_date + ", end_date=" + end_date
				+ ", order_word=" + order_word + ", order_value=" + order_value + ", list_counter=" + list_counter
				+ ", user_id=" + user_id + ", user_name=" + user_name + ", method_mode=" + method_mode + ", data_id="
				+ data_id + ", project_id=" + project_id + ", project_name=" + project_name + ", data_key=" + data_key
				+ ", old_data_key=" + old_data_key + ", parent_data_key=" + parent_data_key + ", data_name=" + data_name
				+ ", parent=" + parent + ", parent_name=" + parent_name + ", parent_depth=" + parent_depth + ", depth="
				+ depth + ", view_order=" + view_order + ", child_yn=" + child_yn + ", mapping_type=" + mapping_type
				+ ", location=" + location + ", latitude=" + latitude + ", longitude=" + longitude + ", height="
				+ height + ", heading=" + heading + ", pitch=" + pitch + ", roll=" + roll + ", attributes=" + attributes
				+ ", status=" + status + ", use_yn=" + use_yn + ", public_yn=" + public_yn + ", data_insert_type="
				+ data_insert_type + ", description=" + description + ", update_date=" + update_date + ", insert_date="
				+ insert_date + ", search_data_name=" + search_data_name + ", search_except_data_name="
				+ search_except_data_name + "]";
	}

}