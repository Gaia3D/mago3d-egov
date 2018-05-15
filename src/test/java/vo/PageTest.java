package vo;

import static org.junit.Assert.assertEquals;

import java.util.List;

import org.junit.Ignore;
import org.junit.Test;

public class PageTest {
	
	@Test
	public void 생성자테스트() {
		System.out.println("/** 생성자 테스트 **/");
		Page page1 = new Page();
		Page page2 = new Page(1000l, 10l, 5l);
		System.out.println("화면에 보여질 페이지 갯수: " + page1.getPageCount() + ", 한 페이지 당 리스트 갯수: " + page1.getListCount());
		System.out.println("화면에 보여질 페이지 갯수: " + page2.getPageCount() + ", 한 페이지 당 리스트 갯수: " + page2.getListCount());
	}

	@Test 
	/** 현재 페이지의 시작 번호를 가져오는 메소드 **/
	public void 현재페이지_시작번호() {
		System.out.println("/** 현재 페이지 시작 번호 **/");
		Page page = new Page(2057234666668774440l, 10l, 20l);
		System.out.println("totalPage: " + page.getTotalPage());
		page.setCurrentPage(100l);
		System.out.println("현재 페이지 No : " + page.getCurrentPage());
		long startPage = page.getStartPage(); 
		System.out.println("현재 페이지의 시작 번호 : " + startPage);
		assertEquals(2001l, page.getStartPage());
	}
	
	@Test
	/** 현재 페이지의 마지막 번호를 가져오는 메소드 **/
	public void 현재페이지_마지막번호() {
		System.out.println("/** 현재 페이지 마지막 번호 **/");
		Page page = new Page(5000000000000000000l, 10l, 10l);
		System.out.println("5000000000000000000l개의 전체 페이지 No : " + page.getTotalPage());
		page.setCurrentPage(5l);
		System.out.println("현재 페이지 No: " + page.getCurrentPage());
		long endPage = page.getEndPage();
		System.out.println("페이지 마지막 번호: " + endPage);
		assertEquals(60l, page.getEndPage());
	}
	
	@Test 
	/** 현재 페이지 목록을 가져오는 메소드 **/
	public void 현재페이지_리스트() {
		System.out.println("/** 현재 페이지 리스트 **/");
		Page page = new Page(300l, 10l, 30l);
		page.setCurrentPage(1l);
		List<Long> list = page.getDataList(page.getCurrentPage());
		System.out.println("현재 페이지 목록 리스트: " + list);
		
	}
	
	@Test 
	/** 현재 페이지의 다음페이지와 이전 페이지를 가져오는 메소드 **/
	public void 이전_목록번호() {
		System.out.println("/** 이전 페이지의 리스트 **/");
		Page page = new Page(40l, 10l, 10l);
		page.setCurrentPage(4);
		long totalPage = page.getTotalPage();
		long prePage = page.getPrePage();
		System.out.println("40l개의 totalPage: " + totalPage);
		System.out.println("이전 페이지: " + prePage);
		assertEquals(4, page.getCurrentPage());
		assertEquals(3, prePage);
		
		//이전 페이지의 리스트
		System.out.println("원래 페이지 번호: " + page.getCurrentPage());
		List<Long> list = page.getDataList(prePage);
		System.out.println("이전 페이지 목록의 리스트: " + list);
	}
	
	@Test 
	/** 현재 페이지의 다음페이지와 이전 페이지를 가져오는 메소드 **/
	public void 다음_목록번호() {
		System.out.println("/** 다음 페이지의 리스트 **/");
		Page page = new Page(1000l, 10l, 20l);
		page.setCurrentPage(4);
		long totalPage = page.getTotalPage();
		long nextPage = page.getNextPage();
		System.out.println("1000l개의 totalPage: " + totalPage);
		System.out.println("이전 페이지: " + nextPage);
		System.out.println("현재 페이지: " + page.getCurrentPage());
		assertEquals(5, nextPage);
		
		//이전 페이지의 리스트
		System.out.println("원래 페이지 번호: " + page.getCurrentPage());
		List<Long> list = page.getDataList(nextPage);
		System.out.println("이전 페이지 목록의 리스트: " + list);
	}
}
