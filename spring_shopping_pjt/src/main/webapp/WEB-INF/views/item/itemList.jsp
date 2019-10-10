<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html dir="ltr">
<%@include file="../include/pageHead.jsp"%>
<script>
	function pageMove(page) {
		$.ajax({
			url : "<c:url value='/a.do'/>",
			dataType : "json",
			success : function(data) {
				alert(data.a);
			}
		})
	}
	window.onload = pageMove;
</script>
<body>
	<div class="preloader">
		<div class="lds-ripple">
			<div class="lds-pos"></div>
			<div class="lds-pos"></div>
		</div>
	</div>
	<div id="main-wrapper">
		<%@include file="../include/pageHeader.jsp"%>
		<%@include file="../include/leftMenu.jsp"%>
		<!-- Section Start -->
		<div class="page-wrapper">
			<div class="container-fluid">
				<div class="card">
					<div class="card-body">
						<div class="table-responsive">
							<table id="zero_config"
								class="table table-striped table-bordered">
								<thead>
									<tr>
										<th>상품번호</th>
										<th>상품명</th>
										<th>가격</th>
										<th>메인이미지</th>
										<th>상세페이지</th>
										<th>상품 등록일</th>
									</tr>
								</thead>
								<tbody id="itemSection">

								</tbody>
							</table>
							<button onclick="pageMove();"></button>
						</div>

					</div>
				</div>
			</div>
		</div>
		<%@include file="../include/pageFooter.jsp"%>
	</div>
	<%@include file="../include/include_JS.html"%>
</body>
</html>