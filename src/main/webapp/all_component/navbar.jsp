<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
 <%@page isELIgnored="false" %>
<div class="container-fluid p-3">
	<div class="row">
		<div class="col-md-3 text-success">
			<h3>
				<i class="fas fa-book"></i> K-Books
			</h3>
		</div>
		<div class="col-md-6 text-center">
			<form>
				<div class="form-group row search justify-content-center">
					<div class="col-sm-8">
						<input class="form-control mr-sm-2" type="search"
					placeholder="Search" aria-label="Search">
					</div>
					<button class="btn btn-outline-success rounded-circle " type="submit"><i class="fas fa-search"></i></button>
				</div>
			</form>
		</div>
		<c:if test="${not empty userobj}">
		<div class="col-md-3 text-right">
			<a href="cart.jsp" class="btn btn-danger"><i class="fas fa-cart-plus"></i></a>
			<a href="./login" class="btn btn-success"><i class="far fa-user"></i>${userobj.name}</a> 
				<a href="logout" class="btn btn-primary"><i class="fas fa-sign-in-alt"></i>Logout</a>
		</div>
		</c:if>
		<c:if test="${empty userobj }">
			<div class="col-md-3 text-right">
			<a href="login" class="btn btn-success"><i
				class="fas fa-sign-in-alt"></i> Login</a> <a href="./register"
				class="btn btn-primary"><i class="fas fa-user-plus"></i>
				Register</a>
		</div>
		</c:if>
	</div>
</div>


<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
	<a class="navbar-brand" href="#"><i class="fas fa-home"></i></a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="./">Home
					<span class="sr-only"></span>
			</a></li>
			<li class="nav-item active"><a class="nav-link" href="All_recentbook.jsp"><i
					class="fas fa-book-open"></i> Recent Book</a></li>
			<li class="nav-item active"><a class="nav-link " href="All_newbook.jsp"><i
					class="fas fa-book-open"></i> New Book</a></li>
			<li class="nav-item active"><a class="nav-link" href="All_oldbook.jsp"><i
					class="fas fa-book-open"></i> Old Book</a></li>
		</ul>
		<form class="form-inline my-2 my-lg-0">
			<button class="btn bg-custom text-light my-2 my-sm-0" type="submit">
				<i class="fas fa-cogs"></i> Setting
			</button>
			<button class="btn bg-custom text-light my-2 my-sm-0" type="submit">
				<i class="fas fa-headset"></i> Contact Us
			</button>
		</form>
	</div>
</nav>