<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script type="text/javascript" src="/js/HuskyEZCreator.js" charset="utf-8"></script>

<!DOCTYPE html>
<html lang="ko">
<c:import url="../main/header.jsp">
	<c:param name="pageTitle" value="데이터 등록" />
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
					<h2 class="contents-title">데이터 등록</h2>
					<div class="contents-box">
						<div class="card">
							<div class="card-body">
							
								<div class="write-box">
									<div class="write-item">
										<label for="title" class="title">제목*</label>
										<div class="input-box">
											<input type="text" id="title" name="title" value="${pictVO.title}" class="input opt-max-width-700">
										</div>
									</div>
								</div>
								
								<div class="write-item">
									<label for="title" class="title">내용</label>
									<div class="input-box">
										<textarea name="text" id="text" cols="30" rows="10" class="txt" style="width:100%;">${pictVO.text}</textarea>
		                            	<!-- 에디터 설정 -->
										<script type="text/javascript">
											var oEditors = [];
											nhn.husky.EZCreator.createInIFrame({
												oAppRef: oEditors,
												elPlaceHolder: "text", //textarea에서 지정한 id와 일치해야 합니다.
												sSkinURI: "/js/SmartEditor2Skin.html",
												fCreator: "createSEditor2"
											});
										</script>
									</div>
								</div>
								
								<div class="write-item">
									<label for="noti" class="title">공지여부</label>
									<div class="input-box">
										<input type="checkbox" id="noti" name="noti" value="1" <c:if test="${pictVO.noti eq '1'}">checked</c:if> style="margin-right:3px"><label for="noti" style="margin-right:10px">공지 여부</label>
									</div>
								</div>
					
								
								<div class="write-box">
									<div class="write-item">
										<label for="title" class="title">첨부파일</label>
										<div class="input-box">
											<input style="margin-bottom:15px" type="file" id="attach_file" name="attach_file" value="${pictVO.file_url1}" class="input opt-max-width-600">
											<c:if test="${pictVO.file_url1 ne '' && pictVO.file_url1 ne undefined}">
												<br>
												첨부된 파일 : ${pictVO.file_url1} <a href="#lnk" onclick="fn_file_delete('1')">파일삭제</a>
											</c:if>
										</div>
									</div>
								</div>
								<div class="write-box">
									<div class="write-item">
										<label for="title" class="title">첨부파일</label>
										<div class="input-box">
											<input style="margin-bottom:15px" type="file" id="attach_file1" name="attach_file1" value="${pictVO.file_url2}" class="input opt-max-width-600">
											<c:if test="${pictVO.file_url2 ne '' && pictVO.file_url2 ne undefined}">
												<br>
												첨부된 파일 : ${pictVO.file_url2} <a href="#lnk" onclick="fn_file_delete('2')">파일삭제</a>
											</c:if>
										</div>
									</div>
								</div>
								<div class="write-box">
									<div class="write-item">
										<label for="title" class="title">첨부파일</label>
										<div class="input-box">
											<input style="margin-bottom:15px" type="file" id="attach_file2" name="attach_file2" value="${pictVO.file_url3}" class="input opt-max-width-600">
											<c:if test="${pictVO.file_url3 ne '' && pictVO.file_url3 ne undefined}">
												<br>
												첨부된 파일 : ${pictVO.file_url3} <a href="#lnk" onclick="fn_file_delete('3')">파일삭제</a>
											</c:if>
										</div>
									</div>
								</div>
								<div class="write-box">
									<div class="write-item">
										<label for="title" class="title">첨부파일</label>
										<div class="input-box">
											<input style="margin-bottom:15px" type="file" id="attach_file3" name="attach_file3" value="${pictVO.file_url4}" class="input opt-max-width-600">
											<c:if test="${pictVO.file_url4 ne '' && pictVO.file_url4 ne undefined}">
												<br>
												첨부된 파일 : ${pictVO.file_url4} <a href="#lnk" onclick="fn_file_delete('4')">파일삭제</a>
											</c:if>
										</div>
									</div>
								</div>
								<div class="write-box">
									<div class="write-item">
										<label for="title" class="title">첨부파일</label>
										<div class="input-box">
											<input style="margin-bottom:15px" type="file" id="attach_file4" name="attach_file4" value="${pictVO.file_url5}" class="input opt-max-width-600">
											<c:if test="${pictVO.file_url5 ne '' && pictVO.file_url5 ne undefined}">
												<br>
												첨부된 파일 : ${pictVO.file_url5} <a href="#lnk" onclick="fn_file_delete('5')">파일삭제</a>
											</c:if>
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
		<input type='hidden' name="file_idx" id="file_idx" value='${pictVO.file_idx}' />  
		
	</form>
	
	<script>
		function fn_file_delete(target){
			if (confirm("첨부파일을 삭제 하시겠습니까?")) {
				$('#file_idx').val(target)
				$("#register").attr("action", "/board/board_file_delete.do");
				$("#register").submit();
			}
		}
		
		function board_delete() {
			if (confirm("삭제 하시겠습니까?")) {
				$("#register").attr("action", "/board/board_delete.do");
				$("#register").submit();
			}
			
		}
		function board_list() {
			location.href = "/board/board_list.do";
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
			oEditors[0].exec("UPDATE_CONTENTS_FIELD", []);
			if (confirm(text)) {
				$("#register").attr("action", "/board/board_save.do");
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