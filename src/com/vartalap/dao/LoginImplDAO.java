package com.vartalap.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

public class LoginImplDAO implements IloginDAO {

	private static JdbcTemplate template2;
	
	public static Boolean validateUser2(String userName, String password) {
		// TODO Auto-generated method stub
		System.out.println(userName+"  Password:"+password);
		@SuppressWarnings("unchecked")
		List<String> s=template2.query("select userName, password from login where username='"+userName+"' and password='"+password+"'",new RowMapper<String>(){

			@Override
			public String mapRow(ResultSet rs, int arg1) throws SQLException {
				// TODO Auto-generated method stub
				return rs.getString(1);
			}
			
		});
		//System.out.println("asdadsadsads;;;;"+id);
		if(s.size()==0)
			return false;
		else
			return true;
	}

	@Override
	public void logout(String userName, String password) {
		// TODO Auto-generated method stub

	}

	public JdbcTemplate getTemplate2() {
		return template2;
	}

	public void setTemplate2(JdbcTemplate template2) {
		this.template2 = template2;
	}

	@Override
	public Boolean validateUser(String userName, String password) {
		// TODO Auto-generated method stub
		return null;
	}

	

}
