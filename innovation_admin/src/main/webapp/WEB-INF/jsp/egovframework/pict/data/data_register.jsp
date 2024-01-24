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
										<label for="title" class="title">파일형식</label>
										<div class="input-box">
											<select id="file_type" name="file_type" class="input opt-max-width-300">
												<option value="1" <c:if test="${pictVO.file_type eq '1'}">selected</c:if> >Table</option>
												<option value="2" <c:if test="${pictVO.file_type eq '2'}">selected</c:if> >Image</option>
												<option value="3" <c:if test="${pictVO.file_type eq '3'}">selected</c:if> >Key-Value</option>
												<option value="4" <c:if test="${pictVO.file_type eq '4'}">selected</c:if> >Text</option>
											</select>
										</div>
									</div>
								</div>
								<div class="write-box">
									<div class="write-item">
										<label for="title" class="title">데이터타입</label>
										<div class="input-box">
											<select id="data_type" name="data_type" class="input opt-max-width-300">
												<c:forEach var="resultList" items="${resultList}" varStatus="status">
													<option value="${resultList.idx}" <c:if test="${pictVO.data_type eq resultList.idx}">selected</c:if> >${resultList.title}</option>
												</c:forEach>
											</select>
										</div>
									</div>
								</div>
								<div class="write-box">
									<div class="write-item">
										<label for="title" class="title">카테고리</label>
										<div class="input-box">
											<select id="category" name="category" class="input opt-max-width-400">
												<option value="1" <c:if test="${pictVO.category  eq '1'}">selected</c:if> >정밀의료 데이터</option>
												<option value="2" <c:if test="${pictVO.category eq '2'}">selected</c:if> >헬스케어 데이터</option>
												<option value="3" <c:if test="${pictVO.category eq '3'}">selected</c:if> >스마트 수소에너지</option>
												<option value="4" <c:if test="${pictVO.category eq '4'}">selected</c:if> >기타</option>
											</select>
										</div>
									</div>
								</div>
								
								<div class="write-item">
									<label for="noti" class="title">데이터 명칭</label>
									<div class="input-box">
										<input type="text" id="title" name="title" value="${pictVO.title}" class="input opt-max-width-400">
									</div>
								</div>
								<div class="write-item">
									<label for="noti" class="title">데이터 대상</label>
									<div class="input-box">
										<input type="text" id="data_text" name="data_text" value="${pictVO.data_text}" class="input opt-max-width-500">
									</div>
								</div>
								<div class="write-item">
									<label for="noti" class="title">해시태그</label>
									<div class="input-box">
										<input type="text" id="hashtag" name="hashtag" value="${pictVO.hashtag}" class="input opt-max-width-500" placeholder="쉼표(,) 단위로 입력해주세요.">
									</div>
								</div>
								
								<div class="write-box">
									<div class="write-item">
										<label for="title" class="title">데이터파일</label>
										<div class="input-box">
											<input style="margin-bottom:15px" type="file" id="attach_file" name="attach_file" value="${pictVO.file_url}" class="input opt-max-width-500">
											<c:if test="${pictVO.file_url ne '' && pictVO.file_url ne undefined}">
												<br>
												첨부된 파일 : ${pictVO.file_url} <a href="#lnk" onclick="fn_file_delete()">파일삭제</a>
											</c:if>
										</div>
									</div>
								</div>
								
								<div class="write-item">
									<label for="title" class="title">수집 데이터 양</label>
									<div class="input-box">
										<textarea name="data_amount" id="" cols="15" rows="5" class="txt" style="width:33%;">${pictVO.data_amount}</textarea>
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
		
	</form>
	
	<script>
		
		function fn_file_delete(target){
			if (confirm("첨부파일을 삭제 하시겠습니까?")) {
				$("#register").attr("action", "/data/data_file_delete.do");
				$("#register").submit();
			}
		}
		
		function board_delete() {
			if (confirm("삭제 하시겠습니까?")) {
				$("#register").attr("action", "/data/data_delete.do");
				$("#register").submit();
			}
			
		}
		function board_list() {
			location.href = "/data/data_list.do";
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
				$("#register").attr("action", "/data/data_save.do");
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