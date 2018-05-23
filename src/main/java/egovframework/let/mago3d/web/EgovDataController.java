package egovframework.let.mago3d.web;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.swing.text.View;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.let.mago3d.service.CacheManager;
import egovframework.let.mago3d.service.DataVO;
import egovframework.let.mago3d.service.EgovDataService;
import egovframework.let.mago3d.service.EgovPolicyService;
import egovframework.let.mago3d.service.EgovProjectService;
import egovframework.let.mago3d.service.PolicyVO;
import egovframework.let.mago3d.service.ProjectVO;
import egovframework.let.mago3d.service.StringUtil;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@RequestMapping("/mago3d/data/")
@Controller
public class EgovDataController {
	private static final Logger logger = LoggerFactory.getLogger(EgovDataController.class);
	
	@Resource(name="EgovProjectService")
	private EgovProjectService projectService;	
	
	@Resource(name="EgovDataService")
	private EgovDataService dataService;	

	@Resource(name="EgovPolicyService")
	private EgovPolicyService policyService;	
	
    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertyService;
	
	/**
	 * Data 목록
	 * @param request
	 * @param dataVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "list-data.do")
	public String listData(HttpServletRequest request, @ModelAttribute("dataVO") DataVO dataVO, ModelMap model) throws Exception {
		
		logger.info("@@@@@@@@@@@@@@@@@@@@@@@@ dataVO = {}", dataVO);
		
		ProjectVO projectVO = new ProjectVO();
		projectVO.setUse_yn(ProjectVO.IN_USE);
		List<ProjectVO> projectList = projectService.selectListProject(projectVO);
		if(dataVO.getProject_id() == null) {
			dataVO.setProject_id(Long.valueOf(0l));
		}
		
		dataVO.setPageUnit(10);
		dataVO.setPageSize(10);
		
		int totalCount = dataService.selectDataTotalCount(dataVO);
		logger.info("전체 게시물 건 수 == {}", totalCount);
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setTotalRecordCount(totalCount);
		
		paginationInfo.setCurrentPageNo(dataVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(dataVO.getPageUnit());
		paginationInfo.setPageSize(dataVO.getPageSize());
		
		logger.info("현재 페이지 번호 == {} ", dataVO.getPageIndex());
		logger.info("한 페이지당 게시되는 게시물 건 수 == {}", dataVO.getPageUnit());
		logger.info("페이지 리스트에 게시되는 페이지 건수 == {}", (Integer) dataVO.getPageSize());
		logger.info("---------------------- paginationInfo = {}", paginationInfo);
		
		dataVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		dataVO.setLastIndex(paginationInfo.getLastRecordIndex());
		dataVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		dataVO.setOffset(paginationInfo.getFirstRecordIndex());
		if(totalCount < 10) dataVO.setOffset(0);
		dataVO.setLimit(paginationInfo.getPageSize());
		logger.info("Offset == {} ", dataVO.getOffset());
		logger.info("Limit == {}", dataVO.getLimit());
			
		List<DataVO> dataList = dataService.selectListData(dataVO);
		logger.info("@@@@@@@@@@@ dataList={} ", dataList);
		
		String searchValue = getSearchParameters(dataVO);
		logger.info("@@@@@@@@@@@ searchValue={} ", searchValue);
		
		model.addAttribute("data", dataVO);
		model.addAttribute("dataList", dataList);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("projectList", projectList);
		model.addAttribute("dataList", dataList);
		model.addAttribute("searchValue", searchValue);
		return "mago3d/data/list-data";
	}

	/**
	 * 프로젝트에 등록된 Data 목록
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "ajax-detail-data.do")
	@ResponseBody
	public Map<String, Object> ajaxDetailData(HttpServletRequest request, @RequestParam("data_id") Long data_id) {
		Map<String, Object> map = new HashMap<>();
		String result = "success";
		try {		
			DataVO dataVO = dataService.selectData(data_id);
			map.put("dataInfo", dataVO);
		} catch(Exception e) {
			e.printStackTrace();
			result = "db.exception";
		}
		
		map.put("result", result);
		return map;
	}
	
	/**
	 * 프로젝트에 등록된 Data 목록
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "ajax-list-data-by-project-id.do")
	@ResponseBody
	public Map<String, Object> ajaxListDataByProjectId(HttpServletRequest request, @RequestParam("project_id") Long project_id) {
		Map<String, Object> map = new HashMap<>();
		String result = "success";
		List<DataVO> dataList = new ArrayList<>();
		try {		
			DataVO dataVO = new DataVO();
			dataVO.setProject_id(project_id);
			dataList = dataService.selectListDataByProjectId(dataVO);
			
			logger.info("@@@@@@@@@@@@@@@@@@@@ dataList={} " + dataList);
		} catch(Exception e) {
			e.printStackTrace();
			result = "db.exception";
		}
		
		map.put("result", result);
		map.put("dataList", dataList);
		
		return map;
	}
	
	/**
	 * Data 등록 화면
	 * @param model
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value = "input-data.do")
	public String inputData(Model model) throws Exception {
		ProjectVO projectVO = new ProjectVO();
		projectVO.setUse_yn(ProjectVO.IN_USE);
		List<ProjectVO> projectList = projectService.selectListProject(projectVO);
		
		PolicyVO policy = CacheManager.getPolicy();
		DataVO dataVO = new DataVO();
		
		model.addAttribute("data", dataVO);
		model.addAttribute("policy", policy);
		model.addAttribute("projectList", projectList);
		return "mago3d/data/input-data";
	}
	
	/**
	 * Data 등록
	 * @param request
	 * @param dataInfo
	 * @return
	 */
	@RequestMapping(value = "ajax-insert-data-info.do")
	@ResponseBody
	public Map<String, Object> ajaxInsertDataInfo(HttpServletRequest request, DataVO dataVO) {
		Map<String, Object> map = new HashMap<>();
		String result = "success";
		
		logger.info("@@@@@@@@@@@@@@@@@@ before dataVO = {}", dataVO);
		try {
			dataVO.setMethod_mode("insert");
			String errorcode = dataValidate(dataVO);
			if(errorcode != null) {
				result = errorcode;
				map.put("result", result);
				return map;
			}
			
			int count = dataService.selectDuplicationKeyCount(dataVO);
			if(count > 0) {
				result = "data.key.duplication";
				map.put("result", result);
				return map;
			}
			
			if(dataVO.getLatitude() != null && dataVO.getLatitude().floatValue() != 0f &&
					dataVO.getLongitude() != null && dataVO.getLongitude().floatValue() != 0f) {
				dataVO.setLocation("POINT(" + dataVO.getLongitude() + " " + dataVO.getLatitude() + ")");
			}
			
			if(dataVO.getParent().longValue() == 0l) {
				dataVO.setDepth(1);
			} else {
				dataVO.setDepth(dataVO.getParent_depth() + 1);
			}
			
			if(dataVO.getParent() == 0l && dataVO.getDepth() == 1) {
				int rootCount = dataService.selectRootParentCount(dataVO);
				if(rootCount > 0) {
					result = "프로젝트 Root가 존재합니다.";
					map.put("result", result);
					return map;
				}
			}
			
			int rootCount = dataService.selectRootParentCount(dataVO);
			if(rootCount > 0) {
				result = "프로젝트 Root가 존재합니다.";
				map.put("result", result);
				return map;
			}
			
			dataVO.setView_order(dataService.selectViewOrderByParent(dataVO));
			logger.info("@@@@@@@@@@@@@@@@@@ after dataVO = {}", dataVO);
			
			dataService.insertData(dataVO);
			
		} catch(Exception e) {
			e.printStackTrace();
			result = "db.exception";
		}
	
		map.put("result", result);
		
		return map;
	}
	
	/**
	 * ajax 용 Data validation 체크
	 * @param dataInfo
	 * @return
	 */
	private String dataValidate(DataVO dataVO) {
		if(dataVO.getData_key() == null || "".equals(dataVO.getData_key())) {
			return "data.input.invalid";
		}
			
		if(dataVO.getProject_id() == null || dataVO.getProject_id().longValue() <= 0
				|| dataVO.getData_name() == null || "".equals(dataVO.getData_name())) {
			return "data.project.id.invalid";
		}
		
		return null;
	}

	
	/**
	 * Data key 중복 체크
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "ajax-data-key-duplication-check.do")
	@ResponseBody
	public Map<String, Object> ajaxDataKeyDuplicationCheck(HttpServletRequest request, DataVO dataVO) {
		Map<String, Object> map = new HashMap<>();
		String result = "success";
		String duplication_value = "";
		try {
			if(dataVO.getProject_id() == null || dataVO.getProject_id().longValue() < 0) {
				result = "project.id.empty";
				map.put("result", result);
				return map;
			}
			else if(dataVO.getData_key() == null || "".equals(dataVO.getData_key())) {
				result = "data.key.empty";
				map.put("result", result);
				return map;
			} else if(dataVO.getOld_data_key() != null && !"".equals(dataVO.getOld_data_key())) {
				if(dataVO.getData_key().equals(dataVO.getOld_data_key())) {
					result = "data.key.same";
					map.put("result", result);
					return map;
				}
			}
			
			int count = dataService.selectDuplicationKeyCount(dataVO);
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
	 * Data 정보
	 * @param data_id
	 * @param model
	 * @return
	 * @throws Exception 
	 * @throws NumberFormatException 
	 */
	@RequestMapping(value = "detail-data.do")
	public String detailData(@RequestParam("data_id") Long data_id, @RequestParam("pageIndex")Integer pageIndex, HttpServletRequest request, Model model) throws NumberFormatException, Exception {
		
		String listParameters = getListParameters(request);
		logger.info("@@@@@@@@@@@ listParameterssss : ", listParameters);
			
		DataVO dataVO =  dataService.selectData(data_id);
		
		logger.info("@@@@ dataVO={}", dataVO);
		
		PolicyVO policyVO = CacheManager.getPolicy();
		
		model.addAttribute("policy", policyVO);
		model.addAttribute("listParameters", listParameters);
		model.addAttribute("data", dataVO);
		model.addAttribute("pageIndex", pageIndex);
		
		return "mago3d/data/detail-data";
	}
	
	/**
	 * Data 정보 수정 화면
	 * @param data_id
	 * @param model
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value = "modify-data.do")
	public String modifyData(HttpServletRequest request, @RequestParam("data_id") Long data_id, @RequestParam("pageIndex") Integer pageIndex, Model model) throws Exception {
		
		String listParameters = getListParameters(request);
		
		ProjectVO projectVO = new ProjectVO();
		projectVO.setUse_yn(ProjectVO.IN_USE);
		List<ProjectVO> projectList = projectService.selectListProject(projectVO);
		DataVO dataVO =  dataService.selectData(data_id);
		dataVO.setOld_data_key(dataVO.getData_key());
		
		logger.info("@@@@@@@@ dataVO = {}", dataVO);
		PolicyVO policyVO = CacheManager.getPolicy();
		
		model.addAttribute("listParameters", listParameters);
		model.addAttribute("policy", policyVO);
		model.addAttribute("projectList", projectList);
		model.addAttribute("data", dataVO);
		model.addAttribute("pageIndex", pageIndex);
	
		return "mago3d/data/modify-data";
	}
	
	/**
	 * Data 정보 수정
	 * @param request
	 * @param dataInfo
	 * @return
	 */
	@RequestMapping(value = "ajax-update-data-info.do")
	@ResponseBody
	public Map<String, Object> ajaxUpdateDataInfo(HttpServletRequest request, DataVO dataVO) {
		Map<String, Object> map = new HashMap<>();
		String result = "success";
		
		logger.info("@@ dataVO = {}", dataVO);
		try {
			dataVO.setMethod_mode("update");
			String errorcode = dataValidate(dataVO);
			if(errorcode != null) {
				result = errorcode;
				map.put("result", result);
				return map;
			}
			
			if(dataVO.getParent() == 0l && dataVO.getDepth() == 1) {
				int rootCount = dataService.selectRootParentCount(dataVO);
				if(rootCount > 0) {
					result = "프로젝트 Root가 존재합니다.";
					map.put("result", result);
					return map;
				}
			}

			if(dataVO.getLatitude() != null && dataVO.getLatitude().floatValue() != 0f &&
					dataVO.getLongitude() != null && dataVO.getLongitude().floatValue() != 0f) {
				dataVO.setLocation("POINT(" + dataVO.getLongitude() + " " + dataVO.getLatitude() + ")");
			}
			logger.info("@@@@@@@@ dataVO = {}", dataVO);
			
			dataService.updateData(dataVO);
			
		} catch(Exception e) {
			e.printStackTrace();
			result = "db.exception";
		}
		map.put("result", result);
		return map;
	}
	
	
	/**
	 * Data 삭제
	 * @param data_id
	 * @param model
	 * @return
	 * @throws Exception 
	 * @throws NumberFormatException 
	 */
	@RequestMapping(value = "delete-data.do")
	public String deleteData(@RequestParam("data_id") String data_id, Model model) throws NumberFormatException, Exception {
		
		dataService.deleteData(Long.valueOf(data_id));
		return "redirect:list-data.do";
	}
	
	/**
	 * Data 삭제
	 * @param request
	 * @param data_id
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "ajax-delete-data.do")
	@ResponseBody
	public Map<String, Object> ajaxDeleteData(HttpServletRequest request, Long data_id) {
		logger.info("@@@@@@@ data_id = {}", data_id);
		Map<String, Object> map = new HashMap<>();
		String result = "success";
		try {
			if(data_id == null || data_id.longValue() <=0) {
				map.put("result", "data.data_id.empty");
				return map;
			}
	
			dataService.deleteData(Long.valueOf(data_id));

		} catch(Exception e) {
			e.printStackTrace();
			map.put("result", "db.exception");
		}
		
		map.put("result", result);
		return map;
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
	
	/**
	 * 검색 조건
	 * @param dataInfo
	 * @return
	 */
	private String getSearchParameters(DataVO dataInfo) {
		// TODO 아래 메소드랑 통합
		StringBuilder builder = new StringBuilder(100);
		builder.append("&");
		builder.append("search_word=" + StringUtil.getDefaultValue(dataInfo.getSearch_word()));
		builder.append("&");
		builder.append("search_option=" + StringUtil.getDefaultValue(dataInfo.getSearch_option()));
		builder.append("&");
		try {
			builder.append("search_value=" + URLEncoder.encode(StringUtil.getDefaultValue(dataInfo.getSearch_value()), "UTF-8"));
		} catch(Exception e) {
			e.printStackTrace();
			builder.append("search_value=");
		}
		builder.append("&");
		builder.append("project_id=" + dataInfo.getProject_id());
		builder.append("&");
		builder.append("status=" + StringUtil.getDefaultValue(dataInfo.getStatus()));
		builder.append("&");
		builder.append("start_date=" + StringUtil.getDefaultValue(dataInfo.getStart_date()));
		builder.append("&");
		builder.append("end_date=" + StringUtil.getDefaultValue(dataInfo.getEnd_date()));
		builder.append("&");
		builder.append("order_word=" + StringUtil.getDefaultValue(dataInfo.getOrder_word()));
		builder.append("&");
		builder.append("order_value=" + StringUtil.getDefaultValue(dataInfo.getOrder_value()));
		builder.append("&");
		builder.append("list_count=" + dataInfo.getList_counter());
		return builder.toString();
	}
	
	
	/**
	 * 목록 페이지 이동 검색 조건
	 * @param request
	 * @return
	 */
	private String getListParameters(HttpServletRequest request) {
		StringBuilder builder = new StringBuilder(100);
		String pageNo = request.getParameter("pageNo");
		builder.append("pageNo=" + pageNo);
		builder.append("&");
		builder.append("search_word=" + StringUtil.getDefaultValue(request.getParameter("search_word")));
		builder.append("&");
		builder.append("search_option=" + StringUtil.getDefaultValue(request.getParameter("search_option")));
		builder.append("&");
		try {
			builder.append("search_value=" + URLEncoder.encode(StringUtil.getDefaultValue(request.getParameter("search_value")), "UTF-8"));
		} catch(Exception e) {
			e.printStackTrace();
			builder.append("search_value=");
		}
		builder.append("&");
		builder.append("project_id=" + request.getParameter("project_id"));
		builder.append("&");
		builder.append("status=" + StringUtil.getDefaultValue(request.getParameter("status")));
		builder.append("&");
		builder.append("start_date=" + StringUtil.getDefaultValue(request.getParameter("start_date")));
		builder.append("&");
		builder.append("end_date=" + StringUtil.getDefaultValue(request.getParameter("end_date")));
		builder.append("&");
		builder.append("order_word=" + StringUtil.getDefaultValue(request.getParameter("order_word")));
		builder.append("&");
		builder.append("order_value=" + StringUtil.getDefaultValue(request.getParameter("order_value")));
		builder.append("&");
		builder.append("list_count=" + StringUtil.getDefaultValue(request.getParameter("list_count")));
		return builder.toString();
	}

}
