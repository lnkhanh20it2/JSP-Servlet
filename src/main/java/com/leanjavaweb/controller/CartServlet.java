package com.leanjavaweb.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.leanjavaweb.DB.DBConnect;
import com.leanjavaweb.Dao.BookDao;
import com.leanjavaweb.Dao.BookImpl;
import com.leanjavaweb.Dao.CartImpl;
import com.leanjavaweb.model.Book;
import com.leanjavaweb.model.Cart;

@WebServlet("/cart")
public class CartServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int bid=Integer.parseInt(req.getParameter("bid"));
			int uid=Integer.parseInt(req.getParameter("uid"));
			BookImpl dao=new BookImpl(DBConnect.getConn());
			Book b=dao.getBookById(bid);
			Cart c= new Cart();
			c.setBid(bid);
			c.setUid(uid);
			c.setBookName(b.getBookName());
			c.setAuthor(b.getAuthor());
			c.setPrice(Double.parseDouble(b.getPrice()));
			c.setTotalPrice(Double.parseDouble(b.getPrice()));
			CartImpl dao2=new CartImpl(DBConnect.getConn());
			boolean f=dao2.addCart(c);
			HttpSession session=req.getSession();
			if (f)
			{
				session.setAttribute("addCart","Book add to cart");
				resp.sendRedirect("All_newbook.jsp");
				System.out.println("add sucess");
			} else {
				session.setAttribute("falled","Somthing wrong");
				resp.sendRedirect("All_newbook.jsp");
			}
		}catch (Exception e) {
			// TODO: handle exception
		}
	}
	
}
