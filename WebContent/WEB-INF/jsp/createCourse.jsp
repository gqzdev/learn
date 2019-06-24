<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<title>添加课程 在线学习平台ForFuture</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description" content="ForFuture Group、ForFuturn News,ForFuture Share,ForFuture Shopping" />
		<meta name="keywords" content="在线学习平台，知识共享!共祝教育事业！  ganquanzhong" />
		<meta name="author" content="ganquanzhong.top" />
		<link rel="shortcut icon"	href="https://8.url.cn/edu/edu_modules/edu-ui/img/nohash/favicon.ico">
		
		<base href="<%=basePath%>">
		<link rel="stylesheet" href="resource/bootstrap/css/bootstrap.min.css" >    
		<link rel="stylesheet" href="resource/bootstrap/css/bootstrap-theme.min.css">
		<link rel="stylesheet" href="resource/css/wukong-ui.css">
		<link rel="stylesheet" href="resource/bootstrap/css/bootstrap-select.min.css">
		<script type="text/javascript" src="resource/lib/jquery-3.1.1.js"></script>
		<script type="text/javascript" src="resource/bootstrap/js/bootstrap.min.js"></script>
	    <script type="text/javascript" src="resource/bootstrap/js/bootstrap-select.min.js"></script>
	</head>

<body>
	<div class="row">
		<div class="col-lg-12">
			<ul class="breadcrumb wk-breadcrumb">
				<li><a href="javascript:void(0);">在线学习平台</a></li>
				<li><a href="javascript:void(0);">课程信息管理</a></li>
				<li><a href="javascript:void(0);">新增课程</a></li>
			</ul>
		</div>
	</div>

	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default wk-panel ">
				<div class="panel-heading">新增课程 Create Course</div>
				<form action="<%=basePath%>saveCourse.html" method="POST">
					<div class="panel-body">
						<div class="row">
							<div class="form-inline">
								<div class="form-group">
									<label for="filePath" class="control-label wk-filed-label">课程名称:
									</label>
									<div class="input-group">
										<input required="required" name="name" type="text"  required="required"
											class="form-control wk-normal-input" placeholder="请输入课程名称" />
									</div>
								</div>

								<div class="form-group">
									<label for="filePath" class="control-label wk-filed-label">
										课程编号:
									</label>
									<div class="input-group">
										<input required="required" name="num" type="text"  required="required"
											class="form-control wk-normal-input"  placeholder="请输入课程编号" />
									</div>
								</div>
								<div class="form-group">
									<label for="filePath" class="control-label wk-filed-label">
										所属学院:
									</label> 
									<select class="selectpicker" name="collegeId">
										<c:forEach items="${colleges}" var="var">
											<option value="${var.id}">${var.name}</option>
										</c:forEach>
									</select>
								</div>
							</div>

							<div class="form-inline">
								<div class="form-group">
									<label for="filePath" class="control-label wk-filed-label">
										课程介绍:
									</label>
									<div class="input-group">
										<input required="required" name="intro" type="text"  required="required"
											class="form-control wk-long-2col-input" placeholder="请输入课程介绍" />
									</div>
								</div>
							</div>

						</div>
					</div>

					<div class="panel-footer wk-panel-footer">
						<button type="submit" class="btn btn-default wk-btn">提&nbsp;&nbsp;交</button>
					</div>
				</form>
			</div>
		</div>
	</div>

</body>
</html>