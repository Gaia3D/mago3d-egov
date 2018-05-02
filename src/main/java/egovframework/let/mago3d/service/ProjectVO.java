package egovframework.let.mago3d.service;

import java.math.BigDecimal;

/**
 * 프로젝트 VO 클래스
 * 
 * @author HJCHOI
 * @since 2018.05.02
 * @version 1.0
 * @see
 */
public class ProjectVO {

	// 임시 그룹
	public static final Long TEMP_GROUP = 2l;

	// 상태 : 사용중
	public static final String IN_USE = "Y";

	/****** 화면 표시용 *******/
	// 그룹에 등록된 사용자 수
	private String open = "open";
	private String node_type = "folder";
	private String parent_name;
	private Integer data_count;
	// up : 위로, down : 아래로
	private String update_type;

	/****** validator ********/
	private String method_mode;

	// 아이디 중복 확인 hidden 값
	private String duplication_value;

	// 고유번호
	private Long project_id;
	// 링크 활용 등을 위한 확장 컬럼
	private String project_key;
	// old 고유 식별번호
	private String old_project_key;
	// 그룹명
	private String project_name;
	// 나열 순서
	private Integer view_order;
	// 기본 사용 삭제불가, Y : 기본, N : 선택
	private String default_yn;
	// 사용유무, Y : 사용, N : 사용안함
	private String use_yn;
	// 위도, 경도 정보 geometry 타입
	private String location;
	// 위도
	private BigDecimal latitude;
	// 경도
	private BigDecimal longitude;
	// 높이
	private BigDecimal height;
	// flyTo 이동시간
	private Integer duration;
	// 설명
	private String description;
	// 등록일
	private String insert_date;

	public String getViewUseYn() {
		if ("Y".equals(this.use_yn)) {
			return "사용";
		} else if ("N".equals(this.use_yn)) {
			return "미사용";
		} else {
			return "";
		}
	}

	public String getViewInsertDate() {
		if (this.insert_date == null || "".equals(insert_date)) {
			return "";
		}
		return insert_date.substring(0, 19);
	}

	public String getOpen() {
		return open;
	}

	public void setOpen(String open) {
		this.open = open;
	}

	public String getNode_type() {
		return node_type;
	}

	public void setNode_type(String node_type) {
		this.node_type = node_type;
	}

	public String getParent_name() {
		return parent_name;
	}

	public void setParent_name(String parent_name) {
		this.parent_name = parent_name;
	}

	public Integer getData_count() {
		return data_count;
	}

	public void setData_count(Integer data_count) {
		this.data_count = data_count;
	}

	public String getUpdate_type() {
		return update_type;
	}

	public void setUpdate_type(String update_type) {
		this.update_type = update_type;
	}

	public String getMethod_mode() {
		return method_mode;
	}

	public void setMethod_mode(String method_mode) {
		this.method_mode = method_mode;
	}

	public String getDuplication_value() {
		return duplication_value;
	}

	public void setDuplication_value(String duplication_value) {
		this.duplication_value = duplication_value;
	}

	public Long getProject_id() {
		return project_id;
	}

	public void setProject_id(Long project_id) {
		this.project_id = project_id;
	}

	public String getProject_key() {
		return project_key;
	}

	public void setProject_key(String project_key) {
		this.project_key = project_key;
	}

	public String getOld_project_key() {
		return old_project_key;
	}

	public void setOld_project_key(String old_project_key) {
		this.old_project_key = old_project_key;
	}

	public String getProject_name() {
		return project_name;
	}

	public void setProject_name(String project_name) {
		this.project_name = project_name;
	}

	public Integer getView_order() {
		return view_order;
	}

	public void setView_order(Integer view_order) {
		this.view_order = view_order;
	}

	public String getDefault_yn() {
		return default_yn;
	}

	public void setDefault_yn(String default_yn) {
		this.default_yn = default_yn;
	}

	public String getUse_yn() {
		return use_yn;
	}

	public void setUse_yn(String use_yn) {
		this.use_yn = use_yn;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public BigDecimal getLatitude() {
		return latitude;
	}

	public void setLatitude(BigDecimal latitude) {
		this.latitude = latitude;
	}

	public BigDecimal getLongitude() {
		return longitude;
	}

	public void setLongitude(BigDecimal longitude) {
		this.longitude = longitude;
	}

	public BigDecimal getHeight() {
		return height;
	}

	public void setHeight(BigDecimal height) {
		this.height = height;
	}

	public Integer getDuration() {
		return duration;
	}

	public void setDuration(Integer duration) {
		this.duration = duration;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getInsert_date() {
		return insert_date;
	}

	public void setInsert_date(String insert_date) {
		this.insert_date = insert_date;
	}

	@Override
	public String toString() {
		return "Project [open=" + open + ", node_type=" + node_type + ", parent_name=" + parent_name + ", data_count="
				+ data_count + ", update_type=" + update_type + ", method_mode=" + method_mode + ", duplication_value="
				+ duplication_value + ", project_id=" + project_id + ", project_key=" + project_key
				+ ", old_project_key=" + old_project_key + ", project_name=" + project_name + ", view_order="
				+ view_order + ", default_yn=" + default_yn + ", use_yn=" + use_yn + ", location=" + location
				+ ", latitude=" + latitude + ", longitude=" + longitude + ", height=" + height + ", duration="
				+ duration + ", description=" + description + ", insert_date=" + insert_date + "]";
	}

}
