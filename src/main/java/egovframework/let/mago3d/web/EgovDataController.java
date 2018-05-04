package egovframework.let.mago3d.web;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.let.mago3d.service.DataVO;
import egovframework.let.mago3d.service.EgovDataService;
import egovframework.let.mago3d.service.EgovProjectService;
import egovframework.let.mago3d.service.ProjectVO;

@RequestMapping("/mago3d/data/")
@Controller
public class EgovDataController {
	private static final Logger logger = LoggerFactory.getLogger(EgovDataController.class);
	
	@Resource(name="EgovProjectService")
	private EgovProjectService projectService;	
	
	@Resource(name="EgovDataService")
	private EgovDataService dataService;	
	
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
		return "/data/list-data";
	}

}
