<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<aside class="left-sidebar" data-sidebarbg="skin5">
	<!-- Sidebar scroll-->
	<div class="scroll-sidebar">
		<!-- Sidebar navigation-->
		<nav class="sidebar-nav">
			<ul id="sidebarnav" class="p-t-30">
				<li class="sidebar-item"><a
					class="sidebar-link has-arrow waves-effect waves-dark"
					href="javascript:void(0)" aria-expanded="false"><i
						class="mdi mdi-view-dashboard"></i><span class="hide-menu">상품
							관리 </span></a>
					<ul aria-expanded="false" class="collapse  first-level">
						<li class="sidebar-item"><a href="./itemList.do"
							class="sidebar-link"><i class="mdi mdi-note-outline"></i><span
								class="hide-menu"> 상품 목록 </span></a></li>
						<li class="sidebar-item"><a href="./addItem.do"
							class="sidebar-link"><i class="mdi mdi-pencil"></i><span
								class="hide-menu"> 상품 등록 </span></a></li>
						<li class="sidebar-item"><a href="./addAllItem.do"
							class="sidebar-link"><i class="mdi mdi-note-plus"></i><span
								class="hide-menu"> 상품 일괄 등록 </span></a></li>
					</ul></li>
				<li class="sidebar-item"><a
					class="sidebar-link has-arrow waves-effect waves-dark"
					href="javascript:void(0)" aria-expanded="false"><i
						class="mdi mdi-face"></i><span class="hide-menu">회원 관리 </span></a>
					<ul aria-expanded="false" class="collapse  first-level">
						<li class="sidebar-item"><a href="./userList.do"
							class="sidebar-link"><i class="mdi mdi-emoticon"></i><span
								class="hide-menu"> 회원 목록 </span></a></li>
					</ul></li>
				<li class="sidebar-item"><a
					class="sidebar-link waves-effect waves-dark sidebar-link"
					href="./orderList.do" aria-expanded="false"><i
						class="mdi mdi-blur-linear"></i><span class="hide-menu">주문
							관리</span></a></li>
				<li class="sidebar-item"><a
					class="sidebar-link waves-effect waves-dark sidebar-link"
					href="./categoryList.do" aria-expanded="false"><i
						class="mdi mdi-pencil"></i><span class="hide-menu">카테고리 관리</span></a></li>
				<li class="sidebar-item"><a
					class="sidebar-link waves-effect waves-dark sidebar-link" href="#"
					aria-expanded="false"><i class="mdi mdi-pencil"></i><span
						class="hide-menu">후기 관리</span></a></li>
				<li class="sidebar-item"><a
					class="sidebar-link waves-effect waves-dark sidebar-link"
					href="./chart.do" aria-expanded="false"><i
						class="mdi mdi-chart-bar"></i><span class="hide-menu">매출 관리</span></a></li>
				<li class="sidebar-item"><a
					class="sidebar-link has-arrow waves-effect waves-dark"
					href="javascript:void(0)" aria-expanded="false"><i
						class="mdi mdi-account-key"></i><span class="hide-menu">사용자
					</span></a>
					<ul aria-expanded="false" class="collapse  first-level">
						<li class="sidebar-item"><a href="authentication-login.html"
							class="sidebar-link"><i class="mdi mdi-all-inclusive"></i><span
								class="hide-menu"> 로그인 </span></a></li>
					</ul></li>
			</ul>
		</nav>
		<!-- End Sidebar navigation -->
	</div>
	<!-- End Sidebar scroll-->
</aside>