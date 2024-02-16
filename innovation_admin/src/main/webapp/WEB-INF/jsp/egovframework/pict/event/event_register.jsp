<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script type="text/javascript" src="/js/HuskyEZCreator.js" charset="utf-8"></script>

<!DOCTYPE html>
<html lang="ko">
<c:import url="../main/header.jsp">
	<c:param name="pageTitle" value="행사장 등록" />
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
					<h2 class="contents-title">행사장 등록</h2>
					<div class="contents-box">
						<div class="card">
							<div class="card-body">
							
								<div class="write-box">
									<div class="write-item">
										<label for="title" class="title">제목*</label>
										<div class="input-box">
											<input type="text" id="title" name="title" value="${pictVO.title}" class="input opt-max-width-500">
										</div>
									</div>
								</div>
								
								<div class="write-item" id="file_div">
									<label for="title" class="title">썸네일</label>
									<div class="input-box">
										<input style="margin-bottom:15px" type="file" id="attach_file" name="attach_file" value="${pictVO.img_url}" class="input opt-max-width-600">
										<div class="select_img1">
					            			<img src="" style="width:200px; margin-bottom:15px; display: none" id="src_1"/>
				            			</div>
									</div>
								</div>
								
								<div class="write-box">
									<div class="write-item">
										<label for="title" class="title">행사기간</label>
										<div class="input-box">
											<input type="text" class="input opt-max-width-300" id="from_date" name="from_date" value="${pictVO.from_date}" autocomplete="off"> ~ 
											<input type="text" class="input opt-max-width-300" id="to_date" name="to_date" value="${pictVO.to_date}" autocomplete="off">
										</div>
									</div>
								</div>
								
								<div class="write-box">
									<div class="write-item">
										<label for="title" class="title">비밀번호</label>
										<div class="input-box">
											<input type="text" id="password" name="password" value="${pictVO.password}" class="input opt-max-width-300" placeholder="공란으로 두시면 누구나 입장가능합니다.">
										</div>
									</div>
								</div>
								
								<div class="write-box">
									<div class="write-item">
										<label for="title" class="title">행사설명</label>
										<div class="input-box">
											<input type="text" id="sub_title" name="sub_title" value="${pictVO.sub_title}" class="input opt-max-width-500">
										</div>
									</div>
								</div>
								
								
								<div class="write-box">
									<div class="write-item">
										<label for="title" class="title">호스트(담당자)</label>
										
										<select class="hostSelect js-states" name="owner" id="owner" multiple="multiple">
											<c:forEach var="resultList" items="${resultList}" varStatus="status">
												<option value="${resultList.idx}" <c:if test="${fn:contains(pictVO.owner, resultList.idx)}">selected</c:if>>${resultList.name}</option>
											</c:forEach>
										</select>
			
									</div>
								</div>
									
								<div class="btn-box" style="margin-top: 60px;">
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
		<input type='hidden' name="file_idx" id="file_idx" value='${pictVO.file_idx}' />  
		
	</form>
	
	<script>

		$('.hostSelect').select2({
			    placeholder: "담당자를 선택하세요.",
			    allowClear: true
		});
		
		function board_delete() {
			if (confirm("삭제 하시겠습니까?")) {
				$("#register").attr("action", "/event/event_delete.do");
				$("#register").submit();
			}
			
		}
		function board_list() {
			location.href = "/event/event_list.do";
		}
		function button1_click() {
			var title = $('#title').val();
			if (title == "" || title == undefined) {
				window.alert("제목을 입력해주세요.");
				$('#title').focus();
				return false;
			}
			
			var text = "등록하시겠습니까?";
			if (saveType == 'update') {
				text = "수정하시겠습니까?"
			}
			if (confirm(text)) {
				$("#register").attr("action", "/event/event_save.do");
				$("#register").submit();
			}
		}
		$('#attach_file').change(function() {
			if(this.files && this.files[0]){
				if(this.files[0].type == '' || this.files[0].type.split('/')[0] != 'image'){
					alert ('이미지 파일만 첨부할 수 있습니다.');
					$('#attach_file').val("")
					return false
				}
				var reader = new FileReader;
				reader.onload = function(data){
					$('#src_1').show()
					$(".select_img1 img").attr("src", data.target.result).width(200);
				}
				reader.readAsDataURL(this.files[0]);
			}
			else{
				$(".select_img1 img").attr("src", "");
			}
		});
		$( document ).ready(function() {
			var img_url1 = '${pictVO.img_url}';
			
			if(img_url1){
				$('#src_1').show()
				$(".select_img1 img").attr("src", img_url1).width(200);
			}
			
		})
		$( function() {
		    $( "#from_date" ).datetimepicker({
		    	format : "Y-m-d H:i"
		    });
		    $( "#to_date" ).datetimepicker({
		    	format : "Y-m-d H:i"
		    });
		  } );
	</script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<link rel="stylesheet" type="text/css" media="screen" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.min.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.full.min.js"></script>
	<script src="../../../../../js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	<script src="../../../../../js/scripts.js"></script>
	<script src="../../../../../js/Chart.min.js" crossorigin="anonymous"></script>
	<script src="../../../../../js/simple-datatables@latest.js" crossorigin="anonymous"></script>

</body>
</html>