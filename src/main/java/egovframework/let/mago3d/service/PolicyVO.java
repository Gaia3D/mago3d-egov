package egovframework.let.mago3d.service;

public class PolicyVO {
	private String geo_data_default_projects;
	
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
	
}
