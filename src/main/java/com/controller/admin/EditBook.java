package com.controller.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.leanjavaweb.DB.DBConnect;
import com.leanjavaweb.Dao.BookImpl;
import com.leanjavaweb.model.Book;

@WebServlet("/editbooks")
public class EditBook extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id=Integer.parseInt(req.getParameter("id"));
			String bookName=req.getParameter("bname");
			String author=req.getParameter("author");
			String price=req.getParameter("price");
			String status=req.getParameter("status");
			Book b=new Book();
			b.setBookId(id);
			b.setBookName(bookName);
			b.setAuthor(author);
			b.setPrice(price);
			b.setStatus(status);
			BookImpl dao=new  BookImpl(DBConnect.getConn());
			boolean f=dao.updateEditBooks(b);
			HttpSession session=req.getSession();
			if(f) 
			{
					session.setAttribute("succMsg","Book update Successfully..");
					resp.sendRedirect("admin/all_books.jsp");
			}else {
				session.setAttribute("failedMsg","Some time wrong");
				resp.sendRedirect("admin/all_books.jsp");
			}
		}catch (Exception e) {
			// TODO: handle exception
		}
	}
}
