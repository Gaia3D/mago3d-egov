<%--
  Class Name : list-project.jsp
  Description : 프로젝트 목록화면
  Modification Information
 
    author   : HJCHOI
    since    : 2018.05.02  
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="egovframework.com.cmm.service.EgovProperties" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="ImgUrl" value="/images/egovframework/cop/bbs/"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
<meta http-equiv="content-language" content="ko">
<link href="<c:url value='/'/>css/common.css" rel="stylesheet" type="text/css" >
<c:if test="${anonymous == 'true'}"><c:set var="prefix" value="/anonymous"/></c:if>
<script type="text/javascript" src="<c:url value='/js/EgovBBSMng.js' />" ></script>
<c:choose>
<c:when test="${preview == 'true'}">
<script type="text/javascript">
<!--
    function press(event) {
    }

    function fn_egov_addNotice() {
    }
    
    function fn_egov_select_noticeList(pageNo) {
    }
    
    function fn_egov_inqire_notice(nttId, bbsId) {      
    }
//-->
</script>
</c:when>
<c:otherwise>
<script type="text/javascript">
<!--
    function press(event) {
        if (event.keyCode==13) {
            fn_egov_select_noticeList('1');
        }
    }

    function fn_egov_addNotice() {
        document.frm.action = "<c:url value='/cop/bbs${prefix}/addBoardArticle.do'/>";
        document.frm.submit();
    }
    
    function fn_egov_select_noticeList(pageNo) {
        document.frm.pageIndex.value = pageNo;
        document.frm.action = "<c:url value='/cop/bbs${prefix}/selectBoardList.do'/>";
        document.frm.submit();  
    }
    
    function fn_egov_inqire_notice(nttId, bbsId) {
        document.subForm.nttId.value = nttId;
        document.subForm.bbsId.value = bbsId;
        document.subForm.action = "<c:url value='/cop/bbs${prefix}/selectBoardArticle.do'/>";
        document.subForm.submit();          
    }
//-->
</script>
</c:otherwise>
</c:choose>
<title><c:out value="${brdMstrVO.bbsNm}"/> 목록</title>

<style type="text/css">
    h1 {font-size:12px;}
    caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
</style>


</head>
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
                            <li><strong>프로젝트 목록</strong></li>
                        </ul>
                    </div>
                </div>
                <!-- 검색 필드 박스 시작 -->
                <div id="search_field">
                    <div id="search_field_loc"><h2><strong><c:out value='${brdMstrVO.bbsNm}'/></strong></h2></div>
					<form name="frm" action ="<c:url value='/cop/bbs${prefix}/selectBoardList.do'/>" method="post">
						<input type="hidden" name="bbsId" value="<c:out value='${boardVO.bbsId}'/>" />
						<input type="hidden" name="nttId"  value="0" />
						<input type="hidden" name="bbsTyCode" value="<c:out value='${brdMstrVO.bbsTyCode}'/>" />
						<input type="hidden" name="bbsAttrbCode" value="<c:out value='${brdMstrVO.bbsAttrbCode}'/>" />
						<input type="hidden" name="authFlag" value="<c:out value='${brdMstrVO.authFlag}'/>" />
						<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
                        <input type="submit" value="실행" onclick="fn_egov_select_noticeList('1'); return false;" id="invisible" class="invisible" />
                        
                        <fieldset><legend>조건정보 영역</legend>
                        <div class="sf_start">
                            <ul id="search_first_ul">
                                <li>
								    <select name="searchCnd" class="select" title="검색조건 선택">
								           <option value="0" <c:if test="${searchVO.searchCnd == '0'}">selected="selected"</c:if> >제목</option>
								           <option value="1" <c:if test="${searchVO.searchCnd == '1'}">selected="selected"</c:if> >내용</option>             
								           <option value="2" <c:if test="${searchVO.searchCnd == '2'}">selected="selected"</c:if> >작성자</option>            
                                    </select>
                                </li>
                                <li>
                                    <input name="searchWrd" type="text" size="35" value='<c:out value="${searchVO.searchWrd}"/>' maxlength="35" onkeypress="press(event);" title="검색어 입력"> 
                                </li>
                                <li>
                                    <div class="buttons" style="position:absolute;left:570px;top:168px;">
                                        <a href="#LINK" onclick="javascript:fn_egov_select_noticeList('1'); return false;"><img src="<c:url value='/images/img_search.gif' />" alt="search" />검색 </a>
                                        <% if(null != session.getAttribute("LoginVO")){ %>
                                        <c:if test="${brdMstrVO.authFlag == 'Y'}">
                                            <a href="<c:url value='/cop/bbs${prefix}/addBoardArticle.do'/>?bbsId=<c:out value="${boardVO.bbsId}"/>">등록</a>
                                        </c:if>
                                        <%} %>
                                    </div>                              
                                </li>      
                            </ul>
                        </div>
                        </fieldset>
                    </form>
                </div>
                <!-- //검색 필드 박스 끝 -->
                <!-- 
                <div id="page_info"><div id="page_info_align"></div></div>                    
                 -->
                <!-- table add start -->
                <div class="default_tablestyle">
                    <table summary="번호, 제목, 게시시작일, 게시종료일, 작성자, 작성일, 조회수   입니다" cellpadding="0" cellspacing="0">
                    <caption>게시물 목록</caption>
                    <thead>
                    <tr>
                        <th scope="col" nowrap="nowrap">프로젝트명</th>
	                    <th scope="col" nowrap="nowrap">위도</th>
                        <th scope="col" nowrap="nowrap">경도</th>
                        <th scope="col" nowrap="nowrap">높이</th>
                        <th scope="col" nowrap="nowrap">등록일</th>
                    </tr>
                    </thead>
                    <tbody>   
                    
                    
     
     
<c:if test="${empty projectList }">
										<tr>
											<td colspan="14" class="col-none"><spring:message code='data.project.does.not.exist'/></td>
										</tr>
</c:if>
<c:if test="${!empty projectList }">
	<c:forEach var="project" items="${projectList}" varStatus="status">
										<tr>
											<td class="col-number">${project.project_name }</td>
											<td class="col-toggle">${project.latitude}</td>
											<td class="col-toggle">${project.longitude}</td>
											<td class="col-toggle">${project.height}</td>
											<td class="col-date">${project.viewInsertDate }</td>
										</tr>
	</c:forEach>
</c:if>

                    </tbody>
                    </table>
                </div>
                <!-- 페이지 네비게이션 시작 -->
                <div id="paging_div">
                    <ul class="paging_align">
                       <%--  <ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_egov_select_noticeList" />     --%>
                    </ul>
                </div>
                <!-- //페이지 네비게이션 끝 -->  
            </div>
            <!-- //content 끝 -->    
        </div>
        <!-- //container 끝 -->
        <!-- footer 시작 -->
        <div id="footer"><c:import url="/EgovPageLink.do?link=main/inc/EgovIncFooter" /></div>
        <!-- //footer 끝 -->
    </div>
    <!-- //전체 레이어 끝 -->
 </body>
</html>