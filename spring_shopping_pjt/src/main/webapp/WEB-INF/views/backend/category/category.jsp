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
		if ($("#CcateogryValue").val().trim() != '')
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
		else
			alert("(대)카테고리를 입력해주세요.");
	}

	function addCsCategory() {
		if ($("#CScateogryValue").val().trim() != '')
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
		else
			alert("(소)카테고리를 입력해주세요.");
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
							categorySection += "<td>" + data[i].c_categoryName
									+ "</td>";
							categorySection += "<td>" + data[i].c_categoryCount
									+ "개</td>";
							categorySection += "<td><button type='button' class='btn btn-danger' data-toggle='modal' data-target='#myModal' onclick='categoryUD("
									+ data[i].cn_idx
									+ ",\""
									+ data[i].c_categoryName
									+ "\",true)'>수정 및 삭제</button></td>";
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
								cs_categorySection += "<td>"
										+ data[i].cs_categoryName + "</td>";
								cs_categorySection += "<td>"
										+ data[i].countCsCategory + "개</td>";
								cs_categorySection += "<td><button type='button' class='btn btn-danger' data-toggle='modal' data-target='#myModal' onclick='categoryUD("
										+ data[i].csn_idx
										+ ",\""
										+ data[i].cs_categoryName
										+ "\",false)'>수정 및 삭제</button></td>";
								cs_categorySection += "</tr>";
							}
						} else {
							cs_categorySection += "<tr><td colspan='2'>*등록된 (소)카테고리가 존재하지 않습니다.</td></tr>";
						}
						$("#CScategorySection").html(cs_categorySection);
					}
				})
	}

	function categoryUD(c_idx, c_name, type) {
		$("#category_type").val(type);
		$("#changeCcategory").val("");
		$("#c_category_idx").val(c_idx);
		$("#originCcategory").val(c_name);
	}

	function categoryUpdate() {
		if ($("#changeCcategory").val() === '') {
			alert("수정할 카테고리명을 다시 입력해주세요.");
			return;
		}
		if ($("#category_type").val() == "true") {
			var c_cs_type = "C_category";
		} else {
			var c_cs_type = "Cs_category";
		}
		if (confirm('*정말 수정하시겠습니까?')) {
			$.ajax({
				url : "<c:url value='/category/updateCcategory'/>",
				data : {
					"c_name" : $("#changeCcategory").val(),
					"c_idx" : $("#c_category_idx").val(),
					"type" : c_cs_type
				},
				dataType : "json",
				success : function(data) {
					if (data.result === "true")
						alert("카테고리 수정 완료");
					else
						alert("카테고리 수정 실패");
					if (c_cs_type === "C_category")
						categoryC_list('Ccategory');
					else
						categoryCS_list();
				}
			});
		}
	}

	function categoryDelete() {
		if ($("#category_type").val() == "true") {
			var conFirm = confirm('*(대)카테고리 삭제시 연관된 모든(소) 카테고리 또한 삭제됩니다.');
			var c_cs_type = "C_category";
		} else {
			var conFirm = confirm('*정말 삭제하시겠습니까?');
			var c_cs_type = "Cs_category";
		}
		if (conFirm) {
			$.ajax({
				url : "<c:url value='/category/deleteCcategory'/>",
				data : {
					"c_idx" : $("#c_category_idx").val(),
					"type" : c_cs_type
				},
				dataType : "json",
				success : function(data) {
					if (data.result === "true")
						alert("카테고리 삭제 완료");
					else
						alert("카테고리 삭제 실패");
					if (c_cs_type === "C_category")
						categoryC_list('Ccategory');
					else
						categoryCS_list();
				}
			});
		}
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
										class="hidden-sm-up"></span> <span class="hidden-xs-down">(대)카테고리</span></a></li>
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
																<th scope="col">(대)카테고리 명</th>
																<th scope="col">(소)카테고리 개수</th>
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
																<th scope="col">(소)카테고리 명</th>
																<th scope="col">해당 상품 개수</th>
																<th scope="col"></th>
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
	<!-- The Modal -->
	<div class="modal fade" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">재고 관리</h4>
					<button type="button" class="close" data-dismiss="modal">×</button>
				</div>
				<!-- Modal body -->
				<div class="modal-body">
					<div class="form-group">
						<label>기존 카테고리 명:</label> <input type="text" class="form-control"
							id="originCcategory" disabled="disabled">
					</div>
					<div class="form-group">
						<label>변경 카테고리 명:</label> <input type="text" class="form-control"
							id="changeCcategory">
					</div>
				</div>
				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal"
						onclick="categoryUpdate();">수정</button>
					<button type="button" class="btn btn-danger" data-dismiss="modal"
						onclick="categoryDelete();">삭제</button>
					<button type="button" class="btn btn-danger" data-dismiss="modal">확인</button>
					<input type="hidden" id="c_category_idx" value="" /> <input
						type="hidden" id="category_type" value="C_category" />
				</div>
			</div>
		</div>
	</div>
</body>
</html>