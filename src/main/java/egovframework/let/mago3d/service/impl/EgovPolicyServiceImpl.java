package egovframework.let.mago3d.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.let.mago3d.service.EgovPolicyService;
import egovframework.let.mago3d.service.PolicyVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

/**
 * 운영정책 구현 클래스
 * 
 * @author HJCHOI
 * @since 2018.05.02
 * @version 1.0
 * @see
 */
@Service("EgovPolicyService")
public class EgovPolicyServiceImpl extends EgovAbstractServiceImpl implements EgovPolicyService {
	
	@Resource(name = "EgovPolicyDAO")
    private EgovPolicyDAO egovPolicyDAO;

	@Override
	public PolicyVO selectPolicy() {
		return egovPolicyDAO.selectPolicy();
	}

}
