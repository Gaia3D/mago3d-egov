package vo;

import org.junit.Test;

public class PageTest {

	@Test
	public void test() {
//		System.out.println("페이지 테스트 입니다.");
//		
//		double totalCount = totalCount(303, 10);
//		System.out.println("전체 페이지 갯수: " + totalCount);
//		
//		int currentPage = currentPage(10, 71);
//		System.out.println(currentPage);
		
		
	}
	
	@Test
	public void lastpageTest() {
		System.out.println("마지막 페이지 호출 테스트 입니다.");
		Page page = new Page();
		page.getLastPage();
	}
	
	
	
//	public double totalCount(double totalContents, int pageUnit) {
//		double totalConut = totalContents / pageUnit;
//		//소숫점이 있으면 무조건 올림
//		double totalPage = Math.ceil(totalConut);
//		
//		return totalPage;
//	}
//	
//	public int currentPage(int pageUnit, double currentContents) {
//		//전체 페이지(totalPage)에서 현재 페이지를 구하기 
//		//71번째 글이 몇 페이지 인지
//		int currentPage = (int) Math.ceil(totalCount(currentContents, pageUnit));
//
//		return currentPage;
//	}

}
