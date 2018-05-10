package egovframework.let.mago3d.service;

import java.util.List;
import java.util.Map;

import egovframework.let.cop.bbs.service.BoardMasterVO;
import egovframework.let.cop.bbs.service.BoardVO;

/**
 * 데이터 서비스 인터페이스 클래스
 * @author HJCHOI
 * @since 2018.05.08
 * @version 1.0
 * @see
 */
public interface EgovDataService {
	
	/**
	 * Data 수
	 * @param dataVO
	 * @return
	 */
	Long selectDataTotalCount(DataVO dataVO) throws Exception;
	
	/**
	 * Data 목록
	 * @param dataVO
	 * @return
	 */
	List<DataVO> selectListData(DataVO dataVO) throws Exception;
	
	/**
	 * Data 목록
	 * @param dataVO
	 * @return
	 */
	List<DataVO> selectListDataByProjectId(DataVO dataVO);
	
	/**
	 * Data Key 중복 건수
	 * @param dataVO
	 * @return
	 */
	Integer selectDuplicationKeyCount(DataVO dataVO) throws Exception;
	
	/**
	 * Data 정보 취득
	 * @param data_id
	 * @return
	 */
	DataVO selectData(Long data_id) throws Exception;
	
	/**
	 * Data 정보 취득
	 * @param dataVO
	 * @return
	 */
	DataVO selectDataByDataKey(DataVO dataVO) throws Exception;
	
	/**
	 * 표시 순서
	 * @param dataInfo
	 * @return
	 */
	Integer selectViewOrderByParent(DataVO dataVO);
	
	/**
	 * 한 프로젝트 내 Root Parent 개수를 체크
	 * @param dataVO
	 * @return
	 */
	Integer selectRootParentCount(DataVO dataVO) throws Exception;

	/**
	 * Data 등록
	 * 
	 * @param dataVO
	 * @return
	 */
	Long insertData(DataVO dataVO) throws Exception;
	
	/**
	 * Data 수정
	 * @param dataVO
	 * @return
	 */
	int updateData(DataVO dataVO) throws Exception;
	
	/**
	 * Data 삭제
	 * @param data_id
	 * @return
	 */
	int deleteData(Long data_id) throws Exception;

	
	/**
	 * 게시판 속성 정보의 목록을 조회 한다.
	 * @param BoardMasterVO
	 * 
	 * @param searchVO
	 * @exception Exception Exception
	 */
	public Map<String, Object> selectDataInfs(DataVO dataVO) throws Exception;
	
	


}
