<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%

            Date currentDate = new Date();
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String formattedDate = dateFormat.format(currentDate);
            pageContext.setAttribute("currentTime", formattedDate);
            
            
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>타다-반납하기</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/fonts.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_bikeRent.css">
		<script src="https://code.jquery.com/jquery-3.6.0.js"></script> 
		
		<style type="text/css">
			/*헤더영역 메뉴*/
			header #menu{display: none;}
			/*틀부분*/
			.container{border: 1px solid #bbb;margin: 40px auto;width: 55%;padding: 20px;background-color: #f1f1f1;border-radius: 10px;}
			.container>div{padding: 20px; text-align: left;}
			.container>div>p{display: inline-block; } 
			.container>div>p:nth-child(1){width: 40%; margin-left: 60px;} 
			.container>div>p:nth-child(2){width: 5%;} 
			.container{font-size: 24px;}
			.container h1{font-size: 50px; text-align: center;}
			.container h2{font-size: 40px; text-align: center;}
			.container button{display:inline-block; width:45%; height:55px; margin-top:0px;text-align:center; font-family:'omyu_pretty'; font-size:25px; border-radius:10px; border:0px solid #ff9933; background:#ff9933;}
			.container button:active{background:#ffcc66; box-shadow:0 2px 2px rgba(0,0,0,0.1); transform:translateY(2px);}
			/*이용내역 내용*/
			#useInfo{width: 80%;}
			/*이용내역 내용 버튼*/
			#useListBtn{text-align: center;}
			
			  
		</style>
		<script type="text/javascript">
			$(document).ready(function(){
		    	$("#btn1").click(function(){
	
		            var fm = document.frm;
		      			
		      			 fm.action ="<%=request.getContextPath()%>/bikeRent/bikeRentReturnAction.do";  
		      			 fm.method = "POST";
		      			 fm.submit();
		
		       });//$("#btn1").click(function(){-----end
				
			});
		</script>  
	</head>
	<body>
		<%@include file="../header.jsp" %>
		<main id="main">
			<section id="content">
				<form id="frm" name="frm">
					<div class="container">
						<div>
							<input type="hidden" name="ridx" value="${ridx}">
							<input type="hidden" name="rsidx" value="${rsidx}">
						</div>
						<div><h1>이용내역</h1></div>
						<div><p id="useInfo">
							이용안내이용안내이용안내이용안내이용안내이용안내이용안내이용안내이용안내이용안내이용안내이용안내이용안내이용안내이용안내
							이용안내이용안내이용안내이용안내이용안내이용안내이용안내이용안내이용안내이용안내이용안내이용안내이용안내이용안내이용안내
							이용안내이용안내이용안내이용안내이용안내이용안내
						</p></div>
						<div><h2>현재 ㅁㅁㅁ을 반납중입니다.</h2></div>
						<div><p>대여한 자전거 대여소 위치</p><p>:</p><p>${bjv.rentPlace} 대여소</p></div>
						<div><p>반납할 자전거 대여소 위치</p><p>:</p><p>${bjv.rentalshopName} 대여소</p></div>
						<div><p>사용자 이름</p><p>:</p><p>${bjv.memberName}</p></div>
						<div><p>자전거 고유번호</p><p>:</p><p>${bjv.bkidx}</p></div>
						<div><p>대여한 자전거 시간</p><p>:</p><p>${bjv.rentDay}</p></div>
						<div><p>반납할 자전거 시간</p><p>:</p><p>${currentTime}</p></div>
						<div><p>대여한 자전거 이용 요금</p><p>:</p><p>${bjv.rentPrice}원</p></div>
						<div id="useListBtn">
							<button onclick="location.href='<%=request.getContextPath()%>/bikeRent/bikeRentFault.do'">고장/신고</button>
							<button type="button" id="btn1">최종 반납하기</button>			 		
						</div>
					</div>
				</form>
			</section>
		</main>
		<%@include file="../footer.jsp" %>
	</body>
</html>