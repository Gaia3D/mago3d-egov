package egovframework.let.mago3d.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.let.mago3d.service.DataVO;

/**
 * 프로젝트 데이터 접근 클래스
 * 
 * @author HJCHOI
 * @since 2018.05.02
 * @version 1.0
 * @see
 */
@Repository("EgovDataDAO")
public class EgovDataDAO extends EgovMago3DAbstractDAO {
	
	/**
	 * Data 수
	 * @param dataInfo
	 * @return
	 */
	public Long selectDataTotalCount(DataVO dataVO) {
		return (Long) select("EgovDataDAO.selectDataTotalCount", dataVO);
	}
	
	/**
	 * Data 목록
	 * @param dataInfo
	 * @return
	 */
	public List<DataVO> selectListData(DataVO dataVO) {
		return (List<DataVO>) select("EgovDataDAO.selectListData", dataVO);
	}
	
	
//	/**
//	 * 프로젝트별 Data 목록
//	 * @param dataInfo
//	 * @return
//	 */
//	List<DataInfo> getListDataByProjectId(DataInfo dataInfo);
//	
//	/**
//	 * data_group_id를 제외한 Data 목록
//	 * @param dataInfo
//	 * @return
//	 */
//	List<DataInfo> getListExceptDataGroupDataByGroupId(DataInfo dataInfo);
//	
//	/**
//	 * Data Key 중복 건수
//	 * @param dataInfo
//	 * @return
//	 */
//	Integer getDuplicationKeyCount(DataInfo dataInfo);
//	
//	/**
//	 * Data 정보 취득
//	 * @param data_id
//	 * @return
//	 */
//	DataInfo getData(Long data_id);
//	
//	/**
//	 * Data 정보 취득
//	 * @param dataInfo
//	 * @return
//	 */
//	DataInfo getDataByDataKey(DataInfo dataInfo);
//	
//	/**
//	 * 표시 순서
//	 * @param dataInfo
//	 * @return
//	 */
//	Integer getViewOrderByParent(DataInfo dataInfo);
//	
//	/**
//	 * 한 프로젝트 내 Root Parent 개수를 체크
//	 * @param dataInfo
//	 * @return
//	 */
//	Integer getRootParentCount(DataInfo dataInfo);
	
	/**
	 * Data 등록
	 * @param dataInfo
	 * @return
	 */
	public Long insertData(DataVO dataVO) throws Exception {
		return (Long) insert("EgovDataDAO.insertData", dataVO);
	}
	
//	/**
//	 * Data 수정
//	 * @param dataInfo
//	 * @return
//	 */
//	int updateData(DataInfo dataInfo);
//	
//	/**
//	 * Data 테이블의 Data 그룹 정보 변경
//	 * @param dataInfo
//	 * @return
//	 */
//	int updateDataGroupData(DataInfo dataInfo);
//	
//	/**
//	 * Data 상태 수정
//	 * @param dataInfo
//	 * @return
//	 */
//	int updateDataStatus(DataInfo dataInfo);
//	
//	/**
//	 * Data 삭제
//	 * @param data_id
//	 * @return
//	 */
//	int deleteData(Long data_id);
//	
//	/**
//	 * TODO 프로젝트에 속한 데이터들은 삭제해야 하나?
//	 * project 이름으로 등록된 최상위 data를 삭제
//	 * @return
//	 */
//	int deleteDataByProjectId(Long project_id);

}
