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
public class EgovProjectDAO extends EgovProjectAbstractDAO {

	public List<ProjectVO> selectListProject(ProjectVO project) throws Exception {
		return (List<ProjectVO>) list("EgovProjectDAO.selectListProject", project);
	}

}
