package egovframework.let.mago3d.service;

import java.util.List;

/**
 * 프로젝트 서비스 인터페이스 클래스
 * @author HJCHOI
 * @since 2018.05.02
 * @version 1.0
 * @see
 */
public interface EgovProjectService {

	/**
	 * Project 목록
	 * 
	 * @param project
	 * @return
	 */
	public List<ProjectVO> selectListProject(ProjectVO projectVO) throws Exception;

	/**
	 * Project 조회
	 * 
	 * @param project_id
	 * @return
	 */
	ProjectVO selectProject(Long project_id) throws Exception;
	
	/**
	 * Project Key 중복 건수
	 * @param project_key
	 * @return
	 */
	Integer selectDuplicationKeyCount(String project_key) throws Exception;
	
	/**
	 * Project 등록
	 * 
	 * @param project
	 * @return
	 */
	Long insertProject(ProjectVO projectVO) throws Exception;

	/**
	 * Project 수정
	 * 
	 * @param project
	 * @return
	 */
	int updateProject(ProjectVO projectVO) throws Exception;

	/**
	 * Project 삭제
	 * 
	 * @param project_id
	 * @return
	 */
	int deleteProject(Long project_id) throws Exception;
	
}
