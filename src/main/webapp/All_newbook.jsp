<%@page import="com.leanjavaweb.model.User"%>
<%@page import="com.leanjavaweb.model.Book"%>
<%@page import="java.util.List"%>
<%@page import="com.leanjavaweb.DB.DBConnect"%>
<%@page import="com.leanjavaweb.Dao.BookImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
 <%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All New Book</title>
<%@include file="all_component/allCss.jsp"%>
<style type="text/css">
.crd-ho:hover {
	background-color: #fcf7f7;
}
#snackbar {
  visibility: hidden;
  min-width: 250px;
  margin-left: -125px;
  background-color: #333;
  color: #fff;
  text-align: center;
  border-radius: 2px;
  padding: 16px;
  position: fixed;
  z-index: 1;
  left: 50%;
  top: 30px;
  font-size: 17px;
}

#snackbar.show {
  visibility: visible;
  -webkit-animation: fadein 0.5s, fadeout 0.5s 2.5s;
  animation: fadein 0.5s, fadeout 0.5s 2.5s;
}

@-webkit-keyframes fadein {
  from {top: 0; opacity: 0;} 
  to {bottom: 30px; opacity: 1;}
}

@keyframes fadein {
  from {top: 0; opacity: 0;}
  to {top: 30px; opacity: 1;}
}

@-webkit-keyframes fadeout {
  from {top: 30px; opacity: 1;} 
  to {top: 0; opacity: 0;}
}

@keyframes fadeout {
  from {top: 30px; opacity: 1;}
  to {top: 0; opacity: 0;}
}
</style>
</head>
<body>
	<% 
	User u=(User)session.getAttribute("userobj");
	%>
	<%@include file="all_component/navbar.jsp"%>
	<c:if test="${not empty addCart}">
		<div id="snackbar">${addCart}</div>
		<script>
			myFunction();
		</script>
		<c:remove var="addCart" scope="session" />
	</c:if>
	<c:if test="${not empty falled}">
		<div id="snackbar">${falled}</div>
		<script>
			myFunction();
		</script>
		<c:remove var="falled" scope="session"/>
	</c:if>	
	<script>
			function myFunction() {
				var x = document.getElementById("snackbar");
				x.className = "show";
				setTimeout(function() {
					x.className = x.className.replace("show", "");
				}, 3000);
			}
			myFunction();
		</script>
		<div class="container-fluid">
			<div class="row m-5">
					<%
					
		BookImpl dao=new BookImpl(DBConnect.getConn());
		List<Book> list=dao.getAllnewBook();
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
								<%if(u==null)
							{%>
							<a href="login.jsp" class="btn btn-danger btn-sm ml-1"><i class="fas fa-cart-plus"></i></a>
							<%} else {
							%>
							<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>" class="btn btn-danger btn-sm ml-1" onclick="myFunction()"><i class="fas fa-cart-plus"></i></a>
							<%
							}
							%>
				 <a href="" class="btn btn-success btn-sm ml-1">View</a> <a href=""
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