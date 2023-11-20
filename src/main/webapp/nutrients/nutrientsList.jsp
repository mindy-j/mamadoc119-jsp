<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>recommendation of nutritional supplements list</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/recoNutriSupplementsList.css">
</head>
<body>

<!-- 헤더 -->
<jsp:include page="../include/header.jsp" />
<!-- 헤더 -->

    <div class="supplements-full-container">
        <!--영양제추천 타이틀-->
        <div class="supplements-origin-box">
            <div class="supplements-origin-title">
                <div class="supplements-title">영양제 추천</div>
                <div class="supplements-sub-title">똥강아지에서 추천하는 영양제 입니다!</div>
        </div>

    <form> <!--form 필요할까... 일단 넣어놨음-->

        <!--검색 부분-->
        <div class="supplements-search-full-container">
            <div> <!--드롭다운-->
                <select class="drop-div">
                    <option value="type">타입</option>
                    <option value="cate">카테고리</option>
                    <!--
                        타입은 제형검색용 : 츄어블, 구미, 가루 등등
                        카테고리 : 종합비타민, 유산균, 등등 
                    -->
                </select>
            </div>

            <!--인풋 검색창-->
                <input type="text" placeholder="검색어 입력" name="search" size="80px">
            
            <div>
                <button type="button" class="search-button">검색</button>
            </div>
        </div>
    </form>

        <!--영양제 사진이랑 이름등등 들어가는 부분-->
        
        <div class="supplements-list-full-container">
	        <c:forEach var="list" items="${nuList}" begin="0" end="11" >
	            <div class="reco-supply-cotain-box">
	                <div class="reco-supply-se-box">
	                    <div class="kindSuppImg-container">
	                        <img src="${pageContext.request.contextPath}/resources/upload/${list.nufileUuid}${list.nufileType}"  class="kindSuppImg"> 
	                    </div>
	                    <div>
	                        <p class="su-title">${list.nutrientsName}</p>
	                        <p>${list.nutrientsInfo}</p>
	                    
	                        <div class="su-detail">
	                            ${list.nutrientsEffect}
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </c:forEach>
        </div>
        

        <!--페이징 처리부분-->
        <div class="paging-part">

        </div>
    
        </div>
  </div> 
  
    <!-- footer -->
<jsp:include page="../include/footer.jsp" />
</body>
</html>