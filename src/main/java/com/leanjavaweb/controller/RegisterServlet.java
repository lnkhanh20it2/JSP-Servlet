package com.leanjavaweb.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.leanjavaweb.DB.DBConnect;
import com.leanjavaweb.Dao.UserDao;
import com.leanjavaweb.Dao.UserDaoImpl;
import com.leanjavaweb.model.User;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet{
	

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.getRequestDispatcher("/register.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String name=req.getParameter("fname");
			String email=req.getParameter("email");
			String phone=req.getParameter("phone");
			String password=req.getParameter("password");
			String check=req.getParameter("check");			
			User us=new User();
			us.setName(name);
			us.setEmail(email);
			us.setPhone(phone);
			us.setPassword(password);
			HttpSession session=req.getSession();
			if(check!=null)
			{
				UserDaoImpl dao = new UserDaoImpl(DBConnect.getConn());
				boolean k = dao.userRegister(us);
				if (k) {
					session.setAttribute("succMsg","Register Suscessfully..");
					resp.sendRedirect("./register");
				} else {
					//System.out.println("Something wrong on sever");
					session.setAttribute("failedMsg","Something wrong on sever");
					resp.sendRedirect("./register");
				}
			} else {
				//System.out.println("please Check Agree &  Terms Condition");
				session.setAttribute("failedMsg","Please Check Agree &  Terms Condition");
				resp.sendRedirect("./register");
			}
		}catch (Exception e) {
			// TODO: handle exception
		}
	}
	
}
