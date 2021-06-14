package com.leanjavaweb.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.leanjavaweb.DB.DBConnect;
import com.leanjavaweb.Dao.CartImpl;
@WebServlet("/remove_book")
public class RemoveBookCart extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int bid=Integer.parseInt(req.getParameter("bid"));
		int uid=Integer.parseInt(req.getParameter("uid"));
		CartImpl dao=new CartImpl(DBConnect.getConn());
		boolean f=dao.deleteBookCart(bid,uid);
		HttpSession session=req.getSession();
		if(f) {
			session.setAttribute("succMsg","Book Cart Removed");
			resp.sendRedirect("cart.jsp");
		} else {
			session.setAttribute("failedMsg","Something wrong");
			resp.sendRedirect("cart.jsp");
			
		}
	
	}

		
}
