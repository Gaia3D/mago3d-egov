package egovframework.let.mago3d.service.impl;

import org.springframework.stereotype.Repository;

import egovframework.let.mago3d.service.PolicyVO;

@Repository("EgovPolicyDAO")
public class EgovPolicyDAO extends EgovMago3DAbstractDAO {
	
	public PolicyVO selectPolicy() {
		return (PolicyVO) select("EgovPolicyDAO.selectPolicy");
	}

}
