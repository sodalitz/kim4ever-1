<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>타다-자전거 소개</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/fonts.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_bikeRent.css"> 
		<style type="text/css">
		 
		 </style> 
	</head>
	<body>
		<%@include file="../header.jsp" %>
		<main id="main">
			<section class="container">
			<div id="content">
				<table id="bikeDetail">
				<tr>
					<td rowspan="10"><img src="../resources/bikeimg/일반자전거.jpg" alt="일반자전거"></td>
					<td colspan="3"><h2>일반 자전거</h2></td>
				</tr>
			
				<tr>
					<td colspan="3">남녀노소 즐길 수 있는 자전거입니다!</td>
				</tr>
			
				<tr>
					<td colspan="3">자전거 고유번호 : hy0101</td>	
				</tr>
				
				<tr>
					<td colspan="3">대여소 위치 : 오목대여소</td>
				</tr>
				
				<tr>
					<td colspan="3">이용 요금 : 1000원</td>
				</tr>
			
				<tr>
				  <td colspan="3">
				    <label for="phone-number">휴대폰번호</label>
				  </td>
				</tr>
				
				<tr>
				  <td colspan="2">
				    <input type="text" id="phone-number" oninput="autoHyphen2(this)" maxlength="13">
				  </td>
				  
				  <td>
				    <button type="button" onclick="sendVerificationCode()">인증번호발송</button>
				  </td>
				</tr>
				
				<tr>
				  <td colspan="3">
				    <label for="verification-code">인증번호</label>
				  </td>
				</tr>
				
				<tr>
				  <td colspan="2">
				    <input type="text" id="verification-code" style="flex: 1; width: 210;" maxlength="6">
				  </td>
				  
				  <td>
				    <button type="button" onclick="verifyCode()">인증확인</button>
				  </td>
				</tr>
				  
				<tr>
				  <td colspan="3">
				  	<button type="button" style="width:100%; height:50px;" onclick="location.href='<%=request.getContextPath()%>/bikeRent/bikeRentHistory.do'">대여하기</button>
				  </td>
				</tr>
			</table>
			</div>
			</section> 
		</main>
		<%@include file="../footer.jsp" %>
	</body>
<script type="text/javascript">
function autoHyphen2(target) {
	  target.value = target.value
	    .replace(/[^0-9]/g, '')
	    .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3")
	    .replace(/(\-{1,2})$/g, "");
	}
</script>
</html>