package egovframework.let.mago3d.service;

/**
 * 프로젝트 서비스 인터페이스 클래스
 * @author HJCHOI
 * @since 2018.05.08
 * @version 1.0
 * @see
 */
public interface EgovPolicyService {
	
	/**
	 * 운영 정책 정보
	 * @return
	 */
	PolicyVO selectPolicy();
	
}
