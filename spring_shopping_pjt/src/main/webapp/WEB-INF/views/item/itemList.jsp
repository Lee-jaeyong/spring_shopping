<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html dir="ltr">
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
								<tbody>
									<tr>
										<td>Howard Hatfield</td>
										<td>Office Manager</td>
										<td>San Francisco</td>
										<td>51</td>
										<td>2008/12/16</td>
										<td>$164,500</td>
									</tr>
									<tr>
										<td>Hope Fuentes</td>
										<td>Secretary</td>
										<td>San Francisco</td>
										<td>41</td>
										<td>2010/02/12</td>
										<td>$109,850</td>
									</tr>
									<tr>
										<td>Vivian Harrell</td>
										<td>Financial Controller</td>
										<td>San Francisco</td>
										<td>62</td>
										<td>2009/02/14</td>
										<td>$452,500</td>
									</tr>
									<tr>
										<td>Timothy Mooney</td>
										<td>Office Manager</td>
										<td>London</td>
										<td>37</td>
										<td>2008/12/11</td>
										<td>$136,200</td>
									</tr>
									<tr>
										<td>Jackson Bradshaw</td>
										<td>Director</td>
										<td>New York</td>
										<td>65</td>
										<td>2008/09/26</td>
										<td>$645,750</td>
									</tr>
									<tr>
										<td>Olivia Liang</td>
										<td>Support Engineer</td>
										<td>Singapore</td>
										<td>64</td>
										<td>2011/02/03</td>
										<td>$234,500</td>
									</tr>
									<tr>
										<td>Bruno Nash</td>
										<td>Software Engineer</td>
										<td>London</td>
										<td>38</td>
										<td>2011/05/03</td>
										<td>$163,500</td>
									</tr>
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