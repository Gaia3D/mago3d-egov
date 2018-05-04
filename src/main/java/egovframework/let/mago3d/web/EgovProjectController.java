package egovframework.let.mago3d.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.let.mago3d.service.EgovProjectService;
import egovframework.let.mago3d.service.ProjectVO;

@Controller
@RequestMapping("/mago3d/project/")
public class EgovProjectController {
	private static final Logger logger = LoggerFactory.getLogger(EgovProjectController.class);

	@Resource(name="EgovProjectService")
	private EgovProjectService projectService;
	
	/**
	 * Project 목록
	 * @param model
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value = "list-project.do")
	public String projectList(Model model) throws Exception {
		List<ProjectVO> projectList = projectService.selectListProject(new ProjectVO());
		
		model.addAttribute("projectListSize", projectList.size());
		model.addAttribute("projectList", projectList);
		
		return "mago3d/project/list-project";
	}
	
	/**
	 * Project 등록 화면
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "input-project.do")
	public String inputProject(Model model) {
		//Policy policy = CacheManager.getPolicy();
		
		//model.addAttribute("policy", policy);
		model.addAttribute("project", new ProjectVO());
		
		return "mago3d/project/input-project";
	}
	
	/**
	 * Ajax Project 목록
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "ajax-list-project.do")
	@ResponseBody
	public Map<String, Object> ajaxListProject(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<>();
		String result = "success";
		try {
			List<ProjectVO> projectList = projectService.selectListProject(new ProjectVO());
			map.put("projectList", projectList);
		} catch(Exception e) {
			e.printStackTrace();
			result = "db.exception";
		}
		
		map.put("result", result);
		return map;
	}
	
	/**
	 * Project key 중복 체크
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "ajax-project-key-duplication-check.do")
	@ResponseBody
	public Map<String, Object> ajaxProjectKeyDuplicationCheck(HttpServletRequest request, ProjectVO projectVO) {
		
		Map<String, Object> map = new HashMap<>();
		String result = "success";
		String duplication_value = "";
		
		logger.info("@@ project = {}", projectVO);
		try {
			if(projectVO.getProject_key() == null || "".equals(projectVO.getProject_key())) {
				result = "project.key.empty";
				map.put("result", result);
				return map;
			} else if(projectVO.getOld_project_key() != null && !"".equals(projectVO.getOld_project_key())) {
				if(projectVO.getProject_key().equals(projectVO.getOld_project_key())) {
					result = "project.key.same";
					map.put("result", result);
					return map;
				}
			}
			
			int count = projectService.selectDuplicationKeyCount(projectVO.getProject_key());
			logger.info("@@ duplication_value = {}", count);
			duplication_value = String.valueOf(count);
		} catch(Exception e) {
			e.printStackTrace();
			result = "db.exception";
		}
	
		map.put("result", result);
		map.put("duplication_value", duplication_value);
		
		return map;
	}
	
	/**
	 * Project 추가
	 * @param request
	 * @param projectVO
	 * @return
	 */
	@RequestMapping(value = "ajax-insert-project.do")
	@ResponseBody
	public Map<String, Object> ajaxInsertProject(HttpServletRequest request, ProjectVO projectVO) {
		Map<String, Object> map = new HashMap<>();
		String result = "success";
		try {
			logger.info("@@ project = {} ", projectVO);
			
			if(projectVO.getProject_key() == null || "".equals(projectVO.getProject_key())
					|| projectVO.getProject_name() == null || "".equals(projectVO.getProject_name())) {
				result = "input.invalid";
				map.put("result", result);
				return map;
			}
			
			projectService.insertProject(projectVO);
			
//			CacheParams cacheParams = new CacheParams();
//			cacheParams.setCacheName(CacheName.PROJECT);
//			cacheParams.setCacheType(CacheType.BROADCAST);
//			cacheConfig.loadCache(cacheParams);
		} catch(Exception e) {
			e.printStackTrace();
			result = "db.exception";
		}
		
		map.put("result", result);
		return map;
	}
	

	/*
	/**
	 * Project 정보
	 * @param projectId
	 * @return
	 *//*
	@RequestMapping(value = "ajax-project.do")
	@ResponseBody
	public Map<String, Object> ajaxProject(Long projectId) {
		Map<String, Object> map = new HashMap<>();
		String result = "success";
		try {
						
			logger.info("@@ projectId = {} ", projectId);
			if(projectId == null) {
				result = "input.invalid";
				map.put("result", result);
				return map;
			}
			
			Project project = projectService.selectProject(projectId);
			map.put("project", project);
		} catch(Exception e) {
			e.printStackTrace();
			result = "db.exception";
		}
		
		map.put("result", result);
		return map;
	}
	
	
	*//**
	 * Project 수정 화면
	 * @param model
	 * @return
	 * @throws Exception 
	 *//*
	@RequestMapping(value = "modify-project.do")
	public String modifyProject(Model model, Long project_id) throws Exception {
		
		Project project = projectService.selectProject(project_id);
		project.setOld_project_key(project.getProject_key());
		
		model.addAttribute("project", project);
		
		return "/project/modify-project";
	}
	
	*//**
	 * Project 수정
	 * @param request
	 * @param project
	 * @return
	 *//*
	@RequestMapping(value = "ajax-update-project.do")
	@ResponseBody
	public Map<String, Object> ajaxUpdateProject(HttpServletRequest request, Project project) {
		Map<String, Object> map = new HashMap<>();
		String result = "success";
		try {
						
			logger.info("@@ project = {} ", project);
			if(project.getProject_id() == null || project.getProject_id().longValue() == 0l
					|| project.getProject_name() == null || "".equals(project.getProject_name())) {
				
				result = "input.invalid";
				map.put("result", result);
				return map;
			}
			
			projectService.updateProject(project);
			
			CacheParams cacheParams = new CacheParams();
			cacheParams.setCacheName(CacheName.PROJECT);
			cacheParams.setCacheType(CacheType.BROADCAST);
			cacheConfig.loadCache(cacheParams);
		} catch(Exception e) {
			e.printStackTrace();
			result = "db.exception";
		}
		
		map.put("result", result);
		return map;
	}
	
	*//**
	 * Project 삭제
	 * @param request
	 * @param project_id
	 * @param model
	 * @return
	 *//*
	@RequestMapping(value = "ajax-delete-project.do")
	@ResponseBody
	public Map<String, Object> ajaxDeleteProject(HttpServletRequest request, Long project_id) {
		logger.info("@@@@@@@ project_id = {}", project_id);
		Map<String, Object> map = new HashMap<>();
		String result = "success";
		try {
			if(project_id == null || project_id.longValue() <=0) {
				map.put("result", "project.project_id.empty");
				return map;
			}
			
			UserSession userSession = (UserSession)request.getSession().getAttribute(UserSession.KEY);
			// 사용자 그룹 ROLE 확인
			UserGroupRole userGroupRole = new UserGroupRole();
			userGroupRole.setUser_id(userSession.getUser_id());
			
			// TODO get 방식으로 권한 오류를 넘겨준다.
			if(!GroupRoleHelper.isUserGroupRoleValid(roleService.getListUserGroupRoleByUserId(userGroupRole), UserGroupRole.PROJECT_DELETE)) {
				log.info("@@ 접근 권한이 없어 실행할 수 없습니다. RoleName = {}",  UserGroupRole.PROJECT_DELETE);
				map.put("result", "user.group.role.invalid");
				return map;
			}
	
			projectService.deleteProject(project_id);
				
			CacheParams cacheParams = new CacheParams();
			cacheParams.setCacheName(CacheName.PROJECT);
			cacheParams.setCacheType(CacheType.BROADCAST);
			cacheConfig.loadCache(cacheParams);
		} catch(Exception e) {
			e.printStackTrace();
			map.put("result", "db.exception");
		}
		
		map.put("result", result	);
		return map;
	}
	
	*//**
	 * Project 삭제
	 * @param request
	 * @param project
	 * @return
	 *//*
	@RequestMapping(value = "delete-project.do")
	public String deleteProject(HttpServletRequest request, @RequestParam("project_id")String project_id) {

		logger.info("@@ project_id = {} ", project_id);

		UserSession userSession = (UserSession)request.getSession().getAttribute(UserSession.KEY);
		// 사용자 그룹 ROLE 확인
		UserGroupRole userGroupRole = new UserGroupRole();
		userGroupRole.setUser_id(userSession.getUser_id());
		
		// TODO get 방식으로 권한 오류를 넘겨준다.
		if(!GroupRoleHelper.isUserGroupRoleValid(roleService.getListUserGroupRoleByUserId(userGroupRole), UserGroupRole.PROJECT_DELETE)) {
			log.info("@@ 접근 권한이 없어 실행할 수 없습니다. RoleName = {}",  UserGroupRole.PROJECT_DELETE);
			return "redirect:/data/list-project.do";
		}

		projectService.deleteProject(Long.valueOf(project_id));
			
		CacheParams cacheParams = new CacheParams();
		cacheParams.setCacheName(CacheName.PROJECT);
		cacheParams.setCacheType(CacheType.BROADCAST);
		cacheConfig.loadCache(cacheParams);
	
		return "redirect:/project/list-project.do";
	}*/

}
