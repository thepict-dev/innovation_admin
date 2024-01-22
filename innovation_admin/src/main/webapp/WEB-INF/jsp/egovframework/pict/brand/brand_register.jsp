<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script type="text/javascript" src="/js/HuskyEZCreator.js" charset="utf-8"></script>

<!DOCTYPE html>
<html lang="ko">
<c:import url="../main/header.jsp">
	<c:param name="pageTitle" value="홍보관 수정" />
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
					<h2 class="contents-title">홍보관 수정</h2>
					<div class="contents-box">
						<div class="card">
							<div class="card-body">
								<div class="write-box">
									<div class="write-item">
										<label for="title" class="title">홍보관 1*</label>
										<div class="input-box">
											<input type="text" id="brand_title1" name="brand_title1" value="${pictVO.brand_title1}" class="input opt-max-width-300">
										</div>
										<label for="title" class="title">홍보관 링크 1*</label>
										<div class="input-box">
											<input type="text" id="brand_link1" name="brand_link1" value="${pictVO.brand_link1}" class="input opt-max-width-300">
										</div>
									</div>
									<div class="write-item">
										<label for="title" class="title">홍보관 2*</label>
										<div class="input-box">
											<input type="text" id="brand_title2" name="brand_title2" value="${pictVO.brand_title2}" class="input opt-max-width-300">
										</div>
										<label for="title" class="title">홍보관 링크 2*</label>
										<div class="input-box">
											<input type="text" id="brand_link2" name="brand_link2" value="${pictVO.brand_link2}" class="input opt-max-width-300">
										</div>
									</div>
									<div class="write-item">
										<label for="title" class="title">홍보관 3*</label>
										<div class="input-box">
											<input type="text" id="brand_title3" name="brand_title3" value="${pictVO.brand_title3}" class="input opt-max-width-300">
										</div>
										<label for="title" class="title">홍보관 링크 3*</label>
										<div class="input-box">
											<input type="text" id="brand_link3" name="brand_link3" value="${pictVO.brand_link3}" class="input opt-max-width-300">
										</div>
									</div>
									<div class="write-item">
										<label for="title" class="title">홍보관 4*</label>
										<div class="input-box">
											<input type="text" id="brand_title4" name="brand_title4" value="${pictVO.brand_title4}" class="input opt-max-width-300">
										</div>
										<label for="title" class="title">홍보관 링크 4*</label>
										<div class="input-box">
											<input type="text" id="brand_link4" name="brand_link4" value="${pictVO.brand_link4}" class="input opt-max-width-300">
										</div>
									</div>
									<div class="write-item">
										<label for="title" class="title">홍보관 5*</label>
										<div class="input-box">
											<input type="text" id="brand_title5" name="brand_title5" value="${pictVO.brand_title5}" class="input opt-max-width-300">
										</div>
										<label for="title" class="title">홍보관 링크 5*</label>
										<div class="input-box">
											<input type="text" id="brand_link5" name="brand_link5" value="${pictVO.brand_link5}" class="input opt-max-width-300">
										</div>
									</div>
									<div class="write-item">
										<label for="title" class="title">홍보관 6*</label>
										<div class="input-box">
											<input type="text" id="brand_title6" name="brand_title6" value="${pictVO.brand_title6}" class="input opt-max-width-300">
										</div>
										<label for="title" class="title">홍보관 링크 6*</label>
										<div class="input-box">
											<input type="text" id="brand_link6" name="brand_link6" value="${pictVO.brand_link6}" class="input opt-max-width-300">
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
		<input type='hidden' name="type" id="type" value='' />
		<input type='hidden' name="del_img_url" id="del_img_url" value='' />
		
	</form>
	
	<script>
		function button1_click() {
			
			var text = "등록하시겠습니까?";
			if (saveType == 'update') {
				text = "수정하시겠습니까?"
			}

			if (confirm(text)) {
				$("#register").attr("action", "/brand/brand_save.do");
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