package com.leanjavaweb.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.leanjavaweb.model.User;

public class UserDaoImpl implements UserDao {
	
	private  Connection conn;

	public UserDaoImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public boolean userRegister(User us) {
		boolean k=false;
		try {
			String sql="insert into user(name,email,phone,password) values(?,?,?,?)";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, us.getName());
			ps.setString(2, us.getEmail());
			ps.setString(3, us.getPhone());
			ps.setString(4, us.getPassword());
			
			int i=ps.executeUpdate();
			if(i==1)
			{
				k=true;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return k;
	}

	@Override
	public User login(String email, String password) {
		User us=null;
		try {
			String sql="select * from user where email=? and password=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1,email);
			ps.setString(2, password);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				us=new User();
				us.setId(rs.getInt(1));
				us.setName(rs.getString(2));
				us.setEmail(rs.getString(3));
				us.setPassword(rs.getString(4));
				us.setAddress(rs.getString(5));
				us.setLandmark(rs.getString(6));
				us.setCity(rs.getString(7));
			}
			
		}catch (Exception e) {
			// TODO: handle exception
		}
		// TODO Auto-generated method stub
		return us;
	}

	
	

}
