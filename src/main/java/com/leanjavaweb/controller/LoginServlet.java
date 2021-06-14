package com.leanjavaweb.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.leanjavaweb.DB.DBConnect;
import com.leanjavaweb.Dao.UserDao;
import com.leanjavaweb.Dao.UserDaoImpl;
import com.leanjavaweb.model.User;

@WebServlet("/login")
public class LoginServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		Cookie arr[]=req.getCookies();
		for (Cookie o: req.getCookies()) {
			if (o.getName().equals("user")) {
				req.setAttribute("username", o.getValue());
				System.out.println(o.getValue());
			}
			if (o.getName().equals("pass")) {
				req.setAttribute("pass", o.getValue());
				System.out.println(o.getValue());
			}
		}
		req.getRequestDispatcher("/login.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			UserDaoImpl dao = new UserDaoImpl(DBConnect.getConn());
			HttpSession session = req.getSession();

			String email = req.getParameter("email");
			String password = req.getParameter("password");
			String remember=req.getParameter("remember");
			if ("admin@gmail.com".equals(email) && "admin".equals(password)) {
				User us=new User();
				us.setName("Admin");
				session.setAttribute("userobj",us);
				resp.sendRedirect("admin/home.jsp");
				} else {
				User us=dao.login(email, password);
				if(us!=null)
				{
					session.setAttribute("userobj", us);
					if (remember!=null) {
					Cookie u=new Cookie("user", email);
					Cookie p=new Cookie("pass", password);
					u.setMaxAge(60*60);
					p.setMaxAge(60*60);
					resp.addCookie(u);
					resp.addCookie(p);
					}
					resp.sendRedirect(req.getContextPath());
				}else {
					session.setAttribute("failedMsg","Email & password khong dung");
					resp.sendRedirect(req.getContextPath());
					
				}
				resp.sendRedirect(req.getContextPath());
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
}
