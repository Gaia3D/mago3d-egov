<%--
  Class Name : EgovFileList.jsp
  Description : 파일목록화면
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2009.03.12   이삼섭          최초 생성
     2011.08.31  JJY       경량환경 버전 생성
 
    author   : 공통서비스 개발팀 이삼섭
    since    : 2009.03.12
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Language" content="ko" >
	<meta name="viewport" content="width=device-width">
	<title>demo | mago3D User</title>
	<link rel="stylesheet" href="../../../css/homepage-demo.css" />
	
<c:if test="${geoViewLibrary == null || geoViewLibrary eq '' || geoViewLibrary eq 'cesium' }">
	<link rel="stylesheet" href="../../../cesium/Widgets/widgets.css" />
</c:if>

	
	<link rel="stylesheet" href="../../../js/jquery-ui/jquery-ui.css" />
	<link rel="stylesheet" href="../../../js/jquery-toast/jquery.toast.css" />
	<link rel="stylesheet" href="../../../js/treegrid/jquery.treegrid.css" />
	<link rel="stylesheet" href="../../../js/jqplot/jquery.jqplot.min.css" />
	<script type="text/javascript" src="../../../js/jquery/jquery.js"></script>
	<script type="text/javascript" src="../../../js/jquery-ui/jquery-ui.js"></script>
	<script type="text/javascript" src="../../../js/jquery-toast/jquery.toast.js"></script>
	<script type="text/javascript" src="../../../js/mago3d/common.js"></script>
	<script type="text/javascript" src="../../../js/treegrid/jquery.treegrid.js"></script>
	<script type="text/javascript" src="../../../js/treegrid/jquery.treegrid.bootstrap3.js"></script>
	<script type="text/javascript" src="../../../js/jqplot/jquery.jqplot.min.js"></script>
	<script type="text/javascript" src="../../../js/jqplot/plugins/jqplot.pieRenderer.js"></script>
	<script type="text/javascript" src="../../../js/jqplot/plugins/jqplot.barRenderer.js"></script>
	<script type="text/javascript" src="../../../js/jqplot/plugins/jqplot.categoryAxisRenderer.js"></script>
	<script type="text/javascript" src="../../../js/mago3d/analytics.js"></script>
<title>DEMO</title>
<link href="<c:url value='/'/>css/common.css" rel="stylesheet" type="text/css" >

<script type="text/javascript" src="<c:url value='/js/EgovBBSMng.js' />"></script>
<script type="text/javascript">
	
	
</script>

</head>
<body>
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
<!-- 전체 레이어 시작 -->
<div id="wrap">
    <!-- header 시작 -->
    <div id="header"><c:import url="/EgovPageLink.do?link=main/inc/EgovIncHeader" /></div>
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
                            <li>HOME</li>
                            <li>&gt;</li>
                            <li>DEMO</li>
                        </ul>
                    </div>
			</div>
			
<!-- DEMO -->


<input type="hidden" id="now_latitude" name="now_latitude" value="${now_latitude }" />
	<input type="hidden" id="now_longitude" name="now_longitude" value="${now_longitude }"  />



<div id="menuContent" class="navContents">
	<div class="alignRight">
		<button type="button" id="menuContentClose" class="navClose">닫기</button>
	</div>
	
	<ul id="homeMenuContent" class="menuList">
		<li><a href="/homepage/index.do">Home</a>
			(<a href="/homepage/about.do" onclick ="changeLanguage('ko');">KO</a> | 
			<a href="/homepage/about.do" onclick ="changeLanguage('en');">EN</a>)
		</li>
		<li><a href="/homepage/about.do">mago3D</a></li>
		<li>Demo
			<ul>
			
<c:if test="${geoViewLibrary == null || geoViewLibrary eq '' || geoViewLibrary eq 'cesium' }">
				<li>Cesium</li>
				<li><a href="demo.do">Cesium</a></li>
</c:if>				
<c:if test="${geoViewLibrary eq 'worldwind' }">				
				<li><a href="demo.do">World Wind</a></li>
				<li>World Wind</li>
</c:if>
			
		
				

			</ul>
		</li>
		<li><a href="/homepage/download.do">Download</a></li>
		<li>Documentation
			<ul>
				<li><a href="http://www.mago3d.com/homepage/api.do">API</a></li>
				<li><a href="http://www.mago3d.com/homepage/spec.do">F4D Spec</a></li>
			</ul>
		</li>
		<li><a href="/homepage/faq.do">FAQ</a></li>
	</ul>
	
	
<!-- API -->
	<div id="apiMenuContent" class="apiWrap">
		<div>
			<h3>로컬(Browser) 검색</h3>
			<ul class="apiLocal">
				<li>
					<label for="localSearchProjectId">프로젝트</label>
					<select id="localSearchProjectId" name="localSearchProjectId" class="select">
<c:forEach var="project" items="${projectList}">
						<option value="${project.project_id}">${project.project_name}</option>
</c:forEach>
					</select>
				</li>
				<li>
					<label for="localSearchDataKey">Data Key</label>
					<input type="text" id="localSearchDataKey" name="localSearchDataKey" size="20" />
					<button type="button" id="localSearch" class="btn">검색</button> 
				</li>
			</ul>
		</div>
	</div>
	

<!-- TREE -->	
	<div id="treeMenuContent" class="treeWrap">
		<div>
			<h3>DATA TREE</h3>
			<ul>
				<li>
					<label for="treeProjectId">Project </label>
					<select id="treeProjectId" name="treeProjectId" onchange="initDataTree();" class="select">
<c:forEach var="project" items="${projectList}">
						<option value="${project.project_id}">${project.project_name}</option>
</c:forEach>					
					</select>
				</li>
			</ul>
		</div>
		<div style="margin-top: 20px; margin-left: 10px; margin-bottom: 20px;">
			<table id="dataTree" class="table dataTree table-bordered table-striped table-condensed" style="padding-bottom: 20px; width: 310px;">
			</table>
		</div>
	</div>


<!-- CHART -->
	<div id="chartMenuContent" class="chartWrap">
		<div>
			<h3>프로젝트별 데이터 건수</h3>
		</div>
		<div id="projectChart" style="width: 340px; height: 340px; font-size: 18px;"></div>
		<div style="height: 20px;"></div>
		<div style="margin-top: 30px;">
			<h3>데이터 상태></h3>
		</div>
		<div id="dataStatusChart" style="width: 340px; height: 340px; font-size: 18px; margin-bottom: 30px;"></div>
	</div>


<!-- 설정 -->	
	<div id="configMenuContent" class="configWrap">
		<div>
			<h3>라벨</h3>
			<input type="radio" id="showLabel" name="labelInfo" value="true" onclick="changeLabel(true);" />
			<label for="showLabel">표시</label>
			<input type="radio" id="hideLabel" name="labelInfo" value="false" onclick="changeLabel(false);"/>
			<label for="hideLabel">비표시</label>
		</div>
	</div>
</div>

<ul class="shortcut">
	<c:forEach var="project" items="${projectList}" varStatus="status">
	<li onclick="gotoProject('${project.project_id }', '${project.longitude}', '${project.latitude}', '${project.height}', '${project.duration}')">${project.project_name }</li>
	</c:forEach>	
</ul>

<!-- 맵영역 -->
<c:if test="${geoViewLibrary == null || geoViewLibrary eq '' || geoViewLibrary eq 'cesium' }">
<div id="magoContainer" class="mapWrap"></div>
<canvas id="objectLabel"></canvas>
</c:if>
<c:if test="${geoViewLibrary eq 'worldwind' }">
<div style="position: absolute; width: 100%; height: 100%; margin-top: 0; padding: 0; overflow: hidden;">
	<canvas id="magoContainer" style="width: 100%; height: 100%">
        Your browser does not support HTML5 Canvas.
    </canvas>
    <canvas id="objectLabel"></canvas>
</div>
</c:if>

<!-- DEMO -->
        <!-- //content 끝 -->    
        </div>  
        <!-- //container 끝 -->
	    <!-- footer 시작 -->
        <div id="footer"><c:import url="/EgovPageLink.do?link=main/inc/EgovIncFooter" /></div>
	    <!-- //footer 끝 -->
    </div>
    <!-- //전체 레이어 끝 -->
</div>
    
    
<script type="text/javascript" src="../../../cesium/Cesium.js"></script>    
<script type="text/javascript" src="../../../js/mago3d/mago3d.js"></script>
<script>
	var agent = navigator.userAgent.toLowerCase();
	if(agent.indexOf('chrome') < 0) { 
		alert("이 데모 페이지는 대용량 웹 데이터 처리를 위해 Chrome 브라우저에 최적화 되어 있습니다. \n원활한 서비스 이용을 위해 Chrome 브라우저를 이용  하시기 바랍니다.");
	}

	var managerFactory = null;
	var policyJson = ${policyJson};
	var initProjectJsonMap = ${initProjectJsonMap};
	var menuObject = { 	homeMenu : false, myIssueMenu : false, searchMenu : false, apiMenu : false, insertIssueMenu : false, 
						treeMenu : false, chartMenu : false, logMenu : false, attributeMenu : false, configMenu : false };
	var insertIssueEnable = false;
	var FPVModeFlag = false;
	
	var imagePath = "../../../images/mago3d";
	var dataInformationUrl = "ajax-project-data-by-project-id.do";
	magoStart();
	var intervalCount = 0;
	var timerId = setInterval("startMogoUI()", 1000);
	
	$(document).ready(function() {
	});
	
	function startMogoUI() {
		intervalCount++;
		if(managerFactory != null && managerFactory.getMagoManagerState() === CODE.magoManagerState.READY) {
			initJqueryCalendar();
			// Label 표시
			changeLabel(false);
			// object 정보 표시
// 			changeObjectInfoViewMode(true); 
			// Origin 표시
//          changeOrigin(false);
			// BoundingBox
//			changeBoundingBox(false);
			// Selecting And Moving
//			changeObjectMove("2");
			// slider, color-picker
//			initRendering();
			// 3PView Mode
//			changeViewMode(false);
			
			clearInterval(timerId);
			console.log(" managerFactory != null, managerFactory.getMagoManagerState() = " + managerFactory.getMagoManagerState() + ", intervalCount = " + intervalCount);
			return;
		}
		console.log("--------- intervalCount = " + intervalCount);
	}
	
	// mago3d 시작, 정책 데이터 파일을 로딩
	function magoStart() {
		var initProjectsLength = ${initProjectsLength};
		if(initProjectsLength === null || initProjectsLength === 0) {
			managerFactory = new ManagerFactory(null, "magoContainer", policyJson, null, null, null, imagePath);
		} else {
			var projectIdArray = new Array(initProjectsLength);
			var projectDataArray = new Array(initProjectsLength);
			var projectDataFolderArray = new Array(initProjectsLength);
			var index = 0;
			for(var projectId in initProjectJsonMap) {
				projectIdArray[index] = projectId;
				var projectJson = JSON.parse(initProjectJsonMap[projectId]);
				projectDataArray[index] = projectJson;
				projectDataFolderArray[index] = projectJson.data_key;
				index++;
			}
			
			managerFactory = new ManagerFactory(null, "magoContainer", policyJson, projectIdArray, projectDataArray, projectDataFolderArray, imagePath);			
		}
	}
	
	// 프로젝트를 로딩한 후 이동
	function gotoProject(projectId, longitude, latitude, height, duration) {
		var projectData = getDataAPI(CODE.PROJECT_ID_PREFIX + projectId);
		if (projectData === null || projectData === undefined) {
			$.ajax({
				url: dataInformationUrl,
				type: "POST",
				data: "project_id=" + projectId,
				dataType: "json",
				headers: { "X-mago3D-Header" : "mago3D"},
				success : function(msg) {
					if(msg.result === "success") {
						var projectDataJson = JSON.parse(msg.projectDataJson);
						if(projectDataJson === null || projectDataJson === undefined) {
							alert("프로젝트가 데이터가 존재하지 않습니다.");
							return;
						}
						gotoProjectAPI(managerFactory, projectId, projectDataJson, projectDataJson.data_key, longitude, latitude, height, duration);
					} else {
						alert(JS_MESSAGE[msg.result]);
					}
				},
				error : function(request, status, error) {
					alert("잠시 후 이용해 주시기 바랍니다. 장시간 같은 현상이 반복될 경우 관리자에게 문의하여 주십시오.");
					console.log("code : " + request.status + "\n message : " + request.responseText + "\n error : " + error);
				}
			});
		} else {
			gotoProjectAPI(managerFactory, projectId, projectData, projectData.data_key, longitude, latitude, height, duration);	
		}
		
		// 현재 좌표를 저장
		saveCurrentLocation(latitude, longitude);
	}
	
	
	// 왼쪽 메뉴 클릭시 ui 처리
	$("#homeMenu").click(function() {
		menuSlideControl("homeMenu");
	});
	$("#searchMenu").click(function() {
		menuSlideControl("searchMenu");
	});
	$("#apiMenu").click(function() {
		menuSlideControl("apiMenu");
	});
	$("#treeMenu").click(function() {
        menuSlideControl("treeMenu");
        initDataTree();
    });
    $("#chartMenu").click(function() {
        menuSlideControl("chartMenu");
        initDataChart();
    });
	$("#configMenu").click(function() {
		menuSlideControl("configMenu");
	});
	
	function menuSlideControl(menuName) {
		var compareMenuState = menuObject[menuName];
		for(var key in menuObject) {
		    // state 값 변경하고, css 변경
			if(key === menuName) {
			    var value = menuObject[key];
				if(value) {
					$("#" + menuName).removeClass("on");
					$("#menuContent").hide();
					$("#" + menuName + "Content").hide();
				} else {
					$("#" + menuName).addClass("on");
					$("#menuContent").show();
					$("#" + menuName + "Content").show();
				}
				menuObject[menuName] = !compareMenuState;
			} else {
				$("#" + key).removeClass("on");
				$("#" + key + "Content").hide();
			}
		}
	}
	
	// menu content close 버튼
	$("#menuContentClose").click(function() {
		for(var key in menuObject) {
            var value = menuObject[key];
            if(value) {
				$("#menuContent").hide();
				$("#" + key + "Content").hide();
				$("#" + key).removeClass("on");
				menuObject[key] = !value;
			}
		}
		// 이슈 등록 비활성화 상태
		changeInsertIssueStateAPI(managerFactory, 0);
	});
	
	// Data 검색
	var searchDataFlag = true;
	$("#searchData").click(function() {
		if ($.trim($("#search_value").val()) === ""){
			alert("검색어를 입력해 주세요.");
			$("#search_value").focus();
			return false;
		}
		
		if(searchDataFlag) {
			searchDataFlag = false;
			var info = $("#searchForm").serialize();
			var url = null;
			if($("#search_word").val() === "data_name") {
				url = "ajax-search-data.do";
			} else {
				url = "ajax-list-issue.do";
			}
			
			$.ajax({
				url: url,
				type: "POST",
				data: info,
				dataType: "json",
				headers: { "X-mago3D-Header" : "mago3D"},
				success : function(msg) {
					if(msg.result === "success") {
						var issueDoesNotExistMessage = "Issue가 존재하지 않습니다.";
						var dataDoesNotExistMessage = "Data가 존재하지 않습니다.";
						var commonShortcutMessage = "바로가기";
						
						var searchType = $("#search_word").val();
						var content = "";
						if(searchType === "data_name") {
							var dataInfoList = msg.dataInfoList;
							if(dataInfoList == null || dataInfoList.length == 0) {
								content = content	
									+ 	"<li style=\"text-align: center; padding-top:20px; height: 50px;\">"
									+	dataDoesNotExistMessage
									+	"</li>";
							} else {
								dataInfoListCount = dataInfoList.length;
								for(i=0; i<dataInfoListCount; i++ ) {
									var dataInfo = dataInfoList[i];
									content = content 
										+ 	"<li>";
									if(dataInfo.parent !== 0) {	
										content = content 
										+ 	"	<button type=\"button\" title=\"" + commonShortcutMessage + "\""
										+ 	" 		onclick=\"gotoData('" + dataInfo.project_id + "', '" + dataInfo.data_key + "');\">" + commonShortcutMessage + "</button>";
									}
									content = content 
										+ 	"	<div class=\"info\">"
										+ 	"		<p class=\"title\">"
										+ 	"			<span>" + dataInfo.project_name + "</span>"
										+ 				dataInfo.data_name
										+ 	"		</p>"
										+ 	"		<ul class=\"tag\">"
										+ 	"			<li><span class=\"t3\"></span>" + dataInfo.latitude + "</li>"
										+ 	"			<li><span class=\"t3\"></span>" + dataInfo.longitude + "</li>"
										+ 	"			<li class=\"date\">" + dataInfo.insert_date.substring(0,19) + "</li>"
										+ 	"		</ul>"
										+ 	"	</div>"
										+ 	"</li>";
								}
							}
						} else {
							var issueList = msg.issueList;
							if(issueList === null || issueList.length === 0) {
								content = content	
									+ 	"<li style=\"text-align: center; padding-top:20px; height: 50px;\">"
									+	issueDoesNotExistMessage
									+	"</li>";
							} else {
								issueListCount = issueList.length;
								for(i=0; i<issueListCount; i++ ) {
									var issue = issueList[i];
									content = content 
										+ 	"<li>"
										+ 	"	<button type=\"button\" title=\"" + commonShortcutMessage + "\""
										+			" onclick=\"gotoIssue('" + issue.project_id + "', '" + issue.issue_id + "', '" + issue.issue_type + "', '" 
										+ 				issue.longitude + "', '" + issue.latitude + "', '" + issue.height + "', '2');\">" + commonShortcutMessage + "</button>"
										+ 	"	<div class=\"info\">"
										+ 	"		<p class=\"title\">"
										+ 	"			<span>" + issue.project_name + "</span>"
										+ 				issue.title
										+ 	"		</p>"
										+ 	"		<ul class=\"tag\">"
										+ 	"			<li><span class=\"" + issue.issue_type_css_class + "\"></span>" + issue.issue_type_name + "</li>"
										+ 	"			<li><span class=\"" + issue.priority_css_class + "\"></span>" + issue.priority_name + "</li>"
										+ 	"			<li class=\"date\">" + issue.insert_date.substring(0,19) + "</li>"
										+ 	"		</ul>"
										+ 	"	</div>"
										+ 	"</li>";
								}
							}
						}
						
						$("#searchList").empty();
						$("#searchList").html(content);
					} else {
						alert(JS_MESSAGE[msg.result]);
					}
					searchDataFlag = true;
				},
				error : function(request, status, error) {
					alert("잠시 후 이용해 주시기 바랍니다. 장시간 같은 현상이 반복될 경우 관리자에게 문의하여 주십시오.");
			    	console.log("code : " + request.status + "\n message : " + request.responseText + "\n error : " + error);
					searchDataFlag = true;
				}
			});
		} else {
			alert("진행 중입니다.");
			return;
		}
	});
	
	// 데이터 위치로 이동
	function gotoData(projectId, dataKey) {
		searchDataAPI(managerFactory, projectId, dataKey);
	}
	
	$("#localSearch").click(function() {
		if ($.trim($("#localSearchDataKey").val()) === ""){
			alert("Data Key를 입력하여 주십시오.");
			$("#localSearchDataKey").focus();
			return false;
		}
		searchDataAPI(managerFactory, $("#localSearchProjectId").val(), $("#localSearchDataKey").val());
	});
	
	// object 정보 표시 call back function
	function showSelectedObject(projectId, dataKey, objectId, latitude, longitude, height, heading, pitch, roll) {
		var objectInfoViewFlag = $(':radio[name="objectInfo"]:checked').val();
		if(objectInfoViewFlag) {
			$("#moveProjectId").val(projectId);
			$("#moveDataKey").val(dataKey);
			$("#moveLatitude").val(latitude);
			$("#moveLongitude").val(longitude);
			$("#moveHeight").val(height);
			$("#moveHeading").val(heading);
			$("#movePitch").val(pitch);
			$("#moveRoll").val(roll);
			
			$.toast({
			    heading: 'Click Object Info',
			    text: [
			    	'projectId : ' + projectId,
			        'dataKey : ' + dataKey, 
			        'objectId : ' + objectId,
			        'latitude : ' + latitude,
			        'longitude : ' + longitude,
			        'height : ' + height,
			        'heading : ' + heading,
			        'pitch : ' + pitch,
			        'roll : ' + roll
			    ],
				bgColor : '#393946',
				hideAfter: 5000,
				icon: 'info',
				position : 'bottom-right'
			});
			
			// occlusion culling
			$("#occlusion_culling_data_key").val(dataKey);
			// 현재 좌표를 저장
			saveCurrentLocation(latitude, longitude);
		}
	}
	
	
	function initDataTree() {
        var projectId = $("#treeProjectId").val();
		var projectData = getDataAPI(CODE.PROJECT_ID_PREFIX + projectId);
        if (projectData === null || projectData === undefined) {
            $.ajax({
            	url: dataInformationUrl,
				type: "POST",
				data: "project_id=" + projectId,
				dataType: "json",
				headers: { "X-mago3D-Header" : "mago3D"},
                success: function(msg) {
                	if(msg.result === "success") {
						var projectDataJson = JSON.parse(msg.projectDataJson);
						if(projectDataJson === null || projectDataJson === undefined) {
							alert("프로젝트가 데이터가 존재하지 않습니다.");
							return;
						}
						drawDataTree(projectId, projectDataJson);
					} else {
						alert(JS_MESSAGE[msg.result]);
					}
                },
                error : function(request, status, error) {
                	alert("잠시 후 이용해 주시기 바랍니다. 장시간 같은 현상이 반복될 경우 관리자에게 문의하여 주십시오.");
                    console.log("code : " + request.status + "\n" + "message : " + request.responseText + "\n" + "error : " + error);
                }
            });
        } else {
            drawDataTree(projectId, projectData);
        }
	}

	function drawDataTree(projectId, projectData) {
	    var content = 	"";
	    var dataCssId = 1;
	    content 	= 	content
					+ 	"<tr class=\"treegrid-" + dataCssId + "\" style=\"height: 25px; background-color: #F79F81\">"
					+ 		"<td style=\"padding-left: 10px\" nowrap=\"nowrap\"></td>"
					+		"<td colspan=\"3\"> <b>" + projectData.data_name + "</b></td>"
					+	"</tr>";
	    var childrenCount = projectData.children.length;
	    if(childrenCount > 0) {
            var childrenContent = getChildrenContent(projectId, dataCssId, projectData.children);
            content = content + childrenContent;
        }

        $("#dataTree").html("");
		$("#dataTree").append(content);
        $('.dataTree').treegrid({
            expanderExpandedClass: 'glyphicon glyphicon-minus',
            expanderCollapsedClass: 'glyphicon glyphicon-plus'
        });
	}

	function getChildrenContent(projectId, dataCssId, children) {
        var content = 	"";
       	var count = children.length;
       	var parentClass = " treegrid-parent-" + dataCssId;
       	var evenColor = "background-color: #ccc";
       	var oddColor = "background-color: #eee";
       	for(var i=0; i<count; i++) {
       		dataCssId++;
			var bgcolor = (dataCssId % 2 == 0) ? evenColor : oddColor;
			var myClass = "treegrid-" + dataCssId;
	        var dataInfo = children[i];
			content 	= 	content
                + 	"<tr class=\"" + myClass + parentClass + "\" style=\"height: 25px;" + bgcolor + "\">"
                + 		"<td style=\"padding-left: 2px\" nowrap=\"nowrap\"></td>"
                +		"<td title=\"" + dataInfo.data_key + "\"> " + dataInfo.data_name + "</td>"
                +		"<td style=\"padding-left: 5px\"><button type=\"button\" title=\"Shortcuts\" class=\"dataShortcut\" onclick=\"gotoData('" + projectId + "', '" + dataInfo.data_key + "');\">Shortcuts</button></td>"
                +		"<td style=\"padding-left: 5px; padding-right: 5px;\"><a href=\"#\" onclick=\"viewDataAttribute('" + dataInfo.data_id + "'); return false; \">Details</a></td>"
                +	"</tr>";
            var childrenCount = dataInfo.children.length;
            if(childrenCount > 0) {
                var childrenContent = getChildrenContent(projectId, dataCssId, dataInfo.children);
                content = content + childrenContent;
            }
		}
		return content;
	}

    var dataAttributeDialog = $( ".dataAttributeDialog" ).dialog({
        autoOpen: false,
        width: 400,
        height: 550,
		modal: true,
        resizable: false
    });

    // data key 를 이용하여 dataInfo 정보를 취득
    function viewDataAttribute(dataId) {
    	var url = "ajax-data-by-data-id.do";
		var info = "data_id=" + dataId;
		$.ajax({
			url: url,
			type: "GET",
			data: info,
			dataType: "json",
			headers: { "X-mago3D-Header" : "mago3D"},
			success : function(msg) {
				if(msg.result === "success") {
					showDataInfo(msg.dataInfo);
				} else {
					alert(JS_MESSAGE[msg.result]);
				}
			},
			error : function(request, status, error) {
				alert("잠시 후 이용해 주시기 바랍니다. 장시간 같은 현상이 반복될 경우 관리자에게 문의하여 주십시오.");
				console.log("code : " + request.status + "\n message : " + request.responseText + "\n error : " + error);
			}
		});
    }

    // data info daialog callback
    function showDataInfo(dataInfo) {
        dataAttributeDialog.dialog( "open" );
        $("#detailDataKey").html(dataInfo.data_key);
        $("#detailDataName").html(dataInfo.data_name);
        $("#detailLatitude").html(dataInfo.latitude);
        $("#detailLongitude").html(dataInfo.longitude);
        $("#detailHeight").html(dataInfo.height);
        $("#detailHeading").html(dataInfo.heading);
        $("#detailPitch").html(dataInfo.pitch);
        $("#detailRoll").html(dataInfo.roll);
        showDataAttribute(dataInfo.data_id);
	}
    
    
    
	// chart 표시
	function initDataChart() {
        projectChart();
        dataStatusChart();
	}

	// project 별 chart
	function projectChart() {
		var url = "ajax-project-data-statistics.do";
		var info = "";
		$.ajax({
			url: url,
			type: "GET",
			data: info,
			dataType: "json",
			headers: { "X-mago3D-Header" : "mago3D"},
			success : function(msg) {
				if(msg.result === "success") {
					drawProjectChart(msg.projectNameList, msg.dataTotalCountList);
				} else {
					alert(JS_MESSAGE[msg.result]);
				}
			},
			error : function(request, status, error) {
				alert("잠시 후 이용해 주시기 바랍니다. 장시간 같은 현상이 반복될 경우 관리자에게 문의하여 주십시오.");
				console.log("code : " + request.status + "\n message : " + request.responseText + "\n error : " + error);
			}
		});
	}
	
	function drawProjectChart(projectNameList, dataTotalCountList) {
		if(projectNameList == null || projectNameList.length == 0) {
			return;
		} 
		
		var data = [];
		var projectCount =  projectNameList.length;
		for(i=0; i<projectCount; i++ ) {
			var projectStatisticsArray = [ projectNameList[i], dataTotalCountList[i]];
			data.push(projectStatisticsArray);
		}
		
		$("#projectChart").html("");
        //var data = [["3DS", 37],["IFC(Cultural Assets)", 1],["IFC", 42],["IFC(MEP)", 1],["Sea Port", 7],["Collada", 7],["IFC(Japan)", 5]];
        var plot = $.jqplot("projectChart", [data], {
            //title : "project 별 chart",
            seriesColors: [ "#a67ee9", "#FE642E", "#01DF01", "#2E9AFE", "#F781F3", "#F6D8CE", "#99a0ac" ],
            grid: {
                drawBorder: false,
                drawGridlines: false,
                background: "#ffffff",
                shadow:false
            },
            gridPadding: {top:0, bottom:115, left:0, right:20},
            seriesDefaults:{
                renderer:$.jqplot.PieRenderer,
                trendline : { show : false},
                rendererOptions: {
                    padding:8,
                    showDataLabels: true,
                    dataLabels: "value",
                    //dataLabelFormatString: "%.1f%"
                },
            },
            legend: {
                show: true,
                fontSize: "10pt",
                placement : "outside",
                rendererOptions: {
                    numberRows: 3,
                    numberCols: 3
                },
                location: "s",
                border: "none",
                marginLeft: "10px"
            }
        });
	}

	function dataStatusChart() {
		var url = "ajax-data-status-statistics.do";
		var info = "";
		$.ajax({
			url: url,
			type: "GET",
			data: info,
			dataType: "json",
			headers: { "X-mago3D-Header" : "mago3D"},
			success : function(msg) {
				if(msg.result === "success") {
					drawDataStatusChart(msg.useTotalCount, msg.forbidTotalCount, msg.etcTotalCount);
				} else {
					alert(JS_MESSAGE[msg.result]);
				}
			},
			error : function(request, status, error) {
				alert("잠시 후 이용해 주시기 바랍니다. 장시간 같은 현상이 반복될 경우 관리자에게 문의하여 주십시오.");
				console.log("code : " + request.status + "\n message : " + request.responseText + "\n error : " + error);
			}
		});
	}
	
	function drawDataStatusChart(useTotalCount, forbidTotalCount, etcTotalCount) {
        $("#dataStatusChart").html("");
        
        var useTotalCountLabel = "사용";
        var forbidTotalCountLabel = "중지";
        var etcTotalCountLabel = "기타";
        var dataValues = [ useTotalCount, forbidTotalCount, etcTotalCount];
        var ticks = [useTotalCountLabel, forbidTotalCountLabel, etcTotalCountLabel];
        var yMax = 100;
        if(useTotalCount > 100 || forbidTotalCount > 100 || etcTotalCount > 100) {
			yMax = Math.max(useTotalCount, forbidTotalCount, etcTotalCount) + (useTotalCount * 0.2);
		}

        var plot = $.jqplot("dataStatusChart", [dataValues], {
            //title : "data 상태별 차트",
            height: 205,
            animate: !$.jqplot.use_excanvas,
            seriesColors: [ "#ffa076"],
            grid: {
                background: "#fff",
                //background: "#14BA6C"
                gridLineWidth: 0.7,
                //borderColor: 'transparent',
                shadow: false,
                borderWidth:0.1
                //shadowColor: 'transparent'
            },
            gridPadding:{
                left:35,
                right:1,
                to:40,
                bottom:27
            },
            seriesDefaults:{
                shadow:false,
                renderer:$.jqplot.BarRenderer,
                pointLabels: { show: true },
                rendererOptions: {
                    barWidth: 40
                }
            },
            axes: {
                xaxis: {
                    renderer: $.jqplot.CategoryAxisRenderer,
                    ticks: ticks,
                    tickOptions:{
                        formatString: "%'d",
                        fontSize: "10pt"
                    }
                },
                yaxis: {
                    numberTicks : 6,
                    min : 0,
                    max : yMax,
                    tickOptions:{
                        formatString: "%'d",
                        fontSize: "10pt"
                    }
                }
            },
            highlighter: { show: false }
        });
	}
	
	
	// data info change request log
    var dataInfoChangeDialog = $( ".dataInfoChangeDialog" ).dialog({
        autoOpen: false,
        width: 400,
        height: 300,
        modal: true,
        resizable: false
    });
	function dataChangeLog(dataInfoLogId) {
		var url = "/ajax-data-info-log.do";
		var info = "data_info_log_id=" + dataInfoLogId;
		$.ajax({
			url: url,
			type: "GET",
			data: info,
			dataType: "json",
			headers: { "X-mago3D-Header" : "mago3D"},
			success : function(msg) {
				if(msg.result === "success") {
					var dataInfoLog = msg.dataInfoLog;
					$("#beforeLatitude").html(dataInfoLog.before_latitude);
					$("#afterLatitude").html(dataInfoLog.latitude);
					$("#beforeLongitude").html(dataInfoLog.before_longitude);
					$("#afterLongitude").html(dataInfoLog.longitude);
					$("#beforeHeight").html(dataInfoLog.before_height);
					$("#afterHeight").html(dataInfoLog.height);
					$("#beforeHeading").html(dataInfoLog.before_heading);
					$("#afterHeading").html(dataInfoLog.heading);
					$("#beforePitch").html(dataInfoLog.before_pitch);
					$("#afterPitch").html(dataInfoLog.pitch);
					$("#beforeRoll").html(dataInfoLog.before_roll);
					$("#afterRoll").html(dataInfoLog.roll);
					
					dataInfoChangeDialog.dialog({title: dataInfoLog.data_name + " Change Request Log"}).dialog( "open" );
				} else {
					alert(JS_MESSAGE[msg.result]);
				}
			},
			error : function(request, status, error) {
				alert("잠시 후 이용해 주시기 바랍니다. 장시간 같은 현상이 반복될 경우 관리자에게 문의하여 주십시오.");
				console.log("code : " + request.status + "\n message : " + request.responseText + "\n error : " + error);
			}
		});
	}
	
	
	// 설정 메뉴 시작
	// Label 표시
	function changeLabel(isShow) {
		$("input:radio[name='labelInfo']:radio[value='" + isShow + "']").prop("checked", true);
		changeLabelAPI(managerFactory, isShow);
	}
	
	
	// click poisition call back function
	function showClickPosition(position) {
		$("#positionLatitude").val(position.lat);
		$("#positionLongitude").val(position.lon);
		$("#positionAltitude").val(position.alt);
	}
	
	// 모든 데이터 비표시
	function clearAllData() {
		clearAllDataAPI(managerFactory);
	}
	
	// general callback alert function
	function showApiResult(apiName, result) {
		if(apiName === "searchData") {
			if(result === "-1") {
				alert("아직 로드되지 않은 정보입니다. 로드 후 검색하십시오.");
			}
		}
	}
	
	function saveCurrentLocation(latitude, longitude) {
		// 현재 좌표를 저장
		$("#now_latitude").val(latitude);
		$("#now_longitude").val(longitude);
	}
	
	// moved data callback
	function showMovedData(projectId, dataKey, objectId, latitude, longitude, height, heading, pitch, roll) {
		$("#moveProjectId").val(projectId);
		$("#moveDataKey").val(dataKey);
        $("#moveLatitude").val(latitude);
        $("#moveLongitude").val(longitude);
        $("#moveHeight").val(height);
        $("#moveHeading").val(heading);
        $("#movePitch").val(pitch);
        $("#moveRoll").val(roll);
    }
</script>
    
    
    
 </body>
</html>