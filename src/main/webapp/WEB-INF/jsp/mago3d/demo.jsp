<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../views/common/taglib.jsp" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width">
	<title>demo | mago3D</title>
	<link rel="stylesheet" href="../../../css/homepage-demo.css" />
	<link rel="stylesheet" href="../../../cesium/Widgets/widgets.css" />
	<link rel="stylesheet" href="../../../js/jquery-ui/jquery-ui.css" />
	<script type="text/javascript" src="../../../js/jquery/jquery.js"></script>
	<script type="text/javascript" src="../../../js/jquery-ui/jquery-ui.js"></script>
	
</head>

<body>
	<input type="hidden" id="now_latitude" name="now_latitude" value="${now_latitude }" />
	<input type="hidden" id="now_longitude" name="now_longitude" value="${now_longitude }"  />

<ul class="nav">
	<li id="homeMenu" class="home">
		<img src="../../../images/home-icon.png" style="width: 35px; height: 35px; padding-right: 2px;"/>
	</li>
	<li id="searchMenu" class="search" data-tooltip-text="searching such as issue, object, and spatial information.">Search</li>
	<li id="apiMenu" class="api" data-tooltip-text="APIs to control various functions of mago3D.">API</li>	
	<li id="configMenu" class="config" data-tooltip-text="Settings related to rendering.">Settings</li>
</ul>

<div id="menuContent" class="navContents">
	<div class="alignRight">
		<button type="button" id="menuContentClose" class="navClose">닫기</button>
	</div>
	
	<ul id="homeMenuContent" class="menuList">
		<li>Demo
			<ul>
                <li>Cesium</li>
			</ul>
		</li>
	</ul>
	
		
	<form id="searchForm" action="/homepage/demo.do" method="post" onsubmit="return false;">
	<div id="searchMenuContent" class="searchWrap">
		<table>
			<tr style="height: 35px;">
				<td style="width: 80px;"><label for="project_id">Project</label></td>
				<td><select id="project_id" name="project_id" class="select">
						<option value=""> ALL </option>
						<option value="1">3DS Project</option>
						<option value="2">Collada Project</option>
						<option value="3">IFC</option>
						<option value="4">IFC(MEP)</option>
						<option value="5">Sea Port</option>
					</select>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td><label for="search_word">Category</label></td>
				<td>
					<select id="search_word" name="search_word" class="select">
						<option value="data_name">Data Name</option>
						<option value="title">Issue Name</option>
					</select>
					<select id="search_option" name="search_option" class="select">
						<option value="1">Included</option>
						<option value="0">Matches</option>
					</select>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td>
				<label for="search_value">SearchWord</label></td>
				<td><input type="text" id="search_value" name="search_value" size="31" /></td>
			</tr>
			<tr style="height: 35px;">
				<td><label for="start_date">Date</label></td>
				<td><input type="text" class="s date" id="start_date" name="start_date" size="12" />
				<span class="delimiter tilde">~</span>
				<input type="text" class="s date" id="end_date" name="end_date" size="12" /></td>
			</tr>
			<tr style="height: 30px;">
				<td><label for="order_word">View Order</label></td>
				<td><select id="order_word" name="order_word" class="select">
					<option value=""> Basic </option>
			       	<option value="register_date"> Date </option>
				</select>
				<select id="order_value" name="order_value" class="select">
					<option value=""> Basic </option>
				   	<option value="ASC"> ASC </option>
					<option value="DESC"> DESC </option>
				</select>
				<select id="list_counter" name="list_counter" class="select">
					<option value="5"> listing 5 </option>
				 	<option value="10"> listing 10 </option>
					<option value="50"> listing 50 </option>
				</select>
				</td>
			</tr>
		</table>
		<div class="btns">
			<button type="button" id="searchData" class="full">Search</button>
		</div>
		<ul id="searchList" class="searchList"></ul>
	</div>
	</form>
	
	<div id="apiMenuContent" class="apiWrap">
		<div>
			<h3>Local(Browser) Search</h3>
			<ul class="apiLoca">
				<li>
					<label for="localSearchProjectId">Project </label>
					<select id="localSearchProjectId" name="localSearchProjectId" class="select">
						<option value="3ds.json">3DS Project</option>
						<option value="ifc_cultural_assets.json">IFC(Cultural Assets)</option>
						<option value="ifc.json">IFC</option>
						<option value="ifc_mep.json">IFC(MEP)</option>
						<option value="sea_port.json">Sea Port</option>
						<option value="collada.json">Collada Project</option>
						<option value="ifc_japan.json">IFC(japan)</option>
					</select>
				</li>
				<li>
					<label for="localSearchDataKey">Data Key</label>
					<input type="text" id="localSearchDataKey" name="localSearchDataKey" size="22" />
					<button type="button" id="localSearch" class="btn">Search</button> 
				</li>
			</ul>
		</div>
		<div>
			<h3>Property Rendering</h3>
			<ul class="apiLoca">
				<li>
					<input type="radio" id="showPropertyRendering" name="propertyRendering" value="true" />
					<label for="showLabel"> Show </label>
					<input type="radio" id="hidePropertyRendering" name="propertyRendering" value="false" />
					<label for="hideLabel"> Hide </label>
				</li>
				<li>
					<label for="propertyRenderingProjectId">Project </label>
					<select id="propertyRenderingProjectId" name="propertyRenderingProjectId" class="select">
						<option value="3ds.json">3DS Project</option>
						<option value="ifc_cultural_asserts.json">IFC(Cultural Assets)</option>
						<option value="ifc.json">IFC</option>
						<option value="ifc_mep.json">IFC(MEP)</option>
						<option value="sea_port.json">Sea Port</option>
						<option value="collada.json">Collada Project</option>
						<option value="ifc_japan.json">IFC(japan)</option>
					</select>
				</li>
				<li>
					<label for="propertyRenderingWord">Property</label>
					<input type="text" id="propertyRenderingWord" name="propertyRenderingWord" size="21" placeholder="isMain=true" />
					<button type="button" id="changePropertyRendering" class="btn">Change</button> 
				</li>
			</ul>
		</div>
		<div>
			<h3>Color Change</h3>
			<ul class="apiLoca">
				<li>
					<label for="colorProjectId">Project </label>
					<select id="colorProjectId" name="colorProjectId" class="select">
						<option value="3ds.json">3DS Project</option>
						<option value="ifc_cultural_asserts.json">IFC(Cultural Assets)</option>
						<option value="ifc.json">IFC</option>
						<option value="ifc_mep.json">IFC(MEP)</option>
						<option value="sea_port.json">Sea Port</option>
						<option value="collada.json">Collada Project</option>
						<option value="ifc_japan.json">IFC(japan)</option>
					</select>
				</li>
				<li>
					<label for="colorDataKey">Data Key</label>
					<input type="text" id="colorDataKey" name="colorDataKey" size="30" />
				</li>
				<li>
					<label for="colorObjectIds">Object Id</label>
					<input type="text" id="colorObjectIds" name="colorObjectIds" placeholder=" , Delimiter" size="30" />
				</li>
				<li>
					<label for="colorProperty">Property</label>
					<input type="text" id="colorProperty" name="colorProperty" size="30" placeholder="isMain=true" />
				</li>
				<li>
					<label for="updateColor">Color</label>
					<select id="updateColor" name="updateColor" class="select">
						<option value="255,0,0"> Red </option>
						<option value="255,255,0"> Yellow </option>
						<option value="0,255,0"> Green </option>
						<option value="0,0,255"> Blue </option>
						<option value="255,0,255"> Pink </option>
						<option value="0,0,0"> Black </option>
					</select>
					<button type="button" id="changeColor" class="btn">Change</button> 
					<button type="button" id="deleteAllChangeColor" class="btn">All Delete</button>
				</li>
			</ul>
		</div>
		<div>
			<h3>Location and Rotation</h3>
			<ul class="apiLoca">
				<li>
					<label for="moveProjectId">Project </label>
					<select id="moveProjectId" name="moveProjectId" class="select">
						<option value="3ds.json">3DS Project</option>
						<option value="ifc_cultural_asserts.json">IFC(Cultural Assets)</option>
						<option value="ifc.json">IFC</option>
						<option value="ifc_mep.json">IFC(MEP)</option>
						<option value="sea_port.json">Sea Port</option>
						<option value="collada.json">Collada Project</option>
						<option value="ifc_japan.json">IFC(japan)</option>
					</select>
				</li>
				<li>
					<label for="moveDataKey">Data Key</label>
					<input type="text" id="moveDataKey" name="moveDataKey" size="25" />
				</li>
				<li>
					<label for="moveLatitude">Latitude </label>
					<input type="text" id="moveLatitude" name="moveLatitude" size="25"/>
				</li>
				<li>
					<label for="moveLongitude">Longitude </label>
					<input type="text" id="moveLongitude" name="moveLongitude" size="25"/>
				</li>
				<li>
					<label for="moveHeight">Altitude </label>
					<input type="text" id="moveHeight" name="moveHeight" size="25" />
				</li>
				<li>
					<label for="moveHeading">HEADING </label>
					<input type="text" id="moveHeading" name="moveHeading" size="15" />
				</li>
				<li>
					<label for="movePitch">PITCH </label>
					<input type="text" id="movePitch" name="movePitch" size="15" />
				</li>
				<li>
					<label for="moveRoll">ROLL </label>
					<input type="text" id="moveRoll" name="moveRoll" size="15" />
					<button type="button" id="changeLocationAndRotation" class="btn">Change</button>
					<button type="button" id="saveLocationAndRotation" class="btn">Save</button>
				</li>
			</ul>
		</div>
		<div>
			<h3>Issue Lists(100) near current location</h3>
			<input type="radio" id="showNearGeoIssueList" name="nearGeoIssueList" value="true" onclick="changeNearGeoIssueList(true);" />
			<label for="showNearGeoIssueList"> Show </label>
			<input type="radio" id="hideNearGeoIssueList" name="nearGeoIssueList" value="false" onclick="changeNearGeoIssueList(false);"/>
			<label for="hideNearGeoIssueList"> Hide </label>
		</div>
		<div>
			<h3>About the location of the click point</h3>
			<ul class="apiLoca">
				<li>
					<label for="positionLatitude"> Latitude </label>
					<input type="text" id="positionLatitude" name="positionLatitude" size="25" />
				</li>
				<li>
					<label for="positionLongitude"> Longitude </label>
					<input type="text" id="positionLongitude" name="positionLongitude" size="25" />
				</li>
				<li>
					<label for="positionAltitude"> Altitude </label>
					<input type="text" id="positionAltitude" name="positionAltitude" size="25" />
				</li>
			</ul>
		</div>
	</div>
	
	
	<div id="configMenuContent" class="configWrap">
		<div>
			<h3>Label</h3>
			<input type="radio" id="showLabel" name="labelInfo" value="true" onclick="changeLabel(true);" />
			<label for="showLabel"> Show </label>
			<input type="radio" id="hideLabel" name="labelInfo" value="false" onclick="changeLabel(false);"/>
			<label for="hideLabel"> Hide </label>
		</div>
		<div>
			<h3>Object Information</h3>
			<input type="radio" id="showObjectInfo" name="objectInfo" value="true" onclick="changeObjectInfoViewMode(true);" />
			<label for="showObjectInfo"> Show </label>
			<input type="radio" id="hideObjectInfo" name="objectInfo" value="false" onclick="changeObjectInfoViewMode(false);"/>
			<label for="hideObjectInfo"> Hide </label>
		</div>
        <div>
            <h3>Origin</h3>
            <input type="radio" id="showOrigin" name="origin" value="true" onclick="changeOrigin(true);" />
            <label for="showOrigin"> Show </label>
            <input type="radio" id="hideOrigin" name="origin" value="false" onclick="changeOrigin(false);"/>
            <label for="hideOrigin"> Hide </label>
        </div>
		<div>
			<h3>Bounding Box</h3>
			<input type="radio" id="showBoundingBox" name="boundingBox" value="true" onclick="changeBoundingBox(true);" />
			<label for="showBoundingBox"> Show </label>
			<input type="radio" id="hideBoundingBox" name="boundingBox" value="false" onclick="changeBoundingBox(false);"/>
			<label for="hideBoundingBox"> Hide </label>
		</div>
		<div>
			<h3>Selecting And Moving</h3>
			<input type="radio" id="objectNoneMove" name="objectMoveMode" value="2" onclick="changeObjectMove('2');"/>
			<label for="objectNoneMove"> None </label>
			<input type="radio" id="objectAllMove" name="objectMoveMode" value="0" onclick="changeObjectMove('0');"/>
			<label for="objectAllMove"> ALL </label>
			<input type="radio" id="objectMove" name="objectMoveMode" value="1" onclick="changeObjectMove('1');"/>
			<label for="objectMove"> Object </label>
			
			<button type="button" id="saveObjectMoveButton" class="btn">Save</button>
			<button type="button" id="deleteAllObjectMoveButton" class="btn">All Delete</button>
		</div>
		<div>
			<h3>Object Occlusion Culling</h3>
			<div style="height: 30px;">
				<div style="display: inline-block; width: 70px;">Select</div>
				<input type="radio" id="useOcclusionCulling" name="occlusionCulling" value="true" />
				<label for="useOcclusionCulling"> Use </label>
				<input type="radio" id="unusedOcclusionCulling" name="occlusionCulling" value="false" />
				<label for="unusedOcclusionCulling"> Unused </label>
			</div>
			<div style="height: 30px;">
				<div style="display: inline-block; width: 70px;">Data Key</div>
				<input type="text" id="occlusion_culling_data_key" name="occlusion_culling_data_key" size="22" />
				<button type="button" id="changeOcclusionCullingButton" class="btn">Change</button>
			</div>
		</div>
		<div>
			<h3>LOD</h3>
			<div style="height: 30px;">
				<div style="display: inline-block; width: 70px;">LOD0</div>
				<input type="text" id="geo_lod0" name="geo_lod0" value="15" size="15" />&nbsp;M
			</div>
			<div style="height: 30px;">
				<div style="display: inline-block; width: 70px;">LOD1</div>
				<input type="text" id="geo_lod1" name="geo_lod1" value="60" size="15" />&nbsp;M
			</div>
			<div style="height: 30px;">
				<div style="display: inline-block; width: 70px;">LOD2</div>
				<input type="text" id="geo_lod2" name="geo_lod2" value="90" size="15" />&nbsp;M
			</div>
			<div style="height: 30px;">
				<div style="display: inline-block; width: 70px;">LOD3</div>
				<input type="text" id="geo_lod3" name="geo_lod3" value="200" size="15" />&nbsp;M
			</div>
			<div style="height: 30px;">
				<div style="display: inline-block; width: 70px;">LOD4</div>
				<input type="text" id="geo_lod4" name="geo_lod4" value="1000" size="15" />&nbsp;M
			</div>
			<div style="height: 30px;">
				<div style="display: inline-block; width: 70px;">LOD5</div>
				<input type="text" id="geo_lod5" name="geo_lod5" value="50000" size="15" />&nbsp;M&nbsp;&nbsp;
				<button type="button" id="changeLodButton" class="btn">Change</button>
			</div>
		</div>
		<div>
			<h3>Lighting</h3>
			<div style="height: 30px;">AmbientReflectionCoeficient</div>
			<div id="ambient_reflection_coef" style="display: inline-block; width: 225px;">
				<div id="geo_ambient_reflection_coef_view" class="ui-slider-handle"></div>
				<input type="hidden" id="geo_ambient_reflection_coef" name="geo_ambient_reflection_coef" value="0.5" />
			</div>
			<div style="height: 30px;">DiffuseReflectionCoeficient</div>
			<div id="diffuse_reflection_coef" style="display: inline-block; width: 225px;">
				<div id="geo_diffuse_reflection_coef_view" class="ui-slider-handle"></div>
				<input type="hidden" id="geo_diffuse_reflection_coef" name="geo_diffuse_reflection_coef" value="1" />
			</div>
			<div style="height: 30px;">SpecularReflectionCoeficient</div>
			<div>
				<div id="specular_reflection_coef" style="display: inline-block; width: 225px;">
					<div id="geo_specular_reflection_coef_view" class="ui-slider-handle"></div>
					<input type="hidden" id="geo_specular_reflection_coef" name="geo_specular_reflection_coef" value="1" />
				</div>
				<div style="float: right;">
					<button type="button" id="changeLightingButton" class="btn">Change</button>
				</div>
			</div>
			<div style="text-align: center">
			</div>
		</div>
		
		<div>
			<h3><label for="geo_ssao_radius">SSAO Radius</label></h3>
			<input type="text" id="geo_ssao_radius" name="geo_ssao_radius" />
			<button type="button" id="changeSsaoRadiusButton" class="btn">Change</button>
		</div>
		
		<div>
			<h3>View Mode</h3>
			<input type="radio" id="mode3PV" name="viewMode" value ="false" onclick="changeViewMode(false);"/>
			<label for="mode3PV"> Third Person Mode </label>
			<input type="radio" id="mode1PV" name="viewMode" value ="true" onclick="changeViewMode(true);"/>
			<label for="mode1PV"> First Person Mode </label>
		</div>
	</div>
</div>

<ul class="shortcut">
	<li onclick="gotoProject('3ds.json', '126.6113', '37.58210', '570', '3')">3DS Project</li>
	<li onclick="gotoProject('ifc.json', '-58.787', '-62.2237', '270', '5')">IFC</li>
	<li onclick="gotoProject('collada.json', '126.7987', '37.567450', '320', '3')">Collada Project</li>
</ul>

<!-- 맵영역 -->
<c:if test="${geoViewLibrary == null || geoViewLibrary eq '' || geoViewLibrary eq 'cesium' }">
<div id="magoContainer" class="mapWrap"></div>
<canvas id="objectLabel"></canvas>
</c:if>

<script type="text/javascript" src="../../../cesium/Cesium.js"></script>
<script type="text/javascript" src="../../../js/mago3d.js"></script>
<script>
	var agent = navigator.userAgent.toLowerCase();
	if(agent.indexOf('chrome') < 0) { 
		alert("This page is optimized for the Chrome browser for massive data processing.\n Please use the Chrome browser for seamless service.");
	}

   	var managerFactory = null;
	var menuObject = { homeMenu : false, myIssueMenu : false, searchMenu : false, apiMenu : false, insertIssueMenu : false, treeMenu : false, chartMenu : false, logMenu : false, attributeMenu : false, configMenu : false };
	var insertIssueEnable = false;

	var imagePath = "/images/ko";
	var dataInformationUrl = "ajax-project-data-by-project-id.do";
	magoStart(null, "magoContainer", imagePath);
	var intervalCount = 0;
	var timerId = setInterval("startMogoUI()", 1000);

	function startMogoUI() {
		intervalCount++;
		if(managerFactory != null && managerFactory.getMagoManagerState() === CODE.magoManagerState.READY) {
			initJqueryCalendar();
			// Label 표시
			changeLabel(false);
			// object 정보 표시
			changeObjectInfoViewMode(true);
            // Origin 표시
            changeOrigin(false);
			// BoundingBox
			changeBoundingBox(false);
			// Selecting And Moving
			changeObjectMove("2");
			// slider, color-picker
			initRendering();
			
			// 3PView Mode
			changeViewMode(false);

			clearInterval(timerId);
			console.log(" managerFactory != null, managerFactory.getMagoManagerState() = " + managerFactory.getMagoManagerState() + ", intervalCount = " + intervalCount);
			return;
		}
		console.log("--------- intervalCount = " + intervalCount);
	}

/* 	
	// mago3d 시작, 정책 데이터 파일을 로딩
	function magoStart(viewer, renderDivId, imagePath) {
		$.ajax({
			url: dataInformationUrl + "policy-cesium.json",
			type: "GET",
			dataType: "json",
			success: function(serverPolicy){
				loadData(viewer, renderDivId, serverPolicy);
			},
			error: function(e){
				alert(e.responseText);
			}
		});
	} 
*/
	
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
							alert(JS_MESSAGE["project.data.no.found"]);
							return;
						}
						gotoProjectAPI(managerFactory, projectId, projectDataJson, projectDataJson.data_key, longitude, latitude, height, duration);
					} else {
						alert(JS_MESSAGE[msg.result]);
					}
				},
				error : function(request, status, error) {
					alert(JS_MESSAGE["ajax.error.message"]);
					console.log("code : " + request.status + "\n message : " + request.responseText + "\n error : " + error);
				}
			});
		} else {
			gotoProjectAPI(managerFactory, projectId, projectData, projectData.data_key, longitude, latitude, height, duration);	
		}
		
		// 현재 좌표를 저장
		saveCurrentLocation(latitude, longitude);
	}
	function gotoIssue(projectId, issueId, issueType, longitude, latitude, height, duration) {
		var projectData = getDataAPI(CODE.PROJECT_ID_PREFIX + projectId);
		if (projectData === null || projectData === undefined) {
			$.ajax({
				url: dataInformationUrl + projectId,
				type: "GET",
				dataType: "json",
				success: function(serverData) {
					gotoIssueAPI(managerFactory, projectId, serverData, serverData.data_key, issueId, issueType, longitude, latitude, height, duration);		
				},
				error : function(request, status, error) {
					console.log("code : " + request.status + "\n" + "message : " + request.responseText + "\n" + "error : " + error);
				}
			});
		} else {
			gotoIssueAPI(managerFactory, projectId, projectData, projectData.data_key, issueId, issueType, longitude, latitude, height, duration);	
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
	
	// 검색 메뉴 시작
	// Data 검색
	var searchDataFlag = true;
	$("#searchData").click(function() {
		if ($.trim($("#search_value").val()) === "") {
			alert("Please enter a search word.");
			$("#search_value").focus();
			return false;
		}
		
		if(searchDataFlag) {
			searchDataFlag = false;
			var info = $("#searchForm").serialize();		
			
			var searchType = $("#search_word").val();
			var content = "";
			if(searchType === "data_name") {
				content = content 
				+ 	"<li>"
				+ 	"	<button type=\"button\" title=\"Shortcuts\" onclick=\"gotoData('3ds.json', 'kangbukSport_del');\">Shortcuts</button>"
				+ 	"	<div class=\"info\">"		
				+ 	"		<p class=\"title\">"			
				+ 	"			<span>3DS Project</span>kangbukSport_del"
				+ 	"		</p>"
				+ 	"		<ul class=\"tag\">"
				+ 	"			<li><span class=\"t3\"></span>37.58198979</li>"
				+ 	"			<li><span class=\"t3\"></span>126.6082096</li>"
				+ 	"			<li class=\"date\">2017-08-10 15:30:51</li>"
				+ 	"		</ul>"
				+ 	"	</div>"
				+ 	"</li>";
			} else {
				content = content 
				+ 	"<li>"
				+ 	"	<button type=\"button\" title=\"Shortcuts\"" 
				+ 	"	onclick=\"gotoIssue('3ds.json', '129', 'ISSUE_TYPE_BUGGER', '126.60779951279575,', '37.582800047391295,', '38.95831222452215', '2');\">Shortcuts</button>"
				+ 	"	<div class=\"info\">"
				+ 	"		<p class=\"title\">"
				+ 	"			<span>3DS Project</span>test"
				+ 	"		</p>"
				+ 	"		<ul class=\"tag\">"
				+ 	"			<li><span class=\"i1\"></span>Bugger</li>"
				+ 	"			<li><span class=\"t1\"></span>Very Important</li>"
				+ 	"			<li class=\"date\">2017-08-25 14:27:42</li>"
				+ 	"		</ul>"
				+ 	"	</div>"
				+ 	"</li>";
			}
			
			$("#searchList").empty();
			$("#searchList").html(content);
			searchDataFlag = true;
		} else {
			alert("In progress.");
			return;
		}
	});
	
	// 데이터 위치로 이동
	function gotoData(projectId, dataKey) {
		searchDataAPI(managerFactory, projectId, dataKey);
	}
	
	$("#localSearch").click(function() {
		if ($.trim($("#localSearchDataKey").val()) === "") {
			alert("Please enter data key.");
			$("#localSearchDataKey").focus();
			return false;
		}
		searchDataAPI(managerFactory, $("#localSearchProjectId").val(), $("#localSearchDataKey").val());
	});
	
	// API 메뉴시작
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
					'ProjectId : ' + projectId,
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
	
	// 속성 가시화
	$("#changePropertyRendering").click(function(e) {
		var isShow = $(':radio[name="propertyRendering"]:checked').val();
		if(isShow === undefined){
			alert("Select Show / Hide.");
			return false;
		}
		if ($.trim($("#propertyRenderingWord").val()) === "") {
			alert("Please enter property.");
			$("#propertyRenderingWord").focus();
			return false;
		}
		changePropertyRenderingAPI(managerFactory, isShow, $("#propertyRenderingProjectId").val(), $("#propertyRenderingWord").val());
	});
	
	// 색변경
	$("#changeColor").click(function(e) {
		if ($.trim($("#colorDataKey").val()) === "") {
			alert("Please enter Data Key.");
			$("#colorDataKey").focus();
			return false;
		}
		
		var objectIds = null;
		var colorObjectIds = $("#colorObjectIds").val();
		if(colorObjectIds !== null && colorObjectIds !== "") objectIds = colorObjectIds.split(",");
		changeColorAPI(managerFactory, $("#colorProjectId").val(), $("#colorDataKey").val(), objectIds, $("#colorProperty").val(), $("#updateColor").val());
	});
	// 색깔 변경 이력 삭제
	$("#deleteAllChangeColor").click(function () {
		if(confirm("Are you sure you want to delete?")) {
			deleteAllChangeColorAPI(managerFactory);
		}
	});
	
	// 변환행렬
	$("#changeLocationAndRotation").click(function() {
		if(!changeLocationAndRotationCheck()) return false;
		changeLocationAndRotationAPI(	managerFactory, $("#moveProjectId").val(),
										$("#moveDataKey").val(), $("#moveLatitude").val(), $("#moveLongitude").val(), 
										$("#moveHeight").val(), $("#moveHeading").val(), $("#movePitch").val(), $("#moveRoll").val());
	});
	function changeLocationAndRotationCheck() {
		if ($.trim($("#moveDataKey").val()) === "") {
			alert("Please enter data key.");
			$("#moveDataKey").focus();
			return false;
		}
		if ($.trim($("#moveLatitude").val()) === "") {
			alert("Please enter latitude.");
			$("#moveLatitude").focus();
			return false;
		}
		if ($.trim($("#moveLongitude").val()) === "") {
			alert("Please enter longitude.");
			$("#moveLongitude").focus();
			return false;
		}
		if ($.trim($("#moveHeight").val()) === "") {
			alert("Please enter altitude.");
			$("#moveHeight").focus();
			return false;
		}
		if ($.trim($("#moveHeading").val()) === "") {
			alert("Please enter heading.");
			$("#moveHeading").focus();
			return false;
		}
		if ($.trim($("#movePitch").val()) === "") {
			alert("Please enter pitch.");
			$("#movePitch").focus();
			return false;
		}
		if ($.trim($("#moveRoll").val()) === "") {
			alert("Please enter roll.");
			$("#moveRoll").focus();
			return false;
		}
		return true;
	}

    // 변환행렬 저장
    $("#saveLocationAndRotation").click(function() {
		alert("This service is available only in Enterprise Version.");
		return;
    });



	// 설정 메뉴 시작
	// Label 표시
	function changeLabel(isShow) {
		$("input:radio[name='labelInfo']:radio[value='" + isShow + "']").prop("checked", true);
		changeLabelAPI(managerFactory, isShow);
	}
	// object info 표시
	function changeObjectInfoViewMode(isShow) {
		$("input:radio[name='objectInfo']:radio[value='" + isShow + "']").prop("checked", true);
		changeObjectInfoViewModeAPI(managerFactory, isShow);
	}
    // Origin 표시/비표시
    function changeOrigin(isShow) {
        $("input:radio[name='origin']:radio[value='" + isShow + "']").prop("checked", true);
        // TODO Selecting AND Moving API와 연동
        changeOriginAPI(managerFactory, isShow);
    }
	// boundingBox 표시/비표시
	function changeBoundingBox(isShow) {
		$("input:radio[name='boundingBox']:radio[value='" + isShow + "']").prop("checked", true);
		changeBoundingBoxAPI(managerFactory, isShow);
	}
	// 마우스 클릭 객체 이동 모드 변경
	function changeObjectMove(objectMoveMode) {
		$("input:radio[name='objectMoveMode']:radio[value='" + objectMoveMode + "']").prop("checked", true);
		changeObjectMoveAPI(managerFactory, objectMoveMode);
		// ALL 인 경우 Origin도 같이 표시
        var originValue = $(':radio[name="origin"]:checked').val();
        if(objectMoveMode === "0") {
		    if(originValue === "true") {
            } else {
            }
            changeOriginAPI(managerFactory, true);
        } else {
            if(originValue === "true") {
            } else {
                changeOriginAPI(managerFactory, false);
            }
        }
	}
	// 마우스 클릭 객체 이동 모드 변경 저장
	$("#saveObjectMoveButton").click(function () {
		alert("Comming soon");
		return;
		var objectMoveMode = $(':radio[name="objectMoveMode"]:checked').val();
		if(objectMoveMode === "2") {
			alert("Can not be saved in None mode.");
			return;
		}
		saveObjectMoveAPI(managerFactory, objectMoveMode);
	});
	// 마우스 클릭 객체 이동 모드 변경 삭제
	$("#deleteAllObjectMoveButton").click(function () {
		var objectMoveMode = $(':radio[name="objectMoveMode"]:checked').val();
		if(confirm("Are you sure you want to delete?")) {
			deleteAllObjectMoveAPI(managerFactory, objectMoveMode);
		}
	});
	
	// Object Occlusion culling
	$("#changeOcclusionCullingButton").click(function () {
		changeOcclusionCullingAPI(managerFactory, ($(':radio[name="occlusionCulling"]:checked').val() === "true"), $("#occlusion_culling_data_key").val());		
	});
	// 카메라 모드 전환
	function changeViewMode(isFPVMode) {
		$("input:radio[name='viewMode']:radio[value='" + isFPVMode + "']").prop("checked", true);
		changeFPVModeAPI(managerFactory, isFPVMode);
	}
	function initJqueryCalendar() {
		$( ".date" ).datepicker({ 
			dateFormat : "yymmdd",
			dayNames : [ "Su", "Mo", "Tu", "We", "Th", "Fr", "Sa" ],
			dayNamesShort : [ "Su", "Mo", "Tu", "We", "Th", "Fr", "Sa" ],
			dayNamesMin : [ "Su", "Mo", "Tu", "We", "Th", "Fr", "Sa" ],
			monthNames : [ "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December" ],
			monthNamesShort : [ "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec" ],
			prevText : "",
			nextText : "",
			showMonthAfterYear : true,
			yearSuffix : ""
		});
	}
	
	// rendering 설정
	function initRendering() {
		var ambient = $( "#geo_ambient_reflection_coef_view" );
		$( "#ambient_reflection_coef" ).slider({
			range: "max",
			min: 0, // min value
			max: 1, // max value
			step: 0.01,
			value: '0.5', // default value of slider
			create: function() {
				ambient.text( $( this ).slider( "value" ) );
			},
			slide: function( event, ui ) {
				ambient.text( ui.value);
				$("#geo_ambient_reflection_coef" ).val(ui.value);
			}
		});
		var diffuse = $( "#geo_diffuse_reflection_coef_view" );
		$( "#diffuse_reflection_coef" ).slider({
			range: "max",
			min: 0, // min value
			max: 1, // max value
			step: 0.01,
			value: '1.0', // default value of slider
			create: function() {
				diffuse.text( $( this ).slider( "value" ) );
			},
			slide: function( event, ui ) {
				diffuse.text( ui.value);
				$("#geo_diffuse_reflection_coef" ).val(ui.value);
			}
		});
		var specular = $( "#geo_specular_reflection_coef_view" );
		$( "#specular_reflection_coef" ).slider({
			range: "max",
			min: 0, // min value
			max: 1, // max value
			step: 0.01,
			value: '1.0', // default value of slider
			create: function() {
				specular.text( $( this ).slider( "value" ) );
			},
			slide: function( event, ui ) {
				specular.text( ui.value);
				$("#geo_specular_reflection_coef" ).val(ui.value);
			}
		});
	}
	
	// LOD 설정
	$("#changeLodButton").click(function() {
		changeLodAPI(managerFactory, $("#geo_lod0").val(), $("#geo_lod1").val(), $("#geo_lod2").val(), $("#geo_lod3").val(), $("#geo_lod4").val(), $("#geo_lod5").val());
	});
	// Lighting 설정
	$("#changeLightingButton").click(function() {
		changeLightingAPI(managerFactory, $("#geo_ambient_reflection_coef").val(), $("#geo_diffuse_reflection_coef").val(), $("#geo_specular_reflection_coef").val(), null, null);
	});
	// Ssadradius 설정
	$("#changeSsaoRadiusButton").click(function() {
		changeSsaoRadiusAPI(managerFactory, $("#geo_ssao_radius").val());
	});

	// click poisition call back function
	function showClickPosition(position) {
		$("#positionLatitude").val(position.lat);
		$("#positionLongitude").val(position.lon);
		$("#positionAltitude").val(position.alt);
	}

	// general callback alert function
	function showApiResult(apiName, result) {
		if(apiName === "getDataInfoByDataKey" || apiName === "searchData" ) {
			if(result === "-1") {
				alert(" Information that has not yet been loaded. Please search after loading. ");
			}
		}
	}
	
	function saveCurrentLocation(latitude, longitude) {
		// 현재 좌표를 저장
		$("#now_latitude").val(latitude);
		$("#now_longitude").val(longitude);
	}

    function showMovedData(projectId, dataKey, objectId, latitude, longitude, height, heading, pitch, roll) {
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