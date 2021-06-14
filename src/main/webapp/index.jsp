
<%@page import="com.leanjavaweb.model.User"%>
<%@page import="com.leanjavaweb.model.Book"%>
<%@page import="java.util.List"%>
<%@page import="com.leanjavaweb.Dao.BookImpl"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.leanjavaweb.DB.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
 <%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Kbook : Index</title>
<%@include file="all_component/allCss.jsp"%>
<style type="text/css">
.back-img {
	height: 40em;
	align-items: center;
	justify-content: center;
	display: flex;
	background: url("img/b3.jpg") 50% 50%/cover no-repeat;
	width: 100%;
	background-repeat: no-repeat;
	background-size: cover;
}
.crd-ho:hover {
	background-color: #fcf7f7;
}
.namebook{
  white-space: nowrap; 
  overflow: hidden;
  text-overflow: ellipsis; 
}
</style>
</head>
<body style="background-color: #f7f7f7;">
	<% 
	User u=(User)session.getAttribute("userobj");
	%>
	<%@include file="all_component/navbar.jsp"%>
	<div class="container-fluid back-img">
		<section class="container title-img text-center">
			<h3>Your Perfect Tour in K-books Starts Here!</h3>
		</section>
	</div>
	<!-- Start recent book -->
	<div class="container">
		<h3 class="text-center m-5">Recent Book</h3>
		<div class="row mt-2">
		<%
		BookImpl dao1=new BookImpl(DBConnect.getConn());
		List<Book> list1=dao1.getRecentBook();
		for ( Book b:list1)
		{%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
					<img alt="" src="img/<%=b.getPhoto()%>" style="width: 150px; height: 200px" class="img-thumblin">
					<div class="card-body">
						<h6 class="namebook"><%=b.getBookName() %></h6>
						<p><%=b.getAuthor() %></p>
						<%
						if (b.getBookcategory().equals("Old"))
						{%>
							<p class="card-text">Categories:<%=b.getBookcategory()%></p>
							<div class="row justify-content-center">
					 <a href="view_book.jsp?bookId=<%=b.getBookId()%>" class="btn btn-success btn-sm ml-1">View</a> 
					 <a href="" class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%></a>
						</div>
						<%} else{%>
								<p class="card-text">Categories:<%=b.getBookcategory()%></p>
							<div class="row justify-content-center">
							<%if(u==null)
							{%>
							<a href="login.jsp" class="btn btn-danger btn-sm ml-1"><i class="fas fa-cart-plus"></i></a>
							<%} else {
							%>
							<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>" class="btn btn-danger btn-sm ml-1" onclick="myFunction()"><i class="fas fa-cart-plus"></i></a>
							<%
							}
							%>
					 <a href="view_book.jsp?bookId=<%=b.getBookId()%>" class="btn btn-success btn-sm ml-1">View</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%></a>
						</div>
						<%
						}
						%>
					</div>
					</div>
				</div>
			</div>
		<%
			}
		%>
		</div>
		<div class="text-center mt-5 mb-5">
			<a href="All_recentbook.jsp" class="btn btn-danger btn-sm text-white py-2 px-4"> View all</a>
		</div>
	</div>
	<!-- end recent book -->
	<hr>
	<!-- Start new book -->
	<div class="container">
		<h3 class="text-center m-5">New Book</h3>
		<div class="row mt-2">
			<%
				BookImpl dao=new BookImpl(DBConnect.getConn());
				List<Book> list=dao.getNewBook();
				for(Book b : list){
				%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="img/<%=b.getPhoto()%>" style="width: 150px; height: 200px" class="img-thumblin">
						<h6><%=b.getBookName()%></h6>
						<p><%=b.getAuthor() %></p>
						<p>Categories:<%=b.getBookcategory() %></p>
						<div class="row justify-content-center">
						<%if(u==null)
							{%>
							<a href="login.jsp" class="btn btn-danger btn-sm ml-1"><i class="fas fa-cart-plus"></i></a>
							<%} else {
							%>
							<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>" class="btn btn-danger btn-sm ml-1" onclick="myFunction()"><i class="fas fa-cart-plus"></i></a>
							<%
							}
							%>
							 <a href="view_book.jsp?bookId=<%=b.getBookId()%>" class="btn btn-success btn-sm ml-1">View</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%></a>
						</div>
					</div>
				</div>
			</div>
			<% 
				}
			%>

		</div>
		<div class="text-center mt-5 mb-5">
			<a href="All_newbook.jsp" class="btn btn-danger btn-sm text-white py-2 px-4"> View all</a>
		</div>
	</div>
	<!-- end new book -->
	<hr>
	<!-- Start old book -->
	<div class="container">
		<h3 class="text-center m-5">Old Book</h3>
		<div class="row mt-2">
			<%
				BookImpl dao3=new BookImpl(DBConnect.getConn());
				List<Book> list3=dao3.getOldBook();
				for(Book b : list3){
				%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="img/<%=b.getPhoto()%>" style="width: 150px; height: 200px" class="img-thumblin">
						<h6><%=b.getBookName()%></h6>
						<p><%=b.getAuthor() %></p>
						<p>
							Categories:<%=b.getBookcategory() %></p>
						<div class="row justify-content-center">
							<a href="view_book.jsp?bookId=<%=b.getBookId()%>" class="btn btn-success btn-sm ml-1">View</a> 
							<a href=""class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%></a>
						</div>
					</div>
				</div>
			</div>
			<% 
				}
			%>
		</div>
		<div class="text-center mt-5 mb-5">
			<a href="All_oldbook.jsp" class="btn btn-danger btn-sm text-white py-2 px-4"> View all</a>
		</div>
	</div>
	<!-- end recent book -->
	<%@include file="all_component/footer.jsp"%>
</body>
</html>