package com.leanjavaweb.Dao;

import com.leanjavaweb.model.User;

public interface UserDao {
	public boolean userRegister(User us);
	public User login(String email,String password);
}
