package egovframework.let.mago3d.service;

/**
 * 데이터 서비스 인터페이스 클래스
 * @author HJCHOI
 * @since 2018.05.04
 * @version 1.0
 * @see
 */
public interface EgovDataService {
	
	/**
	 * Data 등록
	 * 
	 * @param dataVO
	 * @return
	 */
	Long insertData(DataVO dataVO) throws Exception;

}
