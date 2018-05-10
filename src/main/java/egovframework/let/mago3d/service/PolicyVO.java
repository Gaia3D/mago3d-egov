package egovframework.let.mago3d.service;

public class PolicyVO {
	private String geo_data_default_projects;
	
	// 초기 카메라 이동 위도
	private String geo_init_latitude;
	// 초기 카메라 이동 경도
	private String geo_init_longitude;
	// 초기 카메라 이동 높이
	private String geo_init_height;
	// 초기 카메라 이동 시간. 초 단위
	
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
	
}
