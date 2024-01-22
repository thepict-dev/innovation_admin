<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<!DOCTYPE html>
<html lang="ko">
	<c:import url="../main/header.jsp">
    	<c:param name="pageTitle" value="관리자 등록"/>
    </c:import>
    
    <body class="sb-nav-fixed">
    
    <form action="" id="register" name="register" method="post" enctype="multipart/form-data">
        <%@include file="../main/navigation.jsp" %>
        <div id="layoutSidenav">
	        <div id="layoutSidenav_nav">
				<%@include file="../main/gnb.jsp" %>
			</div>
			
			
			<div id="layoutSidenav_content">
				<main class="contents">
					<h2 class="contents-title">관리자 등록</h2>
					<div class="contents-box">
					    <div class="card">
					        <div class="card-body">
					            <div class="write-box">
						            <div class="write-item">
						            	<label for="title" class="title">아이디*</label>
							            <div class="input-box">
											<c:if test="${adminVO.saveType eq 'update'}">
							            		<input type="text" class="input opt-max-width-600" id="id" name="id" value="${adminVO.id}" readonly/>
							            	</c:if>
							            	<c:if test="${adminVO.saveType eq 'insert'}">
							            		<input type="text" class="input opt-max-width-600" id="id" name="id" onkeydown="key_down('id')"/>
							            	</c:if>
										</div>
						            </div>
						            
						            <div class="write-item">
						            	<label for="title" class="title">비밀번호*</label>
							            <div class="input-box">
											<c:if test="${adminVO.saveType == 'update'}">
							            		<input type="password" class="input opt-max-width-600" id="password" name="password" readonly/>
							            	</c:if>
							            	<c:if test="${adminVO.saveType == 'insert'}">
							            		<input type="password" class="input opt-max-width-600" id="password" name="password"/>
							            	</c:if>
										</div>
						            </div>
						            
						            <div class="write-item">
						            	<label for="title" class="title">이름*</label>
							            <div class="input-box">
											<input type="text" class="input opt-max-width-600" id="name" name="name" onkeydown="key_down('name')" value="${adminVO.name}"/>
										</div>
						            </div>
						            
						            <div class="write-item">
						            	<label for="title" class="title">부서명*</label>
							            <div class="input-box">
											<input type="text" class="input opt-max-width-600" id="depart" name="depart" onkeydown="key_down('depart')" value="${adminVO.depart}"/>
										</div>
						            </div>
						            
						            <div class="write-item">
						            	<label for="title" class="title">연락처*</label>
							            <div class="input-box">
											<input type="text" class="input opt-max-width-600" id="mobile" name="mobile" onkeydown="key_down('mobile')" value="${adminVO.mobile}"/>
										</div>
						            </div>
					            </div>
					            <button type="button" id="button1" onclick="button1_click();" class="btn-basic btn-primary btn-sm">
					            	<c:if test="${adminVO.saveType eq 'insert'}">등록</c:if>
					            	<c:if test="${adminVO.saveType ne 'insert'}">수정</c:if>
				            	</button>
				            </div>
			            </div>
		            </div>
		            
				</main>
				<%@include file="../main/footer.jsp" %>
			</div>
		</div>
		<input type='hidden' name="saveType" id="saveType" value='${adminVO.saveType}' />
	</form>
	<script>
		function key_down(id){
			var key = event.keyCode;
			if(key == 13){
				if(id == "id"){
					$('#password').focus();
				}
				else if(id == "password"){
					$('#name').focus();
				}
				else if(id == "name"){
					$('#depart').focus();
				}
				else if(id == "depart"){
					$('#mobile').focus();
				}
				
			}
		}
		function button1_click(){
			var id = $('#id').val();
			var password = $("#password").val(); 
			var mobile = $('#mobile').val();
			var name = $('#name').val();
			var depart = $('#depart').val();
			
			var saveType = $('#saveType').val();
			if(id == "" || id == undefined){
				window.alert("사용자 이름을 입력해주세요.");
				$('#id').focus();
				return false;
			}
			else if(password == "" || password == undefined){
				if(saveType == "insert"){
					window.alert("비밀번호를 입력해주세요.");
					$('#password').focus();
					return false;
				}
			}
			else if(name == "" || name == undefined){
				window.alert("이름을 입력해주세요.");
				$('#name').focus();
				return false;
			}
			else if(depart == "" || depart == undefined){
				window.alert("부서명을 입력해주세요.");
				$('#depart').focus();
				return false;
			}
			
			else if(mobile == "" || mobile == undefined){
				window.alert("연락처를 입력해주세요.");
				$('#mobile').focus();
				return false;
			}
			
			var text ="등록하시겠습니까?";
			
			if(confirm (text)){
				$("#register").attr("action", "/user_save.do");
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