package vo;

import static org.junit.Assert.assertEquals;

import java.util.List;

import org.junit.Ignore;
import org.junit.Test;

public class PageTest {

	@Test 
	/** 현재 페이지의 시작 번호를 가져오는 메소드 **/
	public void getStartPage() {
		System.out.println("/** 현재 페이지의 시작 번호를 가져오는 메소드 **/");
		Page page = new Page(1852, 10, 7);
		System.out.println("1852개의 전체 페이지 No : " + page.totalPage);
		System.out.println("현재 페이지 No : " + page.getCurrentPage());
		long startPage = page.getStartPage(page.currentPage); 
		System.out.println("현재 페이지의 시작 번호 : " + startPage);
		assertEquals(71, startPage);
	}
	
	@Test
	/** 현재 페이지의 마지막 번호를 가져오는 메소드 **/
	public void getEndPage() {
		System.out.println("/** 현재 페이지의 마지막 번호를 가져오는 메소드 **/");
		Page page = new Page(3325, 10, 9);
		System.out.println("3325개의 전체 페이지 No : " + page.totalPage);
		assertEquals(333, page.totalPage);
		long endPage = page.getEndPage(9);
		System.out.println("현재 페이지: " + page.currentPage);
		System.out.println("페이지 마지막 번호: " + endPage);
		assertEquals(100, endPage);
	}
	
	@Test
	/** 현재 페이지 목록을 가져오는 메소드 **/
	public void getCurrentPageList() {
		System.out.println("/** 현재 페이지 목록을 가져오는 메소드 **/");
		Page page = new Page(20001, 10, 15);
		List<Long> list = page.getdataList(page.currentPage);
		System.out.println("현재 페이지 목록 리스트: " + list);
		
	}
	
	@Test
	/** 현재 페이지의 다음페이지와 이전 페이지를 가져오는 메소드 **/
	public void getNextAndPrePage() {
		System.out.println("/** 현재 페이지의 다음페이지와 이전 페이지를 가져오는 메소드 **/");
		Page page = new Page(1999, 10, 5);
		long totalPage = page.totalPage;
		long nextPage = page.getNextPage();
		long prePage = page.getPrePage();
		System.out.println("1999개의 전체 페이지 No: " + totalPage);
		System.out.println("다음 페이지: " + nextPage);
		System.out.println("이전 페이지: " + prePage);
		assertEquals(200, totalPage);
		assertEquals(5, page.currentPage);
		assertEquals(6, nextPage);
		assertEquals(4, prePage);
		
		//이전 페이지의 리스트
		System.out.println("원래 페이지 번호: " + page.getCurrentPage());
		List<Long> list = page.getdataList(prePage);
		System.out.println("이전 페이지 목록의 리스트: " + list);
	}
}
