<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <% BoardVo bv = (BoardVo)request.getAttribute("bv"); %>   

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
/*리셋코드*/ 
*{margin:0;padding:0;}
li{list-style:none;}

@font-face {
    font-family:'GangwonEdu_OTFBoldA';
    src:url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/GangwonEdu_OTFBoldA.woff') format('woff');
    font-weight:normal;
    font-style:normal;
}
@font-face {
    font-family:'omyu_pretty';
    src:url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-01@1.0/omyu_pretty.woff2') format('woff2');
    font-weight:normal;
    font-style:normal;
}
@font-face {
    font-family: KCC-Ganpan';
    src:url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302@1.0/KCC-Ganpan.woff2') format('woff2');
    font-weight:normal;
    font-style:normal;
}

#main{width:1440px; margin:35px auto 70px; text-align:center;}
#main #content{width:1440px; height:auto;}
#main #content h2{text-align:center;  font-family: 'GangwonEdu_OTFBoldA'; font-size:25px;}
#main #bottom{width:1440px; height:300px;}
#content table {width:50%; border-collapse:collapse; margin:60px auto 0; line-height:100px; font-size:24px; font-family: 'omyu_pretty'; cursor:pointer;  white-space: nowrap;  overflow: hidden; text-overflow: ellipsis;}
#content table th{width:100px;padding: 10px;text-align: center; border-top:3px solid #000 ;border-bottom:3px solid #000;}
#content table td{padding: 10px; text-align:center;border-bottom:1px solid #CCCCCC;  }
#content button{width:80px; height:30px; text-align:center; font-family: 'omyu_pretty'; font-size:21px; border-radius:10px; border:0px solid #ff9933; background:#ff9933;}
#content button:active {background:#ffcc66; box-shadow:0 2px 2px rgba(0,0,0,0.1); transform:translateY(2px);}
#content table input{width:250px; height:30px;}
</style>
<script>
    // 에러 메시지가 있다면 알림 창을 띄움
    var errorMsg = "${errorMsg}";
    if (errorMsg !== null && errorMsg !== "") {
        alert(errorMsg);
    }
</script>

</head>
<body>

	<div id="main">
		<%@include file="../header.jsp"%>

		<div id="content">
				<form action="<%=request.getContextPath() %>/member/memberCheckPwdAction.do" method="post">
					<table>
					<tr>
						<td>
							<h2>비밀번호 확인</h2>
						</td>
					</tr>
					
					<tr>
						<td>
						 <label for="password">비밀번호:</label>
						 <input type="password" id="password" name="password" required>
						 <button type="submit">확인</button>
						</td>
					</tr>
					</table>
				</form>	
		</div>
	</div>


		<div id="bottom"></div>
</body>
<%@include file="../footer.jsp"%>
</html>