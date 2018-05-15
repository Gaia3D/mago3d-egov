package vo;

import java.util.ArrayList;
import java.util.List;

/**
 * @author HJCHOI
 * 페이징 처리
 */
public class Page {
	
	/** 목록의 총 건수  **/
	private long totalCount; 
	
	/** 화면에 보여질 페이지 갯수  **/
	private long pageCount = 10l;
	
	/** 화면에 보여질 리스트 갯수  **/
	private long listCount = 10l;
	
	/** 전체 페이지 갯수  **/
	private long totalPage;
	
	/** 현재 페이지 번호  **/
	private long currentPage;
	
	/** 현재 페이지의 시작 번호  **/
	private long startPage;
	
	/** 현재 페이지의 끝 번호  **/
	private long endPage;
	
	/** 다음 페이지  **/
	private long nextPage;
	
	/** 이전 페이지  **/
	private long prePage;
	
	public Page() {
		
	}
	
	public Page(long totalCount, long pageCount, long listCount) {
		this.totalCount = totalCount;
		this.listCount = listCount;
		this.pageCount = pageCount;
		init();
	}
	
	private void init() {
		this.totalPage = (totalCount -1) / listCount + 1 ;
	}

	public long getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(long totalCount) {
		this.totalCount = totalCount;
	}

	public long getPageCount() {
		return pageCount;
	}

	public void setPageCount(long pageCount) {
		this.pageCount = pageCount;
	}

	public long getListCount() {
		return listCount;
	}

	public void setListCount(long listCount) {
		this.listCount = listCount;
	}

	public long getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(long totalPage) {
		this.totalPage = totalPage;
	}

	public long getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(long currentPage) {
		this.currentPage = currentPage;
		this.startPage = currentPage * listCount + 1;
		this.endPage = startPage + pageCount -1;
		this.nextPage = currentPage + 1;
		this.prePage = currentPage - 1;
	}

	public long getStartPage() {
		return startPage;
	}

	public void setStartPage(long startPage) {
		this.startPage = startPage;
	}

	public long getEndPage() {
		return endPage;
	}

	public void setEndPage(long endPage) {
		this.endPage = endPage;
	}

	/**
	 * 현재 페이지 목록을 가져오는 메소드
	 * @param pageIndex
	 * @return
	 */
	public List<Long> getDataList(long pageIndex) {
		List<Long> list = new ArrayList<>();

		long firstList = currentPage * listCount + 1;
		long lastList = firstList + listCount + -1;
		
		for(long i=firstList; i<=lastList; i++){
			list.add(i);
		}
		return list;
	}	

	public void setDataList(List<Long> dataList) {
	}

	public long getNextPage() {
		return nextPage;
	}

	public void setNextPage(long nextPage) {
		this.nextPage = nextPage;
	}

	public long getPrePage() {
		return prePage;
	}

	public void setPrePage(long prePage) {
		this.prePage = prePage;
	}

	
}
