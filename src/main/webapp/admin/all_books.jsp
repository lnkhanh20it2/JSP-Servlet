<%@page import="java.util.ArrayList"%>
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
<meta charset="UTF-8">
<title>Admin:All Books</title>
<%@include file="allCss.jsp"%>
</head>
<body>
<%@include file="navbar.jsp"%>
<c:if test="${empty userobj}">
	<c:redirect url="../login.jsp"/>
	</c:if>
	<h3 class="text-center">All Book</h3>
	<c:if test="${not empty succMsg }">
							<p class="text-center text-success">${succMsg}</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>
						<c:if test="${not empty failedMsg }">
							<p class="text-center text-danger">${failedMsg}</p>
							<c:remove var="failedMsg" scope="session" />
						</c:if>
	<table class="table table-striped">
		<thead>
			<tr>
				<th scope="col">Id</th>
				<th scope="col">Image</th>
				<th scope="col">Book Name</th>
				<th scope="col">Author</th>
				<th scope="col">Price</th>
				<th scope="col">Categories</th>
				<th scope="col">Status</th>
				<th scope="col">Action</th>
			</tr>
		</thead>
		<tbody>
		<%
			BookImpl dao=new BookImpl(DBConnect.getConn());
			List<Book> list=dao.getAllbooks();
			for (Book b : list){
		%>
		<tr>
				<td><%=b.getBookId()%></td>
				<td><img src="../img/<%=b.getPhoto()%>" style="width: 50px;height: 50px"/></td>
				<td><%=b.getBookName()%></td>
				<td><%=b.getAuthor() %></td>
				<td><%=b.getPrice() %></td>
				<td><%=b.getBookcategory() %></td>
				<td><%=b.getStatus()%></td>
				<td>
					<a href="edit_book.jsp?id=<%=b.getBookId()%>" class="btn btn-sm btn-primary"><i class="fas fa-edit"></i>Edit</a>
					<a href="../delete?id=<%=b.getBookId()%>" class="btn btn-sm btn-danger"><i class="far fa-trash-alt"></i>Delete</a>
				</td>
			</tr>
			<% }
			%>
		</tbody>
	</table>
</body>
</html>