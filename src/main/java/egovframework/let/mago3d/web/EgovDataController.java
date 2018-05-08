package egovframework.let.mago3d.web;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.cache.CacheManager;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.let.mago3d.service.DataVO;
import egovframework.let.mago3d.service.EgovDataService;
import egovframework.let.mago3d.service.EgovPolicyService;
import egovframework.let.mago3d.service.EgovProjectService;
import egovframework.let.mago3d.service.PolicyVO;
import egovframework.let.mago3d.service.ProjectVO;
import egovframework.let.mago3d.service.StringUtil;

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
	
	/**
	 * Data 목록
	 * @param request
	 * @param dataInfo
	 * @param pageNo
	 * @param list_counter
	 * @param model
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value = "list-data.do")
	public String listData(Locale locale, HttpServletRequest request, DataVO dataVO, @RequestParam(defaultValue="1") String pageNo, Model model) throws Exception {
		
		logger.info("@@ dataInfo = {}", dataVO);
		ProjectVO projectVO = new ProjectVO();
		projectVO.setUse_yn(projectVO.IN_USE);
		List<ProjectVO> projectList = projectService.selectListProject(projectVO);
		
/*		if(dataVO.getProject_id() == null) {
			dataIndataVOfo.setProject_id(Long.valueOf(0l));
		}
		if(StringUtil.isNotEmpty(dataVO.getStart_date())) {
			dataVO.setStart_date(dataVO.getStart_date().substring(0, 8) + DateUtil.START_TIME);
		}
		if(StringUtil.isNotEmpty(dataVO.getEnd_date())) {
			dataVO.setEnd_date(dataVO.getEnd_date().substring(0, 8) + DateUtil.END_TIME);
		}*/

		long totalCount = dataService.selectDataTotalCount(dataVO);
/*		Pagination pagination = new Pagination(request.getRequestURI(), getSearchParameters(dataVO), totalCount, Long.valueOf(pageNo).longValue(), dataVO.getList_counter());
		log.info("@@ pagination = {}", pagination);*/
		
//		dataVO.setOffset(pagination.getOffset());
//		dataVO.setLimit(pagination.getPageRows());
		List<DataVO> dataList = new ArrayList<>();
		if(totalCount > 0l) {
			dataList = dataService.selectListData(dataVO);
		}
		
/*		boolean txtDownloadFlag = false;
		if(totalCount > 60000l) {
			txtDownloadFlag = true;
		}*/
		
//		@SuppressWarnings("unchecked")
//		List<CommonCode> dataRegisterTypeList = (List<CommonCode>)CacheManager.getCommonCode(CommonCode.DATA_REGISTER_TYPE);
		
		// TODO 다국어 처리를 여기서 해야 할거 같은데....
//		Map<String, String> statusMap = new HashMap<>();
//		String welcome = messageSource.getMessage("xxx.xxxx", new Object[]{}, locale);
		logger.info("@@ locale = {}", locale.toString());
		
//		model.addAttribute(pagination);
//		model.addAttribute("dataRegisterTypeList", dataRegisterTypeList);
//		model.addAttribute("txtDownloadFlag", Boolean.valueOf(txtDownloadFlag));
		model.addAttribute("projectList", projectList);
		model.addAttribute("dataList", dataList);
		model.addAttribute("excelDataInfo", dataVO);
		return "/mago3d/data/list-data";
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
	public String detailData(@RequestParam("data_id") String data_id, HttpServletRequest request, Model model) throws NumberFormatException, Exception {
		
		String listParameters = getListParameters(request);
			
		DataVO dataVO =  dataService.selectData(Long.valueOf(data_id));
		
		PolicyVO policyVO = policyService.selectPolicy();
		
		model.addAttribute("policy", policyVO);
		model.addAttribute("listParameters", listParameters);
		model.addAttribute("data", dataVO);
		
		return "/data/detail-data";
	}
	
	/**
	 * Data 정보 수정 화면
	 * @param data_id
	 * @param model
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value = "modify-data.do")
	public String modifyData(HttpServletRequest request, @RequestParam("data_id") Long data_id, Model model) throws Exception {
		
		String listParameters = getListParameters(request);
		
		ProjectVO projectVO = new ProjectVO();
		projectVO.setUse_yn(projectVO.IN_USE);
		List<ProjectVO> projectList = projectService.selectListProject(projectVO);
		DataVO dataVO =  dataService.selectData(data_id);
		dataVO.setOld_data_key(dataVO.getData_key());
		
		logger.info("@@@@@@@@ dataVO = {}", dataVO);
		PolicyVO policyVO = policyService.selectPolicy();
		
		//@SuppressWarnings("unchecked")
		//List<CommonCode> dataRegisterTypeList = (List<CommonCode>)CacheManager.getCommonCode(CommonCode.DATA_REGISTER_TYPE);
		
		//model.addAttribute("dataRegisterTypeList", dataRegisterTypeList);
		//model.addAttribute("listParameters", listParameters);
		model.addAttribute("policy", policyVO);
		model.addAttribute("projectList", projectList);
		model.addAttribute(dataVO);
		
		return "/data/modify-data";
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
		
		logger.info("@@ dataInfo = {}", dataVO);
		try {
			dataVO.setMethod_mode("update");
//			String errorcode = dataValidate(dataVO);
//			if(errorcode != null) {
//				result = errorcode;
//				map.put("result", result);
//				return map;
//			}
			
			if(dataVO.getParent() == 0l && dataVO.getDepth() == 1) {
				int rootCount = dataService.selectRootParentCount(dataVO);
				if(rootCount > 0) {
					result = "data.project.root.duplication";
					map.put("result", result);
					return map;
				}
			}

//			if(dataVO.getLatitude() != null && dataVO.getLatitude().floatValue() != 0f &&
//					dataVO.getLongitude() != null && dataVO.getLongitude().floatValue() != 0f) {
//				dataVO.setLocation("POINT(" + dataInfo.getLongitude() + " " + dataVO.getLatitude() + ")");
//			}
			logger.info("@@@@@@@@ dataInfo = {}", dataVO);
			
			dataService.updateData(dataVO);
			
/*			CacheParams cacheParams = new CacheParams();
			cacheParams.setCacheName(CacheName.DATA_INFO);
			cacheParams.setCacheType(CacheType.BROADCAST);
			cacheParams.setProject_id(dataInfo.getProject_id());
			cacheConfig.loadCache(cacheParams);*/
		} catch(Exception e) {
			e.printStackTrace();
			result = "db.exception";
		}
	
		map.put("result", result);
		return map;
	}
	
//	/**
//	 * ajax 용 Data validation 체크
//	 * @param dataInfo
//	 * @return
//	 */
//	private String dataValidate(DataVO dataVO) {
//		if(dataVO.getData_key() == null || "".equals(dataVO.getData_key())) {
//			return "data.input.invalid";
//		}
//			
//		if(dataVO.getProject_id() == null || dataVO.getProject_id().longValue() <= 0
//				|| dataVO.getData_name() == null || "".equals(dataVO.getData_name())) {
//			return "data.project.id.invalid";
//		}
//		
//		return null;
//	}
	
	/**
	 * Data 삭제
	 * @param data_id
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "delete-data.do")
	public String deleteData(@RequestParam("data_id") String data_id, Model model) {
		
		// validation 체크 해야 함
		dataService.deleteData(Long.valueOf(data_id));
/*		CacheParams cacheParams = new CacheParams();
		cacheParams.setCacheName(CacheName.DATA_INFO);
		cacheParams.setCacheType(CacheType.BROADCAST);
		cacheConfig.loadCache(cacheParams);*/
		return "redirect:/data/list-data.do";
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
