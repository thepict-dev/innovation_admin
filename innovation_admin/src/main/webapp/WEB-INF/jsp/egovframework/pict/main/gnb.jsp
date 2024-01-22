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
<c:set var="connection_status" value="${fn:indexOf(url, 'connection_status')}"/>
<c:set var="connection_user" value="${fn:indexOf(url, 'connection_user')}"/>
<c:set var="lecture" value="${fn:indexOf(url, 'lecture')}"/>
<c:set var="lecture_list" value="${fn:indexOf(url, 'lecture_list')}"/>
<c:set var="lecture_register" value="${fn:indexOf(url, 'lecture_register')}"/>



<c:set var="gnb" value="${fn:indexOf(url, 'gnb')}"/>
<c:set var="intro" value="${fn:indexOf(url, 'intro')}"/>

<c:set var="user_list" value="${fn:indexOf(url, 'user_list')}"/>
<c:set var="user_register" value="${fn:indexOf(url, 'user_register')}"/>

<c:set var="board_list" value="${fn:indexOf(url, 'board_list')}"/>
<c:set var="board_register" value="${fn:indexOf(url, 'board_register')}"/>

<c:set var="video_register" value="${fn:indexOf(url, 'video_register')}"/>
<c:set var="patrol_list" value="${fn:indexOf(url, 'patrol_list')}"/>


<c:set var="finish_list" value="${fn:indexOf(url, 'finish_list')}"/>

<c:set var="superstar_list" value="${fn:indexOf(url, 'superstar_list')}"/>
<c:set var="superstar_vote" value="${fn:indexOf(url, 'superstar_vote')}"/>

<c:set var="quiz_maze_list" value="${fn:indexOf(url, 'quiz_maze_list')}"/>
<c:set var="bwf_list" value="${fn:indexOf(url, 'bwf_list')}"/>
<c:set var="wesp_list" value="${fn:indexOf(url, 'wesp_list')}"/>
<c:set var="best_list" value="${fn:indexOf(url, 'best_list')}"/>

<c:set var="brand_register" value="${fn:indexOf(url, 'brand_register')}"/>



<nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
    <div class="sb-sidenav-menu">
        <div class="nav">
        	<%
				pageContext.setAttribute("sessionid", session.getAttribute("id"));
			%>
            <a class="nav-link" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts1" aria-expanded="true" aria-controls="collapseLayouts1">
				사용자관리
            </a>
            <div class="collapse <c:if test="${user_register ne -1}">show</c:if>" id="collapseLayouts1" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                <nav class="sb-sidenav-menu-nested nav">
                    <a class="nav-link <c:if test="${user_register ne -1}">active</c:if>" href="/user/user_register.do">사용자 등록</a>
                </nav>
            </div>
            
            <div class="collapse <c:if test="${user_list ne -1}">show</c:if>" id="collapseLayouts1" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                <nav class="sb-sidenav-menu-nested nav">
                    <a class="nav-link <c:if test="${user_list ne -1}">active</c:if>" href="/user/user_list.do">사용자 리스트</a>
                </nav>
            </div>
            
            <a class="nav-link" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts2" aria-expanded="true" aria-controls="collapseLayouts2">
				컨텐츠관리
            </a>
            <div class="collapse <c:if test="${board_register ne -1}">show</c:if>" id="collapseLayouts2" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                <nav class="sb-sidenav-menu-nested nav">
                    <a class="nav-link <c:if test="${board_register ne -1}">active</c:if>" href="/board/board_register.do">띠배너 등록</a>
                </nav>
            </div>
            <div class="collapse <c:if test="${board_list ne -1}">show</c:if>" id="collapseLayouts2" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                <nav class="sb-sidenav-menu-nested nav">
                    <a class="nav-link <c:if test="${board_list ne -1}">active</c:if>" href="/board/board_list.do">띠배너 리스트</a>
                </nav>
            </div>
            
            <div class="collapse <c:if test="${video_register ne -1}">show</c:if>" id="collapseLayouts2" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                <nav class="sb-sidenav-menu-nested nav">
                    <a class="nav-link <c:if test="${video_register ne -1}">active</c:if>" href="/video/video_register.do">동영상 등록</a>
                </nav>
            </div>
            
            <a class="nav-link" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts3" aria-expanded="true" aria-controls="collapseLayouts3">
				참여관리
            </a>
            <div class="collapse <c:if test="${patrol_list ne -1}">show</c:if>" id="collapseLayouts3" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                <nav class="sb-sidenav-menu-nested nav">
                    <a class="nav-link <c:if test="${patrol_list ne -1}">active</c:if>" href="/participation/patrol_list.do">스카우트기능</a>
                </nav>
            </div>
            <div class="collapse <c:if test="${quiz_maze_list ne -1}">show</c:if>" id="collapseLayouts3" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                <nav class="sb-sidenav-menu-nested nav">
                    <a class="nav-link <c:if test="${quiz_maze_list ne -1}">active</c:if>" href="/participation/quiz_maze_list.do">OX퀴즈/미로찾기</a>
                </nav>
            </div>
            <div class="collapse <c:if test="${bwf_list ne -1}">show</c:if>" id="collapseLayouts3" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                <nav class="sb-sidenav-menu-nested nav">
                    <a class="nav-link <c:if test="${bwf_list ne -1}">active</c:if>" href="/participation/bwf_list.do">BWF</a>
                </nav>
            </div>
            <div class="collapse <c:if test="${wesp_list ne -1}">show</c:if>" id="collapseLayouts3" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                <nav class="sb-sidenav-menu-nested nav">
                    <a class="nav-link <c:if test="${wesp_list ne -1}">active</c:if>" href="/participation/wesp_list.do">줍깅챌린지</a>
                </nav>
            </div>
            <div class="collapse <c:if test="${best_list ne -1}">show</c:if>" id="collapseLayouts3" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                <nav class="sb-sidenav-menu-nested nav">
                    <a class="nav-link <c:if test="${best_list ne -1}">active</c:if>" href="/participation/best_list.do">우수참여자</a>
                </nav>
            </div>
            
            <a class="nav-link" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts4" aria-expanded="true" aria-controls="collapseLayouts4">
				슈퍼스타 J
            </a>
            <div class="collapse <c:if test="${superstar_list ne -1}">show</c:if>" id="collapseLayouts4" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                <nav class="sb-sidenav-menu-nested nav">
                    <a class="nav-link <c:if test="${superstar_list ne -1}">active</c:if>" href="/superstar/superstar_list.do">참여관리 리스트</a>
                </nav>
            </div>
            <div class="collapse <c:if test="${superstar_vote ne -1}">show</c:if>" id="collapseLayouts4" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                <nav class="sb-sidenav-menu-nested nav">
                    <a class="nav-link <c:if test="${superstar_vote ne -1}">active</c:if>" href="/superstar/superstar_vote.do">슈퍼스타J 투표현황</a>
                </nav>
            </div>
            
            <a class="nav-link" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts5" aria-expanded="true" aria-controls="collapseLayouts5">
				홍보관관리
            </a>
            <div class="collapse <c:if test="${brand_register ne -1}">show</c:if>" id="collapseLayouts5" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                <nav class="sb-sidenav-menu-nested nav">
                    <a class="nav-link <c:if test="${brand_register ne -1}">active</c:if>" href="/brand/brand_register.do">홍보관 수정</a>
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