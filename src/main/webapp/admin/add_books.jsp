
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
 <%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta charset="UTF-8">
<title>Admin:Add Books</title>
<%@include file="allCss.jsp"%>
</head>
<body>
<%@include file="navbar.jsp"%>
	<c:if test="${empty userobj}">
	<c:redirect url="../login.jsp"/>
	</c:if>
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Add Books</h4>
						<c:if test="${not empty succMsg }">
							<p class="text-center text-success">${succMsg}</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>
						<c:if test="${not empty failedMsg }">
							<p class="text-center text-danger">${failedMsg}</p>
							<c:remove var="failedMsg" scope="session" />
						</c:if>
						
						<form action="../admin/add_books" method="post" accept-charset="UTF-8" enctype = "multipart/form-data">
							<div class="form-group">
								<label for="exampleInputEmail1">Books Name</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									 name="bname">
							</div>
								<div class="form-group">
								<label for="exampleInputEmail1">Author</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									 name="author">
							</div>
								<div class="form-group">
								<label for="exampleInputEmail1">Price</label> <input
									type="number" class="form-control" id="exampleInputEmail1"
									 name="price">
							</div>
								<div class="form-group">
								<label for="inputState">Categories</label><select id="inputState" class="form-control" name="categories">
								<option selected>--select--</option>
								<option value="New">New Book</option>
								<option value="Old">Old Book</option>
								</select>
							</div>
								<div class="form-group">
								<label for="inputState">Status</label>	<select id="inputState" class="form-control" name="status">
								<option selected>--select--</option>
								<option value="Active">Active</option>
								<option value="Inactive">Inactive</option>
								</select>
							</div>
							<div class="form-group">
								<label for="exampleFormControlFile1">Upload photo</label>
								<input type="file" class="form-control-file"
									id="exampleFormControlFile1" name="bimg">
							</div>
							<button type="submit" class="btn btn-primary">Add</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>