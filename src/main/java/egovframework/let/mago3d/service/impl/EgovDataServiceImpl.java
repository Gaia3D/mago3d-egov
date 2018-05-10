package egovframework.let.mago3d.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import egovframework.let.cop.bbs.service.BoardVO;
import egovframework.let.mago3d.service.DataVO;
import egovframework.let.mago3d.service.EgovDataService;
import egovframework.let.utl.fcc.service.EgovDateUtil;
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
	private static final Logger logger = LoggerFactory.getLogger(EgovDataService.class);
	
    @Resource(name = "EgovDataDAO")
    private EgovDataDAO egovDataDAO;
    
    /**
	 * Data 수
	 * @param dataVO
	 * @return
	 */
	public Long selectDataTotalCount(DataVO dataVO) {
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
/*

	/**
     * 조건에 맞는 게시물 목록을 조회 한다.
     *
     * @see egovframework.let.cop.bbs.brd.service.EgovBBSManageService#selectBoardArticles(egovframework.let.cop.bbs.brd.service.BoardVO)
     */
    public Map<String, Object> selectDataArticles(DataVO dataVO) throws Exception {
    	List<DataVO> list = egovDataDAO.selectDataArticleList(dataVO);
    	List<DataVO> result = new ArrayList<DataVO>();
/*
	if ("BBSA01".equals(attrbFlag)) {
	    // 유효게시판 임
	    String today = EgovDateUtil.getToday();

	    DataVO vo;
	    Iterator<DataVO> iter = list.iterator();
	    while (iter.hasNext()) {
		vo = (DataVO)iter.next();

		if (!"".equals(vo.getNtceBgnde()) || !"".equals(vo.getNtceEndde())) {
		    if (EgovDateUtil.getDaysDiff(today, vo.getNtceBgnde()) > 0 || EgovDateUtil.getDaysDiff(today, vo.getNtceEndde()) < 0) {
			// 시작일이 오늘날짜보다 크거나, 종료일이 오늘 날짜보다 작은 경우
			vo.setIsExpired("Y");
		    }
		}
		result.add(vo);
	    }
	} else {
	    result = list;
	}
*/
	int cnt = egovDataDAO.selectDataArticleListCnt(dataVO);

	Map<String, Object> map = new HashMap<String, Object>();

	map.put("resultList", result);
	map.put("resultCnt", Integer.toString(cnt));

	return map;
    }

}
