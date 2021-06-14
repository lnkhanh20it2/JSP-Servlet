<%@page import="com.leanjavaweb.model.Book"%>
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
<title>Admin:Add Books</title>
<%@include file="allCss.jsp"%>
</head>
<body>
<%@include file="navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Edit Books</h4>
						<%
						int id=Integer.parseInt(request.getParameter("id"));
						BookImpl dao=new BookImpl(DBConnect.getConn());
						Book b=dao.getBookById(id);
						%>
						<form action="../editbooks" method="post">
							<input type="hidden" name="id" value="<%=b.getBookId()%>">
							<div class="form-group">
								<label for="exampleInputEmail1">Books Name</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="bname" value="<%=b.getBookName()%>">
							</div>
								<div class="form-group">
								<label for="exampleInputEmail1">Author</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="author" value="<%=b.getAuthor()%>">
							</div>
								<div class="form-group">
								<label for="exampleInputEmail1">Price</label> <input
									type="number" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="price" value="<%=b.getPrice()%>">
							</div>
								<div class="form-group">
								<label for="inputState">Status</label>	<select id="inputState" class="form-control" name="status">
								<% 
								if("Active".equals(b.getStatus())) {
								%>
								<option value="Active">Active</option>
								<% 
								}else {%>
										<option value="Inactive">Inactive</option>
								<%}
								%>
								</select>
							</div>
							<button type="submit" class="btn btn-primary">Edit</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>