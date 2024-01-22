<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>



<!DOCTYPE html>
<html lang="ko">
	<c:import url="../main/header.jsp">
    	<c:param name="pageTitle" value="최종통과자 리스트"/>
    </c:import>
    
    <body class="sb-nav-fixed">
        <%@include file="../main/navigation.jsp" %>
        <div id="layoutSidenav">
	        <div id="layoutSidenav_nav">
				<%@include file="../main/gnb.jsp" %>
			</div>
			
			<div id="layoutSidenav_content">
				<main class="contents">
					<h2 class="contents-title">최종통과자 리스트</h2>
					<div class="contents-box">
						<div class="card">
						    <div class="card-body">
							    <div class="search-form">
							    	<form action="" id="search_fm" name="search_fm" method="get" class="search-box">
								    	<select id="category" name="category" class="input opt-max-width-600">
											<option value="">카테고리선택</option>
											<option value="ox" <c:if test="${pictVO.category eq 'ox'}"> selected </c:if> >OX퀴즈</option>
											<option value="maze" <c:if test="${pictVO.category eq 'maze'}"> selected </c:if> >미로찾기</option>
										</select>
								    	<input type="text" id="search_text" name="search_text" value="${pictVO.search_text}" class="input" placeholder="검색어를 입력하세요." autocomplete="off">
								    	<button type="button" onclick="search();" class="btn"><i class="fa-solid fa-magnifying-glass"></i></button>
							    	</form>
							    </div>
						    	<div class="tbl-basic tbl-hover">
							        <table style="text-align : left">
							        	<colgroup>
							        		<col style="width:10%;">
							        		<col style="width:30%;">
							        		<col style="width:20%;">
							        		<col style="width:20%;">
							        	</colgroup>
							            <thead>
							                <tr class="thead">
							                    <th>순서</th>
												<th>이름</th>
							                    <th>카테고리</th>
							                    <th>검증여부</th>
							                </tr>
							            </thead>
							            <tbody>
								            <c:forEach var="resultList" items="${resultList}" varStatus="status">
								                <tr>
							                    	<td>${status.count}</td>
							                    	<td class="opt-tl"><a href="javascript:void(0);" onclick="detail('${resultList.idx}', '${resultList.file_url}');" class="link">${resultList.nick_name}</a></td>
							                    	<td>${resultList.category}</td>
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
								                </tr>
							                </c:forEach>
							            </tbody>
						            </table>
				            	</div>
				            </div>
			            </div>
		            </div>
		            <div id="popup_img_div" style="display: none">
			            <img src="" id="popup_img" style="position:fixed; top:15%; left:30%" onclick="popup_img()"/>
		            </div>
				</main>
			</div>
		</div>
		<form action="" id="register" name="register" method="post" enctype="multipart/form-data">
			<input type='hidden' name="idx" id="idx" value='' />
			<input type='hidden' name="use_at" id="use_at" value='' />
			<input type='hidden' name="type" id="type" value='' />
		</form>
		<script>
			let timer;
			function popup_img(){
				$('#popup_img_div').hide()
				$("#popup_img").attr("src", "");
								
				clearInterval(timer)

			}
			function detail(idx, file_url){
				$('#popup_img_div').show()
				console.log(file_url)
				var img = "http://ccsool.co.kr/user1/upload_file/1.png"
				if(file_url != '' && file_url != undefined) img = file_url
				$("#popup_img").attr("src", img).width(500).height(500);
				timer = setInterval(() =>
					$.ajax({
						url : "/test_time.do"
						, type : "POST"
						, enctype:'multipart/form-data'
						, data : {}
						, contentType : false
				        , processData : false
				        , success:function(data){
				        	console.log(data)
				        	
				        }
				        , error:function(e){
				        	
				        }
					})
				
				, 2000);
			}
			function cng_use_at(idx, use_at){
				$('#idx').val(idx)
				$('#use_at').val(use_at)
				console.log(use_at)
				var text = "해당 항목을 검증완료 상태로 변경하시겠습니까?";
				if(use_at == 'Y') text = "해당 항목을 미검증 상태로 변경하시겠습니까?";
				
				if(confirm (text)){
					$("#register").attr("action", "/participation/finish_cng.do");
					$("#register").submit();
				}
			}
			function search(){
				$("#search_fm").attr("action", "/participation/quiz_maze_list.do");
				$("#search_fm").submit();
			}
			
		</script>
            
		<script src="../../../../../js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
		<script src="../../../../../js/scripts.js"></script>
		<script src="../../../../../js/Chart.min.js" crossorigin="anonymous"></script>
		<script src="../../../../../js/simple-datatables@latest.js" crossorigin="anonymous"></script>
		
    </body>
</html>