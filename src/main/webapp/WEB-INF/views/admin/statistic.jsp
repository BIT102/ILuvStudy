<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>계정 관리</title>
    <!-- VENDOR CSS -->
	<link rel="stylesheet" href="/resources/vendor/chartist/css/chartist-custom.css">
	<!-- GOOGLE FONTS -->
	<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700" rel="stylesheet">
<style>
#line-chart, #line-chart2{
width:100%;
}
</style>
</head>
<body>
<div id="wrapper">
<%@ include file="nav.jsp" %>
	 <!-- MAIN -->
		<div class="main">
			<!-- MAIN CONTENT -->
			<div class="main-content">
				<div class="container-fluid">
					<h3 class="page-title">통계관리</h3>
        <!-- <div class="panel-body"> -->
					<!-- OVERVIEW -->
					<ul class="nav nav-tabs">
						<li class="active"><a href="#tab1" data-toggle="tab">방문자 수</a></li>
						<li><a href="#tab2" data-toggle="tab">가입자 수</a></li>
						<li><a href="#tab3" data-toggle="tab">스터디 수</a></li>
					</ul>
					
				 	<div class="panel">
				 	<div class="panel-body tabs"> 
					
					<div class="tab-content">
<!-- ========= 방문자 통계 ============== -->					
					<div class="tab-pane fade in active" id="tab1">
						<h4>방문자 통계</h4>
							<div class="row">
								<div class="col-md-3">
									<div class="metric">
										<span class="icon"><i class="fa fa-leaf" style="margin-top:15px"></i></span>
										<p>
											<span class="number">${statisticVO.toDVisit}</span>
											<span class="title">오늘 방문자 수</span>
										</p>
									</div>
								</div>
								<div class="col-md-3">
									<div class="metric">
										<span class="icon"><i class="fa fa-paw" style="margin-top:15px"></i></span>
										<p>
											<%-- span class="number">${statisticVO.yesterDMember}</span>
											<span class="title">어제 가입자수</span> --%>
											<span class="number">${statisticVO.yesterDVisit}</span>
											<span class="title">어제 방문자 수</span>
										</p>
									</div>
								</div>
								<div class="col-md-3">
									<div class="metric">
										<span class="icon"><i class="fa fa-eye" style="margin-top:15px"></i></span>
										<p>
											<span class="number" id="weektv"></span>
											<span class="title">주간 방문자 수</span> 
										</p>
									</div>
								</div>
								<div class="col-md-3">
									<div class="metric">
										<span class="icon"><i class="fa fa-bar-chart" style="margin-top:15px"></i></span>
										<p>
											<%-- <span class="number">${statisticVO.totalWithdrawal}</span>
											<span class="title">전체 탈퇴회원수</span> --%>
											<span class="number">${statisticVO.totalVisit}</span>
											<span class="title">전체 방문자 수</span>
										</p>
									</div>
								</div>
							</div> 

							<div class="row">
<!-- 								<div class="col-md-12">
									<span style="color:rgba(48, 164, 255, 1)">■</span>&nbsp;가입자 수&nbsp;&nbsp;
									<span style="color:rgba(220,220,220,1)">■</span>&nbsp;방문자 수
								</div> -->
								<div class="col-md-12">
									<!-- 다른 템플릿 추가 -->
									<div class="canvas-wrapper"> 
										<canvas class="main-chart" id="line-chart" width="1000" height="300"></canvas>
									</div>
									<!-- 추가 끝 -->
								</div>
							</div>
					</div><!-- tab1 end -->
<!-- ========= 가입자 통계 ============== -->					
					<div class="tab-pane fade" id="tab2">
						<h4>가입자 통계</h4>
							<div class="row">
								<div class="col-md-3">
									<div class="metric">
										<span class="icon"><i class="fa fa-leaf" style="margin-top:15px"></i></span>
										<p>
											<span class="number">${statisticVO.toDMember}</span>
											<span class="title">오늘 가입자 수</span>
										</p>
									</div>
								</div>
								<div class="col-md-3">
									<div class="metric">
										<span class="icon"><i class="fa fa-paw" style="margin-top:15px"></i></span>
										<p>
											<span class="number">${statisticVO.yesterDMember}</span>
											<span class="title">어제 가입자 수</span>
										</p>
									</div>
								</div>
								<div class="col-md-3">
									<div class="metric">
										<span class="icon"><i class="fa fa-eye" style="margin-top:15px"></i></span>
										<p>
											<span class="number" id="weektm"></span>
											<span class="title">주간 가입자 수</span>
										</p>
									</div>
								</div>
								<div class="col-md-3">
									<div class="metric">
										<span class="icon"><i class="fa fa-bar-chart" style="margin-top:15px"></i></span>
										<p>
											<span class="number">${statisticVO.totalMember}</span>
											<span class="title">전체 회원 수</span>
										</p>
									</div>
								</div>
							</div> 

							<div class="row">
								<div class="col-md-12">
									<div class="canvas-wrapper" > 
										<canvas class="main-chart" id="line-chart2" width="1000" height="300"></canvas>
									</div>
								</div>
							</div>
					</div>
<!-- ========= 스터디 통계 ============== -->
					<div class="tab-pane fade" id="tab3">
						<h4>스터디 통계</h4>
							<div class="row">
								<div class="col-md-3">
									<div class="metric">
										<span class="icon"><i class="fa fa-leaf" style="margin-top:15px"></i></span>
										<p>
											<span class="number" id="weekts"></span>
											<span class="title">주간 스터디 등록 수</span>
										</p>
									</div>
								</div>
								<div class="col-md-3">
									<div class="metric">
										<span class="icon"><i class="fa fa-paw" style="margin-top:15px"></i></span>
										<p>
											<span class="number" id="weekta"></span>
											<span class="title">주간 스터디 신청 수</span>
										</p>
									</div>
								</div>
								<div class="col-md-3">
									<div class="metric">
										<span class="icon"><i class="fa fa-eye" style="margin-top:15px"></i></span>
										<p>
											<span class="number">${statisticVO.totalStudy}</span>
											<span class="title">전체 스터디 등록 수</span>
										</p>
									</div>
								</div>
								<div class="col-md-3">
									<div class="metric">
										<span class="icon"><i class="fa fa-bar-chart" style="margin-top:15px"></i></span>
										<p>
											<span class="number">${statisticVO.totalApply}</span>
											<span class="title">전체 스터디 신청 수</span>
										</p>
									</div>
								</div>
							</div> 

							<div class="row">
							 	<div class="col-md-12">
									<span style="color:rgba(48, 164, 255, 1)">■</span>&nbsp;스터디 등록 수&nbsp;&nbsp;
									<span style="color:rgba(220,220,220,1)">■</span>&nbsp;스터디 신청 수
								</div>
								<div class="col-md-12">
									<div class="canvas-wrapper" > 
										<canvas class="main-chart" id="line-chart3" width="1000" height="300"></canvas>
									</div>
								</div>
							</div>
							<br><br><br>
							
<!-- ======스터디 조회수 상위 10개 ===========-->
							<h4>스터디 조회 수 TOP10</h4>				
							<div class="row">
							<div class="col-md-12">
							<table class="table table-striped">
           		 				<tr>
              						<th>스터디 번호</th>
                					<th>스터디명</th>
                					<th>스터디방장</th>
                					<th>지역</th>
                					<th>스터디 상태</th>
                					<th>스터디 시작일</th>
                					<th>스터디 마감일</th>
                					<th>조회 수</th>
            					</tr>
<!-- DB데이터 가져옴 -->
<c:forEach items="${studytop}" var="studyVO">
            <tr>
                <td>${studyVO.bno}</td>
                <td>${studyVO.title}</td>
                <td>${studyVO.writer}</td>
                <td>${studyVO.rDName} ${studyVO.rSName}</td>
                <td>
                	<!-- 시작일, 마감일과 now 비교  -->
                	<jsp:useBean id="now" class="java.util.Date" />
                	<c:if test="${studyVO.sd > now}">모집중</c:if>
                	<c:if test="${studyVO.sd <= now && studyVO.enddate >= now}">진행중</c:if>
                	<c:if test="${studyVO.enddate < now}">마감</c:if>
                </td>
                <td>${studyVO.sd}</td>
                <td><fmt:formatDate pattern="yyyy-MM-dd" value="${studyVO.enddate}"/></td>
                <td>${studyVO.vct}</td>
            </tr>
</c:forEach>
        				</table>
        				</div>
        				</div>
        				
					</div>
					<!-- tab3 끝 -->
					
					</div>
					</div>
					</div>
					
					<!-- END OVERVIEW -->
					
					</div>
				</div>
			<!-- END MAIN CONTENT -->
			</div>
		<!-- END MAIN -->
		</div>

<script src="/resources/vendor/jquery.easy-pie-chart/jquery.easypiechart.min.js"></script>
<!-- <script src="/resources/vendor/chartist/js/chartist.min.js"></script> -->

<!-- 추가 템플릿 -->
<script src="/resources/js/chart.min.js"></script>
<!-- <script src="/resources/js/chart-data.js"></script> -->
<script src="/resources/js/easypiechart.js"></script>
<script src="/resources/js/easypiechart-data.js"></script>
<script src="/resources/js/bootstrap-datepicker.js"></script>
<script src="/resources/js/custom.js"></script>
<!-- 추가끝 -->

<script>
	$(document).ready(function(){	
		$("#statisticnav").attr("class", "active");
		
	});
	
	// 다른 템플릿 겟 
	window.onload = function () {
		var day = [];	//날짜 저장
		var weekm = [];	//가입자 수 저장
		var weekv = [];	//방문자 수 저장
		var weeks = [];	//스터디 등록 수 저장
		var weeka = [];	//스터디 신청 수 저장
		var weektm = 0; //주간 총 가입자수
		var weektv = 0; //주간 총 방문자수
		var weekts = 0; //주간 총 스터디 등록 수
		var weekta = 0; //주간 총 스터디 신청 수
		
		//배열 위치 지정 변수
		<% int cnt = 0; %>
		
		//최근 8일 가입자 수 불러오기
		<c:forEach items="${weekm}" var="StatisticVO">	
			day[<%=cnt%>] = "${StatisticVO.day}";		//날짜 담아줌
			weekm[<%=cnt%>] = "${StatisticVO.weekMember}"; //가입자수 담아줌
			<% cnt++; %>
		</c:forEach>
		
		<%cnt = 0;%>
		
		//최근 8일 방문자 수 불러오기
		<c:forEach items="${weekv}" var="StatisticVO">	
			weekv[<%=cnt%>] = "${StatisticVO.weekVisit}"; //방문자수 담아줌
			<% cnt++; %>
		</c:forEach>	
		
		<%cnt = 0;%>
		
		//최근 8일 스터디 등록 수 불러오기
		<c:forEach items="${weeks}" var="StatisticVO">	
			weeks[<%=cnt%>] = "${StatisticVO.weekStudy}"; //스터디 등록 수 담아줌
			<% cnt++; %>
		</c:forEach>
		
		<%cnt = 0;%>
		
		//최근 8일 스터디 신청 수 불러오기
		<c:forEach items="${weeka}" var="StatisticVO">	
			weeka[<%=cnt%>] = "${StatisticVO.weekApply}"; //스터디 신청 수 담아줌
			<% cnt++; %>
		</c:forEach>
		
		for(var i=0;i<8;i++){
			weektm += Number(weekm[i]);	//주간 총 가입자수
			weektv += Number(weekv[i]); //주간 총 방문자수
			weekts += Number(weeks[i]); //주간 총 스터디 등록 수
			weekta += Number(weeka[i]); //주간 총 스터디 신청 수
		};
		
		$('#weektm').text(weektm);
		$('#weektv').text(weektv);
		$('#weekts').text(weekts);
		$('#weekta').text(weekta);

		console.log(weekm);
		console.log(weekv);
		console.log(weeks);
		console.log(weeka);
		console.log(day);
		console.log(weektm);
		console.log(weektv);
		console.log(weekts);
		console.log(weekta);
		
		//차트 데이터(방문자 수)
		var lineChartData = {
				labels : day,
				datasets : [
					{
						label: "My First dataset",
						fillColor : "rgba(48, 164, 255, 0.2)",
						strokeColor : "rgba(48, 164, 255, 1)",
						pointColor : "rgba(48, 164, 255, 1)",
						pointStrokeColor : "#fff",
						pointHighlightFill : "#fff",
						pointHighlightStroke : "rgba(48, 164, 255, 1)",
						data : weekv  //파랑색, 방문자 수
					}
				]
			}
		
		//line-chart id에 차트 추가
		var chart1 = document.getElementById("line-chart").getContext("2d");
		myLine = new Chart(chart1).Line(lineChartData, {
			responsive: false,
			scaleLineColor: "rgba(0,0,0,.2)",
			scaleGridLineColor: "rgba(0,0,0,.05)",
			scaleFontColor: "#c5c7cc"
		});
		
		//차트 데이터(가입자 수)
		var lineChartData2 = {
				labels : day,
				datasets : [
					{
						label: "My First dataset",
						fillColor : "rgba(48, 164, 255, 0.2)",
						strokeColor : "rgba(48, 164, 255, 1)",
						pointColor : "rgba(48, 164, 255, 1)",
						pointStrokeColor : "#fff",
						pointHighlightFill : "#fff",
						pointHighlightStroke : "rgba(48, 164, 255, 1)",
						data : weekm  //파랑색, 가입자 수
					}
				]
		}
		
		//line-chart2 id에 차트 추가
		var chart2 = document.getElementById("line-chart2").getContext("2d");
		window.myLine2 = new Chart(chart2).Line(lineChartData2, {
			responsive: false,
			scaleLineColor: "rgba(0,0,0,.2)",
			scaleGridLineColor: "rgba(0,0,0,.05)",
			
		});
		
		//차트 데이터(스터디 등록 수, 스터디 신청 수)
		var lineChartData3 = {
				labels : day,
				datasets : [
					{
						label: "My First dataset",
						fillColor : "rgba(48, 164, 255, 0.2)",
						strokeColor : "rgba(48, 164, 255, 1)",
						pointColor : "rgba(48, 164, 255, 1)",
						pointStrokeColor : "#fff",
						pointHighlightFill : "#fff",
						pointHighlightStroke : "rgba(48, 164, 255, 1)",
						data : weeks  //파랑색, 스터디 등록 수
					},
					{
						label: "My Second dataset",
						fillColor : "rgba(220,220,220,0.2)",
						strokeColor : "rgba(220,220,220,1)",
						pointColor : "rgba(220,220,220,1)",
						pointStrokeColor : "#fff",
						pointHighlightFill : "#fff",
						pointHighlightStroke : "rgba(220,220,220,1)",
						data : weeka  //회색, 스터디 신청 수
					}
				]
			}
		
		//line-chart3 id에 차트 추가
		var chart3 = document.getElementById("line-chart3").getContext("2d");
		window.myLine3 = new Chart(chart3).Line(lineChartData3, {
			responsive: false,
			scaleLineColor: "rgba(0,0,0,.2)",
			scaleGridLineColor: "rgba(0,0,0,.05)",
			
		});
		
		//캔버스 크기 조정
		var canvas = document.getElementById('line-chart');
		var canvas2 = document.getElementById('line-chart2');
		var canvas3 = document.getElementById('line-chart3');
		canvas.style.width = '100%';
		canvas2.style.width = '100%';
		canvas3.style.width = '100%';
		canvas.style.height = '100%';
		canvas2.style.height = '100%';
		canvas3.style.height = '100%';
		
	}
	//끝
	
</script>
</body>
</html>