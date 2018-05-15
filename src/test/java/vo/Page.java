package vo;

import java.util.ArrayList;
import java.util.List;

/**
 * @author HJCHOI
 * 페이징 처리
 */
/**
 * @author HJCHOI
 *
 */
/**
 * @author HJCHOI
 *
 */
public class Page {
	
	/** 목록의 총 건수  **/
	long totalCount; 
	
	/** 화면에 보여질 페이지 수  **/
	long pageNo;
	
	/** 전체 페이지 갯수  **/
	long totalPage;
	
	/** 현재 페이지 번호  **/
	long currentPage;
	
	/** 현재 페이지의 시작 번호  **/
	long startPage;
	
	/** 현재 페이지의 끝 번호  **/
	long endPage;
	
	/** 현재 페이지 목록 리스트  **/
	List<Long> dataList;
	
	/** 다음 페이지  **/
	long nextPage;
	
	/** 이전 페이지  **/
	long prePage;
	
	public Page(long totalCount, long pageNo) {
		currentPage = 1;
		this.pageNo = 10;
		this.totalPage = ((totalCount -1) / pageNo) + 1;
	}
	
	public Page(long totalCount, long pageNo, long currentPage) {
		this.pageNo = 10;
		this.currentPage = currentPage;
		this.totalPage = ((totalCount -1) / pageNo) + 1;
		this.startPage = currentPage * pageNo + 1 ;
		this.nextPage = currentPage + 1;
		this.prePage = currentPage - 1;
	}

	public void setCurrentPage(long currentPage) {
		this.currentPage = currentPage;
	}
	
	public long getTotalCount() {
		return totalCount;
	}

	public long getCurrentPage() {
		return currentPage;
	}
	
	public long getStartPage() {
		return startPage;
	}
	
	public long getNextPage(){
		return nextPage;
	}
	
	public long getPrePage(){
		return prePage;
	}

	/**
	 * 현재 페이지의 시작 번호를 가져오는 메소드
	 * @param currentPage
	 * @return
	 */
	public long getStartPage(long currentPage) {
		long startPage = currentPage * pageNo + 1 ;
		this.startPage = startPage;
		return startPage;
	}
	
	/**
	 * 현재 페이지의 마지막 번호를 가져오는 메소드
	 * @param currentPage
	 * @return
	 */
	public long getEndPage(long currentPage) {
		long endPage = (getStartPage(currentPage) + pageNo) - 1;
		
		return endPage;
	}
	
	/**
	 * 현재 페이지 목록을 가져오는 메소드
	 * @return
	 */
	public List<Long> getdataList(long pageIndex) {
		List<Long> list = new ArrayList<>();
		
		this.currentPage = pageIndex;
		long startPage = getStartPage(currentPage);
		long endPage = getEndPage(currentPage);
		
		for(long i=startPage; i<=endPage; i++){
			list.add(i);
		}
		return list;
	}	
	
}
