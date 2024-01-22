<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script type="text/javascript" src="/js/HuskyEZCreator.js" charset="utf-8"></script>

<!DOCTYPE html>
<html lang="ko">
<c:import url="../main/header.jsp">
	<c:param name="pageTitle" value="슈퍼스타J" />
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
					<h2 class="contents-title">슈퍼스타J</h2>
					<div class="contents-box">
						<div class="card">
							<div class="card-body">
								<c:if test="${pictVO.ext eq 'mp4' || pictVO.ext eq 'm4v' || pictVO.ext eq 'avi' || pictVO.ext eq 'wmv' || 
								pictVO.ext eq 'mwa' || pictVO.ext eq 'asf' || pictVO.ext eq 'mpg' || pictVO.ext eq 'mpeg' || pictVO.ext eq 'mkv'}">
									<video src="${pictVO.file_url}" id="my_video" width="500" height="350" controls></video>
								</c:if>
								
								<c:if test="${pictVO.ext eq 'bmp' || pictVO.ext eq 'jpeg' || pictVO.ext eq 'jpg' || pictVO.ext eq 'gif' || pictVO.ext eq 'png'}">
									<img src="${pictVO.file_url}" style="max-width:350px"/>
								</c:if>	
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
	
	<script src="../../../../../js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	<script src="../../../../../js/scripts.js"></script>
	<script src="../../../../../js/Chart.min.js" crossorigin="anonymous"></script>
	<script src="../../../../../js/simple-datatables@latest.js" crossorigin="anonymous"></script>

</body>
</html>