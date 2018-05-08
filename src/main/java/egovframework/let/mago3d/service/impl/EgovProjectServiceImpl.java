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
	 * Project 조회
	 * 
	 * @param project_id
	 * @return
	 * @throws Exception 
	 */
	public ProjectVO selectProject(Long project_id) throws Exception {
		return egovProjectDAO.selectProject(project_id);
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


	/**
	 * Project 삭제
	 * 
	 * @param project_id
	 * @return
	 */
	@Override
	public int deleteProject(Long project_id) throws Exception {
		return egovProjectDAO.delete(project_id);
	}




	
}
