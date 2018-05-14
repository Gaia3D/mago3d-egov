package vo;

import java.util.ArrayList;
import java.util.List;

public class Page {
	
	double currentPage; //현재 페이지
	int firstIndex;//현재 페이지 시작 인덱스
	int lastIndex;//현재 페이지 마지막 인덱스
	int pageUnit; //현재 페이지에 보여질 목록 수
	double totalCount; //전체 페이지 갯수
	
	int nextPage; //다음 페이지로
	int beforePage; //이전 페이지로
	
	public Page() {
		
	}
	
//	public double totalCount(double totalContents, int pageUnit) {
//		double totalConut = totalContents / pageUnit;
//		//소숫점이 있으면 무조건 올림
//		double totalPage = Math.ceil(totalConut);
//		return totalPage;
//	}
//	
//	
//	public int currentPage(int pageUnit, double currentContents) {
//		//전체 페이지(totalPage)에서 현재 페이지를 구하기 
//		//71번째 글이 몇 페이지 인지
//		int currentPage = (int) Math.ceil(totalCount(currentContents, pageUnit));
//
//		return currentPage;
//	}
//	
//	//시작 인덱스
//	public int firstIndex() {
//		//65번째 글의 시작 인덱스
//		
//		
//	}
	
	public List<Long> getCurrentPageList(long currentPage) {
		System.out.println("현재 페이지를 구하는 메소드 입니다.");
		List<Long> list = new ArrayList<>();
		
		// long, Long
		// int, Integer
		
		//list.add(e)
		return null;
	}
	
	public long getLastPage() {
		System.out.println("마지막 페이지를 구하는 메소드 입니다.");
		return 0l;
	}
}
