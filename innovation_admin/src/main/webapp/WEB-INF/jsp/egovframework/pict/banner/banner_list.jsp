<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>



<!DOCTYPE html>
<html lang="ko">
	<c:import url="../main/header.jsp">
    	<c:param name="pageTitle" value="띠배너 리스트"/>
    </c:import>
    
    <body class="sb-nav-fixed">
        <%@include file="../main/navigation.jsp" %>
        <div id="layoutSidenav">
	        <div id="layoutSidenav_nav">
				<%@include file="../main/gnb.jsp" %>
			</div>
			
			<div id="layoutSidenav_content">
				<main class="contents">
					<h2 class="contents-title">띠배너 리스트</h2>
					<div class="contents-box">
						<div class="card">
						    <div class="card-body">
							    <div class="search-form">
							    	<form action="" id="search_fm" name="search_fm" method="get" class="search-box">
								    	<input type="text" id="search_text" name="search_text" value="${pictVO.search_text}" class="input" placeholder="검색어를 입력하세요." autocomplete="off">
								    	<button type="button" onclick="search();" class="btn"><i class="fa-solid fa-magnifying-glass"></i></button>
							    	</form>
							    </div>
						    	<div class="tbl-basic tbl-hover">
							        <table style="text-align : left">
							        	<colgroup>
							        		<col style="width:10%;">
							        		<col style="width:40%;">
							        		<col style="width:17%;">
							        		<col style="width:17%;">
							        		<col style="width:17%;">
							        	</colgroup>
							            <thead>
							                <tr class="thead">
							                    <th>순서</th>
							                    <th>띠배너</th>
							                    <th>등록일시</th>
							                    <th>사용여부</th>
							                    <th>삭제</th>
							                </tr>
							            </thead>
							            <tbody>
								            <c:forEach var="resultList" items="${resultList}" varStatus="status">
								                <tr>
													<td>${status.count}</td>
							                    	<td class="opt-tl"><a href="javascript:void(0);" onclick="wish_reply('${resultList.idx}');" class="link">${resultList.text}</a></td>
							                    	<td>${resultList.createdAt}</td>
							                    	<td>
							                    		<c:if test="${resultList.use_at eq '0'}">
															<button type="button" class="state-box state-n" onclick="javascript:cng_use_at('${resultList.idx}');">
											            		<span class="text">비활성화</span> 
											            	</button>
										            	</c:if>
										            	<c:if test="${resultList.use_at ne '0'}">
										            		<button type="button" class="state-box state-y" style="cursor: default">
											            		<span class="text">활성화</span> 
											            	</button>
										            	</c:if>
						                    		</td>
							                    	<td>
							                    		<button type="button" onclick="javascript:wish_delete('${resultList.idx}')" class="btn-basic btn-fill btn-sm">삭제</button>
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

			function wish_reply(idx){
				$('#idx').val(idx)
				$("#register").attr("action", "/banner/banner_register.do");
				$("#register").submit();
			}

			function wish_delete(idx) {
				if (confirm("삭제 하시겠습니까?")) {
					$('#idx').val(idx)
					$("#register").attr("action", "/banner/banner_delete.do");
					$("#register").submit();
				}
			}
			function search(){
				$("#search_fm").attr("action", "/banner/banner_list.do");
				$("#search_fm").submit();
			}
			function cng_use_at(idx){
				$('#idx').val(idx)
				var text = "해당 띠 배너를 활성화 상태로 변경하시겠습니까?";
				
				if(confirm (text)){
					$("#register").attr("action", "/banner/cng_use_at.do");
					$("#register").submit();
				}
				
			}
		</script>
            
		<script src="../../../../../js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
		<script src="../../../../../js/scripts.js"></script>
		<script src="../../../../../js/Chart.min.js" crossorigin="anonymous"></script>
		<script src="../../../../../js/simple-datatables@latest.js" crossorigin="anonymous"></script>
		
    </body>
</html>