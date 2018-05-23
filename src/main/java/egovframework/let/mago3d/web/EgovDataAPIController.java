package egovframework.let.mago3d.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import egovframework.let.mago3d.service.CacheManager;
import egovframework.let.mago3d.service.DataVO;
import egovframework.let.mago3d.service.EgovDataService;
import egovframework.let.mago3d.service.ProjectVO;


@RestController
@RequestMapping("/mago3d/data/api/")
public class EgovDataAPIController {
	private static final Logger logger = LoggerFactory.getLogger(EgovDataController.class);

	@Resource(name="EgovDataService")
	private EgovDataService dataService;	
	
	/**
	 * 데이터 정보를 취득
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "ajax-data-by-data-id.do")
	@ResponseBody
	public Map<String, Object> ajaxDataByDataId(HttpServletRequest request, @RequestParam("data_id") Long data_id) {
		
		logger.info("@@@@@@@@@ data_id = {}", data_id);
		Map<String, Object> map = new HashMap<>();
		String result = "success";
		try {
			map.put("dataInfo", dataService.selectData(data_id));
		} catch(Exception e) {
			e.printStackTrace();
			result = "db.exception";
		}
		
		map.put("result", result);
		return map;
	}

	/**
	 * 프로젝트별 데이터 건수에 대한 통계
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "ajax-project-data-statistics.do")
	@ResponseBody
	public Map<String, Object> ajaxProjectDataStatistics(HttpServletRequest request) {
		
		Map<String, Object> map = new HashMap<>();
		String result = "success";
		try {
			List<ProjectVO> projectList = CacheManager.getProjectList();
			List<String> projectNameList = new ArrayList<>();
			List<Integer> dataTotalCountList = new ArrayList<>();
			for(ProjectVO project : projectList) {
				projectNameList.add(project.getProject_name());
				List<DataVO> dataInfoList = CacheManager.getProjectDataList(project.getProject_id());
				dataTotalCountList.add(dataInfoList.size() - 1);
			}
			
			map.put("projectNameList", projectNameList);
			map.put("dataTotalCountList", dataTotalCountList);
		} catch(Exception e) {
			e.printStackTrace();
			result = "db.exception";
		}
		
		map.put("result", result);
		return map;
	}
	
	/**
	 * 데이터 상태별 통계 정보
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "ajax-data-status-statistics.do")
	@ResponseBody
	public Map<String, Object> ajaxDataStatusStatistics(HttpServletRequest request) {
		
		Map<String, Object> map = new HashMap<>();
		String result = "success";
		try {
			long useTotalCount = dataService.getDataTotalCountByStatus(DataVO.STATUS_USE);
			long forbidTotalCount = dataService.getDataTotalCountByStatus(DataVO.STATUS_FORBID);
			long etcTotalCount = dataService.getDataTotalCountByStatus(DataVO.STATUS_ETC);
			map.put("useTotalCount", useTotalCount);
			map.put("forbidTotalCount", forbidTotalCount);
			map.put("etcTotalCount", etcTotalCount);
		} catch(Exception e) {
			e.printStackTrace();
			result = "db.exception";
		}
		
		map.put("result", result);
		return map;
	}
	
}
