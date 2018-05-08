<%--
  Class Name : list-project.jsp
  Description : 프로젝트 목록화면
  Modification Information
 
    author   : HJCHOI
    since    : 2018.05.02  
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="egovframework.com.cmm.service.EgovProperties"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="content-language" content="ko">
<link href="<c:url value='/'/>css/common.css" rel="stylesheet"
	type="text/css">

<title>데이터 목록</title>

<style type="text/css">
h1 {
	font-size: 12px;
}

caption {
	visibility: hidden;
	font-size: 0;
	height: 0;
	margin: 0;
	padding: 0;
	line-height: 0;
}
</style>
</head>
<body>
	<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부
		기능을 사용하실 수 없습니다.</noscript>
	<!-- 전체 레이어 시작 -->
	<div id="wrap">
		<!-- header 시작 -->
		<div id="header_mainsize">
			<c:import url="/EgovPageLink.do?link=main/inc/EgovIncHeader" />
		</div>
		<div id="topnavi">
			<c:import url="/EgovPageLink.do?link=main/inc/EgovIncTopnav" />
		</div>
		<!-- //header 끝 -->
		<!-- container 시작 -->
		<div id="container">
			<!-- 좌측메뉴 시작 -->
			<div id="leftmenu">
				<c:import url="/EgovPageLink.do?link=main/inc/EgovIncLeftmenu" />
			</div>
			<!-- //좌측메뉴 끝 -->
			<!-- 현재위치 네비게이션 시작 -->
			<div id="content">
				<div id="cur_loc">
					<div id="cur_loc_align">
						<ul>
							<li>운영설정</li>
							<li>&gt;</li>
							<li><strong>데이터 목록</strong></li>
						</ul>
					</div>
				</div>
				<!-- 검색 필드 박스 시작 -->
				<div id="search_field">
					<div id="search_field_loc">
						<h2>
							<strong><c:out value='${brdMstrVO.bbsNm}' /></strong>
						</h2>
					</div>
					<form name="frm"
						action="<c:url value='/cop/bbs${prefix}/selectBoardList.do'/>"
						method="post">
						<input type="hidden" name="bbsId"
							value="<c:out value='${boardVO.bbsId}'/>" /> <input
							type="hidden" name="nttId" value="0" /> <input type="hidden"
							name="bbsTyCode" value="<c:out value='${brdMstrVO.bbsTyCode}'/>" />
						<input type="hidden" name="bbsAttrbCode"
							value="<c:out value='${brdMstrVO.bbsAttrbCode}'/>" /> <input
							type="hidden" name="authFlag"
							value="<c:out value='${brdMstrVO.authFlag}'/>" /> <input
							name="pageIndex" type="hidden"
							value="<c:out value='${searchVO.pageIndex}'/>" /> <input
							type="submit" value="실행"
							onclick="fn_egov_select_noticeList('1'); return false;"
							id="invisible" class="invisible" />

						<fieldset style="margin-bottom: 20px;">
							<legend>조건정보 영역</legend>
							<div class="sf_start">
								<ul id="search_first_ul">
									<li><select name="searchCnd" class="select"
										title="검색조건 선택">
											<option value="0"
												<c:if test="${searchVO.searchCnd == '0'}">selected="selected"</c:if>>제목</option>
											<option value="1"
												<c:if test="${searchVO.searchCnd == '1'}">selected="selected"</c:if>>내용</option>
											<option value="2"
												<c:if test="${searchVO.searchCnd == '2'}">selected="selected"</c:if>>작성자</option>
									</select></li>
									<li><input name="searchWrd" type="text" size="35"
										value='<c:out value="${searchVO.searchWrd}"/>' maxlength="35"
										onkeypress="press(event);" title="검색어 입력">
									</li>
									<li><div class="buttons" style="position: absolute; left: 870px; top: 168px;">
											<a href="#LINK"
												onclick="javascript:fn_egov_select_noticeList('1'); return false;">
												<img src="<c:url value='/images/img_search.gif' />" alt="search" />검색
											</a>
											<% if(null != session.getAttribute("LoginVO")){ %>
											<c:if test="${brdMstrVO.authFlag == 'Y'}">
												<a
													href="<c:url value='/cop/bbs${prefix}/addBoardArticle.do'/>?bbsId=<c:out value="${boardVO.bbsId}"/>">등록</a>
											</c:if>
											<%} %>
									</div></li>
								</ul>
							</div>
						</fieldset>
					</form>
				</div>
				<!-- //검색 필드 박스 끝 -->



				<div class="list">
					<form:form id="listForm" modelAttribute="data" method="post">
						<input type="hidden" id="check_ids" name="check_ids" value="" />
<%-- 						<div class="list-header row">
							<div class="list-desc u-pull-left">
							전체: <em><fmt:formatNumber value="${pagination.totalCount}" type="number"/></em>건
							<fmt:formatNumber value="${pagination.pageNo}" type="number"/> / <fmt:formatNumber value="${pagination.lastPage }" type="number"/>페이지
						</div> 
							<div class="list-functions u-pull-right">
								<div class="button-group">
									<a href="#"
										onclick="updateDataStatus('DATA', 'LOCK'); return false;"
										class="button">잠금</a> <a href="#"
										onclick="updateDataStatus('DATA', 'UNLOCK'); return false;"
										class="button">잠금 해제</a> <a href="#"
										onclick="deleteDatas(); return false;" class="button">일괄
										삭제</a> <a href="#" onclick="uploadDataFile(); return false;"
										class="button">일괄 등록</a> <a href="#"
										onclick="uploadProjectDataAttribute(); return false;"
										class="button">속성 일괄 등록</a> <a href="#"
										onclick="uploadProjectDataObjectAttribute(); return false;"
										class="button">Object 속성 일괄 등록</a>
								</div>
							</div>
						</div> --%>

						<!-- table add start -->
						<div class="default_tablestyle">

							<table class="list-table scope-col">
								<col class="col-number" />
								<col class="col-name" />
								<col class="col-id" />
								<col class="col-name" />
								<col class="col-toggle" />
								<col class="col-toggle" />
								<col class="col-toggle" />
								<col class="col-toggle" />
								<col class="col-date" />
								<col class="col-functions" />
								<thead>
									<tr>
										<th scope="col" class="col-number">총 건수</th>
										<th scope="col" class="col-name">프로젝트명</th>
										<th scope="col" class="col-id">프로젝트 Key</th>
										<th scope="col" class="col-name">데이터명</th>
										<th scope="col" class="col-toggle">위도</th>
										<th scope="col" class="col-toggle">경도</th>
										<th scope="col" class="col-toggle">높이</th>
										<th scope="col" class="col-toggle">상태</th>
										<th scope="col" class="col-functions" colspan="2">수정/삭제</th>
									</tr>
								</thead>
								<tbody>
									<c:if test="${empty dataList }">
										<tr>
											<td colspan="14" class="col-none">데이터가 존재하지 않습니다.</td>
										</tr>
									</c:if>
									<c:if test="${!empty dataList }">
										<c:forEach var="data" items="${dataList}" varStatus="status">
											<tr>
												<td class="col-number">${pagination.rowNumber - status.index }</td>
												<td class="col-name"><a href="#"
													class="view-group-detail"
													onclick="detailProject('${data.project_id }'); return false;">${data.project_name }</a></td>
												<td class="col-id">${data.data_key }</td>
												<td class="col-name"><a
													href="/data/detail-data.do?data_id=${data.data_id }&amp;pageNo=${pagination.pageNo }${pagination.searchParameters}">${data.data_name }</a></td>
												<td class="col-toggle">${data.latitude}</td>
												<td class="col-toggle">${data.longitude}</td>
												<td class="col-toggle">${data.height}</td>
												<td class="col-toggle"><c:if test="${data.status eq '0'}">
														<span class="icon-glyph glyph-on on"></span>
														<span class="icon-text">사용중</span>
													</c:if> <c:if test="${data.status ne '0'}">
														<span class="icon-glyph glyph-off off"></span>
														<span class="icon-text">미사용</span>
													</c:if></td>
												<td class="col-functions" style="text-align: right;">
													<a href="/data/modify-data.do?data_id=${data.data_id }&amp;pageNo=${pagination.pageNo }${pagination.searchParameters}">수정&nbsp;</a>
												</td>
												<td class="col-functions" style="text-align: left;">
													<a href="/data/delete-data.do?data_id=${data.data_id }" onclick="return deleteWarning();">&nbsp;삭제</a>
												</td>
											</tr>
										</c:forEach>
									</c:if>
								</tbody>
							</table>
						</div>
					</form:form>

				</div>
			</div>
		</div>
	</div>



	<script src="/js/jquery/jquery.js"></script>
	<script src="/js/jquery-ui/jquery-ui.js"></script>
	<script type="text/javascript">
	$(document).ready(function() {
		initJqueryCalendar();
		
		initSelect(	new Array("project_id", "status", "data_insert_type", "search_word", "search_option", "search_value", "order_word", "order_value", "list_counter"), 
					new Array("${dataInfo.project_id}", "${dataInfo.status}", "${dataInfo.data_insert_type}", "${dataInfo.search_word}", 
							"${dataInfo.search_option}", "${dataInfo.search_value}", "${dataInfo.order_word}", "${dataInfo.order_value}", "${pagination.pageRows }"));
		initCalendar(new Array("start_date", "end_date"), new Array("${dataInfo.start_date}", "${dataInfo.end_date}"));
		$( ".select" ).selectmenu();
	});
	

	// project 정보
    function detailProject(projectId) {
    	projectDialog.dialog( "open" );
    	
    	$.ajax({
    		url: "/data/ajax-project.do",
    		data: { projectId : projectId },
    		type: "GET",
    		dataType: "json",
    		success: function(msg){
    			if (msg.result == "success") {
    				$("#project_name_info").html(msg.project.project_name);
    				$("#project_key_info").html(msg.project.project_key);
    				$("#use_yn_info").html(msg.project.use_yn);
    				$("#description_info").html(msg.project.description);
				} else {
    				alert(JS_MESSAGE[msg.result]);
    			}
    		},
    		error:function(request,status,error){
    			alert("잠시 후 이용해 주시기 바랍니다. 장시간 같은 현상이 반복될 경우 관리자에게 문의하여 주십시오.");
    		}
    	});
	}

	
	
</script>
</body>
</html>