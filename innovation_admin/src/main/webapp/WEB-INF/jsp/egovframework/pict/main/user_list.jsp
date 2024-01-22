<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<!DOCTYPE html>
<html lang="ko">
	<c:import url="../main/header.jsp">
    	<c:param name="pageTitle" value="관리자 리스트"/>
    </c:import>
    
    
    <body class="sb-nav-fixed">
        <%@include file="../main/navigation.jsp" %>
        <div id="layoutSidenav">
	        <div id="layoutSidenav_nav">
				<%@include file="../main/gnb.jsp" %>
			</div>
			
			<div id="layoutSidenav_content">
				<main class="contents">
					<h2 class="contents-title">관리자 리스트</h2>
					<div class="contents-box">
					    <div class="card">
						    <div class="card-body">
							    <div class="search-form">
							    	<form action="" id="search_fm" name="search_fm" method="get" class="search-box">
								    	<input type="text" id="search_text" name="search_text" value="${search_text}" class="input"  placeholder="검색어를 입력하세요." autocomplete="off"/>
							    	<button type="button" id="button1" onclick="search();" class="btn">검색</button>
							    	</form>
							    </div>
						    <div class="tbl-basic tbl-hover">
						        <table>
						        	<colgroup>
						        		<col style="width:10%;">
						        		<col style="width:10%;">
						        		<col style="width:10%;">
						        		<col style="width:20%;">
						        		<col style="width:20%;">
						        		<col style="width:20%;">
						        		<col style="width:10%;">
						        	</colgroup>
						            <thead>
						                <tr class="thead">
						                	<th>순서</th>
						                    <th>아이디</th>
						                    <th>담당자</th>
						                    <th>부서명</th>
						                    <th>연락처</th>
						                    <th>비밀번호</th>
						                    <th>계정삭제</th>
						                </tr>
						            </thead>
						            
						            <tbody>
							            <c:forEach var="resultList" items="${resultList}" varStatus="status">
							                <tr>
							                    <td>${status.count}</td>
							                    <td class="opt-tl">
							                    	<a href="#lnk" onclick="user_mod('${resultList.id}');" class="link">${resultList.id}</a>
							                    	
						                    	</td>
							                    <td>${resultList.name}</td>
							                    <td>${resultList.depart}</td>
							                    <td>${resultList.mobile}</td>
							                    <td>
							                    	<button type="button" id="button1" onclick="javascript:password_reset('${resultList.id}');" class="btn-basic btn-primary btn-sm">초기화</button>
							                    </td>
							                    <td>
							                    	<button type="button" id="button1" onclick="javascript:fn_delete('${resultList.id}');" class="btn-basic btn-fill btn-sm">삭제</button>
							                    </td>
							                </tr>
						                </c:forEach>
						            </tbody>
					            </table>
					            </div>
			            	</div>
			            </div>
		            </div>
		            <!-- <button type="button" id="button1" onclick="button1_click();" style="width:20%; float: left; margin-left:20px">등록</button> -->
				</main>
				<%@include file="../main/footer.jsp" %>
				
			</div>
		</div>

		<form action="" id="register" name="register" method="post" enctype="multipart/form-data">
			<input type="hidden" id="id" name="id" value=""/>
		</form>
		
		<script>
			function search(){
				$("#search_fm").attr("action", "/user_list.do");
				$("#search_fm").submit();
			}
			function user_mod(id){
				location.href= "/user_register.do?id="+ id;
			}
			function button1_click(id){
				location.href= "/user_register.do"
			}
			function password_reset(id){
				if(confirm(id + " 계정의 비밀번호를 초기화 하시겠습니까?")){
					$("#id").val(id);
					document.register.action = "/user_reset.do";
					document.register.submit();
				}
			}
			function fn_delete(id){
				if(confirm(id + " 계정을 삭제하시겠습니까?")){
					$("#id").val(id);
					document.register.action = "/user_delete.do";
					document.register.submit();
				}
			}
			
		
		</script>
            
		<script src="../../../../../js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
		<script src="../../../../../js/scripts.js"></script>
		<script src="../../../../../js/Chart.min.js" crossorigin="anonymous"></script>
		<script src="../../../../../js/simple-datatables@latest.js" crossorigin="anonymous"></script>
		
    </body>
</html>