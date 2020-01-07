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
	            <li><a href="#">课程文件管理</a></li>
	            <li><a href="#">课程文档信息查询</a></li>
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
							action="<%=basePath%>searchCourseFileInfoByTerm.html" method="post">
						<!-- 
						<div class="form-group">
							<input type="text" class="form-control" v-model="searchContent" placeholder="课程名称">
						</div> 
						-->
						<div class="form-group">
							<label for="filePath" class="control-label wk-filed-label">所属课程:</label> 
							<select class="selectpicker"  name="courseId">
								<option value="0">请选择所属课程</option>
								<c:forEach items="${courses}" var="course">
									<option value="${course.id}">${course.name}</option>
								</c:forEach>
							</select>
						</div>
						
						<div class="form-group">
							<label for="filePath" class="control-label wk-filed-label">发布教师:</label> 
							<select class="selectpicker"  name="teacherId" >
								<option value="0">请选择发布教师</option>
					 			<c:forEach items="${teachers}" var="teacher">
					 				<option value="${teacher.id}">${teacher.name }</option>
					 			</c:forEach>
							</select>
						</div>
						<button type="submit"  class="btn btn-default wk-tool-btn" >查询</button>
					</form>
					<div>
						<button id="downBtn" type="button" class="btn btn-default wk-tool-btn" style="position: absolute;top: 10px;right: -320px;">下载文件</button>
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
							<th>文件名</th>
							<th>所属课程</th>
							<th>发布教师</th>
							<th>上传时间</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${files}" var="var">
						<tr>
							<td><input id="grid_${var.id}" name="workerRadio"
								type="radio" aria-label="选择" /></td>
							<td>${var.path}</td>
							<td>${var.courseName}</td>
							<td>${var.teacherName}</td>
							<td><fmt:formatDate value="${var.recordTime}" pattern="yyyy-MM-dd  HH:mm:ss" /></td>
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

    $("#downBtn").on("click", function() {
        var id = "";
        $(":radio").each(function() {
            if ($(this).is(":checked")) {
                id = $(this).attr("id").substr(5, $(this).attr("id").length);
            } 
        });

        if (id != "") {
               location.href = "<%=basePath%>downFile/" + id + ".html";
        }
    });
     
</script>
</body>
</html>