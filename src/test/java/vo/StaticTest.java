package vo;

import org.junit.Test;

import egovframework.let.mago3d.service.CacheManager;
import egovframework.let.mago3d.service.PolicyVO;
import egovframework.let.mago3d.service.ProjectVO;

public class StaticTest {

	@Test
	public void 일반_클래스() {
		//ProjectVO project = new ProjectVO();
		ProjectVO projectVO = new ProjectVO();
		projectVO.setView_order(1);
		int getView_order = projectVO.getView_order();
		System.out.println(getView_order);
	}
	
	@Test
	public void static_클래스() {
		//
		CacheManager.setPolicy(new PolicyVO());
		PolicyVO policy = CacheManager.getPolicy();
		System.out.println(policy.toString());
	}
}
