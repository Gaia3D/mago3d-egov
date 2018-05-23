package egovframework.let.mago3d.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;

import egovframework.let.mago3d.service.CacheManager;
import egovframework.let.mago3d.service.CacheParams;
import egovframework.let.mago3d.service.DataVO;
import egovframework.let.mago3d.service.EgovDataService;
import egovframework.let.mago3d.service.EgovPolicyService;
import egovframework.let.mago3d.service.EgovProjectService;
import egovframework.let.mago3d.service.PolicyVO;
import egovframework.let.mago3d.service.ProjectVO;

@Controller
@RequestMapping("/mago3d/")
public class EgovDemoController {
	private static final Logger logger = LoggerFactory.getLogger(EgovDataController.class);
	
	@Resource(name="EgovProjectService")
	private EgovProjectService projectService;	
	
	@Resource(name="EgovDataService")
	private EgovDataService dataService;	

	@Resource(name="EgovPolicyService")
	private EgovPolicyService policyService;	

	/**
	 * 데모
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "demo.do")
	public String demo(HttpServletRequest request, HttpServletResponse response, @RequestParam(defaultValue="cesium") String viewLibrary, String device, Model model) throws Exception {
		
		logger.info("@@ viewLibrary = {}", viewLibrary);
		String viewName = "demo";
		
		PolicyVO policy = CacheManager.getPolicy();
		if(policy == null) {
			policy = policyService.selectPolicy();
			CacheManager.setPolicy(policy);
		}
		
		// project Cache
		List<ProjectVO> projectList = CacheManager.getProjectList();
		Map<Long, ProjectVO> projectMap = null;
		if(projectList == null) {
			projectList = projectService.selectListProject(new ProjectVO());
			for(ProjectVO project : projectList) {
				projectMap = new HashMap<>();
				projectMap.put(project.getProject_id(), project);
			}
			CacheManager.setProjectList(projectList);
			CacheManager.setProjectMap(projectMap);
		}
		// data Cache
		Map<Long, List<DataVO>> projectDataMap = CacheManager.getProjectDataMap();
		Map<Long, String> projectDataJsonMap = null;
		if(projectDataMap == null) {
			projectDataMap = new HashMap<>();
			projectDataJsonMap = new HashMap<>();
			
			for(ProjectVO project : projectList) {
				DataVO dataInfo = new DataVO();
				dataInfo.setProject_id(project.getProject_id());
				List<DataVO> dataInfoList = dataService.selectListDataByProjectId(dataInfo);
				
				projectDataMap.put(project.getProject_id(), dataInfoList);
				projectDataJsonMap.put(project.getProject_id(), getProjectDataJson(project, dataInfoList));
			}
			CacheManager.setProjectDataMap(projectDataMap);
			CacheManager.setProjectDataJsonMap(projectDataJsonMap);
		}
		
		
		Map<String, String> initProjectJsonMap = new HashMap<>();
		int initProjectsLength = 0;
		String defaultProjects = policy.getGeo_data_default_projects();
		String[] initProjects = null;
		if(defaultProjects != null && !"".equals(defaultProjects)) {
			initProjects = defaultProjects.split(",");
			for(String projectId : initProjects) {
				initProjectJsonMap.put(projectId, CacheManager.getProjectDataJson(Long.valueOf(projectId)));
			}
			initProjectsLength = initProjects.length;
		}
		
		ObjectMapper mapper = new ObjectMapper();
		
		model.addAttribute("policy", policy);
		model.addAttribute("projectList", projectList);
		model.addAttribute("projectDataMap", projectDataMap);
		model.addAttribute("geoViewLibrary", policy.getGeo_view_library());
		model.addAttribute("now_latitude", policy.getGeo_init_latitude());
		model.addAttribute("now_longitude", policy.getGeo_init_longitude());
		model.addAttribute("initProjectsLength", initProjectsLength);
		model.addAttribute("initProjectJsonMap", mapper.writeValueAsString(initProjectJsonMap));
//		model.addAttribute("cache_version", policyVO.getContent_cache_version());
		model.addAttribute("policyJson", mapper.writeValueAsString(policy));

		
		logger.info("@@@@@@ viewName = {}", viewName);
		logger.info("@@@@@@ policy = {}", policy);
		logger.info("@@@@@@ defaultProjects = {}", defaultProjects);
		logger.info("@@@@@@ projectList = {}", projectList);
		logger.info("@@@@@@ projectDataMap = {}", projectDataMap);
		logger.info("@@@@@@ projectDataJsonMap = {}", projectDataJsonMap);
		logger.info("@@@@@@ initProjectJsonMap = {}", initProjectJsonMap);
		
		return "mago3d/demo";
	}
	
	/**
	 * 프로젝트에 등록된 Data 목록
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "ajax-project-data-by-project-id.do")
	@ResponseBody
	public Map<String, Object> ajaxProjectDataByProjectId(HttpServletRequest request, @RequestParam("project_id") Long project_id) {
		Map<String, Object> map = new HashMap<>();
		String result = "success";
		try {		
			String projectDataJson =  CacheManager.getProjectDataJson(project_id);
			map.put("projectDataJson", projectDataJson);
		} catch(Exception e) {
			e.printStackTrace();
			result = "db.exception";
		}
		
		map.put("result", result);
		return map;
	}
	
private String getProjectDataJson(ProjectVO project, List<DataVO> dataInfoList) {
		
		if(dataInfoList == null || dataInfoList.isEmpty()) return null;
		
		StringBuilder builder = new StringBuilder(256);
		
		int dataInfoCount = dataInfoList.size();
		int preDepth = 0;
		int brackets = 0;
		for(int i = 0; i < dataInfoCount; i++) {
			DataVO dataInfo = dataInfoList.get(i);
			
			// 자식들 정보
			if(preDepth < dataInfo.getDepth()) {
				// 시작
				builder.append("{");
				// location 정보 및 attributes
				builder = getLocationAndAttributes(builder, dataInfo);
				// 자식 노드
				builder.append("\"children\"").append(":").append("[");
				brackets++;
			} else if(preDepth == dataInfo.getDepth()) {
				// 형제 노드, 닫는 처리
				builder.append("]");
				builder.append("}");
				
				builder.append(",");
				builder.append("{");
				// location 정보 및 attributes
				builder = getLocationAndAttributes(builder, dataInfo);
				// 자식 노드
				builder.append("\"children\"").append(":").append("[");
			} else {
				// 종료, 닫는처리
				int closeCount = preDepth - dataInfo.getDepth();
				for(int j=0; j<=closeCount; j++) {
					builder.append("]");
					builder.append("}");
					brackets--;
				}
				
				builder.append(",");
				builder.append("{");
				// location 정보 및 attributes
				builder = getLocationAndAttributes(builder, dataInfo);
				// 자식 노드
				builder.append("\"children\"").append(":").append("[");
			}
				
			if(dataInfoCount == (i+1)) {
				// 맨 마지막의 경우 괄호를 닫음
				for(int k=0; k<brackets; k++) {
					builder.append("]");
					builder.append("}");
				}
			}
			
			preDepth = dataInfo.getDepth();
		}
		
		logger.info(" ************** {} json file **********", project.getProject_name());
		logger.info(" ========= {} ", builder.toString());
		return builder.toString();
	}

	private StringBuilder getLocationAndAttributes(StringBuilder builder, DataVO dataInfo) {
		builder.append("\"data_id\"").append(":").append("\"").append(dataInfo.getData_id()).append("\"").append(",");
		builder.append("\"data_key\"").append(":").append("\"").append(dataInfo.getData_key()).append("\"").append(",");
		builder.append("\"data_name\"").append(":").append("\"").append(dataInfo.getData_name()).append("\"").append(",");
		builder.append("\"parent\"").append(":").append(dataInfo.getParent()).append(",");
		builder.append("\"depth\"").append(":").append(dataInfo.getDepth()).append(",");
		builder.append("\"view_order\"").append(":").append(dataInfo.getView_order()).append(",");
		if(dataInfo.getMapping_type() != null) builder.append("\"mapping_type\"").append(":").append("\"").append(dataInfo.getMapping_type()).append("\"").append(",");
		if(dataInfo.getLatitude() != null) builder.append("\"latitude\"").append(":").append(dataInfo.getLatitude()).append(",");
		if(dataInfo.getLongitude() != null) builder.append("\"longitude\"").append(":").append(dataInfo.getLongitude()).append(",");
		if(dataInfo.getHeight() != null) builder.append("\"height\"").append(":").append(dataInfo.getHeight()).append(",");
		if(dataInfo.getHeading() != null) builder.append("\"heading\"").append(":").append(dataInfo.getHeading()).append(",");
		if(dataInfo.getPitch() != null) builder.append("\"pitch\"").append(":").append(dataInfo.getPitch()).append(",");
		if(dataInfo.getRoll() != null) builder.append("\"roll\"").append(":").append(dataInfo.getRoll()).append(",");
		builder.append("\"attributes\"").append(":").append(dataInfo.getAttributes()).append(",");
		
		return builder;
	}
	

}
