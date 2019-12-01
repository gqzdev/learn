<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    <div class="register">
    <div class="top">注册</div>
	<form action="<%=basePath%>addStudent.html" method="POST">
		<div class="panel-body">
			<div class="row">
				<div class="form-inline">
					<div class="form-group reg">
						<div class="input-group">
							学生姓名:<input required="required" name="name" type="text" style="height:25px;"
								class="form-control wk-normal-input" placeholder="请输入学生姓名" />
						</div>
					</div>

					<div class="form-group reg">
						<div class="input-group">
							学生学号:<input required="required" name="num" type="text" style="height:25px;"
								class="form-control wk-normal-input" placeholder="请输入学生学号" />
						</div>
					</div>
					<div class="form-group reg">
						所属学院:<select class="selectpicker" name="collegeId" style="height:25px;">
							<c:forEach items="${colleges}" var="var">
								<option value="${var.id}">${var.name}</option>
							</c:forEach>
						</select>
					</div>
				</div>

				<div class="form-inline">
					<div class="form-group reg">
						<div class="input-group">
							联系电话:<input required="required" name="telphone" type="tel" style="height:25px;"
								class="form-control wk-normal-input" placeholder="请输入联系电话" />
						</div>
					</div>
					<div class="form-group reg" >
						<div class="input-group">
							身份证号:<input required="required" name="idCardNo" type="text" style="height:25px;"
								class="form-control wk-normal-input" placeholder="请输入身份证号" />
						</div>
					</div>
					<div class="form-group reg">
						学生性别: <select style="height:25px;"
							class="selectpicker" name="gender">
							<option value="0">男</option>
							<option value="1">女</option>
						</select>
					</div>
				</div>
				<div class="form-inline">
					<div class="form-group reg">
						<div class="input-group">
							登录账户:<input required="required" name="account" type="text" style="height:25px;"
								class="form-control wk-normal-input" placeholder="请输入登录账户" />
						</div>
					</div>
					<div class="form-group reg">
						<div class="input-group">
							登录密码: <input required="required" name="password" type="password" style="height:25px;"
								class="form-control wk-normal-input" placeholder="请输入登录密码" />
						</div>
					</div>
				</div>


			</div>
		</div>

		<div class="panel-footer wk-panel-footer">
			<button type="submit" class="btn btn-default wk-btn" style="height:25px;font-size:18px;">注册</button>
		</div>
	</form>
	</div>
</body>
</html>
