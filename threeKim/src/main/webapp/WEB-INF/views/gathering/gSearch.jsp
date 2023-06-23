<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>소모임 검색</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/fonts.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_gathering.css">		
		<link rel="stylesheet"  media ="(min-width: 300px) and (max-width: 940px)" href="${pageContext.request.contextPath}/css/style_gathering_mo.css">  
		
		  
		 <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		 <meta name="viewport" content="width=device-width, initial-scale=1">
		   
		 <style type="text/css">
		 	/*검색부분*/
			#SearchPart{margin: 30px 0 30px 0; position: relative;}
			#SearchPart button{position: absolute;width: 50px; height: 50px;border: 0px;background: 0px; top: 3px; right: 225px;}
			#SearchPart img{width: 40px; height: 40px;}
			#keywordMark p{font-size:21px;}
				/*************************모바일****************************************/
				/*****모바일 넓이***/
			@media (min-width: 300px) and (max-width: 940px)  {
			#SearchPart button{position: absolute;width: 50px; height: 30px;border: 0px;background: 0px; top: 3px; right: 0px;}
			#SearchPart img{width: 25px; height: 25px; margin-top:30px; margin-right:10%;}
			#keywordMark p{font-size:21px;}
				}
		 </style>
	</head>
	<body>
	<%@include file="../header2.jsp" %>
	<main id="main">
		<section class="gContainer">
			<form action="<%=request.getContextPath()%>/gathering/gSearch.do" method="GET">
			<div id="SearchPart">
		        <input class="gInput" type="text" id="keyword" name="keyword" value="${empty scri.keyword ? '' : scri.keyword}" placeholder="검색하세요.">
		        <button type="submit"><img src="../resources/icon/loupe.png"></button>
   			</div>
			</form>
			
			<div id="keywordMark">
			<%
			  String keyword = request.getParameter("keyword");
			  if (keyword != null && !keyword.isEmpty()) {
			%>
			  <p>키워드 : <%= keyword %></p>
			<%
			  }
			%>
			</div>
			
			<div class="gContentTitle" >
				<h2>전주 모임 보기</h2>
			</div>
				<div class="gContent gContentB" >
					<c:forEach var="gjv" items="${gjvlist}">
						<div class="card" >
							<img class="cardImg" src="../resources/GTImages/${gjv.imageName}">
							<c:choose>
								<c:when test="${gjv.gwidx != 0}">
								<img class="cardWish" src="../resources/icon/fullheart.png" onclick="handleHeartClick(${gjv.giidx}, ${midx}, this)">
								</c:when>
								<c:otherwise>
									<button ><img class="cardWish" src="../resources/icon/heart.png" onclick="handleHeartClick(${gjv.giidx}, ${midx}, this)"></button>
								</c:otherwise>
							</c:choose>
						
							<h3 class="cardTitle">${gjv.gInfoName}</h3>
							<p class="cardInfo" id="textContainer">${gjv.gInfoBriefIntroduction}</p>
							<p class="attend">(참여멤버${gjv.gInfoParticipating}/${gjv.gInfoCapacity})</p> 
							<button class="gBtn" onclick="delayedRedirect('${pageContext.request.contextPath}/gathering/gSimpleInfo.do?giidx=${gjv.giidx}', 50)">구경하기</button><!-- 버튼딜레이 -->						
						</div>
					 </c:forEach>
				</div>
				<div><button id="moreButton" class="gBtn2" >더보기</button></div>
		</section>
	</main>
	<%@include file="../footer.jsp" %>
	<script>
			function handleHeartClick(giidx, midx ,element) {
				 
				var imageSrc = element.src;
				
				 if (imageSrc.includes('fullheart.png')) {
					
					// AJAX 요청 전송
					$.ajax({
						url: '${pageContext.request.contextPath}/gathering/WishDel.do',
						type: 'POST',
						data: {
							giidx: giidx,
							midx: midx
						},
						success: function(data) {
							
							if (data.value == 1) {
								alert("찜 삭제");
								// src 속성을 업데이트하여 이미지를 변경합니다.
								$(element).attr('src', '../resources/icon/heart.png');
								return;
							} else {
								alert("찜 실패");
								return false;
							}
						},
						error: function(xhr, status, error) {
							// AJAX 오류 처리
							console.log('오류: ' + error);
						}
					});
				 }
				 else if (imageSrc.includes('heart.png')) { 
					// AJAX 요청 전송
					$.ajax({
						url: '${pageContext.request.contextPath}/gathering/Wish.do',
						type: 'POST',
						data: {
							giidx: giidx,
							midx: midx
						},
						success: function(data) {
							
							if (data.value == 1) {
								alert("찜 성공");
								// src 속성을 업데이트하여 이미지를 변경합니다.
								$(element).attr('src', '../resources/icon/fullheart.png');
								return;
							} else {
								alert("찜 실패");
								return false;
							}
						},
						error: function(xhr, status, error) {
							// AJAX 오류 처리
							console.log('오류: ' + error);
						}
					});
					
				}
			}
			
			//버튼 이펙트 스크립트
			var animateButton = function(e) {
				  e.preventDefault();
				  // Reset animation
				  e.target.classList.remove('animate');
				  
				  e.target.classList.add('animate');
				  setTimeout(function(){
				    e.target.classList.remove('animate');
				  }, 700);
				};

				var gBtns = document.getElementsByClassName("gBtn");

				for (var i = 0; i < gBtns.length; i++) {
				  gBtns[i].addEventListener('click', animateButton, false);
				}

				/* 버튼 딜레이*/
				  function delayedRedirect(url, delay) {
					    setTimeout(function() {
					      window.location.href = url;
					    }, delay);
					  }
				
		</script>
    	<script>
	            var offset = 8;
	            $("#moreButton").click(function() {
	                $.ajax({
	                    url: "${pageContext.request.contextPath}/gathering/more.do",
	                    type: "GET",
	                    dataType: "json",
	                    data: {offset: offset , URI: "${pageContext.request.contextPath}/gathering/gSearch.do" , keyword: "${param.keyword}"},
	                    success: function(data) {
	                        // 가져온 데이터를 gContent에 추가
	                        $.each(data, function(index, gjv) {
                                var card = "<div class='card'>"
                                    + "<img class='cardImg' src='../resources/GTImages/" + gjv.imageName + "'>"
                                    + "<img class='cardWish' src='../resources/icon/" + (gjv.gwidx != 0 ? "fullheart.png" : "heart.png") + "' onclick='handleHeartClick(" + gjv.giidx + ", " + ${midx} + ", this)'>"
                                    + "<h3 class='cardTitle'>" + gjv.gInfoName + "</h3>"
                                    + "<p class='cardInfo'>" + gjv.gInfoBriefIntroduction + "</p>"
                                    + "<p class='attend'>(참여멤버 " + gjv.gInfoParticipating + "/" + gjv.gInfoCapacity + ")</p>" 
                                    + "<button class='gBtn' onclick=\"location.href='${pageContext.request.contextPath}/gathering/gSimpleInfo.do?giidx="+gjv.giidx+"'\">구경하기</button>"

                                    + "</div>";
                                $(".gContentB").append(card);
	                        });

	                        //alert(offset);
	                        offset += 8;
	                    },
	                    error: function() {
	                        alert("더 보기 요청에 실패했습니다.");
	                    }
	                });
	            });
    </script>		
	</body>
</html>