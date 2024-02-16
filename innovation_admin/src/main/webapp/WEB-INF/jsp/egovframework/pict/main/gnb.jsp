<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn"	   uri="http://java.sun.com/jsp/jstl/functions"%>



<%
	String url = request.getRequestURL().toString();
	pageContext.setAttribute("url", url);
	
%>

<c:set var="gnb" value="${fn:indexOf(url, 'gnb')}"/>
<c:set var="intro" value="${fn:indexOf(url, 'intro')}"/>

<c:set var="user_list" value="${fn:indexOf(url, 'user_list')}"/>
<c:set var="user_register" value="${fn:indexOf(url, 'user_register')}"/>

<c:set var="board_list" value="${fn:indexOf(url, 'board_list')}"/>
<c:set var="board_register" value="${fn:indexOf(url, 'board_register')}"/>

<c:set var="popup_list" value="${fn:indexOf(url, 'popup_list')}"/>
<c:set var="popup_register" value="${fn:indexOf(url, 'popup_register')}"/>

<c:set var="program_list" value="${fn:indexOf(url, 'program_list')}"/>
<c:set var="program_register" value="${fn:indexOf(url, 'program_register')}"/>

<c:set var="event_list" value="${fn:indexOf(url, 'event_list')}"/>
<c:set var="event_register" value="${fn:indexOf(url, 'event_register')}"/>

<c:set var="data_list" value="${fn:indexOf(url, 'data_list')}"/>
<c:set var="data_register" value="${fn:indexOf(url, 'data_register')}"/>
<c:set var="data_type_list" value="${fn:indexOf(url, 'data_type_list')}"/>
<c:set var="data_type_register" value="${fn:indexOf(url, 'data_type_register')}"/>

<c:set var="status" value="${fn:indexOf(url, 'status')}"/>

<c:set var="banner_list" value="${fn:indexOf(url, 'banner_list')}"/>
<c:set var="banner_register" value="${fn:indexOf(url, 'banner_register')}"/>

<nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
    <div class="sb-sidenav-menu">
        <div class="nav">
        	<%
				pageContext.setAttribute("sessionid", session.getAttribute("id"));
			%>
            <a class="nav-link" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts1" aria-expanded="true" aria-controls="collapseLayouts1">
				사용자관리
            </a>
            <div class="collapse <c:if test="${user_list ne -1}">show</c:if>" id="collapseLayouts1" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                <nav class="sb-sidenav-menu-nested nav">
                    <a class="nav-link <c:if test="${user_list ne -1}">active</c:if>" href="/user/user_list.do">사용자 리스트</a>
                </nav>
            </div>
            
            <a class="nav-link" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts2" aria-expanded="true" aria-controls="collapseLayouts2">
				게시물관리
            </a>
            <div class="collapse <c:if test="${board_register ne -1}">show</c:if>" id="collapseLayouts2" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                <nav class="sb-sidenav-menu-nested nav">
                    <a class="nav-link <c:if test="${board_register ne -1}">active</c:if>" href="/board/board_register.do">게시물 등록</a>
                </nav>
            </div>
            <div class="collapse <c:if test="${board_list ne -1}">show</c:if>" id="collapseLayouts2" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                <nav class="sb-sidenav-menu-nested nav">
                    <a class="nav-link <c:if test="${board_list ne -1}">active</c:if>" href="/board/board_list.do">게시물 리스트</a>
                </nav>
            </div>
            
            <a class="nav-link" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts3" aria-expanded="true" aria-controls="collapseLayouts3">
				팝업존관리
            </a>
            <div class="collapse <c:if test="${popup_register ne -1}">show</c:if>" id="collapseLayouts3" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                <nav class="sb-sidenav-menu-nested nav">
                    <a class="nav-link <c:if test="${popup_register ne -1}">active</c:if>" href="/popup/popup_register.do">팝업존 등록</a>
                </nav>
            </div>
            <div class="collapse <c:if test="${popup_list ne -1}">show</c:if>" id="collapseLayouts3" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                <nav class="sb-sidenav-menu-nested nav">
                    <a class="nav-link <c:if test="${popup_list ne -1}">active</c:if>" href="/popup/popup_list.do">팝업존 리스트</a>
                </nav>
            </div>
            
            <a class="nav-link" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts4" aria-expanded="true" aria-controls="collapseLayouts4">
				프로그램관리
            </a>
            <div class="collapse <c:if test="${program_register ne -1}">show</c:if>" id="collapseLayouts4" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                <nav class="sb-sidenav-menu-nested nav">
                    <a class="nav-link <c:if test="${program_register ne -1}">active</c:if>" href="/program/program_register.do">프로그램 등록</a>
                </nav>
            </div>
            <div class="collapse <c:if test="${program_list ne -1}">show</c:if>" id="collapseLayouts4" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                <nav class="sb-sidenav-menu-nested nav">
                    <a class="nav-link <c:if test="${program_list ne -1}">active</c:if>" href="/program/program_list.do">프로그램 리스트</a>
                </nav>
            </div>
            
            <a class="nav-link" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts5" aria-expanded="true" aria-controls="collapseLayouts5">
				행사장관리
            </a>
            <div class="collapse <c:if test="${event_register ne -1}">show</c:if>" id="collapseLayouts5" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                <nav class="sb-sidenav-menu-nested nav">
                    <a class="nav-link <c:if test="${event_register ne -1}">active</c:if>" href="/event/event_register.do">행사장 등록</a>
                </nav>
            </div>
            <div class="collapse <c:if test="${event_list ne -1}">show</c:if>" id="collapseLayouts5" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                <nav class="sb-sidenav-menu-nested nav">
                    <a class="nav-link <c:if test="${event_list ne -1}">active</c:if>" href="/event/event_list.do">행사장 리스트</a>
                </nav>
            </div>
            
            
            <a class="nav-link" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts6" aria-expanded="true" aria-controls="collapseLayouts6">
				데이터관리
            </a>
            <div class="collapse <c:if test="${data_type_register ne -1}">show</c:if>" id="collapseLayouts6" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                <nav class="sb-sidenav-menu-nested nav">
                    <a class="nav-link <c:if test="${data_type_register ne -1}">active</c:if>" href="/data/data_type_register.do">데이터형태 등록</a>
                </nav>
            </div>
            <div class="collapse <c:if test="${data_type_list ne -1}">show</c:if>" id="collapseLayouts6" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                <nav class="sb-sidenav-menu-nested nav">
                    <a class="nav-link <c:if test="${data_type_list ne -1}">active</c:if>" href="/data/data_type_list.do">데이터형태 리스트</a>
                </nav>
            </div>
            <div class="collapse <c:if test="${data_register ne -1}">show</c:if>" id="collapseLayouts6" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                <nav class="sb-sidenav-menu-nested nav">
                    <a class="nav-link <c:if test="${data_register ne -1}">active</c:if>" href="/data/data_register.do">데이터 등록</a>
                </nav>
            </div>
            <div class="collapse <c:if test="${data_list ne -1}">show</c:if>" id="collapseLayouts6" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                <nav class="sb-sidenav-menu-nested nav">
                    <a class="nav-link <c:if test="${data_list ne -1}">active</c:if>" href="/data/data_list.do">데이터 리스트</a>
                </nav>
            </div>
            
            <a class="nav-link" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts7" aria-expanded="true" aria-controls="collapseLayouts7">
				통계관리
            </a>
            <div class="collapse <c:if test="${status ne -1}">show</c:if>" id="collapseLayouts7" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                <nav class="sb-sidenav-menu-nested nav">
                    <a class="nav-link <c:if test="${status ne -1}">active</c:if>" href="/status/status_list.do">통계 리스트</a>
                </nav>
            </div>
            
            <a class="nav-link" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts8" aria-expanded="true" aria-controls="collapseLayouts8">
				띠배너 관리
            </a>
            <div class="collapse <c:if test="${banner_list ne -1}">show</c:if>" id="collapseLayouts8" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                <nav class="sb-sidenav-menu-nested nav">
                    <a class="nav-link <c:if test="${banner_list ne -1}">active</c:if>" href="/banner/banner_list.do">띠배너 리스트</a>
                </nav>
            </div>
            <div class="collapse <c:if test="${banner_register ne -1}">show</c:if>" id="collapseLayouts8" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                <nav class="sb-sidenav-menu-nested nav">
                    <a class="nav-link <c:if test="${banner_register ne -1}">active</c:if>" href="/banner/banner_register.do">띠배너 등록</a>
                </nav>
            </div>
            
		</div>
	</div>
</nav>
<script>
	function tttt() {
		alert("준비중입니다.")
	}
</script>

<script src="../../../../../js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="../../../../../js/scripts.js"></script>
<script src="../../../../../js/Chart.min.js" crossorigin="anonymous"></script>
<script src="../../../../../js/simple-datatables@latest.js" crossorigin="anonymous"></script>