<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script type="text/javascript" src="/js/HuskyEZCreator.js" charset="utf-8"></script>

<!DOCTYPE html>
<html lang="ko">
<c:import url="../main/header.jsp">
	<c:param name="pageTitle" value="사용자 등록" />
</c:import>
<body class="sb-nav-fixed">
	<form action="" id="register" name="register" method="post" enctype="multipart/form-data">
		<%@include file="../main/navigation.jsp"%>
		<div id="layoutSidenav">
			<div id="layoutSidenav_nav">
				<%@include file="../main/gnb.jsp"%>
			</div>
			<div id="layoutSidenav_content">
				<main class="contents">
					<h2 class="contents-title">사용자 등록</h2>
					<div class="contents-box">
						<div class="card">
							<div class="card-body">
								<div class="write-box">
								
									<div class="write-item" style="margin-right:20px">
										<label for="title" class="title">아이디*</label>
										<div class="input-box">
											<input type="text" id="id" name="id" value="${pictVO.id}" class="input opt-max-width-200">
											<c:if test="${pictVO.saveType eq 'insert'}">
												<button type="button" onclick="javascript:duple_check()" class="btn-basic btn-fill btn-sm">중복확인</button>
											</c:if>
										</div>
										
									</div>
									<div class="write-item" style="margin-right:20px">
										<label for="title" class="title">이름*</label>
										<div class="input-box">
											<input type="text" id="nick_name" name="nick_name" value="${pictVO.nick_name}" class="input opt-max-width-200">
										</div>
									</div>
									<div class="write-item" style="margin-right:20px">
										<label for="title" class="title">소속*</label>
										<div class="input-box">
											<input type="text" id="depart" name="depart" value="${pictVO.depart}" class="input opt-max-width-200">
										</div>
									</div>
									<div class="write-item" style="margin-right:20px">
										<label for="title" class="title">직급*</label>
										<div class="input-box">
											<input type="text" id="position" name="position" value="${pictVO.position}" class="input opt-max-width-200">
										</div>
									</div>
									<div class="write-item">
										<label for="title" class="title">휴대전화번호*</label>
										<div class="input-box">
											<input type="text" id="mobile" name="mobile" value="${pictVO.mobile}" class="input opt-max-width-300">
										</div>
									</div>
									
									<div class="write-item">
										<label for="title" class="title">이메일*</label>
										<div class="input-box">
											<input type="text" id="email" name="email" value="${pictVO.email}" class="input opt-max-width-300">
										</div>
									</div>
								</div>
								<div class="btn-box">
									<c:if test="${pictVO.saveType eq 'update'}">
										<button type="button" onclick="javascript:board_delete()" class="btn-basic btn-fill btn-sm">삭제</button>
									</c:if>
									<c:if test="${pictVO.saveType eq 'insert'}">
										<button type="button" onclick="button1_click();" class="btn-basic btn-primary btn-sm">등록</button>
									</c:if>
									<c:if test="${pictVO.saveType ne 'insert'}">
										<button type="button" onclick="button1_click();" class="btn-basic btn-primary btn-sm">수정</button>
									</c:if>
						        	<button type="button" onclick="javascript:board_list();" class="btn-basic btn-common btn-sm">목록보기</button>    
					            </div>
							</div>
						</div>
		            </div>
				</main>
			</div>
		</div>
		<input type='hidden' name="saveType" id="saveType" value='${pictVO.saveType}' /> 
		<input type='hidden' name="idx" id="idx" value='${pictVO.idx}' /> 
		<input type='hidden' name="use_at" id="use_at" value='${pictVO.use_at}' />
		<input type='hidden' name="duple" id="duple" value='${pictVO.id}' />
	</form>
	
	<script>

		function user_delete() {
			if (confirm("삭제 하시겠습니까?")) {
				$("#register").attr("action", "/user/user_delete.do");
				$("#register").submit();
			}
			
		}
		function user_list() {
			location.href = "/user/user_list.do";
		}
		function duple_check() {
			var id = $('#id').val();
			if (id == "" || id == undefined) {
				alert("아이디를 입력 후에 중복확인 해주세요.")
				$('#id').focus();
				return false;
			}
			
			$.ajax({
				url : "/user/user_duple.do",
				type : 'POST',
				data : {
					id: id,
				},
				success : function(data) {
					if(data == 'duple'){
						alert('중복된 아이디가 존재합니다.');
						return false;
					}
					else{
						alert('사용 가능한 아이디입니다.');
						$('#duple').val('check');
						return false;
					}
				},
				error : function(e) {
					console.log(e)
				}
			});
			
		}		
		
		function button1_click() {
			var id = $('#id').val();
			var name = $('#nick_name').val();
			var depart = $('#depart').val();
			var mobile = $('#mobile').val();
			var duple = $('#duple').val();
			var saveType = $('#saveType').val();
			
			
			if (id == "" || id == undefined) {
				window.alert("아이디를 입력해주세요.");
				$('#id').focus();
				return false;
			}
			else if (name == "" || name == undefined) {
				window.alert("이름을 입력해주세요.");
				$('#name').focus();
				return false;
			}
			else if (depart == "" || depart == undefined) {
				window.alert("소속을 입력해주세요.");
				$('#depart').focus();
				return false;
			}
			else if (mobile == "" || mobile == undefined) {
				window.alert("연락처를 입력해주세요.");
				$('#mobile').focus();
				return false;
			}
			
			if(duple == '' || duple == undefined){
				alert("중복체크하세요");
				return false;
			}
			var text = "등록하시겠습니까?";
			if (saveType == 'update') {
				text = "수정하시겠습니까?"
			}
			if(saveType == 'insert'){
				$.ajax({
					url : "/user/user_duple.do",
					type : 'POST',
					data : {
						id: id,
					},
					success : function(data) {
						if(data == 'duple'){
							alert('중복된 아이디가 존재합니다.');
							return false;
						}
						else{
							if (confirm(text)) {
								$("#register").attr("action", "/user/user_save.do");
								$("#register").submit();
							}
						}
					},
					error : function(e) {
						console.log(e)
					}
				});
			}
			else{
				if (confirm(text)) {
					$("#register").attr("action", "/user/user_save.do");
					$("#register").submit();
				}
			}
		}
		
		
	</script>
	<script src="../../../../../js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	<script src="../../../../../js/scripts.js"></script>
	<script src="../../../../../js/Chart.min.js" crossorigin="anonymous"></script>
	<script src="../../../../../js/simple-datatables@latest.js" crossorigin="anonymous"></script>

</body>
</html>