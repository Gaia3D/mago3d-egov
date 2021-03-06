<%--
  Class Name : list-data.jsp
  Description : 데이터 목록 화면
  Modification Information
 
    author   : HJCHOI
    since    : 2018.05.02  
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="egovframework.com.cmm.service.EgovProperties" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="ImgUrl" value="/images/egovframework/cop/bbs/"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
<meta http-equiv="content-language" content="ko">
<link href="<c:url value='/'/>css/common.css" rel="stylesheet" type="text/css" >
<c:if test="${anonymous == 'true'}"><c:set var="prefix" value="/anonymous"/></c:if>
<c:choose>
	<c:when test="${preview == 'true'}">
	</c:when>
</c:choose>
<title>데이터 목록</title>
	<script type="text/javascript" src="<c:url value='/js/EgovBBSMng.js' />" ></script>
	<script type="text/javascript">

		function fn_egov_select_dataList(pageNo){
			//location.href = "list-data.do?pageNo="+pageNo;
			document.frm.pageIndex.value = pageNo; 
			document.frm.action = "<c:url value='list-data.do'/>";
			document.frm.submit();	

			
		}
		
	</script>

<style type="text/css">
    h1 {font-size:12px;}
    caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
</style>

</head>
<body>
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
                            <li>HOME</li>
                            <li>&gt;</li>
                            <li>운영설정</li>
                            <li>&gt;</li>
                            <li><strong>데이터 목록</strong></li>
                        </ul>
                    </div>
                </div>
                <!-- 검색 필드 박스 시작 -->
                <div id="search_field">
                    <div id="search_field_loc"><h2><strong><c:out value='데이터 목록'/></strong></h2></div>
					<form:form id="searchForm" modelAttribute="data" method="post" action="list-data.do" onsubmit="return searchCheck();">
						<input type="hidden" name="projectId" value="<c:out value='${data.project_id}'/>" />
						<input name="pageIndex" type="hidden" value="<c:out value='${data.pageIndex}'/>"/>
                        
                        <fieldset><legend>조건정보 영역</legend>
                        <div class="sf_start">
                            <ul id="search_first_ul">
                                <li>
										<label for="search_word">&nbsp;&nbsp; 검색어 &nbsp;&nbsp;</label>
										<select id="search_word" name="search_word" class="select" style="width: 120px; margin-right: 30px;">
											<option value="select">선택</option>
						         			<option value="data_name">데이터명</option>
										</select>
										<form:input path="search_value" id ="search_data" type="search" cssClass="m" size="30px;"/>
                                </li>
                                <li>
                                    <div class="buttons" style="position:absolute;left:690px;top:183px;">
                                    	<!-- <a href="list-data.do" onclick=searchCheck(); return false;"><img src="/images/img_search.gif" alt="search">검색 </a> -->
                                    	<input type="submit" value="검색" />
                                    </div>                              
                                </li>      
                            </ul>
                        </div>
                        </fieldset>
                    </form:form>
                </div>
                <!-- //검색 필드 박스 끝 -->
                
                <div id="page_info"><div id="page_info_align"></div></div>      

                <div class="list-desc u-pull-left">
					전체: ${totalCount} 건  / ${paginationInfo.totalPageCount} 페이지
				</div> 
				                             
                <!-- table add start -->
                <div class="default_tablestyle">
                    <table summary="번호, 제목, 게시시작일, 게시종료일, 작성자, 작성일, 조회수   입니다" cellpadding="0" cellspacing="0">
                    <caption>게시물 목록</caption>
                    <thead>
                    <tr>
                   		<th scope="col" class="f_field" nowrap="nowrap">번호</th>
						<th scope="col" class="col-id" style="width: 140px;">프로젝트명</th>
						<th scope="col" class="col-name" style="width: 140px;">데이터명</th>
						<th scope="col" class="col-toggle" style="width: 110px;">위도</th>
						<th scope="col" class="col-toggle" style="width: 110px;">경도</th>
						<th scope="col" class="col-toggle" style="width: 110px;">상태</th>
						<th scope="col" class="col-functions" colspan="2" style="width: 180px;">수정/삭제</th>
                    </tr>
                    </thead>
                    <tbody>                 

                    <c:if test="${empty dataList }">
						<tr>
							<td colspan="8" class="col-none">데이터가 존재하지 않습니다.</td>
						</tr>
					</c:if>
					<c:if test="${!empty dataList }">
					<c:forEach var="dataVO" items="${dataList}" varStatus="status">
                    <!-- loop 시작 -->                                
                      <tr>
				        <td nowrap="nowrap"><strong><c:out value="${paginationInfo.firstRecordIndex + status.count}"/></strong></td>	
				        <td class="col-id">${dataVO.project_name }</td>
				        <td><a href="detail-data.do?data_id=${dataVO.data_id}&pageIndex=${paginationInfo.currentPageNo}">${dataVO.data_name}</a></td>
				        <td class="col-toggle"><fmt:formatNumber value="${dataVO.latitude}" type="number" maxFractionDigits="10" /></td>
						<td class="col-toggle"><fmt:formatNumber value="${dataVO.longitude}" type="number" maxFractionDigits="10" /></td>
<c:choose>
	<c:when test="${dataVO.status eq '0' }">
						<td class="col-toggle">사용</td>
	</c:when>
	<c:when test="${dataVO.status eq '1' }">
						<td class="col-toggle">사용중지</td>
	</c:when>
	<c:when test="${dataVO.status eq '2' }">
						<td class="col-toggle">기타</td>
	</c:when>
</c:choose>
						<td class="col-functions" style="text-align: right;"><a href="modify-data.do?data_id=${dataVO.data_id}&pageIndex=${paginationInfo.currentPageNo}">수정&nbsp;</a></td>
						<td class="col-functions" style="text-align: left;"><a href="#" onclick="deleteData('${dataVO.data_id}'); return false;">&nbsp;삭제</a></td>
				      </tr>
				     </c:forEach>     
				     </c:if>
				     
                    </tbody>
                    </table>
                </div>
                
                <!-- 페이지 네비게이션 시작 -->
                <div id="paging_div">
                    <ul class="paging_align">
                       <ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_egov_select_dataList"  />
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


	<script src="/js/jquery/jquery.js"></script>
	<script src="/js/jquery-ui/jquery-ui.js"></script>
	<script src="/js/jquery/jquery.form.js"></script>
	<script type="text/javascript">
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
    var deleteDatatFlag = true;
	function deleteData(data_id) {
		if(confirm("정말 삭제하시겠습니까?")) {
			if(deleteDatatFlag) {
				deleteDatatFlag = false;
				var info = "data_id=" + data_id;
				$.ajax({
					url: "ajax-delete-data.do",
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
						deleteDatatFlag = true;
					},
					error:function(request,status,error){
				        alert("잠시 후 이용해 주시기 바랍니다. 장시간 같은 현상이 반복될 경우 관리자에게 문의하여 주십시오.");
				        deleteDatatFlag = true;
					}
				});
			} else {
				alert("진행 중입니다.");
				return;
			}
		}
	}
	
	function searchCheck() {
		
		var search_word = document.getElementById("search_word");
		var selectValue = search_word.options[search_word.selectedIndex].value;
		var search_data = $("#search_data").val();
		
		if(selectValue == 'select') {
			alert("검색어를 선택해 주세요.");
			return false;
		} else if (selectValue == 'data_name') {
			if(search_data == null || search_data == "") {
				alert("검색어를 입력해 주세요.");
				return false;
			}
			return true;
		}
		
	} 


	
	
</script>
</body>
</html>