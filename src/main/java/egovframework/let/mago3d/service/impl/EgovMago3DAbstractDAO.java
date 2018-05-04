package egovframework.let.mago3d.service.impl;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

import javax.annotation.Resource;

import com.ibatis.sqlmap.client.SqlMapClient;

/**
 * EgovProjectAbstractDAO.java 클래스
 * 
 * @author HJCHOI
 * @since 2018.05.02
 * @version 1.0
 * @see
 */
public abstract class EgovMago3DAbstractDAO extends EgovAbstractDAO{
	
	
	@Resource(name="egov.sqlMapClient")
	public void setSuperSqlMapClient(SqlMapClient sqlMapClient) {
        super.setSuperSqlMapClient(sqlMapClient);
    }
	

}
