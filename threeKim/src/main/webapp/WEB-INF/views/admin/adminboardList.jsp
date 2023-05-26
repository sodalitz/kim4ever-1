<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/fonts.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_admin.css">  

<style>


#main{width:1220px; margin:35px auto 70px; text-align:center;}
#main #content{width:1440px; height:2400px;}
#main #content h2{text-align:left; margin-top:50px; margin-left:160px; font-family: 'GangwonEdu_OTFBoldA'; font-size:25px;}
#main #bottom{width:1440px; height:300px;}
#content table {width:80%; border-collapse:collapse; margin:60px auto 0; line-height:100px; font-size:24px; font-family: 'omyu_pretty'; cursor:pointer;}
#content table th{width:100px;padding: 10px;text-align: center; border-top:3px solid #000 ;border-bottom:3px solid #000;}
#content table td{padding: 10px; text-align:center;border-bottom:1px solid #CCCCCC;}
#content table tr th:nth-child(1){width: 20px;}
#content table tr th:nth-child(2){width: 80px;}
#content table tr th:nth-child(3){width: 80px;}
#content table tr th:nth-child(4){width: 80px;}
#content table tr th:nth-child(5){width: 20px;}
#content #btn{text-align:right; margin-top:20px; margin-right:144px; }
#content #btn button{width:100px; height:40px; text-align:center; font-family: 'omyu_pretty'; font-size:21px; border-radius:10px; border:0px solid #ff9933; background:#ff9933;}
#content #btn button:active {background:#ffcc66; box-shadow:0 2px 2px rgba(0,0,0,0.1); transform:translateY(2px);}
/*메뉴바 테이블*/
.tab__contents {display:none;}
.show {display: block;}
.tab__list li{
  display: inline-block;
  border: 1px solid #ccc;
  background-color: #f8f8f8;
  padding: 10px 20px;
  cursor: pointer;
  margin-top:30px;
  font-family: 'omyu_pretty';
  font-size:21px;
  border-radius:5px;
}
.tab__list__item.active {background-color:#333;color:#fff;border:1px solid #333;}


</style>

</head>
<body>
<%@include file="../header4.jsp" %>
<div id="main">

   
	<div id="content">
		<div class="tab">
	       <ul class="tab__list">
		        <li class="tab__list__item active" data-list="1">
		            공지사항
		        </li>
		        
		        <li class="tab__list__item" data-list="2">
		            문의게시판
		        </li>
		        
		        <li class="tab__list__item" data-list="3">
		            자주묻는질문
		        </li>
	    	</ul>
	    	
	    <div class="tab__contents show" data-order="1">
	        <h2>공지사항</h2>
              	<table>
	            <tr>
	               <th>No</th>
	               <th>제목</th>
	               <th>작성자</th>
	               <th>작성일</th>
	               <th>조회수</th>
	            </tr>
	         
	            <tr>
	               <td>1</td>
	               <td onclick="location.href='<%=request.getContextPath()%>/board/boardNoticeContent.do'">공지사항</td>
	               <td>관리자</td>
	               <td>2023-04-26</td>
	               <td>17</td>
	            </tr>
	            
	            <tr>
	               <td>2</td>
	               <td onclick="location.href='<%=request.getContextPath()%>/board/boardNoticeContent.do'">신규 지도 업데이트</td>
	               <td>관리자</td>
	               <td>2023-04-26</td>
	               <td>17</td>
	            </tr>
	               
	      		</table>
	      		<div id="btn">
         		<button type="button" onclick="location.href='<%=request.getContextPath()%>/board/boardNoticeWrite.do'">작성</button>
         		</div> 
        </div>
        
        <div class="tab__contents" data-order="2">
	        <h2>문의게시판</h2>
              	<table>
	            <tr>
	               <th>No</th>
	               <th>제목</th>
	               <th>작성자</th>
	               <th>작성일</th>
	               <th>조회수</th>
	            </tr>
	         
	            <tr>
	               <td>1</td>
	               <td onclick="location.href='<%=request.getContextPath()%>/board/boardQnaContent.do'">결제 방법 문의</td>
	               <td>김아무개</td>
	               <td>2023-04-26</td>
	               <td>17</td>
	            </tr>
	            
	            <tr>
	               <td>2</td>
	               <td onclick="location.href='<%=request.getContextPath()%>/board/boardQnaContent.do'">대여소 설치요청 하고싶어요</td>
	               <td>김진상</td>
	               <td>2023-05-21</td>
	               <td>7</td>
	            </tr>
	            
	           
	            </table>
	            <div id="btn">
         		<button type="button" onclick="location.href='<%=request.getContextPath()%>/board/boardQnaWrite.do'">작성</button>
         		</div> 
        </div>
       
        <div class="tab__contents" data-order="3">
	        <h2>자주묻는질문</h2>
              	<table>
	            <tr>
	               <th>No</th>
	               <th>제목</th>
	               <th>작성자</th>
	               <th>작성일</th>
	               <th>조회수</th>
	            </tr>
	         
	            <tr>
	               <td>1</td>
	               <td onclick="location.href='<%=request.getContextPath()%>/board/boardFaqContent.do'">자전거 보험 안내</td>
	               <td>김똥개</td>
	               <td>2023-04-26</td>
	               <td>17</td>
	            </tr>
	            
	             <tr>
	               <td>2</td>
	               <td onclick="location.href='<%=request.getContextPath()%>/board/boardFaqContent.do'">대여한 곳에만 반납해야 하나요?</td>
	               <td>김장군</td>
	               <td>2023-05-26</td>
	               <td>12</td>
	            </tr>
	            
	            </table>
	            <div id="btn">
         		<button type="button" onclick="location.href='<%=request.getContextPath()%>/board/boardFaqWrite.do'">작성</button>
         		</div> 
        </div>
        
<script>
const tab = document.querySelector(".tab");
const tabListItems = document.querySelectorAll(".tab__list__item");
const tabContents = document.querySelectorAll(".tab__contents");
const activeItem = document.querySelector(".active");
const showing = document.querySelector(".show");

tab.addEventListener("click", (e)=> {
  const listOrder = e.target.dataset.list;
  tabListItems.forEach(function (item) {
    item.classList.remove("active");
  });
  e.target.classList.add("active");
  if (listOrder) { 
    tabContents.forEach(function (element) {
      if (element.dataset.order == listOrder) {
        element.classList.add("show");
      } else {
        element.classList.remove("show");
      }
    });
  }
});

</script>
	
	 	</div>
       
   </div>
   
   
   <div id="bottom">
  
   </div>
</div>
</body>
<%@include file="../footer.jsp" %>
</html>