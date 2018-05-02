package egovframework.let.mago3d.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

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

    @Resource(name = "EgovProjectDAO")
    private EgovProjectDAO egovProjectDAO;

/*    @Autowired
	private PolicyMapper policyMapper;
	@Autowired
	private ProjectMapper projectMapper;
	@Autowired
	private DataMapper dataMapper;*/

	/**
	 * Project 목록
	 * 
	 * @param project
	 * @return
	 * @throws Exception 
	 */
	public List<ProjectVO> selectListProject(ProjectVO project) throws Exception {
		return egovProjectDAO.selectListProject(project);
	}
	
/*	
	*//**
	 * Project 조회
	 * 
	 * @param project_id
	 * @return
	 *//*
	public Project getProject(Long project_id) {
		return egovProjectDAO.selectProject(project_id);
	}

	*//**
	 * Project Key 중복 건수
	 * @param project_key
	 * @return
	 *//*
	public Integer getDuplicationKeyCount(String project_key) {
		return egovProjectDAO.selectDuplicationKeyCount(project_key);
	}
	
	*//**
	 * Project 등록
	 * 
	 * @param project
	 * @return
	 *//*
	public int insertProject(Project project) {
		egovProjectDAO.insertProject(project);
		
		DataInfo dataInfo = new DataInfo();
		dataInfo.setProject_id(project.getProject_id());
		dataInfo.setData_key(project.getProject_key());
		dataInfo.setData_name(project.getProject_name());
		dataInfo.setParent(0l);
		dataInfo.setDepth(1);
		dataInfo.setView_order(1);
		dataInfo.setAttributes("{\"isPhysical\" : false}");
		return dataMapper.insertData(dataInfo);
	}

	*//**
	 * Project 수정
	 * 
	 * @param project
	 * @return
	 *//*
	public int updateProject(Project project) {
		return egovProjectDAO.updateProject(project);
	}

	*//**
	 * Project 삭제
	 * 
	 * @param project_id
	 * @return
	 *//*
	public int deleteProject(Long project_id) {
		// 환경 설정에서 init project 에도 삭제해 줘야 함
		Policy policy = CacheManager.getPolicy();
		String geo_data_default_projects = policy.getGeo_data_default_projects();
		
		log.info("@@ geo_data_default_projects = {} ", geo_data_default_projects);
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
	}
	*/
}
