<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="./include/header.html"%>
<body>

	<div class="site-wrap">
		<%@include file="./include/siteNavbar.html"%>
		<%@include file="./include/publicHeader.html"%>

		<div class="site-section">
			<div class="container">
				<div class="row">
					<div class="col-md-12 text-center">
						<span class="icon-check_circle display-3 text-success"></span>
						<h2 class="display-3 text-black">Thank you!</h2>
						<p class="lead mb-5">You order was successfuly completed.</p>
						<p>
							<a href="shop.html" class="btn btn-sm btn-primary">Back to
								shop</a>
						</p>
					</div>
				</div>
			</div>
		</div>

		<%@include file="./include/footer.html"%>
	</div>
	<%@include file="./include/scriptArea.html"%>
</body>
</html>