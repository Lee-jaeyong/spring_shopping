<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html dir="ltr">
<%@include file="../include/pageHead.jsp"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<%@include file="../include/include_JS.html"%>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<script>
	function weekChart() {
		var ctx = document.getElementById("weekChart");
		var weekChart = new Chart(ctx, {
			type : "bar",
			data : {
				labels : [ '월', '화', '수', '목', '금', '토', '일' ],
				datasets : [ {
					data : [ 12, 16, 3, 2, 5, 3, 5 ],
					backgroundColor : [ 'rgba(255,99,132,0.2)',
							'rgba(54,162,235,0.2)', 'rgba(255,206,86,0.2)',
							'rgba(75,192,192,0.2)', 'rgba(75,192,192,0.2)',
							'rgba(153,102,255,0.2)', 'rgba(255,159,64,0.2)' ],
					borderColor : [ 'rgba(255,99,132,1)', 'rgba(54,162,235,1)',
							'rgba(255,206,86,1)', 'rgba(75,192,192,1)',
							'rgba(75,192,192,1)', 'rgba(153,102,255,1)',
							'rgba(255,159,64,1)' ],
					borderWidth : 1
				} ]
			},
			options : {
				scales : {
					yAxes : [ {
						ticks : {
							beginAtZero : true
						}
					} ]
				},
				legend : {
					display : false
				}
			}
		});
	}

	function pieChart() {
		data = {
			datasets : [ {
				backgroundColor : [ 'red', 'blue' ],
				data : [ 10, 20 ]
			} ],
			labels : [ '여성', '남성' ]
		};

		var ctx = document.getElementById("pieChart");
		var pieChart = new Chart(ctx, {
			type : "pie",
			data : data,
			options : {}
		});
	}

	function doughnutChart() {
		data = {
			datasets : [ {
				backgroundColor : [ 'red', 'yellow', 'blue', 'green', 'black' ],
				data : [ 10, 20, 30, 40, 50 ]
			} ],
			labels : [ '10대', '20대', '30대', '40대', '기타' ]
		};

		var ctx = document.getElementById("doughnutChart");
		var doughnutChart = new Chart(ctx, {
			type : "doughnut",
			data : data,
			options : {}
		});
	}

	function plot1() {
		$
				.ajax({
					url : "<c:url value='/getChartTime'/>",
					dataType : "json",
					success : function(data) {
						var ctx = document.getElementById("line-chart")
								.getContext("2d");
						var datas = [ 1, 0, 10, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0,
								0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ];
						for (var i = 0; i < data.length; i++) {
							datas[parseInt(data[i].nowDay.substring(10))] = data[i].timeSumValue;
						}
						var timeLine = [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11,
								12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23,
								24 ];
						var chart = new Chart(ctx, {
							type : "line",
							data : {
								labels : timeLine,
								datasets : [ {
									label : '건',
									backgroundColor : 'transparent',
									borderColor : 'red',
									data : datas
								} ]
							},
							options : {
								legend : {
									display : false
								}
							}
						});
					}
				});
	}
	window.onload = function() {
		weekChart();
		pieChart();
		doughnutChart();
		plot1();
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
						<div class="row">
							<div class="col-md-12">
								<div class="card">
									<div class="card-body">
										<h5 class="card-title">시간대별 매출</h5>
										<div class="flot-chart">
											<canvas height="70px" id="line-chart"></canvas>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<div class="card">
									<div class="card-body">
										<h5 class="card-title">남녀 비율</h5>
										<div class="flot-chart">
											<canvas height="150px" id="pieChart"></canvas>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div class="card">
									<div class="card-body">
										<h5 class="card-title">연령 비율</h5>
										<div class="flot-chart">
											<canvas height="150px" id="doughnutChart"></canvas>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<div class="card">
									<div class="card-body">
										<h5 class="card-title">이번주 요일별 매출</h5>
										<div class="flot-chart">
											<canvas height="80px" id="weekChart"></canvas>
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
</body>
</html>