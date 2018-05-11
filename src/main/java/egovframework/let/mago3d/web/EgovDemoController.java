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
		
		List<ProjectVO> projectList = CacheManager.getProjectList();
		if(projectList == null) {
			projectList = projectService.selectListProject(new ProjectVO());
			Map<Long, ProjectVO> projectMap = new HashMap<>();
			for(ProjectVO project : projectList) {
				projectMap.put(project.getProject_id(), project);
			}
			CacheManager.setProjectList(projectList);
			CacheManager.setProjectMap(projectMap);
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
		model.addAttribute("geoViewLibrary", policy.getGeo_view_library());
		model.addAttribute("now_latitude", policy.getGeo_init_latitude());
		model.addAttribute("now_longitude", policy.getGeo_init_longitude());
//		model.addAttribute("totalCount", totalCount);
		model.addAttribute("projectList", projectList);
		model.addAttribute("initProjectsLength", initProjectsLength);
		model.addAttribute("initProjectJsonMap", mapper.writeValueAsString(initProjectJsonMap));
//		model.addAttribute("cache_version", policyVO.getContent_cache_version());
		model.addAttribute("policyJson", mapper.writeValueAsString(policy));
		
		logger.info("@@@@@@ viewName = {}", viewName);
		logger.info("@@@@@@ policy = {}", policy);
		logger.info("@@@@@@ initProjectsLength = {}", initProjectsLength);
		logger.info("@@@@@@ initProjectJsonMap = {}", mapper.writeValueAsString(initProjectJsonMap));
		
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

}
