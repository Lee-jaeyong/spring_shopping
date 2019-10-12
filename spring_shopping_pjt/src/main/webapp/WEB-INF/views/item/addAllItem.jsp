<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html dir="ltr">
<%@include file="../include/pageHead.jsp"%>
<script type="text/javascript">
	function excelUpload() {
		$.ajax({
			url : "<c:url value='/excelUpload'/>",
			dataType : "json",
			data : {
				"path" : $("#excelUpload").val()
			},
			success : function(data) {
				if (data.result == 'true')
					alert("엑셀 업로드 성공");
				else
					alert("엑셀 업로드 중 문제가 발생했습니다.");
			}
		})
	}

	function excelChange(file) {
		$("#excelText").html(file.value);
		$.ajax({
			url : "<c:url value='/excelList'/>",
			dataType : "json",
			data : {
				"path" : $("#excelUpload").val()
			},
			success : function(data) {
				var html = "";
				if (data.result != 'false') {
					for (var i = 0; i < data.result.length; i++) {
						html += "<td>" + data.result[i].i_name + "</td>";
						html += "<td>" + data.result[i].i_price + "</td>";
						html += "<td>" + data.result[i].i_main + "</td>";
						html += "<td>" + data.result[i].i_detail + "</td>";
						html += "<td>" + data.result[i].c_category + "</td>";
						html += "<td>" + data.result[i].cs_category + "</td>";
						html += "<td>" + data.result[i].i_info + "</td>";
					}
				} else {
					alert("잘못된 엑셀 형식입니다.");
				}
				$("#itemSection").html(html);
			}
		})
	}
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
							<div class="row">
								<div class="input-group col-sm-6">
									<div class="custom-file">
										<input id="excelUpload" type="file" class="custom-file-input"
											onchange="excelChange(this);" accept=".xls"><label
											class="custom-file-label" for="validatedCustomFile"
											id="excelText">Choose file...</label>
									</div>
								</div>
								<br />
								<div class="col-sm-6 input-group-append">
									<button class="btn btn-success" onclick="excelUpload();">업로드</button>
								</div>
							</div>
							<br />
							<table id="zero_config"
								class="table table-striped table-bordered">
								<thead>
									<tr>
										<th>상품명</th>
										<th>가격</th>
										<th>메인이미지</th>
										<th>상세이미지</th>
										<th>대분류</th>
										<th>소분류</th>
										<th>상품 정보</th>
									</tr>
								</thead>
								<tbody id="itemSection">
								</tbody>
							</table>
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