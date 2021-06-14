<%@page import="com.leanjavaweb.model.Book"%>
<%@page import="java.util.List"%>
<%@page import="com.leanjavaweb.DB.DBConnect"%>
<%@page import="com.leanjavaweb.Dao.BookImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Recent Book</title>
<%@include file="all_component/allCss.jsp"%>
<style type="text/css">
.crd-ho:hover {
	background-color: #fcf7f7;
}
</style>
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>
		<div class="container-fluid">
			<div class="row m-5">
					<%
		BookImpl dao=new BookImpl(DBConnect.getConn());
		List<Book> list=dao.getAllrecentBook();
		for ( Book b: list)
		{%>
			<div class="col-md-3">
				<div class="card crd-ho mt-3">
					<div class="card-body text-center">
					<img alt="" src="img/<%=b.getPhoto()%>" style="width: 150px; height: 200px" class="img-thumblin">
					<div class="card-body">
						<h6><%=b.getBookName() %></h6>
						<p><%=b.getAuthor() %></p>
						<%
						if (b.getBookcategory().equals("Old"))
						{%>
							<p class="card-text">Categories:<%=b.getBookcategory()%></p>
							<div class="row justify-content-center">
					 <a href="" class="btn btn-success btn-sm ml-1">View</a> 
					 <a href="" class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%></a>
						</div>
						<%} else{%>
								<p class="card-text">Categories:<%=b.getBookcategory()%></p>
							<div class="row justify-content-center">
					<a href="" class="btn btn-danger btn-sm ml-1"><i class="fas fa-cart-plus"></i></a> <a
								href="" class="btn btn-success btn-sm ml-1">View</a> <a href=""
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
		</div>	
</body>
</html>