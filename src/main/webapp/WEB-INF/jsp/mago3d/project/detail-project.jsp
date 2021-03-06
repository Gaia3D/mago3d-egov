<%--
  Class Name : input-project.jsp
  Description : 프로젝트 상세 화면
  Modification Information
 
    author   : HJCHOI
    since    : 2018.05.02  
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
<meta http-equiv="content-language" content="ko">
<link href="<c:url value='/'/>css/common.css" rel="stylesheet" type="text/css" >
<link href="<c:url value='${brdMstrVO.tmplatCours}' />" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<c:url value='/js/EgovBBSMng.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/EgovMultiFile.js'/>" ></script>
<script type="text/javascript" src="<c:url value='/js/EgovCalPopup.js'/>" ></script>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="board" staticJavascript="false" xhtml="true" cdata="false"/>
<c:if test="${anonymous == 'true'}"><c:set var="prefix" value="/anonymous"/></c:if>
<script type="text/javascript">
    function fn_egov_validateForm(obj) {
        return true;
    }
    
    function fn_egov_regist_notice() {
        //document.board.onsubmit();
        
        if (!validateBoard(document.board)){
            return;
        }
        <c:if test="${bdMstr.bbsAttrbCode == 'BBSA02'}">
        if(document.getElementById("egovComFileUploader").value==""){
            alert("갤러리 게시판의 경우 이미지 파일 첨부가 필수사항입니다.");
            return false;
        }
        </c:if>
        if (confirm('<spring:message code="common.regist.msg" />')) {
            //document.board.onsubmit();
            document.board.action = "<c:url value='/cop/bbs${prefix}/insertBoardArticle.do'/>";
            document.board.submit();
        }
    }
    
    function fn_egov_select_noticeList() {
        document.board.action = "<c:url value='/cop/bbs${prefix}/selectBoardList.do'/>"+ "?bbsId=" +"<c:out value='${bdMstr.bbsId}'/>";
        document.board.submit();
    }   
</script>
<style type="text/css">
.noStyle {background:ButtonFace; BORDER-TOP:0px; BORDER-bottom:0px; BORDER-left:0px; BORDER-right:0px;}
  .noStyle th{background:ButtonFace; padding-left:0px;padding-right:0px}
  .noStyle td{background:ButtonFace; padding-left:0px;padding-right:0px}
</style>
<title><c:out value='${bdMstr.bbsNm}'/>프로젝트 등록 </title>

<style type="text/css">
    h1 {font-size:12px;}
    caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
</style>


</head>

<!-- body onload="javascript:editor_generate('nttCn');"-->
<!-- <body onLoad="HTMLArea.init(); HTMLArea.onload = initEditor; document.board.nttSj.focus();"> -->
<body>
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>

<!-- 전체 레이어 시작 -->
<div id="wrap">
    <!-- header 시작 -->
    <div id="header_mainsize"><c:import url="/EgovPageLink.do?link=main/inc/EgovIncHeader" /></div>
    <div id="topnavi"><c:import url="/EgovPageLink.do?link=main/inc/EgovIncTopnav" /></div>        
    <!-- //header 끝 --> 
    <!-- container 시작 -->
    <div id="container">
        <!-- 좌측메뉴 시작 -->
        <div id="leftmenu"><c:import url="/EgovPageLink.do?link=main/inc/EgovIncLeftmenu" /></div>
        <!-- //좌측메뉴 끝 -->
            <!-- 현재위치 네비게이션 시작 -->
            <div id="content">
                <div id="cur_loc">
                    <div id="cur_loc_align">
                        <ul>
                            <li>운영설정</li>
                            <li>&gt;</li>
                            <li><strong>프로젝트 등록</strong></li>
                        </ul>
                    </div>
                </div>
                <!-- 검색 필드 박스 시작 -->
                <div id="search_field">
                    <div id="search_field_loc"><h2><strong>프로젝트 등록</strong></h2></div>
                </div>

				
					<div id="border" class="modify_user" >
						<form:form id="project" modelAttribute="project" method="post" onsubmit="return false;">
								<form:hidden path="project_id"/>
								<table class="input-table scope-row">
									<col class="col-label" />
									<col class="col-input" />
									<tr>
										<th class="col-label" scope="row">Key
											<img src="<c:url value='/images/required.gif' />" width="15" height="15" alt="required" />
										</th>
										<td class="col-input">${project.project_key}</tr>
									<tr>
										<th class="col-label" scope="row">프로젝트명
											<img src="<c:url value='/images/required.gif' />" width="15" height="15" alt="required" />
										</th>
										<td class="col-input">${project.project_name}</td>
									</tr>
									<tr>
										<th class="col-label" scope="row">표시순서</th>
										<td class="col-input">${project.view_order}</td>
									</tr>
									<tr>
										<th class="col-label" scope="row">
											<form:label path="default_yn">기본값</form:label>
										</th>
<c:if test="${project.default_yn eq  'Y'}" >
										<td class="col-input">기본</td>
</c:if>										
<c:if test="${project.default_yn eq  'N'}" >
										<td class="col-input">선택</td>
</c:if>										
									</tr>
									<tr>
										<th class="col-label" scope="row">
											<form:label path="use_yn">상태</form:label>
										</th>
<c:if test="${project.use_yn eq 'Y' }">
										<td class="col-input">사용</td>
</c:if>
<c:if test="${project.use_yn eq 'N' }">
										<td class="col-input">사용안함</td>
</c:if>
									</tr>
									<tr>
										<th class="col-label" scope="row">
											<form:label path="latitude">위도</form:label>
											<img src="<c:url value='/images/required.gif' />" width="15" height="15" alt="required" />
										</th>
										<td class="col-input">${project.latitude}</td>
									</tr>
									<tr>
										<th class="col-label" scope="row">
											<form:label path="longitude">경도</form:label>
											<img src="<c:url value='/images/required.gif' />" width="15" height="15" alt="required" />
										</th>
										<td class="col-input">${project.longitude}</td>
									</tr>
									<tr>
										<th class="col-label" scope="row">
											<form:label path="height">높이</form:label>
											<img src="<c:url value='/images/required.gif' />" width="15" height="15" alt="required" />
										</th>
										<td class="col-input">${project.height}</td>
									</tr>
									<tr>
										<th class="col-label" scope="row">
											<form:label path="duration">이동시간</form:label>
											<img src="<c:url value='/images/required.gif' />" width="15" height="15" alt="required" />
										</th>
										<td class="col-input">${project.duration} 초</td>
									</tr>
									<tr>
										<th class="col-label" scope="row">
											<form:label path="description">설명</form:label>
										</th>
										<td class="col-input">${project.description}</td>
									</tr>
								</table>
								<center>
								<div class="buttons" style="margin: 30px;">
									<div id="insertProjectLink">
										<input type="button" onclick="location.href='list-project.do'" class="button" value="목록" style="font-size: 12px; padding: 3px;">
										
									</div>
								</div>
								</center>
						</form:form>
                    </div>                        

            </div>  
            <!-- //content 끝 -->    
    </div>  
    <!-- //container 끝 -->
    <!-- footer 시작 -->
    <div id="footer"><c:import url="/EgovPageLink.do?link=main/inc/EgovIncFooter" /></div>
    <!-- //footer 끝 -->
</div>
<!-- //전체 레이어 끝 -->

<script src="/js/jquery/jquery.js"></script>
<script src="/js/jquery-ui/jquery-ui.js"></script>
<script type="text/javascript">


</script>    
</body>
</html>

