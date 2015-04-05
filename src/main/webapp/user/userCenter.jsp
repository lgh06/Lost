<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %> 
<%
//未登录禁止查看此页
if(session.getAttribute("curruser")==null){
	response.sendRedirect("../login.html");
}
%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=no">
		<title>天津师范大学 失物招领平台</title>
		<link rel="stylesheet/less" type="text/css" href="${contextPath}/css/index.less" charset="utf-8" />
		<link rel="stylesheet" href="${contextPath}/otherres/font-awesome-4.3.0/css/font-awesome.min.css">
		<script src="${contextPath}/js/jquery-1.10.2.js" type="text/javascript" charset="utf-8"></script>
		<script src="${contextPath}/js/less.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="${contextPath}/js/tjnulost_init.jsp" type="text/javascript" charset="utf-8"></script>
	</head>

	<body>
		<div class="container">
			<div class="header">
				<div class="headerwrap"> <a href="${contextPath}/index.jsp"> <img class="logo" src="${contextPath}/img/logo.gif"> </a> 
					<div class="title"> <p>失物招领平台</p> </div> 
					<div class="navbtn"> <i id="navbtn" class="fa fa-list fa-3x"></i> </div> 
				</div>
			</div>
			<div class="leftnav">导航区域
				<ul>
					<li><a href="${contextPath}/pubFound.jsp">发布找到的</a></li>
					<li><a href="${contextPath}/pubLost.jsp">发布丢失的</a></li>
					<li><a href="${contextPath}/info/showInfoListByUser.jsp?uid=${sessionScope.curruser.id}&status=-2">自己发布的找到信息</a></li>
					<li><a href="${contextPath}/info/showInfoListByUser.jsp?uid=${sessionScope.curruser.id}&status=2">自己发布的丢失信息</a></li>
					<li><a href="${contextPath}/user/personalInfo">个人信息修改</a></li>
					<li><a href="${contextPath}/user/logout">退出</a></li>
					<li><a href="${contextPath}/admin.html">管理员登陆</a></li>

				</ul>



			</div>
			<div class="main">
				欢迎登陆个人中心！
			</div>
			<div class="footer">&copy;过客小站 版权所有</div>
		</div>
	</body>

</html>