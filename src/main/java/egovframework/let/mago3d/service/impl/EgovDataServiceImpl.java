package egovframework.let.mago3d.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import egovframework.let.mago3d.service.DataVO;
import egovframework.let.mago3d.service.EgovDataService;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

/**
 * 프로젝트 기능 구현 클래스
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
	 * @param DataVO
	 * @return
	 */
    @Override
	public Long selectDataTotalCount(DataVO dataVO) {
		return egovDataDAO.selectDataTotalCount(dataVO);
	}
	
	/**
	 * Data 목록
	 * @param DataVO
	 * @return
	 */
    @Override
	public List<DataVO> selectListData(DataVO dataVO) {
		return egovDataDAO.selectListData(dataVO);
	}

	@Override
	public Long insertData(DataVO dataVO) throws Exception {
		return egovDataDAO.insertData(dataVO);
	}

	/**
	 * Data 목록
	 * @param request
	 * @param dataInfo
	 * @param pageNo
	 * @param list_counter
	 * @param model
	 * @return
	 */
	
	
}
