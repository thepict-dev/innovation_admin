<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html lang="ko">
	<c:import url="../main/header.jsp">
    	<c:param name="pageTitle" value="데이터별 통계 리스트"/>
    </c:import>
    
    <body class="sb-nav-fixed">
        <%@include file="../main/navigation.jsp" %>
        <div id="layoutSidenav">
	        <div id="layoutSidenav_nav">
				<%@include file="../main/gnb.jsp" %>
			</div>
			
			<div id="layoutSidenav_content">
				<main class="contents">
					<h2 class="contents-title">데이터별 통계 리스트</h2>
					<div class="contents-box">
						<div class="card">
						    <div class="card-body">
						    	<button type="button" onclick="btn_excel('${pictVO.title}');" class="btn-basic btn-sm btn-default point" style="float:right; margin-bottom:10px">엑셀다운로드</button>
						    	<div class="tbl-basic tbl-hover">
						    		<span style="float : left; margin-bottom:10px; font-weight:700">${pictVO.title} <span style="font-weight:400">다운로드 상세 내역</span></span> 
							        <table style="text-align : left">
							        	<colgroup>
							        		<col style="width:10%;">
							        		<col style="width:10%;">
							        		<col style="width:15%;">
							        		<col style="width:15%;">
							        		<col style="width:15%;">
							        		<col style="width:15%;">
							        		<col style="width:20%;">
							        	</colgroup>
							            <thead>
							                <tr class="thead">
							                    <th>순서</th>
							                    <th>이름</th>
							                    <th>소속</th>
							                    <th>직급</th>
							                    <th>연락처</th>
							                    <th>이메일</th>
							                    <th>활용목적</th>
							                </tr>
							            </thead>
							            <tbody>
								            <c:forEach var="resultList" items="${resultList}" varStatus="status">
								                <tr>
							                    	<td>${status.count}</td>
							                    	<td>${resultList.name}</td>
							                    	<td>${resultList.depart}</td>
							                    	<td>
							                    		<c:if test="${resultList.level eq '1'}">교수</c:if>
							                    		<c:if test="${resultList.level eq '2'}">학생</c:if>
							                    		<c:if test="${resultList.level eq '3'}">직장인</c:if>
							                    		<c:if test="${resultList.level eq '4'}">기타</c:if>
							                    		<c:if test="${resultList.level ne '1' && resultList.level ne '2' && resultList.level ne '3' && resultList.level ne '4'}">${resultList.level}</c:if>
						                    		</td>
							                    	<td>${resultList.mobile}</td>
							                    	<td>${resultList.email}</td>
							                    	<td class="opt-tl">
							                    		<c:if test="${resultList.type eq '1'}">정규교과 실습 등 활용</c:if>
							                    		<c:if test="${resultList.type eq '2'}">비교과 프로그램 활용</c:if>
							                    		<c:if test="${resultList.type eq '3'}">해커톤 활용</c:if>
							                    		<c:if test="${resultList.type eq '4'}">
								                    		${resultList.type_text}
						                    			</c:if>
						                    		</td>
								                </tr>
							                </c:forEach>
							            </tbody>
						            </table>
				            	</div>
				            </div>
			            </div>
		            </div>
		            <!-- <div style="float : right; margin-right: 20%">
			            <button type="button" id="button1" onclick="board_list();">게시글 리스트</button>
		            </div> -->
				</main>
			</div>
		</div>
		<form action="" id="search_fm" name="search_fm" method="post" enctype="multipart/form-data">
			<input type="hidden" id="idx" name="idx" value="${pictVO.idx}"/>
		</form>
		
		<script>
			function btn_excel(target){
				if(confirm(target+" 리스트를 엑셀파일로 내려받으시겠습니까?")){
					$("#search_fm").attr("action", "/status/excel_down.do");
					$("#search_fm").submit();
					
				}
			}
		</script>
            
		<script src="../../../../../js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
		<script src="../../../../../js/scripts.js"></script>
		<script src="../../../../../js/Chart.min.js" crossorigin="anonymous"></script>
		<script src="../../../../../js/simple-datatables@latest.js" crossorigin="anonymous"></script>
		
    </body>
</html>