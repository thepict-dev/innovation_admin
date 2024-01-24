<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html lang="ko">
	<c:import url="../main/header.jsp">
    	<c:param name="pageTitle" value="통계 리스트"/>
    </c:import>
    
    <body class="sb-nav-fixed">
        <%@include file="../main/navigation.jsp" %>
        <div id="layoutSidenav">
	        <div id="layoutSidenav_nav">
				<%@include file="../main/gnb.jsp" %>
			</div>
			
			<div id="layoutSidenav_content">
				<main class="contents">
					<h2 class="contents-title">통계 리스트</h2>
					<div class="contents-box">
						<div class="card">
						    <div class="card-body">
						    	<div class="tbl-basic tbl-hover">
							        <table style="text-align : left">
							        	<colgroup>
							        		<col style="width:10%;">
							        		<col style="width:10%;">
							        		<col style="width:10%;">
							        		<col style="width:15%;">
							        		<col style="width:15%;">
							        		<col style="width:15%;">
							        	</colgroup>
							            <thead>
							                <tr class="thead">
							                    <th>순서</th>
							                    <th>파일형식</th>
							                    <th>데이터종류</th>
							                    <th>카테고리</th>
							                    <th>데이터명칭</th>
							                    <th>다운로드 수(클릭시 상세)</th>
							                </tr>
							            </thead>
							            <tbody>
								            <c:forEach var="resultList" items="${resultList}" varStatus="status">
								                <tr>
							                    	<td>${status.count}</td>
							                    	<td>
							                    		<c:if test="${resultList.file_type eq '1'}">Table</c:if>
							                    		<c:if test="${resultList.file_type eq '2'}">Image</c:if>
							                    		<c:if test="${resultList.file_type eq '3'}">Key-Value</c:if>
							                    		<c:if test="${resultList.file_type eq '4'}">Text</c:if>
							                    		<c:if test="${resultList.file_type eq '5'}">Sensor</c:if>
							                    		<c:if test="${resultList.file_type eq '6'}">Time-Series</c:if>
							                    		<c:if test="${resultList.file_type eq '7'}">기타</c:if>
							                    	</td>
							                    	<td>${resultList.data_type_title}</td>
							                    	<td>
							                    		<c:if test="${resultList.category eq '1'}">정밀의료 데이터</c:if>
							                    		<c:if test="${resultList.category eq '2'}">헬스케어 데이터</c:if>
							                    		<c:if test="${resultList.category eq '3'}">스마트 수소에너지</c:if>
							                    		<c:if test="${resultList.category eq '4'}">기타</c:if>
							                    	</td>
							                    	<td>${resultList.title}</td>
							                    	<td class="opt-tl">
							                    		<c:if test="${resultList.cnt ne 0}">
							                    			<a href="javascript:void(0);" onclick="board_mod('${resultList.idx}');" class="link">${resultList.cnt}</a>
						                    			</c:if>
						                    			<c:if test="${resultList.cnt eq 0}">
						                    				${resultList.cnt}
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

		<script>

			function board_mod(idx){
				location.href= "/status/status_user_list.do?idx=" +idx;
			}


		</script>
            
		<script src="../../../../../js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
		<script src="../../../../../js/scripts.js"></script>
		<script src="../../../../../js/Chart.min.js" crossorigin="anonymous"></script>
		<script src="../../../../../js/simple-datatables@latest.js" crossorigin="anonymous"></script>
		
    </body>
</html>