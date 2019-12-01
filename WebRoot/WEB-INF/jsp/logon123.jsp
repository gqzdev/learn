<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>在线学习平台</title>
<script type="text/javascript" src="resource/lib/jquery-3.1.1.js"></script>
<link rel="stylesheet" href="resource/css/wukong-ui.css" />
</head>

<body class="logonBody">
	<form action="<%=basePath%>userLogon.html" method="POST">
		<div class="logon">
	    	<ul>
	        	<li><input type="text" name="account" placeholder="请输入账户名"/></li>
	            <li><input type="password" name="password" placeholder="请输入登录密码"/></li>
	             <li>
	             	<select name="role">
	             		<option value="2">学生</option>
	             		<option value="1">教师</option>
	             		<option value="0">管理员</option>
	             	</select>
	             </li>
	        </ul>	
	        <div class="logonTip">
	        	* ${info}
	        	<a href="register.html" style="float:right;">注册</a>
	        </div>
	        <input type="submit" class="logonSubmitBtn" value="登录"/>
	    </div>
	</form>
		
</body>
</html>
