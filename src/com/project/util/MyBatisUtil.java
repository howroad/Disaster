/**
 * 
 */
package com.project.util;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

/**
 * @author howroad
 * @Date 2018年3月28日
 * @version 1.0
 */
public class MyBatisUtil {
	/**
	 * 获得SqlSessionFactory实例
	 * @return SqlSessionFactory实例
	 */
	public static SqlSessionFactory getSqlSessionFactory() {
		InputStream ins = null;
		SqlSessionFactory sqlSessionFacoty = null;
		try {
			ins = Resources.getResourceAsStream("config.xml");
			sqlSessionFacoty = new SqlSessionFactoryBuilder().build(ins);
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if(ins!=null) {ins.close();}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return sqlSessionFacoty;
	}
	/**
	 * 获得SqlSession
	 * @return SqlSession
	 */
	public static SqlSession getSqlSession() {
		return getSqlSessionFactory().openSession(false);
	}
	/**
	 * 获得SqlSession
	 * @param boo 
	 * @return true为自动提交，flase为默认的不自动提交
	 */
	public static SqlSession getSqlSession(boolean boo) {
		return getSqlSessionFactory().openSession(boo);
	}
}
