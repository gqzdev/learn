<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title></title>
<base href="<%=basePath%>">
<link rel="stylesheet" href="resource/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="resource/bootstrap/css/bootstrap-theme.min.css">
<script type="text/javascript" src="resource/lib/jquery-3.1.1.js"></script>
<script type="text/javascript"
	src="resource/bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="resource/css/wukong-ui.css">
<link rel="stylesheet" href="bootstrap/css/bootstrap-select.min.css">
<script type="text/javascript"
	src="bootstrap/js/bootstrap-select.min.js"></script>
</head>

<body>
	<div class="row">
		<div class="col-lg-12">
			<ul class="breadcrumb wk-breadcrumb">
				<li><a href="#">大学生学习平台</a></li>
	            <li><a href="#">作业理</a></li>
	            <li><a href="#">作业查询</a></li>
			</ul>
		</div>
	</div>

	<div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default wk-panel wk-table-tools-panel">
                <div class="panel-heading">
                    工具栏 Tools
                </div>
                <div class="panel-body">
	                <button id="deleteBtn" type="button" class="btn btn-default wk-tool-btn">删除</button>
                 </div>
            </div>
        </div>
    </div>

	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default  wk-panel">
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th>选择</th>
							<th>题目</th>
							<th>选项A</th>
							<th>选项B</th>
							<th>选项C</th>
							<th>选项D</th>
							<th>答案</th>
							<th>分值</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${questions}" var="var">
						<tr>
							<td><input id="grid_${var.id}" name="workerRadio"
								type="radio" aria-label="选择" /></td>
							<td>${var.title}</td>
							<td>${var.itemA}</td>
							<td>${var.itemB}</td>
							<td>${var.itemC}</td>
							<td>${var.itemD}</td>
							<td>${var.answer}</td>
							<td>${var.score}</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>

</body>
</html>