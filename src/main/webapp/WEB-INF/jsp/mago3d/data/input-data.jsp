<%--
  Class Name : input-project.jsp
  Description : 데이터 등록화면
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
<title><c:out value='${bdMstr.bbsNm}'/>데이터 등록 </title>

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
                            <li><strong>데이터 등록</strong></li>
                        </ul>
                    </div>
                </div>
                <!-- 검색 필드 박스 시작 -->
                <div id="search_field">
                    <div id="search_field_loc"><h2><strong>데이터 등록</strong></h2></div>
                </div>
					<div id="border" class="modify_user" >
						<form:form id="dataInfo" modelAttribute="dataInfo" method="post" onsubmit="return false;">
								<table class="input-table scope-row">
									<col class="col-label" />
									<col class="col-input" />
									<tr>
										<th class="col-label" scope="row">
											<form:label path="project_id">프로젝트명</form:label>
											<span class="icon-glyph glyph-emark-dot color-warning"></span>
										</th>
										<td class="col-input">
											<select id="project_id" name="project_id" class="select" >
	<c:forEach var="project" items="${projectList }">
												<option value="${project.project_id }">${project.project_name }</option>
	</c:forEach>									
											</select>
										</td>
									</tr>
									<tr>
										<th class="col-label" scope="row">
											<form:label path="parent">상위 Node</form:label>
											<span class="icon-glyph glyph-emark-dot color-warning"></span>
										</th>
										<td class="col-input">
											<form:hidden path="parent" />
											<form:hidden path="parent_depth" />
				 							<form:input path="parent_name" cssClass="l" readonly="true" />
											<input type="button" id="parentFind" value="검색" />
										</td>
									</tr>
									<tr>
										<th class="col-label" scope="row">
											<form:label path="data_key">Key</form:label>
											<span class="icon-glyph glyph-emark-dot color-warning"></span>
										</th>
										<td class="col-type-select">
											<form:hidden path="duplication_value"/>
											<form:input path="data_key" cssClass="l" />
					  						<input type="button" id="data_duplication_buttion" value="중복확인" />
					  						<form:errors path="data_key" cssClass="error" />
										</td>
									</tr>
									<tr>
										<th class="col-label" scope="row">
											<form:label path="data_name">데이터명</form:label>
											<span class="icon-glyph glyph-emark-dot color-warning"></span>
										</th>
										<td class="col-input">
											<form:input path="data_name" class="l" />
					  						<form:errors path="data_name" cssClass="error" />
										</td>
									</tr>
									<tr>
										<th class="col-label" scope="row">
											<form:label path="mapping_type">Mapping Type</form:label>
										</th>
										<td class="col-input">
											<form:input path="mapping_type" class="m" />
					  						<form:errors path="mapping_type" cssClass="error" />
										</td>
									</tr>
									<tr>
										<th class="col-label" scope="row">
											<form:label path="latitude">위도</form:label>
										</th>
										<td class="col-input">
											<form:input path="latitude" class="m" />
					  						<form:errors path="latitude" cssClass="error" />
										</td>
									</tr>
									<tr>
										<th class="col-label" scope="row">
											<form:label path="longitude">경도</form:label>
										</th>
										<td class="col-input">
											<form:input path="longitude" class="m" />
					  						<form:errors path="longitude" cssClass="error" />
										</td>
									</tr>
									<tr>
										<th class="col-label" scope="row">
											<form:label path="height">높이</form:label>
										</th>
										<td class="col-input">
											<form:input path="height" class="m" />
					  						<form:errors path="height" cssClass="error" />
										</td>
									</tr>
									<tr>
										<th class="col-label" scope="row">
											<form:label path="heading">Heading</form:label>
										</th>
										<td class="col-input">
											<form:input path="heading" class="m" />
					  						<form:errors path="heading" cssClass="error" />
										</td>
									</tr>
									<tr>
										<th class="col-label" scope="row">
											<form:label path="pitch">Pitch</form:label>
										</th>
										<td class="col-input">
											<form:input path="pitch" class="m" />
					  						<form:errors path="pitch" cssClass="error" />
										</td>
									</tr>
									<tr>
										<th class="col-label" scope="row">
											<form:label path="roll">Roll</form:label>
										</th>
										<td class="col-input">
											<form:input path="roll" class="m" />
					  						<form:errors path="roll" cssClass="error" />
										</td>
									</tr>
									<tr>
										<th class="col-label" scope="row">
											<form:label path="attributes">속성</form:label>
											<span class="icon-glyph glyph-emark-dot color-warning"></span>
										</th>
										<td class="col-input">
											<form:input path="attributes" class="xl" value="{\"isPhysical\": true}" />
					  						<form:errors path="attributes" cssClass="error" />
										</td>
									</tr>
									<tr>
										<th class="col-label" scope="row">
											<form:label path="description">설명</form:label>
										</th>
										<td class="col-input">
											<form:input path="description" class="xl" />
					  						<form:errors path="description" cssClass="error" />
										</td>
									</tr>
								</table>
								
								<div class="button-group">
									<div class="center-buttons">
										<input type="submit" value="저장" onclick="insertData();" />
										<a href="/data/list-data.do" class="button">목록</a>
									</div>
								</div>
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
var dataDialog = $( ".dataDialog" ).dialog({
	autoOpen: false,
	height: 600,
	width: 1200,
	modal: true,
	overflow : "auto",
	resizable: false
});

// 부모 찾기
$( "#parentFind" ).on( "click", function() {
	dataDialog.dialog( "open" );
	dataDialog.dialog( "option", "title", $("#project_id option:selected").prop("label"));
	drawDataList($("#project_id").val());
});

function drawDataList(projectId) {
	if(projectId === "") {
		alert("프로젝트ID를 입력해주세요."");
		return false;
	}
	var info = "project_id=" + projectId;
	$.ajax({
		url: "/data/ajax-list-data-by-project-id.do",
		type: "POST",
		data: info,
		cache: false,
		dataType: "json",
		success: function(msg){
			if(msg.result == "success") {
				var content = "";
				var dataList = msg.dataList;
				var projectDataNone = "데이터가 존재하지 않습니다.";
				if(dataList == null || dataList.length == 0) {
					content = content
						+ 	"<tr>"
						+ 	"	<td colspan=\"9\" class=\"col-none\">" + projectDataNone + "</td>"
						+ 	"</tr>";
				} else {
					dataListCount = dataList.length;
					var preViewDepth = "";
					var preDataId = 0;
					var preDepth = 0;
					var select = "선택";
					for(i=0; i<dataListCount; i++ ) {
						var dataInfo = dataList[i];
						var viewAttributes = dataInfo.attributes;
						var viewDepth = getViewDepth(preViewDepth, dataInfo.data_id, preDepth, dataInfo.depth);
						if(viewAttributes !== null && viewAttributes !== "" && viewAttributes.length > 20) viewAttributes = viewAttributes.substring(0, 20) + "...";
						content = content 
							+ 	"<tr>"
							+ 	"	<td class=\"col-number\">" + (i + 1) + " </td>"
							+ 	"	<td class=\"col-id\">" + viewDepth + "</td>"
							+ 	"	<td class=\"col-id\">" + dataInfo.data_key + "</td>"
							+ 	"	<td class=\"col-name\">" + dataInfo.data_name + "</td>"
							+ 	"	<td class=\"col-toggle\">" + dataInfo.latitude + "</td>"
							+ 	"	<td class=\"col-toggle\">" + dataInfo.longitude + "</td>"
							+ 	"	<td class=\"col-toggle\">" + dataInfo.height + "</td>"
							+ 	"	<td class=\"col-toggle\">" + viewAttributes + "</td>"
							+ 	"	<td class=\"col-toggle\"><a href=\"#\" onclick=\"confirmParent('" 
							+ 									dataInfo.data_id + "', '" + dataInfo.data_name + "', '" + dataInfo.depth + "'); return false;\">" + select + "</a></td>"
							+ 	"</tr>";
							
						preDataId = dataInfo.data_id;
						preDepth = dataInfo.depth;
						preViewDepth = viewDepth;
					}
				}
				
				$("#projectDataList").empty();
				$("#projectDataList").html(content);
			} else {
				alert(JS_MESSAGE[msg.result]);
			}
		},
		error:function(request, status, error) {
			//alert(JS_MESSAGE["ajax.error.message"]);
			alert(" code : " + request.status + "\n" + ", message : " + request.responseText + "\n" + ", error : " + error);
		}
	});
}

function getViewDepth(preViewDepth, dataId, preDepth, depth) {
	var result = "";
	if(depth === 1) return result + dataId;
	
	if(preDepth === depth) {
		// 형제
		if(preViewDepth.indexOf(".") >= 0) {
			result =  preViewDepth.substring(0, preViewDepth.lastIndexOf(".") + 1) + dataId;
		} else {
			result = dataId;
		}
	} else if(preDepth < depth) {
		// 자식
		result = preViewDepth + "." + dataId;				
	} else {
		result =  preViewDepth.substring(0, preViewDepth.lastIndexOf("."));
		result =  result.substring(0, result.lastIndexOf(".") + 1) + dataId;
	}
	return result;
}

// 상위 Node
function confirmParent(dataId, dataName, depth) {
	$("#parent").val(dataId);
	$("#parent_name").val(dataName);
	$("#parent_depth").val(depth);
	dataDialog.dialog( "close" );
}

$( "#rootParentSelect" ).on( "click", function() {
	$("#parent").val(0);
	$("#parent_name").val("최상위 Node");
	$("#parent_depth").val(1);
	dataDialog.dialog( "close" );
});

// 아이디 중복 확인
$( "#data_duplication_buttion" ).on( "click", function() {
	var dataKey = $("#data_key").val();
	if (dataKey == "") {
		alert(JS_MESSAGE["data.key.empty"]);
		$("#data_id").focus();
		return false;
	}
	var info = "project_id=" + $("#project_id").val() + "&data_key=" + dataKey;
	$.ajax({
		url: "/data/ajax-data-key-duplication-check.do",
		type: "POST",
		data: info,
		cache: false,
		//async:false,
		dataType: "json",
		success: function(msg){
			if(msg.result == "success") {
				if(msg.duplication_value != "0") {
					alert("사용중인 아이디 입니다. 다른 아이디를 선택해 주십시오.");
					$("#data_key").focus();
					return false;
				} else {
					alert("사용 가능한 Key 입니다.");
					$("#duplication_value").val(msg.duplication_value);
				}
			} else {
				alert(JS_MESSAGE[msg.result]);
			}
		},
		error:function(request, status, error) {
			//alert(JS_MESSAGE["ajax.error.message"]);
			alert(" code : " + request.status + "\n" + ", message : " + request.responseText + "\n" + ", error : " + error);
		}
	});
});

// Data 정보 저장
var insertDataFlag = true;
function insertData() {
	if (checkData() == false) {
		return false;
	}
	if(insertDataFlag) {
		insertDataFlag = false;
		var info = $("#dataInfo").serialize();
		$.ajax({
			url: "/data/ajax-insert-data-info.do",
			type: "POST",
			data: info,
			cache: false,
			//async:false,
			dataType: "json",
			success: function(msg){
				if(msg.result == "success") {
					alert("데이터를 등록 하였습니다.");
					$("#parent").val("");
					$("#duplication_value").val("");
				} else {
					alert(JS_MESSAGE[msg.result]);
				}
				insertDataFlag = true;
			},
			error:function(request,status,error){
		        alert("잠시 후 이용해 주시기 바랍니다. 장시간 같은 현상이 반복될 경우 관리자에게 문의하여 주십시오.");
		        alert(" code : " + request.status + "\n" + ", message : " + request.responseText + "\n" + ", error : " + error);
		        insertDataFlag = true;
			}
		});
	} else {
		alert("진행 중입니다.");
		return;
	}
}

function checkData() {
	if ($("#parent").val() == "") {
		alert(JS_MESSAGE["data.parent.empty"]);
		$("#parent_name").focus();
		return false;
	}
	if ($("#data_key").val() == "") {
		alert("Data Key를 입력하여 주십시오.");
		$("#data_key").focus();
		return false;
	}
	if($("#duplication_value").val() == null || $("#duplication_value").val() == "") {
		alert(JS_MESSAGE["Key 중복확인을 해주십시오."]);
		return false;
	} else if($("#duplication_value").val() == "1") {
		alert("사용중인 key 입니다. 다른 아이디를 선택해 주십시오.");
		return false;
	}
	if ($("#data_name").val() == "") {
		alert(JS_MESSAGE["데이터명을 입력하여 주십시오."]);
		$("#data_name").focus();
		return false;
	}
}
</script>    
</body>
</html>

