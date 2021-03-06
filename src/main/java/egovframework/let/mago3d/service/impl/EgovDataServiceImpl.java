package egovframework.let.mago3d.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.let.mago3d.service.DataVO;
import egovframework.let.mago3d.service.EgovDataService;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

/**
 * 데이터 기능 구현 클래스
 * 
 * @author HJCHOI
 * @since 2018.05.02
 * @version 1.0
 * @see
 */
@Service("EgovDataService")
public class EgovDataServiceImpl extends EgovAbstractServiceImpl implements EgovDataService {
	
    @Resource(name = "EgovDataDAO")
    private EgovDataDAO egovDataDAO;
    
    /**
	 * Data 수
	 * @param dataVO
	 * @return
	 */
	public int selectDataTotalCount(DataVO dataVO) {
		return egovDataDAO.selectDataTotalCount(dataVO);
	}
	
	/**
	 * Data 목록
	 * @param dataVO
	 * @return
	 */
	public List<DataVO> selectListData(DataVO dataVO) {
		return egovDataDAO.selectListData(dataVO);
	}
	
	/**
	 * Data 목록
	 * @param dataInfo
	 * @return
	 */
	public List<DataVO> selectListDataByProjectId(DataVO dataVO) {
		return egovDataDAO.selectListDataByProjectId(dataVO);
	}
		
	/**
	 * Data Key 중복 건수
	 * @param dataVO
	 * @return
	 */
	public Integer selectDuplicationKeyCount(DataVO dataVO) {
		return egovDataDAO.selectDuplicationKeyCount(dataVO);
	}
	
	/**
	 * Data 정보 취득
	 * @param data_id
	 * @return
	 */
	public DataVO selectData(Long data_id) {
		return egovDataDAO.selectData(data_id);
	}
	
	/**
	 * Data 정보 취득
	 * @param dataInfo
	 * @return
	 */
	public DataVO selectDataByDataKey(DataVO dataVO) {
		return egovDataDAO.selectDataByDataKey(dataVO);
	}
	
	/**
	 * 표시 순서
	 * @param dataInfo
	 * @return
	 */
	public Integer selectViewOrderByParent(DataVO dataVO) {
		return egovDataDAO.selectViewOrderByParent(dataVO);
	}
	
	/**
	 * 한 프로젝트 내 Root Parent 개수를 체크
	 * @param dataInfo
	 * @return
	 */
	public Integer selectRootParentCount(DataVO dataVO) {
		return egovDataDAO.selectRootParentCount(dataVO);
	}
	
	/**
	 * Data 등록
	 * @param dataVO
	 * @return
	 * @throws Exception 
	 */
	public Long insertData(DataVO dataVO) throws Exception {
		return egovDataDAO.insertData(dataVO);
	}
	
	/**
	 * Data 수정
	 * @param dataVO
	 * @return
	 */
	public int updateData(DataVO dataVO) {
		// TODO 환경 설정 값을 읽어 와서 update 할 건지, delete 할건지 분기를 타야 함
		return egovDataDAO.updateData(dataVO);
	}
	
	/**
	 * Data 삭제
	 * @param data_id
	 * @return
	 */
	public int deleteData(Long data_id) {
//		PolicyVO policyVO = CacheManager.getPolicy();
//		String dataDeleteType = policyVO.getData_delete_type();
		
		return egovDataDAO.deleteData(data_id);
	}
	
	/**
	 * 데이터 상태별 통계 정보
	 * @param status
	 * @return
	 */
	public Long getDataTotalCountByStatus(String status) {
		return egovDataDAO.getDataTotalCountByStatus(status);
	}

}
