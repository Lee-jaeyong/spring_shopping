<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html dir="ltr">
<script>
	function selectCS_category() {
		$
				.ajax({
					url : "<c:url value='/getCsCategoryList'/>",
					dataType : "json",
					data : {
						"c_category" : $("#c_category").val()
					},
					success : function(data) {
						var cs_category = "<select class='form-control' name='cs_categoryNum'>";
						for (var i = 0; i < data.length; i++) {
							cs_category += "<option value="+data[i].csn_idx+">"
									+ data[i].cs_categoryName + "</option>";
						}
						cs_category += "</select>";
						$("#cs_category").html(cs_category);
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
						<form class="form-horizontal" action="./addItemExecute.do" method="post"
							enctype="multipart/form-data">
							<div class="card-body">
								<h4 class="card-title">상품 등록(*는 필수 기재입니다)</h4>
								<div class="form-group row">
									<label for="fname"
										class="col-sm-3 text-right control-label col-form-label">*상품명</label>
									<div class="col-sm-9">
										<input type="text" name="i_name" class="form-control">
									</div>
								</div>
								<div class="form-group row">
									<label for="lname"
										class="col-sm-3 text-right control-label col-form-label">*가격</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="">
									</div>
								</div>
								<div class="form-group row">
									<label for="cono1"
										class="col-sm-3 text-right control-label col-form-label">(대)분류</label>
									<div class="col-sm-3">
										<select class="form-control" name="c_categoryNum"
											onchange="selectCS_category();" id="c_category">
											<c:forEach items="${categoryList }" var="categoryList">
												<option value="${categoryList.cn_idx }">${categoryList.c_categoryName }</option>
											</c:forEach>
										</select>
									</div>
									<label for="cono1"
										class="col-sm-3 text-right control-label col-form-label">(소)분류</label>
									<div class="col-sm-3" id="cs_category">
										<select class="form-control">
											<option disabled="disabled" selected="selected">*대분류를
												선택해주세요</option>
										</select>
									</div>
								</div>
								<div class="form-group row">
									<label for="lname"
										class="col-sm-3 text-right control-label col-form-label">대표이미지</label>
									<div class="col-sm-9">
										<input type="file" name="img_path"
											class="form-control-file border">
									</div>
								</div>
								<div class="form-group row">
									<label for="lname"
										class="col-sm-3 text-right control-label col-form-label">상세페이지</label>
									<div class="col-sm-9">
										<input type="file" name="i_detailimg"
											class="form-control-file border">
									</div>
								</div>
								<div class="form-group row">
									<label for="cono1"
										class="col-sm-3 text-right control-label col-form-label">상품
										정보</label>
									<div class="col-sm-9">
										<textarea name="i_info" class="form-control"></textarea>
									</div>
								</div>
							</div>
							<div class="border-top">
								<div class="card-body">
									<input type="submit" class="btn btn-primary" value="상품 등록" />
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<%@include file="../include/pageFooter.jsp"%>
	</div>
	<%@include file="../include/include_JS.html"%>
</body>
</html>