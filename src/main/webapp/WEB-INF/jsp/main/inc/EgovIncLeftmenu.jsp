<%--
  Class Name : EgovIncLeftmenu.jsp
  Description :  좌메뉴 화면(include)
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2011.08.31   JJY       경량환경 버전 생성
 
    author   : 실행환경개발팀 JJY
    since    : 2011.08.31 
--%><%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "java.util.HashMap" %>
<%
String menuNo = ((String)session.getAttribute("menuNo")!=null)?(String)session.getAttribute("menuNo"):"11";
%>

<div id="nav">	
	<div class="top"></div>             
	<div class="nav_style">
	<ul>
	    <% if (menuNo.indexOf("1")== 0) {%>
		<li class="leftmenu_dept01">
			<a href="javascript:fn_main_headPageMove('11','main/sample_menu/EgovAboutSite')">사이트소개</a>
			<ul>
				<li class="dept02"><a href="javascript:fn_main_headPageMove('11','main/sample_menu/EgovAboutSite')">소개</a></li>	
				<li class="dept02"><a href="javascript:fn_main_headPageMove('12','main/sample_menu/EgovHistory')">연혁</a></li>
				<li class="dept02"><a href="javascript:fn_main_headPageMove('13','main/sample_menu/EgovOrganization')">조직소개</a></li>
				<li class="dept02"><a href="javascript:fn_main_headPageMove('14','main/sample_menu/EgovLocation')">찾아오시는 길</a></li>
			</ul> 
		</li>
		<% } %>
		<% if (menuNo.indexOf("2")== 0) {%>
		<li class="leftmenu_dept01">
			<a href="javascript:fn_main_headPageMove('21','main/sample_menu/EgovProductInfo')">정보마당</a>
			<ul>	
				<li class="dept02"><a href="javascript:fn_main_headPageMove('21','main/sample_menu/EgovProductInfo')">주요사업 소개</a></li>
				<li class="dept02"><a href="javascript:fn_main_headPageMove('22','main/sample_menu/EgovServiceInfo')">대표서비스 소개</a></li>
			</ul> 
		</li>
		<% } %>
        <% if (menuNo.indexOf("3")== 0) {%>
		<li class="leftmenu_dept01">
			<a href="javascript:fn_main_headPageMove('31','main/sample_menu/EgovDownload')">고객지원</a>
			<ul>
				<li class="dept02"><a href="javascript:fn_main_headPageMove('31','main/sample_menu/EgovDownload')">자료실</a></li>
				<li class="dept02"><a href="javascript:fn_main_headPageMove('32','main/sample_menu/EgovQA')">묻고답하기</a></li>
				<li class="dept02"><a href="javascript:fn_main_headPageMove('33','main/sample_menu/EgovService')">서비스신청</a></li>
			</ul>
		</li>
		<% } %>
        <% if (menuNo.indexOf("4")== 0) {%>
		<li class="leftmenu_dept01">
			<a href="javascript:fn_main_headPageAction('41','cop/smt/sim/EgovIndvdlSchdulManageDailyList.do')">알림마당</a>
			<ul>
			    <li class="dept02"><a href="javascript:fn_main_headPageAction('41','cop/smt/sim/EgovIndvdlSchdulManageDailyList.do')">오늘의 행사</a></li>	
				<li class="dept02"><a href="javascript:fn_main_headPageAction('42','cop/smt/sim/EgovIndvdlSchdulManageWeekList.do')">금주의 행사</a></li>
				<li class="dept02"><a href="javascript:fn_main_headPageAction('43','cop/bbs/selectBoardList.do?bbsId=BBSMSTR_AAAAAAAAAAAA')">공지사항</a></li>
				<li class="dept02"><a href="javascript:fn_main_headPageAction('44','cop/bbs/selectBoardList.do?bbsId=BBSMSTR_BBBBBBBBBBBB')">사이트갤러리</a></li>
			</ul> 
		</li>
		<% } %>
        <% if (menuNo.indexOf("5")== 0) {%>
		<li class="leftmenu_dept01">
			<a href="javascript:fn_main_headPageAction('51','mago3d/project/list-project.do')">운영설정</a>
			<ul>	
				<li class="dept02"><a href="javascript:fn_main_headPageAction('51','mago3d/project/list-project.do')">프로젝트 목록</a></li>
				<li class="dept02"><a href="javascript:fn_main_headPageAction('52','mago3d/project/input-project.do')">프로젝트 등록</a></li>
				<li class="dept02"><a href="javascript:fn_main_headPageAction('53','mago3d/data/list-data.do')">데이터 목록</a></li>
				<li class="dept02"><a href="javascript:fn_main_headPageAction('54','mago3d/data/input-data.do')">데이터 등록</a></li>
			</ul> 
		</li>
		<% } %>
        <% if (menuNo.indexOf("6")== 0) {%>
		<li class="leftmenu_dept01">
			<a href="javascript:fn_main_headPageAction('61','mago3d/demo.do')">DEMO</a>
			<ul>	
				<li class="dept02"><a href="http://www.mago3d.com/homepage/about.do" target="_blank">Mago3D</a></li>
				<li class="dept02"><a href="http://mago3d.com/homepage/api.do" target="_blank">API</a></li>	
			</ul> 
		</li>
		<% } %>
	</ul>
	</div>
	<div class="bottom"></div>		
</div>
<!-- //메뉴 끝 -->	
