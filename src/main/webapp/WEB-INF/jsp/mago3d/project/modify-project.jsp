<%--
  Class Name : input-project.jsp
  Description : 프로젝트 등록화면
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
							<form:hidden path="old_project_key"/>
							<table class="input-table scope-row">
									<col class="col-label" />
									<col class="col-input" />
									<tr>
										<th class="col-label" scope="row">
											<form:label path="project_key">Key</form:label>
											<img src="<c:url value='/images/required.gif' />" width="15" height="15" alt="required" />
										</th>
										<td class="col-input">
											<form:hidden path="duplication_value"/>
											<form:input path="project_key" cssClass="m" />
											<input type="button" id="project_duplication_buttion" value="중복확인" />
					  						<form:errors path="project_key" cssClass="error" />
										</td>
									</tr>
									<tr>
										<th class="col-label" scope="row">
											<form:label path="project_name">프로젝트명</form:label>
											<img src="<c:url value='/images/required.gif' />" width="15" height="15" alt="required" />
										</th>
										<td class="col-input">
											<form:input path="project_name" cssClass="m" />
											<form:errors path="project_name" cssClass="error" />
										</td>
									</tr>
									<tr>
										<th class="col-label" scope="row">
											<form:label path="view_order">표시순서</form:label>
										</th>
										<td class="col-input">
											<form:input path="view_order" class="m" />
					  						<form:errors path="view_order" cssClass="error" />
										</td>
									</tr>
									<tr>
										<th class="col-label" scope="row">
											<form:label path="default_yn">기본값</form:label>
										</th>
										<td class="col-input">
											<form:radiobutton path="default_yn" value="Y" label="기본" />
											<form:radiobutton path="default_yn" value="N" label="선택" />
										</td>
									</tr>
									<tr>
										<th class="col-label" scope="row">
											<form:label path="use_yn">상태</form:label>
										</th>
										<td class="col-input">
											<form:radiobutton path="use_yn" value="Y" label="사용" />
											<form:radiobutton path="use_yn" value="N" label="사용안함" />
										</td>
									</tr>
									<tr>
										<th class="col-label" scope="row">
											<form:label path="latitude">위도</form:label>
											<img src="<c:url value='/images/required.gif' />" width="15" height="15" alt="required" />
										</th>
										<td class="col-input">
											<form:input path="latitude" class="m" />
					  						<form:errors path="latitude" cssClass="error" />
										</td>
									</tr>
									<tr>
										<th class="col-label" scope="row">
											<form:label path="longitude">경도</form:label>
											<img src="<c:url value='/images/required.gif' />" width="15" height="15" alt="required" />
										</th>
										<td class="col-input">
											<form:input path="longitude" class="m" />
					  						<form:errors path="longitude" cssClass="error" />
										</td>
									</tr>
									<tr>
										<th class="col-label" scope="row">
											<form:label path="height">높이</form:label>
											<img src="<c:url value='/images/required.gif' />" width="15" height="15" alt="required" />
										</th>
										<td class="col-input">
											<form:input path="height" class="m" />
					  						<form:errors path="height" cssClass="error" />
										</td>
									</tr>
									<tr>
										<th class="col-label" scope="row">
											<form:label path="duration">이동시간</form:label>
											<img src="<c:url value='/images/required.gif' />" width="15" height="15" alt="required" />
										</th>
										<td class="col-input">
											<form:input path="duration" class="m" />
					  						<form:errors path="duration" cssClass="error" />
										</td>
									</tr>
									<tr>
										<th class="col-label" scope="row">
											<form:label path="description">설명</form:label>
										</th>
										<td class="col-input">
											<form:input path="description" size="80"/>
					  						<form:errors path="description" />
										</td>
									</tr>
								</table>
								<center>
								<div class="buttons" style="margin: 30px;">
									<div id="insertProjectLink">
										<input type="submit" value="수정" onclick="updateProject();" style="margin-right: 10px; font-size: 12px; padding: 3px;"/>
										<input type="button" onclick="location.href='list-project.do'" class="button" value="목록" style="margin-left: 12px; font-size: 12px; padding: 3px;">
										
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
// project key 중복 확인
$( "#project_duplication_buttion" ).on( "click", function() {
	var projectKey = $("#project_key").val();
	if (projectKey == "") {
		alert(JS_MESSAGE["project.key.empty"]);
		$("#project_key").focus();
		return false;
	}
	var info = $("#project").serialize();
	$.ajax({
		url: "ajax-project-key-duplication-check.do",
		type: "POST",
		data: info,
		cache: false,
		//async:false,
		dataType: "json",
		success: function(msg){
			if(msg.result == "success") {
				if(msg.duplication_value != "0") {
					alert(JS_MESSAGE["project.key.duplication"]);
					$("#project_key").focus();
					return false;
				} else {
					alert(JS_MESSAGE["project.key.enable"]);
					$("#duplication_value").val(msg.duplication_value);
				}
			} else {
				alert(JS_MESSAGE[msg.result]);
			}
		},
		error:function(request,status,error) {
			//alert(JS_MESSAGE["ajax.error.message"]);
			alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
		}
	});
});

// Project 정보 저장
var updateProjectFlag = true;
function updateProject() {
	if (checkProject() == false) {
		return false;
	}
	if(updateProjectFlag) {
		updateProjectFlag = false;
		var info = $("#project").serialize();
		$.ajax({
			url: "ajax-update-project.do",
			type: "POST",
			data: info,
			cache: false,
			dataType: "json",
			success: function(msg){
				if(msg.result == "success") {
					alert("프로젝트를 수정 하였습니다.");
					$("#old_project_key").val($("#project_key").val());
					$("#duplication_value").val("");
				}
				updateProjectFlag = true;
			},
			error:function(request,status,error){
		        alert("잠시 후 이용해 주시기 바랍니다. 장시간 같은 현상이 반복될 경우 관리자에게 문의하여 주십시오.");
		        updateProjectFlag = true;
			}
		});
	} else {
		alert("진행 중입니다.");
		return;
	}
}

function checkProject() {
	if ($("#project_key").val() == "") {
		alert("Key를 입력하여 주십시오.");
		$("#project_key").focus();
		return false;
	}
	if($("#project_key").val() !== $("#old_project_key").val()) {
		if($("#duplication_value").val() == null || $("#duplication_value").val() == "") {
			alert("Key 중복확인을 해주십시오.");
			return false;
		} else if($("#duplication_value").val() == "1") {
			alert("사용중인 Key 입니다. 다른 Key를 선택해 주십시오.");
			return false;
		}
	}
	if ($("#project_name").val() == "") {
		alert("프로젝트명을 입력하여 주십시오.");
		$("#project_name").focus();
		return false;
	}
	if ($("#latitude").val() == "") {
		alert("위도를 입력하여 주십시오.");
		$("#latitude").focus();
		return false;
	}
	if ($("#longitude").val() == "") {
		alert("경도를  입력하여 주십시오.");
		$("#longitude").focus();
		return false;
	}
	if ($("#height").val() == "") {
		alert("높이를  입력하여 주십시오.");
		$("#height").focus();
		return false;
	}
	if ($("#duration").val() == "") {
		alert("이동시간을  입력하여 주십시오.");
		$("#duration").focus();
		return false;
	}
}
</script>    
</body>
</html>

