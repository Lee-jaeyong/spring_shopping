<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html dir="ltr">
<script>
	var colorIdx = 0;
	function submitPage(type) {
		if (type === 'add') {
			var chkColor = true;
			for (var i = 0; i < $("input[name='i_color']").length; i++) {
				if ($("input[name='i_color']")[i].value == '') {
					chkColor = false;
				}
			}
			if ($("input[name='i_name']").val().trim() === '') {
				alert("상품명을 입력해주세요.");
			} else if ($("input[name='i_price']").val().trim() === '') {
				alert("상품 가격을 입력해주세요.");
			} else if (isNaN($("input[name='i_price']").val())) {
				alert("상품 가격을 다시입력해주세요.");
			} else if ($("input:checkbox[name='i_size']:checked").length <= 0) {
				alert("상품 사이즈를 선택해주세요.");
			} else if ($("input[name='i_color']").length <= 0
					|| chkColor == false) {
				alert("상품 색상을 입력해주세요.");
			} else if (isNaN($("input[name='i_price']").val())) {
				alert("상품 가격을 다시입력해주세요.");
			} else if ($("#cs_categoryNum").val() === '') {
				alert("(소)카테고리를 선택해주세요.");
			} else if ($("input[name='ImgMain']").val().trim() === '') {
				alert("대표이미지를 선택해주세요.");
			} else if ($("input[name='ImgDetail']").val().trim() === '') {
				alert("상세페이지를 선택해주세요.");
			} else if ($("#i_info").val().trim() === '') {
				alert("상세 정보를 입력해주세요.");
			} else {
				$("#itemInfo").attr("action", "./addItemExecute.do").attr(
						"method", "post").submit();
			}
		} else {
			$("#itemInfo").attr("action", "./updateItemExecute.do").attr(
					"method", "post").submit();
		}
	}

	function changeFile(file, ImgText, ImgClass) {
		$("#" + ImgText).html(file.value);
		var reader = new FileReader();
		reader.readAsDataURL(file.files[0]);
		reader.onload = function(e) {
			$("#mainImg" + ImgClass).attr("src", e.target.result);
		}
	}

	function selectCS_category() {
		$
				.ajax({
					url : "<c:url value='/category/getCsCategoryList'/>",
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

	function addColor() {
		$("#colorArea")
				.append(
						"<input type='text' id='" + colorIdx
						+ "' name='i_color'/><input type='button' id='"
								+ colorIdx
								+ "' value='x' onclick='deleteColor("
								+ (colorIdx++) + ")'>");
	}

	function deleteColor(colorIdx) {
		$("input[type='text']").remove("#" + colorIdx);
		$("input[type='button']").remove("#" + colorIdx);
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
						<form id="itemInfo" class="form-horizontal"
							enctype="multipart/form-data">
							<c:if test="${itemVO.i_name ne null}">
								<input type="hidden" name="i_idx" value="${ itemVO.i_idx}" />
							</c:if>
							<div class="card-body">
								<c:choose>
									<c:when test="${itemVO.i_name eq null}">
										<h4 class="card-title">상품 등록(*는 필수 기재입니다)</h4>
									</c:when>
									<c:when test="${itemVO.i_name ne null}">
										<h4 class="card-title">상품 수정</h4>
									</c:when>
								</c:choose>
								<div class="form-group row">
									<label for="fname"
										class="col-sm-3 text-right control-label col-form-label">*상품명</label>
									<div class="col-sm-9">
										<input type="text" name="i_name" class="form-control"
											value="${itemVO.i_name} " id="iName">
									</div>
								</div>
								<div class="form-group row">
									<label for="lname"
										class="col-sm-3 text-right control-label col-form-label">*가격</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="i_price"
											value="${itemVO.i_price}">
									</div>
								</div>
								<c:if test="${itemVO.i_name eq null}">
									<div class="form-group row">
										<label for="lname"
											class="col-sm-3 text-right control-label col-form-label">*사이즈</label>
										<div class="col-sm-9" style="margin-top: 5px;">
											<div class="form-check-inline">
												<label class="form-check-label"> <input
													type="checkbox" class="form-check-input" name="i_size"
													value="S">S
												</label>
											</div>
											<div class="form-check-inline">
												<label class="form-check-label"> <input
													type="checkbox" class="form-check-input" name="i_size"
													value="M">M
												</label>
											</div>
											<div class="form-check-inline">
												<label class="form-check-label"> <input
													type="checkbox" class="form-check-input" name="i_size"
													value="L">L
												</label>
											</div>
											<div class="form-check-inline">
												<label class="form-check-label"> <input
													type="checkbox" class="form-check-input" name="i_size"
													value="XL">XL
												</label>
											</div>
										</div>
									</div>
									<div class="form-group row">
										<label for="fname"
											class="col-sm-3 text-right control-label col-form-label">*색상</label>
										<div id="colorArea" class="col-sm-2"></div>
										<div class="col-sm-5">
											<button type="button" class="btn btn-info"
												onclick="addColor();">색상 추가</button>
										</div>
									</div>
									<div class="form-group row">
										<label for="cono1"
											class="col-sm-3 text-right control-label col-form-label">(대)분류</label>
										<div class="col-sm-3">
											<select class="form-control" name="c_categoryNum"
												onchange="selectCS_category();" id="c_category">
												<c:forEach items="${categoryList }" var="categoryList">
													<c:choose>
														<c:when
															test="${categoryList.c_categoryName eq itemVO.c_categoryName}">
															<option selected="selected"
																value="${categoryList.cn_idx }">${categoryList.c_categoryName }(${categoryList.c_categoryCount })</option>
														</c:when>
														<c:when
															test="${categoryList.c_categoryName ne itemVO.c_categoryName}">
															<option value="${categoryList.cn_idx }">${categoryList.c_categoryName }(${categoryList.c_categoryCount })</option>
														</c:when>
													</c:choose>
												</c:forEach>
											</select>
										</div>
										<label for="cono1"
											class="col-sm-3 text-right control-label col-form-label">(소)분류</label>
										<div class="col-sm-3" id="cs_category">
											<select class="form-control" id="cs_categoryNum">
												<option selected="selected" value="">*대분류를 선택해주세요</option>
											</select>
										</div>
									</div>
								</c:if>
								<div class="form-group row">
									<label for="lname"
										class="col-sm-3 text-right control-label col-form-label">대표이미지</label>
									<div class="col-sm-9">
										<div class="custom-file">
											<input type="file" name="ImgMain" class="custom-file-input"
												onchange="changeFile(this,'mainImgText','Main');"> <label
												class="custom-file-label" for="validatedCustomFile"
												id="mainImgText">${itemVO.img_path }</label>
										</div>
										<br />
										<c:choose>
											<c:when test="${itemVO.img_path eq null}">
												<img id="mainImgMain"
													src="${pageContext.request.contextPath}/resources/backend/image/background.jpg"
													style="width: 1000px; height: 300px;">
											</c:when>
											<c:when test="${itemVO.img_path ne null}">
												<img id="mainImgMain"
													src="${pageContext.request.contextPath}/resources/backend/image/${itemVO.img_path}"
													style="width: 1000px; height: 300px;">
											</c:when>
										</c:choose>
									</div>
								</div>
								<div class="form-group row">
									<label for="lname"
										class="col-sm-3 text-right control-label col-form-label">상세페이지</label>
									<div class="col-sm-9">
										<div class="custom-file">
											<input type="file" name="ImgDetail" class="custom-file-input"
												onchange="changeFile(this,'detailImgText','Sub');">
											<label class="custom-file-label" for="validatedCustomFile"
												id="detailImgText">${itemVO.i_detailimg }</label>
										</div>
										<br />
										<c:choose>
											<c:when test="${itemVO.i_detailimg eq null}">
												<img id="mainImgSub"
													src="${pageContext.request.contextPath}/resources/backend/image/background.jpg"
													style="width: 1000px; height: 300px;">
											</c:when>
											<c:when test="${itemVO.i_detailimg ne null}">
												<img id="mainImgSub"
													src="${pageContext.request.contextPath}/resources/backend/image/${itemVO.i_detailimg}"
													style="width: 1000px; height: 300px;">
											</c:when>
										</c:choose>
									</div>
								</div>
								<div class="form-group row">
									<label for="cono1"
										class="col-sm-3 text-right control-label col-form-label">상품
										정보</label>
									<div class="col-sm-9">
										<textarea name="i_info" id="i_info" class="form-control">${ itemVO.i_info}</textarea>
									</div>
								</div>
							</div>
							<div class="border-top">
								<div class="card-body">
									<c:choose>
										<c:when test="${itemVO.i_name eq null}">
											<input type="button" class="btn btn-primary" value="상품 등록"
												onclick="submitPage('add')" />
										</c:when>
										<c:when test="${itemVO.i_name ne null}">
											<input type="button" class="btn btn-primary" value="상품 수정"
												onclick="submitPage('modify')" />
										</c:when>
									</c:choose>
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