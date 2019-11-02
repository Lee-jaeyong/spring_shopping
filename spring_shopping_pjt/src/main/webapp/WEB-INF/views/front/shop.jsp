<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="./include/header.html"%>
<script>
	function pageMove(page) {
		$("input[name='page']").val(page);
		$("input[name='search']").val($("#searchArea").val());
		$("input[name='sortType']").val("i_idx");
		$("#moveForm").attr("method", "GET").attr("action", "").submit();
	}
</script>
<body>
	<form id="moveForm">
		<input type="hidden" name="page" value="0" /> <input type="hidden"
			name="sortType" value="i_idx" /> <input type="hidden" name="search"
			value="" />
	</form>
	<div class="site-wrap">
		<%@include file="./include/siteNavbar.html"%>
		<%@include file="./include/publicHeader.html"%>

		<div class="site-section">
			<div class="container">

				<div class="row mb-5">
					<div class="col-md-9 order-2">

						<div class="row">
							<div class="col-md-12 mb-5">
								<div class="float-md-left mb-4">
									<h2 class="text-black h5">Shop All</h2>
								</div>
								<div class="d-flex">
									<div class="dropdown mr-1 ml-md-auto"></div>
									<div class="btn-group">
										<button type="button"
											class="btn btn-secondary btn-sm dropdown-toggle"
											id="dropdownMenuReference" data-toggle="dropdown">정렬
											방식</button>
										<div class="dropdown-menu"
											aria-labelledby="dropdownMenuReference">
											<a class="dropdown-item" href="#">상품 번호 순</a> <a
												class="dropdown-item" href="#">가격 낮은 순</a> <a
												class="dropdown-item" href="#">가격 높은 순</a> <a
												class="dropdown-item" href="#">인기 많은 순</a>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="row mb-5">
							<c:forEach var="item" items="${itemList }">
								<div class="col-sm-6 col-lg-4 mb-4" data-aos="fade-up">
									<div class="block-4 text-center border">
										<figure class="block-4-image">
											<a href="shop-single.html"><img
												src="${pageContext.request.contextPath}/resources/backend/image/${item.img_path }"
												class="img-fluid" style="width: 300px; height: 270px;"></a>
										</figure>
										<div class="block-4-text p-4">
											<h3>
												<a href="shop-single.html">${item.i_name }</a>
											</h3>
											<p class="mb-0">Finding perfect t-shirt</p>
											<p class="text-primary font-weight-bold">${item.i_price }원</p>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
						<div class="row" data-aos="fade-up">
							<div class="col-md-12 text-center">
								<div class="site-block-27">
									<ul>
										<li><a href="#">&lt;</a></li>
										<c:forEach var="i" begin="${startBlock }" end="${endBlock -1}">
											<c:choose>
												<c:when test="${page eq  i}">
													<li class="active"><span>${i+1 }</span></li>
												</c:when>
												<c:when test="${page ne  i}">
													<li><a href="javascript:pageMove(${i })">${i+1 }</a></li>
												</c:when>
											</c:choose>
										</c:forEach>
										<li><a href="#">&gt;</a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>

					<div class="col-md-3 order-1 mb-5 mb-md-0">
						<div class="border p-4 rounded mb-4">
							<h3 class="mb-3 h6 text-uppercase text-black d-block">Categories</h3>
							<ul class="list-unstyled mb-0">
								<li class="mb-1"><a href="#" class="d-flex"><span>Men</span>
										<span class="text-black ml-auto">(2,220)</span></a></li>
								<li class="mb-1"><a href="#" class="d-flex"><span>Women</span>
										<span class="text-black ml-auto">(2,550)</span></a></li>
								<li class="mb-1"><a href="#" class="d-flex"><span>Children</span>
										<span class="text-black ml-auto">(2,124)</span></a></li>
							</ul>
						</div>

						<div class="border p-4 rounded mb-4">
							<div class="mb-4">
								<h3 class="mb-3 h6 text-uppercase text-black d-block">Filter
									by Price</h3>
								<div id="slider-range" class="border-primary"></div>
								<input type="text" name="text" id="amount"
									class="form-control border-0 pl-0 bg-white" />
							</div>

							<div class="mb-4">
								<h3 class="mb-3 h6 text-uppercase text-black d-block">Size</h3>
								<label for="s_sm" class="d-flex"> <input type="checkbox"
									id="s_sm" class="mr-2 mt-1"> <span class="text-black">Small
										(2,319)</span>
								</label> <label for="s_md" class="d-flex"> <input
									type="checkbox" id="s_md" class="mr-2 mt-1"> <span
									class="text-black">Medium (1,282)</span>
								</label> <label for="s_lg" class="d-flex"> <input
									type="checkbox" id="s_lg" class="mr-2 mt-1"> <span
									class="text-black">Large (1,392)</span>
								</label>
							</div>

							<div class="mb-4">
								<h3 class="mb-3 h6 text-uppercase text-black d-block">Color</h3>
								<a href="#" class="d-flex color-item align-items-center"> <span
									class="bg-danger color d-inline-block rounded-circle mr-2"></span>
									<span class="text-black">Red (2,429)</span>
								</a> <a href="#" class="d-flex color-item align-items-center"> <span
									class="bg-success color d-inline-block rounded-circle mr-2"></span>
									<span class="text-black">Green (2,298)</span>
								</a> <a href="#" class="d-flex color-item align-items-center"> <span
									class="bg-info color d-inline-block rounded-circle mr-2"></span>
									<span class="text-black">Blue (1,075)</span>
								</a> <a href="#" class="d-flex color-item align-items-center"> <span
									class="bg-primary color d-inline-block rounded-circle mr-2"></span>
									<span class="text-black">Purple (1,075)</span>
								</a>
							</div>

						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-md-12">
						<div class="site-section site-blocks-2">
							<div class="row justify-content-center text-center mb-5">
								<div class="col-md-7 site-section-heading pt-4">
									<h2>Categories</h2>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-6 col-md-6 col-lg-4 mb-4 mb-lg-0"
									data-aos="fade" data-aos-delay="">
									<a class="block-2-item" href="#">
										<figure class="image">
											<img
												src="${pageContext.request.contextPath}/resources/front/images/women.jpg"
												alt="" class="img-fluid">
										</figure>
										<div class="text">
											<span class="text-uppercase">Collections</span>
											<h3>Women</h3>
										</div>
									</a>
								</div>
								<div class="col-sm-6 col-md-6 col-lg-4 mb-5 mb-lg-0"
									data-aos="fade" data-aos-delay="100">
									<a class="block-2-item" href="#">
										<figure class="image">
											<img
												src="${pageContext.request.contextPath}/resources/front/images/children.jpg"
												alt="" class="img-fluid">
										</figure>
										<div class="text">
											<span class="text-uppercase">Collections</span>
											<h3>Children</h3>
										</div>
									</a>
								</div>
								<div class="col-sm-6 col-md-6 col-lg-4 mb-5 mb-lg-0"
									data-aos="fade" data-aos-delay="200">
									<a class="block-2-item" href="#">
										<figure class="image">
											<img
												src="${pageContext.request.contextPath}/resources/front/images/men.jpg"
												alt="" class="img-fluid">
										</figure>
										<div class="text">
											<span class="text-uppercase">Collections</span>
											<h3>Men</h3>
										</div>
									</a>
								</div>
							</div>

						</div>
					</div>
				</div>

			</div>
		</div>

		<%@include file="./include/footer.html"%>
	</div>
	<%@include file="./include/scriptArea.html"%>
</body>
</html>