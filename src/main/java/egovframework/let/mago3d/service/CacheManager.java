package egovframework.let.mago3d.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * TODO 귀찮고, 전부 select 성 데이터고 관리자가 혼자라서 getInstance를 사용하지 않았음. 바람직 하지는 않음
 * 환경 설정 관련 모든 요소를 캐시 처리
 * 
 * @author jeongdae
 *
 */
public class CacheManager {

	private volatile static CacheManager cacheManager = new CacheManager();;
	
	private CacheManager() {
	}
	
	// 회사명
	private String companyName;
	// 서버 실제 IP
	private String serverIp;
	// 서버명
	private String serverName;
	// 호스트명
	private String hostname;
	// 라이선스 유효성
	private boolean licenseAvailable = false;
	
	// 개인정보 마스킹 처리 유무
	private boolean userInfoMasking = false;
	// 공통 코드
	private Map<String, Object> commonCodeMap = null;
	// 운영 정책
	private PolicyVO policy = null;
	// 고가용성(HA)
	private Map<String, String> haMap = null;
	// StandBy Server 상태( ON, OFF, BUSY )
	private String standByServerStatus = null;
	
	// project list
	private List<ProjectVO> projectList = null;
	private Map<Long, ProjectVO> projectMap = null;
	// 프로젝트별 데이터 목록
	private Map<Long, List<DataVO>> projectDataMap = null;
	// 프로젝트별 데이터 목록, json 변환 속도를 줄이기 위해 중복 보관
	private Map<Long, String> projectDataJsonMap = null;

	
	/**
	 * 회사명
	 * @return
	 */
	public static String getCompanyName() {
		return cacheManager.companyName;
	}

	public static void setCompanyName(String companyName) {
		cacheManager.companyName = companyName;
	}
	
	/** 
	 * 서버 IP
	 * @return
	 */
	public static String getServerIp() {
		return cacheManager.serverIp;
	}

	public static void setServerIp(String serverIp) {
		cacheManager.serverIp = serverIp;
	}
	
	/**
	 * 서버명
	 * @return
	 */
	public static String getServerName() {
		return cacheManager.serverName;
	}

	public static void setServerName(String serverName) {
		cacheManager.serverName = serverName;
	}
	
	/**
	 * hostname
	 * @return
	 */
	public static String getHostname() {
		return cacheManager.hostname;
	}

	public static void setHostname(String hostname) {
		cacheManager.hostname = hostname;
	}
	
	/**
	 * 라이선스 유효성 확인
	 * @return
	 */
	public static boolean isLicenseAvailable() {
		return cacheManager.licenseAvailable;
	}

	public static void setLicenseAvailable(boolean licenseAvailable) {
		cacheManager.licenseAvailable = licenseAvailable;
	}
	
	/**
	 * 개인정보 마스킹 처리 유무
	 * @return
	 */
	public static boolean isUserInfoMasking() {
		return cacheManager.userInfoMasking;
	}
	
	public static List<ProjectVO> getProjectList() {
		return cacheManager.projectList;
	}
	public static void setProjectList(List<ProjectVO> projectList) {
		cacheManager.projectList = projectList;
	}
	
	public static Map<Long, ProjectVO> getProjectMap() {
		return cacheManager.projectMap;
	}
	public static void setProjectMap(Map<Long, ProjectVO> projectMap) {
		cacheManager.projectMap = projectMap;
	}

	
	
	/**
	 * 운영 정책
	 * @return
	 */
	public static PolicyVO getPolicy() {
		return cacheManager.policy;
	}
	
	
	/**
	 * 공통 코드명
	 * @param 
	 * @return
	 */
	public static Map<String, Object> getCommonCodeMap() {
		return cacheManager.commonCodeMap;
	}
	public static Object getCommonCode(String codeKey) {
		return cacheManager.commonCodeMap.get(codeKey);
	}
	
	public static void setCommonCodeMap(Map<String, Object> commonCodeMap) {
		cacheManager.commonCodeMap = commonCodeMap;
	}
	
	public static Map<String, String> getHaMap() {
		return cacheManager.haMap;
	}

	public static void setHaMap(Map<String, String> haMap) {
		cacheManager.haMap = haMap;
	}
	
	/**
	 * StandBy Server 상태( ON, OFF, BUSY )
	 * @return
	 */
	public static String getStandByServerStatus() {
		return cacheManager.standByServerStatus;
	}

	public static void setStandByServerStatus(String standByServerStatus) {
		cacheManager.standByServerStatus = standByServerStatus;
	}

	
	/**
	 * 프로젝트별 데이터 목록
	 * @return
	 */
	public static Map<Long, List<DataVO>> getProjectDataMap() {
		return cacheManager.projectDataMap;
	}
	public static void setProjectDataMap(Map<Long, List<DataVO>> projectDataMap) {
		cacheManager.projectDataMap = projectDataMap;
	}
	public static List<DataVO> getProjectDataList(Long projectId) {
		return cacheManager.projectDataMap.get(projectId);
	}
	public static Map<Long, String> getProjectDataJsonMap() {
		return cacheManager.projectDataJsonMap;
	}
	public static void setProjectDataJsonMap(Map<Long, String> projectDataJsonMap) {
		cacheManager.projectDataJsonMap = projectDataJsonMap;
	}
	public static String getProjectDataJson(Long projectId) {
		return cacheManager.projectDataJsonMap.get(projectId);
	}
}
