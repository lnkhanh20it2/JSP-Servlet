package com.leanjavaweb.Dao;

import java.util.List;

import com.leanjavaweb.model.Cart;

public interface CartDao {
	public boolean addCart(Cart c);
	
	public List<Cart> getBookByUser(int Uid);
	
	public boolean deleteBookCart(int bid,int uid);
}
