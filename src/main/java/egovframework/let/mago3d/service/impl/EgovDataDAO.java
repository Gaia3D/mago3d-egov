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
	
	public Integer selectDataTotalCount(DataVO dataVO) {
		return (Integer) select("EgovDataDAO.selectDataTotalCount", dataVO);
	}

	public List<DataVO> selectListData(DataVO dataVO) {
		return (List<DataVO>) list("EgovDataDAO.selectListData", dataVO);
	}
	
	public List<DataVO > selectListDataByProjectId(DataVO dataVO) {
		return (List<DataVO>) list("EgovDataDAO.selectListDataByProjectId", dataVO);
	}

	public Integer selectDuplicationKeyCount(DataVO dataVO) {
		return (Integer) select("EgovDataDAO.selectDuplicationKeyCount", dataVO);
	}

	public DataVO selectData(Long data_id) {
		return (DataVO) select("EgovDataDAO.selectData", data_id);
	}

	public DataVO selectDataByDataKey(DataVO dataVO) {
		return (DataVO) select("EgovDataDAO.selectData", dataVO);
	}
	
	public Integer selectViewOrderByParent(DataVO dataVO) {
		return (Integer) select("EgovDataDAO.selectViewOrderByParent", dataVO);
	}
	
	public Integer selectRootParentCount(DataVO dataVO) {
		return (Integer) select("EgovDataDAO.selectRootParentCount", dataVO);
	}

	public Long insertData(DataVO dataVO) throws Exception {
		return (Long) insert("EgovDataDAO.insertData", dataVO);
	}

	int updateData(DataVO dataVO) {
		return update("EgovDataDAO.updateData", dataVO);
	}
	
	int deleteData(Long data_id) {
		return delete("EgovDataDAO.deleteData", data_id);
	}
	
	long getDataTotalCountByStatus(String status) {
		return (long) select("EgovDataDAO.getDataTotalCountByStatus", status);
	}

}
