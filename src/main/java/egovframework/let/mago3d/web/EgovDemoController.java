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
	public String demo(HttpServletRequest request, HttpServletResponse response, 
			@RequestParam(defaultValue="1") String pageNo, @RequestParam(defaultValue="cesium") String viewLibrary, String device, Model model) throws Exception {
		
		logger.info("@@ viewLibrary = {}", viewLibrary);
		String viewName = "demo";
//		String lang = (String)request.getParameter("lang");
//		if(lang == null || "".equals(lang)) {
//			lang = (String)request.getSession().getAttribute(SessionKey.LANG.name());
//			if(lang == null || "".equals(lang)) {
//				lang = "ko";
//			}
//		}
		
//		logger.info("@@ lang = {}", lang);
//		if(Locale.KOREA.getLanguage().equals(lang) 
//				|| Locale.ENGLISH.getLanguage().equals(lang)
//				|| Locale.JAPAN.getLanguage().equals(lang)) {
//			request.getSession().setAttribute(SessionKey.LANG.name(), lang);
//			Locale locale = new Locale(lang);
////			LocaleResolver localeResolver = RequestContextUtils.getLocaleResolver(request);
//			localeResolver.setLocale(request, response, locale);
//		}
		
//		Issue issue = new Issue();
//		UserSession userSession = (UserSession)request.getSession().getAttribute(UserSession.KEY);
//		if(userSession == null) {
//			issue.setUser_id("guest");
//			issue.setUser_name("guest");
//		} else {
//			issue.setUser_id(userSession.getUser_id());
//			issue.setUser_name(userSession.getUser_name());
//		}
		
//		logger.info("@@ issue = {}", issue);
//		if(StringUtil.isNotEmpty(issue.getStart_date())) {
//			issue.setStart_date(issue.getStart_date().substring(0, 8) + DateUtil.START_TIME);
//		}
//		if(StringUtil.isNotEmpty(issue.getEnd_date())) {
//			issue.setEnd_date(issue.getEnd_date().substring(0, 8) + DateUtil.END_TIME);
//		}
//		long totalCount = issueService.getIssueTotalCountByUserId(issue);
//		
//		Pagination pagination = new Pagination(request.getRequestURI(), getSearchParameters(issue), totalCount, Long.valueOf(pageNo).longValue(), 10l);
//		log.info("@@ pagination = {}", pagination);
//		
//		issue.setOffset(pagination.getOffset());
//		issue.setLimit(pagination.getPageRows());
//		List<Issue> issueList = new ArrayList<>();
//		if(totalCount > 0l) {
//			issueList = issueService.getListIssueByUserId(issue);
//		}
//		
		PolicyVO policyVO = policyService.selectPolicy();
		List<ProjectVO> projectList = CacheManager.getProjectList();
		Map<String, String> initProjectJsonMap = new HashMap<>();
		int initProjectsLength = 0;
		String defaultProjects = policyVO.getGeo_data_default_projects();
		String[] initProjects = null;
		if(defaultProjects != null && !"".equals(defaultProjects)) {
			initProjects = defaultProjects.split(",");
			for(String projectId : initProjects) {
				initProjectJsonMap.put(projectId, CacheManager.getProjectDataJson(Long.valueOf(projectId)));
			}
			initProjectsLength = initProjects.length;
		}
//				
//		@SuppressWarnings("unchecked")
//		List<CommonCode> issuePriorityList = (List<CommonCode>)CacheManager.getCommonCode(CommonCode.ISSUE_PRIORITY);
//		@SuppressWarnings("unchecked")
//		List<CommonCode> issueTypeList = (List<CommonCode>)CacheManager.getCommonCode(CommonCode.ISSUE_TYPE);
//		
//		boolean isMobile = isMobile(request);
//		policy.setGeo_view_library(viewLibrary);
//		if(!"pc".equals(device) && isMobile) {
//			viewName = "demo-mobile";
//		}
		
//		ObjectMapper mapper = new ObjectMapper();
		
//		model.addAttribute("policy", policy);
//		model.addAttribute("geoViewLibrary", policy.getGeo_view_library());
//		model.addAttribute("issue", issue);
//		model.addAttribute("now_latitude", policy.getGeo_init_latitude());
//		model.addAttribute("now_longitude", policy.getGeo_init_longitude());
//		model.addAttribute(pagination);
//		model.addAttribute("totalCount", totalCount);
//		model.addAttribute("issueList", issueList);
//		model.addAttribute("projectList", projectList);
//		model.addAttribute("initProjectsLength", initProjectsLength);
//		model.addAttribute("initProjectJsonMap", mapper.writeValueAsString(initProjectJsonMap));
//		model.addAttribute("cache_version", policy.getContent_cache_version());
//		model.addAttribute("policyJson", mapper.writeValueAsString(policy));
//		model.addAttribute("issuePriorityList", issuePriorityList);
//		model.addAttribute("issueTypeList", issueTypeList);
//		
//		log.info("@@@@@@ viewName = {}", viewName);
//		log.info("@@@@@@ policy = {}", policy);
//		log.info("@@@@@@ initProjectsLength = {}", initProjectsLength);
//		log.info("@@@@@@ initProjectJsonMap = {}", mapper.writeValueAsString(initProjectJsonMap));
		
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
			/*String projectDataJson =  CacheManager.getProjectDataJson(project_id);
			map.put("projectDataJson", projectDataJson);*/
		} catch(Exception e) {
			e.printStackTrace();
			result = "db.exception";
		}
		
		map.put("result", result);
		return map;
	}

}
