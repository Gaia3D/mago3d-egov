package egovframework.let.mago3d.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import egovframework.let.mago3d.service.DataVO;
import egovframework.let.mago3d.service.EgovProjectService;
import egovframework.let.mago3d.service.ProjectVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

/**
 * 프로젝트 기능 구현 클래스
 * 
 * @author HJCHOI
 * @since 2018.05.02
 * @version 1.0
 * @see
 */
@Service("EgovProjectService")
public class EgovProjectServiceImpl extends EgovAbstractServiceImpl implements EgovProjectService {
	private static final Logger logger = LoggerFactory.getLogger(EgovProjectService.class);

    @Resource(name = "EgovProjectDAO")
    private EgovProjectDAO egovProjectDAO;
    @Resource(name = "EgovDataDAO")
    private EgovDataDAO egovDataDAO;

	/**
	 * Project 목록
	 * 
	 * @param projectVO
	 * @return
	 * @throws Exception 
	 */
	public List<ProjectVO> selectListProject(ProjectVO projectVO) throws Exception {
		return egovProjectDAO.selectListProject(projectVO);
	}
	
	/**
	 * Project Key 중복 건수
	 * @param project_key
	 * @return
	 * @throws Exception 
	 */
	public Integer selectDuplicationKeyCount(String project_key) throws Exception {
		return egovProjectDAO.selectDuplicationKeyCount(project_key);
	}
		
	/**
	 * Project 등록
	 * 
	 * @param projectVO
	 * @return
	 * @throws Exception 
	 */
	public Long insertProject(ProjectVO projectVO) throws Exception {
		egovProjectDAO.insertProject(projectVO);
		
		DataVO dataVO = new DataVO();
		dataVO.setProject_id(projectVO.getProject_id());
		dataVO.setData_key(projectVO.getProject_key());
		dataVO.setData_name(projectVO.getProject_name());
		dataVO.setParent(0l);
		dataVO.setDepth(1);
		dataVO.setView_order(1);
		dataVO.setAttributes("{\"isPhysical\" : false}");
		return egovDataDAO.insertData(dataVO);
	}

	/**
	 * Project 수정
	 * 
	 * @param project
	 * @return
	 * @throws Exception 
	 */
	public int updateProject(ProjectVO projectVO) throws Exception {
		return egovProjectDAO.updateProject(projectVO);
	}


	@Override
	public int deleteProject(Long project_id) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	/**
	 * Project 삭제
	 * 
	 * @param project_id
	 * @return
	 */
	/*public int deleteProject(Long project_id) {
		// 환경 설정에서 init project 에도 삭제해 줘야 함
		Policy policy = CacheManager.getPolicy();
		String geo_data_default_projects = policy.getGeo_data_default_projects();
		
		logger.info("@@ geo_data_default_projects = {} ", geo_data_default_projects);
		if(geo_data_default_projects != null && !"".equals(geo_data_default_projects)) {
			String[] projectIds = geo_data_default_projects.split(",");
			int count = projectIds.length;
			String tempIds = "";
			for(int i=0; i<count; i++) {
				if(project_id.longValue() != Long.valueOf(projectIds[i]).longValue()) {
					if("".equals(tempIds)) {
						tempIds += projectIds[i];
					} else {
						tempIds += "," + projectIds[i];
					}
				}
			}
			policy.setGeo_data_default_projects(tempIds);
			policyMapper.updatePolicyGeo(policy);
		}
		
		// TODO 프로젝트에 속한 데이터들은 삭제해야 하나?
		// project 이름으로 등록된 최상위 data를 삭제
		dataMapper.deleteDataByProjectId(project_id);
		
		return projectMapper.deleteProject(project_id);
	}*/
	
	
	/**
	 * Project 조회
	 * 
	 * @param project_id
	 * @return
	 * @throws Exception 
	 */
	public ProjectVO selectProject(Long project_id) throws Exception {
		return egovProjectDAO.selectProject(project_id);
	}

	
}
