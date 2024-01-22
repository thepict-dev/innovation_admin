<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
    <h1 class="header-logo">
    	<a class="navbar-brand ps-3" href="/pict_main.do">
    		<img src="/images/pict/logo_1.png" alt="디지털잼버리" style="position:relative; left:-5px">
   		</a>
	</h1>
    <div class="header-info">
		<ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
			<li class="nav-item dropdown">
				<a href="#lnk" onclick="javascript:fn_logout();" class="header-logout">
					<i class="fa-solid fa-right-from-bracket"></i>Logout
				</a>
			</li>
		</ul>
	</div>
</nav>

<script>
	function fn_logout() {
		if(confirm("로그아웃 하시겠습니까?")){
			location.href="/logout.do"
		}
	}
	function fn_user() {
		location.href="/user_register.do"
	}
</script>
<script src="../../../../../js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="../../../../../js/scripts.js"></script>
<script src="../../../../../js/Chart.min.js" crossorigin="anonymous"></script>
<script src="../../../../../js/simple-datatables@latest.js" crossorigin="anonymous"></script>