package egovframework.let.mago3d.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.let.mago3d.service.ProjectVO;


/**
 * 프로젝트 데이터 접근 클래스
 * 
 * @author HJCHOI
 * @since 2018.05.02
 * @version 1.0
 * @see
 */
@Repository("EgovProjectDAO")
public class EgovProjectDAO extends EgovMago3DAbstractDAO {

	public List<ProjectVO> selectListProject(ProjectVO project) throws Exception {
		return (List<ProjectVO>) list("EgovProjectDAO.selectListProject", project);
	}
	
	public Long insertProject(ProjectVO projectVO) throws Exception {
		return (Long) insert("EgovProjectDAO.insertProject", projectVO);
	}
	
	public Integer updateProject(ProjectVO projectVO) throws Exception {
		return update("EgovProjectDAO.updateProject", projectVO);
	}
	
	public Integer deleteProject(Long project_id) throws Exception {
		return delete("EgovProjectDAO.deleteProject", project_id);
	}
	
	public ProjectVO selectProject(Long project_id) throws Exception {
		return (ProjectVO) select("EgovProjectDAO.selectProject", project_id);
	}
	
	public Integer selectDuplicationKeyCount(String project_key) throws Exception {
		return (Integer) select("EgovProjectDAO.selectDuplicationKeyCount", project_key);
	}
	
	

}
