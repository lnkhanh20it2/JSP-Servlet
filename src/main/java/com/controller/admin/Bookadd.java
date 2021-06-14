package com.controller.admin;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.jar.Attributes;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.leanjavaweb.DB.DBConnect;
import com.leanjavaweb.Dao.BookImpl;
import com.leanjavaweb.model.Book;
@MultipartConfig
@WebServlet("/admin/add_books")
public class Bookadd extends HttpServlet {
	private static final long serialVersionUID = 1L;
	

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.getRequestDispatcher("../admin/add_books.jsp").forward(req, resp);
	}


	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			req.setCharacterEncoding("UTF-8");
			String bookName=req.getParameter("bname");
			String author=req.getParameter("author");
			String price=req.getParameter("price");
			String category=req.getParameter("categories");
			String status=req.getParameter("status");
			
			Part filePart = req.getPart("bimg");
			String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
			String readPath = req.getServletContext().getRealPath("/img"); 
			if(!new File(readPath+"/"+fileName).exists()) {
				filePart.write(readPath+"/"+fileName);
			}
			Book b=new Book(bookName,author,price,category,status,fileName,"admin@gmail.com");
			System.out.println(b);
			BookImpl dao=new BookImpl(DBConnect.getConn());
			boolean f=dao.addBook(b);
			HttpSession session=req.getSession();
			if(f)
			{
				session.setAttribute("succMsg","Book add sucessfully");
				resp.sendRedirect("./add_books");
			}else {
				session.setAttribute("failedMsg","Check infomation");
				resp.sendRedirect("./add_books");
			}
			
	}catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
	}
	
	
}
