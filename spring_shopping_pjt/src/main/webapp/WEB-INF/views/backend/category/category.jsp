<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html dir="ltr">
<%@include file="../include/pageHead.jsp"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	function addcategory() {
		$.ajax({
			url : "<c:url value='/category/addCcategory'/>",
			dataType : "json",
			data : {
				"category" : $("#CcateogryValue").val()
			},
			success : function(data) {
				if (data.result)
					alert("(대)카테고리 추가 완료");
				else
					alert("(대)카테고리 추가 실패");
				categoryC_list('Ccategory');
			}
		})
	}

	function addCsCategory() {
		$.ajax({
			url : "<c:url value='/category/addCscategory'/>",
			dataType : "json",
			data : {
				"category" : $("#CScateogryValue").val(),
				"categoryClass" : $("#CcategoryVal").val()
			},
			success : function(data) {
				if (data.result)
					alert("(소)카테고리 추가 완료");
				else
					alert("(소)카테고리 추가 실패");
				categoryCS_list();
				$("#CScateogryValue").val("");
			}
		})
	}

	function categoryC_list(category) {
		$
				.ajax({
					url : "<c:url value='/category/get"+category+"List'/>",
					dataType : "json",
					success : function(data) {
						var categorySection = "";
						var cs_categorySection = "<select id='CcategoryVal' onchange='categoryCS_list();'>";
						for (var i = 0; i < data.length; i++) {
							categorySection += "<tr>";
							categorySection += "<td>" + data[i].cn_idx
									+ "</td>";
							categorySection += "<td>" + data[i].c_categoryName
									+ "</td>";
							categorySection += "<td><button type='button' class='btn btn-success'>수정</button></td>";
							categorySection += "<td><button type='button' class='btn btn-danger'>삭제</button></td>";
							categorySection += "</tr>";
							cs_categorySection += "<option value='"+data[i].cn_idx+"'>"
									+ data[i].c_categoryName
									+ "("
									+ data[i].c_categoryCount + ")</option>";
						}

						cs_categorySection += "</select>";
						$("#" + category + "Section").html(categorySection);
						$("div[id='cs_categorySection']").html(
								cs_categorySection);
					}
				})
	}

	function categoryCS_list() {
		$
				.ajax({
					url : "<c:url value='/category/getCsCategoryList'/>",
					dataType : "json",
					data : {
						"c_category" : $("#CcategoryVal").val()
					},
					success : function(data) {
						var cs_categorySection = "";
						if (data.length > 0) {
							for (var i = 0; i < data.length; i++) {
								cs_categorySection += "<tr>";
								cs_categorySection += "<td>" + data[i].csn_idx
										+ "</td>";
								cs_categorySection += "<td>"
										+ data[i].cs_categoryName + "</td>";
								cs_categorySection += "</tr>";
							}
						} else {
							cs_categorySection += "<tr><td colspan='2'>*등록된 (소)카테고리가 존재하지 않습니다.</td></tr>";
						}
						$("#CScategorySection").html(cs_categorySection);
					}
				})
	}

	window.onload = categoryC_list('Ccategory');
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
						<div class="card">
							<!-- Nav tabs -->
							<ul class="nav nav-tabs" role="tablist">
								<li class="nav-item"><a class="nav-link active"
									data-toggle="tab" href="#home" role="tab"><span
										class="hidden-sm-up"></span> <span class="hidden-xs-down">(대)카테고리</span></a>
								</li>
								<li class="nav-item"><a class="nav-link" data-toggle="tab"
									href="#profile" role="tab"><span class="hidden-sm-up"></span>
										<span class="hidden-xs-down">(소)카테고리</span></a></li>
							</ul>
							<!-- Tab panes -->
							<div class="tab-content tabcontent-border">
								<div class="tab-pane active" id="home" role="tabpanel">
									<div class="p-20">
										<div class="row">
											<div class="col-sm-6">
												<div class="card">
													<form class="form-horizontal">
														<div class="card-body">
															<div class="form-group row">
																<label for="fname"
																	class="col-sm-3 text-right control-label col-form-label">(대)카테고리</label>
																<div class="col-sm-6">
																	<input type="text" class="form-control"
																		id="CcateogryValue">
																</div>
																<div class="col-sm-3">
																	<button type="button" class="btn btn-primary"
																		onclick="addcategory('Ccategory');">추가</button>
																</div>
															</div>
														</div>
													</form>
												</div>
											</div>
											<div class="col-sm-6">
												<div class="card">
													<table class="table">
														<thead>
															<tr>
																<th scope="col">(대)카테고리 번호</th>
																<th scope="col">(대)카테고리 명</th>
															</tr>
														</thead>
														<tbody id="CcategorySection">
														</tbody>
													</table>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="tab-pane  p-20" id="profile" role="tabpanel">
									<div class="p-20">
										<div class="row">
											<div class="col-sm-2">
												<div class="card">
													<div class="card-body" id="cs_categorySection">
														<select class="form-control">
														</select>
													</div>
												</div>
											</div>
											<div class="col-sm-3">
												<div class="card">
													<form class="form-horizontal">
														<div class="card-body">
															<div class="form-group row">
																<label for="fname"
																	class="text-right control-label col-form-label">(소)카테고리</label>
																<div class="col-sm-6">
																	<input type="text" class="form-control"
																		id="CScateogryValue">
																</div>
																<div class="col-sm-3">
																	<button type="button" class="btn btn-primary"
																		onclick="addCsCategory('CScategory');">추가</button>
																</div>
															</div>
														</div>
													</form>
												</div>
											</div>
											<div class="col-sm-6">
												<div class="card">
													<table class="table">
														<thead>
															<tr>
																<th scope="col">(소)카테고리 번호</th>
																<th scope="col">(소)카테고리 명</th>
															</tr>
														</thead>
														<tbody id="CScategorySection">
															<tr>
																<td colspan="2">*(대)카테고리를 선택해주세요</td>
															</tr>
														</tbody>
													</table>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%@include file="../include/pageFooter.jsp"%>
	</div>
	<%@include file="../include/include_JS.html"%>
	<input type="hidden" id="nowPage" value="" />
</body>
</html>