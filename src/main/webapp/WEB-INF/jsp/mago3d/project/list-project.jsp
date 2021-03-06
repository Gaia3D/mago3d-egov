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

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
<meta http-equiv="content-language" content="ko">
<link href="<c:url value='/'/>css/common.css" rel="stylesheet" type="text/css" >

<title>프로젝트 목록</title>

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
                
                <div id="search_field">
                    <div id="search_field_loc"><h2><strong>프로젝트 목록</strong></h2></div>
                </div>
                
                <!-- table add start -->
                <div class="default_tablestyle">
                    <table summary="번호, 제목, 게시시작일, 게시종료일, 작성자, 작성일, 조회수   입니다" cellpadding="0" cellspacing="0" style="margin: 10px;">
                    <caption>게시물 목록</caption>
                    <thead>
                    <tr>
                        <th scope="col" nowrap="nowrap" class="col-name" style="width: 140px;">프로젝트명</th>
	                    <th scope="col" nowrap="nowrap" class="col-toggle" style="width: 110px;">위도</th>
                        <th scope="col" nowrap="nowrap" class="col-toggle" style="width: 110px;">경도</th>
                        <th scope="col" nowrap="nowrap" class="col-toggle" style="width: 110px;">높이</th>
                        <th scope="col" nowrap="nowrap" class="col-date" style="width: 140px;">등록일</th>
                        <th scope="col" nowrap="nowrap" class="col-functions" colspan="2" style="width: 180px;">수정/삭제</th>
                    </tr>
                    </thead>
                    <tbody>   
  
<c:if test="${empty projectList }">
										<tr>
											<td colspan="14" class="col-none">프로젝트가 존재하지 않습니다.</td>
										</tr>
</c:if>
<c:if test="${!empty projectList }">
	<c:forEach var="project" items="${projectList}" varStatus="status">
										<tr>
											<td class="col-name">
											<a href="detail-project.do?project_id=${project.project_id }">${project.project_name}</a>
											</td>
											<td class="col-toggle">${project.latitude}</td>
											<td class="col-toggle">${project.longitude}</td>
											<td class="col-toggle">${project.height}</td>
											<td class="col-date" >${project.viewInsertDate }</td>
											<td class="col-functions" style="text-align: right;"><a href="modify-project.do?project_id=${project.project_id}">수정&nbsp;</a></td>
											<td class="col-functions" style="text-align: left;"><a href="#" onclick="deleteProject('${project.project_id}'); return false;">&nbsp;삭제</a></td>
										</tr>
	</c:forEach>
</c:if>

                    </tbody>
                    </table>
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
//project 삭제
var deleteProjectFlag = true;
function deleteProject(project_id) {
	if(confirm("정말 삭제하시겠습니까?")) {
		if(deleteProjectFlag) {
			deleteProjectFlag = false;
			var info = "project_id=" + project_id;
			$.ajax({
				url: "ajax-delete-project.do",
				type: "POST",
				data: info,
				cache: false,
				async:false,
				dataType: "json",
				success: function(msg){
					if(msg.result == "success") {
						alert("삭제 되었습니다.");	
						location.reload();
					} else {
						alert(JS_MESSAGE[msg.result]);
					}
					deleteProjectFlag = true;
				},
				error:function(request,status,error){
			        alert("잠시 후 이용해 주시기 바랍니다. 장시간 같은 현상이 반복될 경우 관리자에게 문의하여 주십시오.");
			        deleteProjectFlag = true;
				}
			});
		} else {
			alert("진행 중입니다.");
			return;
		}
	}
}

</script>
 </body>
</html>