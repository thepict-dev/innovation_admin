<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>



<!DOCTYPE html>
<html lang="ko">
	<c:import url="../main/header.jsp">
    	<c:param name="pageTitle" value="참여관리 리스트"/>
    </c:import>
    
    <body class="sb-nav-fixed">
        <%@include file="../main/navigation.jsp" %>
        <div id="layoutSidenav">
	        <div id="layoutSidenav_nav">
				<%@include file="../main/gnb.jsp" %>
			</div>
			
			<div id="layoutSidenav_content">
				<main class="contents">
					<h2 class="contents-title">참여관리 리스트</h2>
					<div class="contents-box">
						<div class="card">
						    <div class="card-body">
							    <div class="search-form">
							    	<form action="" id="search_fm" name="search_fm" method="get" class="search-box">
							    		<select id="type" name="type" class="input opt-max-width-600">
											<option value="">카테고리선택</option>
											<option value="superstar" <c:if test="${pictVO.type eq 'superstar'}"> selected </c:if> >슈퍼스타J</option>
											<option value="flag" <c:if test="${pictVO.type eq 'flag'}"> selected </c:if> >반보기</option>
											<option value="friend" <c:if test="${pictVO.type eq 'friend'}"> selected </c:if> >내친소</option>
											<option value="day" <c:if test="${pictVO.type eq 'day'}"> selected </c:if> >1일1선</option>
										</select>
								    	<input type="text" id="search_text" name="search_text" value="${pictVO.search_text}" class="input" placeholder="검색어를 입력하세요." autocomplete="off">
								    	<button type="button" onclick="search();" class="btn"><i class="fa-solid fa-magnifying-glass"></i></button>
							    	</form>
							    </div>
						    	<div class="tbl-basic tbl-hover">
							        <table style="text-align : left">
							        	<colgroup>
							        		<col style="width:10%;">
							        		<col style="width:10%;">
							        		<col style="width:30%;">
							        		<col style="width:20%;">
							        		<col style="width:15%;">
							        		<col style="width:15%;">
							        	</colgroup>
							            <thead>
							                <tr class="thead">
							                    <th>순서</th>
							                    <th>카테고리</th>
							                    <th>제목</th>
							                    <th>참가자</th>
							                    <th>검증여부</th>
							                    <th>삭제</th>
							                </tr>
							            </thead>
							            <tbody>
								            <c:forEach var="resultList" items="${resultList}" varStatus="status">
								                <tr>
							                    	<td>${status.count}</td>
							                    	<td>
							                    		<c:if test="${resultList.type eq 'superstar'}">슈퍼스타 J</c:if>
							                    		<c:if test="${resultList.type eq 'flag'}">반보기</c:if>
							                    		<c:if test="${resultList.type eq 'friend'}">내친소</c:if>
							                    		<c:if test="${resultList.type eq 'day'}">1일1선</c:if>
						                    		</td>
							                    	<td class="opt-tl"><a href="javascript:void(0);" onclick="super_view('${resultList.idx}');" class="link">${resultList.title}</a></td>
							                    	
						                    		<td>
						                    			<c:if test="${resultList.type eq 'superstar'}">
						                    				${resultList.person}
						                    			</c:if>
						                    			<c:if test="${resultList.type ne 'superstar' }">
						                    				${resultList.nick_name}
						                    			</c:if>
						                    		</td>
							                    	<td>
							                    		<c:if test="${resultList.use_at eq 'N'}">
															<button type="button" class="state-box state-n" onclick="javascript:cng_use_at('${resultList.idx}', '${resultList.use_at}');">
											            		<span class="text">미검증</span> 
											            	</button>
										            	</c:if>
										            	<c:if test="${resultList.use_at ne 'N'}">
										            		<button type="button" class="state-box state-y" onclick="javascript:cng_use_at('${resultList.idx}', '${resultList.use_at}');">
											            		<span class="text">검증완료</span> 
											            	</button>
										            	</c:if>
													</td>
							                    	<td>
							                    		<button type="button" onclick="javascript:board_delete('${resultList.idx}')" class="btn-basic btn-fill btn-sm">삭제</button>
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
		<form action="" id="register" name="register" method="post" enctype="multipart/form-data">
			<input type='hidden' name="idx" id="idx" value='' />
			<input type='hidden' name="use_at" id="use_at" value='' />
			<input type='hidden' name="type" id="type" value='' />
		</form>
		<script>
			function board_delete(idx) {
				if (confirm("삭제 하시겠습니까?")) {
					$('#idx').val(idx)
					$("#register").attr("action", "/superstar/superstar_delete.do");
					$("#register").submit();
				}
			}
			function cng_use_at(idx, use_at){
				$('#idx').val(idx)
				$('#use_at').val(use_at)
				console.log(use_at)
				var text = "해당 항목을 검증완료 상태로 변경하시겠습니까?";
				if(use_at == 'Y') text = "해당 항목을 미검증 상태로 변경하시겠습니까?";
				
				if(confirm (text)){
					$("#register").attr("action", "/superstar/superstar_cng.do");
					$("#register").submit();
				}
				
			}
			
			function search(){
				$("#search_fm").attr("action", "/superstar/superstar_list.do");
				$("#search_fm").submit();
			}
			function super_view(idx){
				location.href= "/superstar/superstar_view.do?idx="+ idx;
			}
		</script>
            
		<script src="../../../../../js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
		<script src="../../../../../js/scripts.js"></script>
		<script src="../../../../../js/Chart.min.js" crossorigin="anonymous"></script>
		<script src="../../../../../js/simple-datatables@latest.js" crossorigin="anonymous"></script>
		
    </body>
</html>