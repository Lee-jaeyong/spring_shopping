<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html dir="ltr">
<script type="text/javascript">
	function pageMove(page) {
		$("#nowPage").val(page);
		$
				.ajax({
					url : "<c:url value='/getItemList'/>",
					dataType : "json",
					data : {
						"search" : $("#searchItem").val(),
						"sortType" : $("#sortType").val(),
						"page" : page,
						"showType" : $("#showType").val()
					},
					success : function(data) {
						var html = "";
						var btnSection = "";
						if (data.result.length > 0) {
							for (var i = 0; i < data.result.length; i++) {
								html += "<tr>";
								html += "<td>" + data.result[i].i_idx + "</td>";
								html += "<td>" + data.result[i].i_name
										+ "</td>";
								html += "<td>" + data.result[i].i_price
										+ "</td>";
								html += "<td>" + data.result[i].img_path
										+ "</td>";
								html += "<td>" + data.result[i].c_categoryName
										+ "</td>";
								html += "<td>" + data.result[i].cs_categoryName
										+ "</td>";
								html += "<td>" + data.result[i].i_date
										+ "</td>";
								html += "</tr>";
							}

							if (parseInt(data.startBlock) == 0)
								btnSection += "<button type='button' class='btn btn-primary disabled'><</button>";
							else
								btnSection += "<button type='button' onclick='pageMove("
										+ (parseInt(data.startBlock) - $(
												"#showType").val())
										+ ")' class='btn btn-primary'><</button>";

							for (var i = parseInt(data.startBlock); i < parseInt(data.endBlock); i++) {
								if (page == i) {
									btnSection += "  <button type='button' class='btn btn-primary disabled'>"
											+ (parseInt(i) + 1) + "</button>";
								} else {
									btnSection += "  <button type='button' onclick='pageMove("
											+ i
											+ ")' class='btn btn-primary'>"
											+ (parseInt(i) + 1) + "</button>";
								}
							}

							if (parseInt(data.endBlock) == parseInt(data.totalBlock))
								btnSection += "<button type='button' class='btn btn-primary disabled'>></button>";
							else
								btnSection += "<button type='button' onclick='pageMove("
										+ (parseInt(data.startBlock) + $(
												"#showType").val())
										+ ")' class='btn btn-primary'>></button>";
						} else {
							html += "<tr>";
							html += "<td colspan='7'>*검색하신 상품이 존재하지 않습니다.</td>";
							html += "</tr>";
						}
						$("#itemSection").html(html);
						$("#pageBtnSection").html(btnSection);
					}
				})
	}
</script>
<%@include file="../include/pageHead.jsp"%>
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
						<div class="row">
							<div class="col-md-3">
								<div class="card">
									<div class="card-body">
										<br />
										<div class="input-group">
											<input id="searchItem" type="text" class="form-control"
												onkeyup="pageMove(0);" placeholder="Search">
											<div class="input-group-append">
												<button class="btn btn-success" onclick="pageMove(0);">검색</button>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-3">
								<div class="card">
									<div class="card-body">
										<label for="sel1">정렬:</label> <select id="sortType"
											class="form-control" onchange="pageMove(0);">
											<option value="i_idx">상품번호 순</option>
											<option value="i_name">상품명 순</option>
											<option value="i_price">가격 순</option>
											<option value="i_date">상품 등록일 순</option>
										</select>
									</div>
								</div>
							</div>
							<div class="col-md-3">
								<div class="card">
									<div class="card-body">
										<div class="form-group">
											<label for="sel1">보기:</label> <select id="showType"
												class="form-control" onchange="pageMove(0);">
												<option value="5">5개씩 보기</option>
												<option value="10">10개씩 보기</option>
												<option value="20">20개씩 보기</option>
												<option value="30">30개씩 보기</option>
											</select>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-3">
								<div class="card">
									<br />
									<div class="card-body">
										<button class="btn btn-success"
											onclick="location.href='./excelDown';">엑셀 다운로드</button>
									</div>
								</div>
							</div>
						</div>
						<div class="table-responsive">
							<br />
							<table id="zero_config"
								class="table table-striped table-bordered">
								<thead>
									<tr>
										<th>상품번호</th>
										<th>상품명</th>
										<th>가격</th>
										<th>메인이미지</th>
										<th>대분류</th>
										<th>소분류</th>
										<th>상품 등록일</th>
									</tr>
								</thead>
								<tbody id="itemSection">
								</tbody>
							</table>
							<div id="pageBtnSection" class="btn-group"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%@include file="../include/pageFooter.jsp"%>
	</div>
	<%@include file="../include/include_JS.html"%>
	<input type="hidden" id="nowPage" value="" />
	<script>
		window.onload = pageMove(0);
	</script>
</body>
</html>