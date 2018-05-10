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
                            <li>HOME</li>
                            <li>&gt;</li>
                            <li>알림마당</li>
                            <li>&gt;</li>
                            <li><strong>${brdMstrVO.bbsNm}</strong></li>
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
                                    <div class="buttons" style="position:absolute;left:870px;top:182px;">
                                        <a href="#LINK" onclick="javascript:fn_egov_select_noticeList('1'); return false;"><img src="<c:url value='/images/img_search.gif' />" alt="search" />조회 </a>
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
                    <colgroup>
                    <col width="10%">
                    <col>  
                    <c:if test="${brdMstrVO.bbsAttrbCode == 'BBSA01'}">
	                    <col width="10%">
	                    <col width="10%">
				    </c:if>
				    <c:if test="${anonymous != 'true'}">
                        <col width="10%">
                    </c:if>
                    <col width="15%">
                    <col width="8%">
                    </colgroup>
                    <thead>
                    <tr>
                        <th scope="col" class="f_field" nowrap="nowrap">번호</th>
                        <th scope="col" nowrap="nowrap">제목</th>
                        <c:if test="${brdMstrVO.bbsAttrbCode == 'BBSA01'}">
	                        <th scope="col" nowrap="nowrap">게시시작일</th>
	                        <th scope="col" nowrap="nowrap">게시종료일</th>
	                    </c:if>
	                    <c:if test="${anonymous != 'true'}">
	                        <th scope="col" nowrap="nowrap">작성자</th>
	                    </c:if>
                        <th scope="col" nowrap="nowrap">작성일</th>
                        <th scope="col" nowrap="nowrap">조회수</th>
                    </tr>
                    </thead>
                    <tbody>                 

                    <c:forEach var="result" items="${resultList}" varStatus="status">
                    <!-- loop 시작 -->                                
                      <tr>
				        <!--td class="lt_text3" nowrap="nowrap"><input type="checkbox" name="check1" class="check2"></td-->
				        <td><b><c:out value="${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.pageSize + status.count)}"/></b></td>            
				        <td align="left">
				            <form name="subForm" method="post" action="<c:url value='/cop/bbs${prefix}/selectBoardArticle.do'/>">
				            <c:if test="${result.replyLc!=0}">
				                <c:forEach begin="0" end="${result.replyLc}" step="1">
				                    &nbsp;
				                </c:forEach>
				                <img src="<c:url value='/images/reply_arrow.gif'/>" alt="reply arrow"/>
				            </c:if>
				            <c:choose>
				                <c:when test="${result.isExpired=='Y' || result.useAt == 'N'}">
				                    <c:out value="${result.nttSj}" />
				                </c:when>
				                <c:otherwise>
				                        <input type="hidden" name="bbsId" value="<c:out value='${result.bbsId}'/>" />
				                        <input type="hidden" name="nttId"  value="<c:out value="${result.nttId}"/>" />
				                        <input type="hidden" name="bbsTyCode" value="<c:out value='${brdMstrVO.bbsTyCode}'/>" />
				                        <input type="hidden" name="bbsAttrbCode" value="<c:out value='${brdMstrVO.bbsAttrbCode}'/>" />
				                        <input type="hidden" name="authFlag" value="<c:out value='${brdMstrVO.authFlag}'/>" />
				                        <input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
				                        <span class="link"><input type="submit" style="width:320px;border:solid 0px black;text-align:left;" value="<c:out value="${result.nttSj}"/>" ></span>
				                </c:otherwise>
				            </c:choose>
				            </form>
				        </td>
				        <c:if test="${brdMstrVO.bbsAttrbCode == 'BBSA01'}">
				            <td ><c:out value="${result.ntceBgnde}"/></td>
				            <td ><c:out value="${result.ntceEndde}"/></td>
				        </c:if>
				        <c:if test="${anonymous != 'true'}">
				            <td ><c:out value="${result.frstRegisterNm}"/></td>
				        </c:if>
				        <td ><c:out value="${result.frstRegisterPnttm}"/></td>
				        <td ><c:out value="${result.inqireCo}"/></td>
				      </tr>
				     </c:forEach>     
				     <c:if test="${fn:length(resultList) == 0}">
				      <tr>
				        <c:choose>
				            <c:when test="${brdMstrVO.bbsAttrbCode == 'BBSA01'}">
				                <td colspan="7" ><spring:message code="common.nodata.msg" /></td>
				            </c:when>
				            <c:otherwise>
				                <c:choose>
				                    <c:when test="${anonymous == 'true'}">
				                        <td colspan="4" ><spring:message code="common.nodata.msg" /></td>
				                    </c:when>
				                    <c:otherwise>
				                        <td colspan="5" ><spring:message code="common.nodata.msg" /></td>
				                    </c:otherwise>
				                </c:choose>     
				            </c:otherwise>
				        </c:choose>       
				          </tr>      
				     </c:if>  
                    </tbody>
                    </table>
                </div>
                <!-- 페이지 네비게이션 시작 -->
                <div id="paging_div">
                    <ul class="paging_align">
                        <ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_egov_select_noticeList" />    
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


	 				<%-- 	<!-- table add start -->
						<div class="default_tablestyle">

							<table class="list-table scope-col">
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
										<th scope="col" class="col-name">프로젝트ID</th>
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
												<td class="col-name">${data.project_id}</td>
												<td class="col-name">
													<a href="detail-data.do?data_id=${data.data_id }">${data.data_name }</a>
												</td>
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
													<a href="modify-data.do?data_id=${data.data_id }&amp;pageNo=${pagination.pageNo }${pagination.searchParameters}">수정&nbsp;</a>
												</td>
												<td class="col-functions" style="text-align: left;">
													<a href="#" onclick="deleteData('${data.data_id}'); return false;">&nbsp;삭제</a>
												</td>
											</tr>
										</c:forEach>
										<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
									</c:if>
								</tbody>
							</table>
						</div>
					</form:form>
                <!-- 페이지 네비게이션 시작 -->
                <div id="paging_div">
                    <ul class="paging_align">
                        <ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_egov_select_noticeList" />    
                    </ul>
                </div>
                <!-- //페이지 네비게이션 끝 --> 
				</div>
			</div>
		</div>
		<!-- footer 시작 -->
        <div id="footer"><c:import url="/EgovPageLink.do?link=main/inc/EgovIncFooter" /></div>
        <!-- //footer 끝 -->
	</div>

 --%>

	<script src="/js/jquery/jquery.js"></script>
	<script src="/js/jquery-ui/jquery-ui.js"></script>
	<script src="/js/jquery/jquery.form.js"></script>
	<script type="text/javascript" src="../../../js/common.js"></script>	
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

	
	
</script>
</body>
</html>