<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	            <li><a href="#">学生信息管理</a></li>
	            <li><a href="#">学生信息查询</a></li>
			</ul>
		</div>
	</div>

	<div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default wk-panel wk-table-tools-panel">
                <div class="panel-heading">
                    	工具栏 Tools
                </div>
                <!-- 搜索 start -->
				 <div style="position: absolute;top: -11px;left: 240px;">
					<form class="navbar-form navbar-right" role="search" 
							action="<%=basePath%>searchStudentByTerm.html" method="post">
						<div class="form-group">
							<input type="text" class="form-control" name="searchContent" placeholder="学生学号">
						</div> 
						<div class="form-group">
							<label for="filePath" class="control-label wk-filed-label">所属学院:</label> 
							<select class="selectpicker"  name="collegeId">
								<option value="0">请选择所属学院</option>
								<c:forEach items="${colleges}" var="college">
									<option value="${college.id}">${college.name}</option>
								</c:forEach>
							</select>
						</div>
						<button type="submit"  class="btn btn-default wk-tool-btn" >查询</button>
					</form>
					<div>
						<button id="deleteBtn" type="button" class="btn btn-default wk-tool-btn" style="position: absolute;top: 10px;right: -320px;">删除</button>
		                <button id="updateBtn" type="button" class="btn btn-default wk-tool-btn" style="position: absolute;top: 10px;right: -400px;">编辑</button>
					</div>
				 </div>
				 <!-- 搜索 end -->
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
							<th>学生姓名</th>
							<th>学生学号</th>
							<th>所属学院</th>
							<th>联系电话</th>
							<th>身份证号</th>
							<th>性别</th>
							<th>登录账户</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${students}" var="var">
						<tr>
							<td><input id="grid_${var.id}" name="workerRadio" type="radio" aria-label="选择" /></td>
							<td>${var.name}</td>
							<td>${var.num}</td>
							<td>${var.collegeName}</td>
							<td>${var.telphone}</td>
							<td>${var.idCardNo}</td>
							<td>${var.genderName}</td>
							<td>${var.account}</td>
						</tr>
						</c:forEach>
					</tbody>
					
				</table>
			</div>
		</div>
	</div>

	<div class="modal fade" tabindex="-1" role="dialog"
		id="deleteConfirm">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header wk-modal-header">
					<button class="close" type="button" data-dismiss="modal">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4>系统提示</h4>
				</div>
				<div class="modal-body">您确定要删除这些记录？</div>
				<div class="modal-footer wk-modal-footer">
					<button id="deleteBtnOK" type="submit"
						class="btn btn-default wk-btn" data-dismiss="modal">确定</button>
					<button type="button" class="btn btn-default wk-tool-btn"
						data-dismiss="modal">取消</button>
				</div>
			</div>
		</div>
	</div>

	<script>

    $("#deleteBtn").on("click", function() {
        var id = "";
        $(":radio").each(function() {
            if ($(this).is(":checked")) {
                id = $(this).attr("id").substr(5, $(this).attr("id").length);
            }
        });

        if (id != "") {
            $("#deleteConfirm").modal();
            $("#deleteBtnOK").on("click", function() {
                location.href = "<%=basePath%>deleteStudent/" + id + ".html";
            });
        }
    });

    

     $("#updateBtn").on("click", function() {
        var id = "";
        $(":radio").each(function() {
            if ($(this).is(":checked")) {
                id = $(this).attr("id").substr(5, $(this).attr("id").length);
            }
        });         

        if (id != "") {
			location.href = "<%=basePath%>updateStudent/" + id + ".html";
        }
    });

     
</script>
</body>
</html>