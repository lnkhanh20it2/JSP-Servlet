<%@page import="com.leanjavaweb.model.Book"%>
<%@page import="com.leanjavaweb.DB.DBConnect"%>
<%@page import="com.leanjavaweb.Dao.BookImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2">
<%@include file="all_component/navbar.jsp"%>
<%
	int bookid=Integer.parseInt(request.getParameter("bookId"));
	BookImpl dao=new BookImpl(DBConnect.getConn());
	Book b=dao.getBookById(bookid);
%>
<div class="container p-3">
	<div class="row">
		<div class="col-md-6 text-center p-5 border bg-white">
		<img alt="" src="img/<%=b.getPhoto()%>" style="height: 150px;width: 100px"><br>
		<h4 class="mt-3">Book Name:<span class="text-success"><%=b.getBookName()%></span></h4>
		<h4>Author Name: <span class="text-success"><%=b.getAuthor()%></span></h4>
		<h4>Category: <span class="text-success"><%=b.getBookcategory()%></span></h4>
		</div>
		<div class="col-md-6 text-center p-5 border bg-white">
		<h2><%=b.getBookName()%></h2>
			<%
				if("Old".equals(b.getBookcategory()))
				{%>
					<div class="text-primary">
					<h5>Contact to Seller</h5>
					<h5><i class="fas fa-envelope"></i>Email:<%=b.getEmail()%></h5>
					</div>
			<%}
			%>
		<div class="row m-3">
			<div class="col-md-4 text-center text-danger">
			<i class="fas fa-hand-holding-usd fa-2x"></i>
			<p>Thanh toan thuan loi</p>
			</div>
			<div class="col-md-4 text-center text-danger">
			<i class="fas fa-undo-alt fa-2x"></i>
			<p>Doi tra mien phi</p>
			</div>
			<div class="col-md-4 text-center text-danger">
			<i class="fas fa-shipping-fast fa-2x"></i>
			<p>Free ship toan quoc</p>
			</div>
			</div>
			<%
				if("Old".equals(b.getBookcategory())){
			%>
			<div class="text-center p-3">
				<a href="" class="btn btn-primary">Continue Shopping</a>
				<a href="" class="btn btn-danger"><%=b.getPrice()%></a>
			</div>
			<%}else{%>
			<div class="text-center p-3">
				<a href="" class="btn btn-primary"><i class="fas fa-cart-plus"></i></a>
				<a href="" class="btn btn-danger"><%=b.getPrice()%></a>
			</div>
			<%}
			%>
		</div>
	</div>
</div>
</body>
</html>