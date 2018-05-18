<%--
  Class Name : input-project.jsp
  Description : 데이터 상세 화면
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
<link rel="stylesheet" href="../../../js/jquery-ui/jquery-ui.css" />
<link href="<c:url value='/'/>css/style.css" rel="stylesheet" type="text/css" >

<style type="text/css">
.noStyle {background:ButtonFace; BORDER-TOP:0px; BORDER-bottom:0px; BORDER-left:0px; BORDER-right:0px;}
  .noStyle th{background:ButtonFace; padding-left:0px;padding-right:0px}
  .noStyle td{background:ButtonFace; padding-left:0px;padding-right:0px}
</style>
<title> 데이터 상세 </title>

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
                            <li>데이터 목록</li>
                            <li>&gt;</li>
                            <li><strong>데이터 상세</strong></li>
                        </ul>
                    </div>
                </div>
                <!-- 검색 필드 박스 시작 -->
                <div id="search_field">
                    <div id="search_field_loc"><h2><strong>데이터 상세</strong></h2></div>
                </div>

				<div id="border" class="modify_user" >
						<form:form id="data" modelAttribute="data" method="post" onsubmit="return false;">
							<form:hidden path="data_id"/>
								<table class="input-table scope-row">
									<col class="col-label" />
									<col class="col-input" />
									<tr>
										<th class="col-label" scope="row">프로젝트명
											<img src="<c:url value='/images/required.gif' />" width="15" height="15" alt="required" />
										</th>
										<td class="col-input">${data.project_name}</td>
									</tr>
									<tr>
										<th class="col-label" scope="row">상위 Node
											<img src="<c:url value='/images/required.gif' />" width="15" height="15" alt="required" />
										</th>
<c:if test="${data.depth eq 1}">
										<td class="col-input">Top Node</td>
</c:if>
<c:if test="${data.depth eq 2}">
										<td class="col-input">${data.project_name}</td>
</c:if>
									</tr>
									<tr>
										<th class="col-label" scope="row">데이터명
											<img src="<c:url value='/images/required.gif' />" width="15" height="15" alt="required" />
										</th>
										<td class="col-input">${data.data_name}</td>
									</tr>
									<tr>
										<th class="col-label" scope="row">Mapping Type
											<img src="<c:url value='/images/required.gif' />" width="15" height="15" alt="required" />
										</th>
										<td class="col-input">${data.mapping_type}</td>
									</tr>
									<tr>
										<th class="col-label" scope="row">
											<form:label path="status">상태</form:label>
										</th>
										<td class="col-input">${data.status}</td>
									</tr>
									<tr>
										<th class="col-label" scope="row">
											<form:label path="latitude">위도</form:label>
											<img src="<c:url value='/images/required.gif' />" width="15" height="15" alt="required" />
										</th>
										<td class="col-input">${data.latitude}</td>
									</tr>
									<tr>
										<th class="col-label" scope="row">
											<form:label path="longitude">경도</form:label>
											<img src="<c:url value='/images/required.gif' />" width="15" height="15" alt="required" />
										</th>
										<td class="col-input">${data.longitude}</td>
									</tr>
									<tr>
										<th class="col-label" scope="row">
											<form:label path="height">높이</form:label>
											<img src="<c:url value='/images/required.gif' />" width="15" height="15" alt="required" />
										</th>
										<td class="col-input">${data.height}</td>
									</tr>
									<tr>
										<th class="col-label" scope="row">HEADING</th>
										<td class="col-input">${data.heading}</td>
									</tr>
									<tr>
										<th class="col-label" scope="row">
											<form:label path="pitch">PITCH</form:label>
										</th>
										<td class="col-input">${data.pitch}</td>
									</tr>
									<tr>
										<th class="col-label" scope="row">
											<form:label path="roll">ROLL</form:label>
										</th>
										<td class="col-input">${data.roll}</td>
									</tr>
									<tr>
										<th class="col-label" scope="row">
											<form:label path="insert_date">등록일</form:label>
										</th>
										<td class="col-input">${data.insert_date}</td>
									</tr>
								</table>
								<center>
								<div class="buttons" style="margin: 30px;">
									<div id="insertDataLink">
										<input type="button" onclick="location.href='list-data.do?data_id=${data.data_id}&pageIndex=${pageIndex}&search_word=${data.data_name}'" class="button" value="목록" style="font-size: 12px; padding: 3px;">
										
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

<script src="../../../js/jquery/jquery.js"></script>
<script src="../../../js/jquery-ui/jquery-ui.js"></script>
<script type="text/javascript">

</script>    
</body>
</html>

