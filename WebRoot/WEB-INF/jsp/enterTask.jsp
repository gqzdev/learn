<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link rel="stylesheet"
	href="resource/bootstrap/css/bootstrap-select.min.css">
<script type="text/javascript"
	src="resource/bootstrap/js/bootstrap-select.min.js"></script>
</head>

<body>
	<div class="row">
		<div class="col-lg-12">
			<ul class="breadcrumb wk-breadcrumb">
				<li><a href="#">大学生学习平台</a></li>
				<li><a href="#">作业管理</a></li>
				<li><a href="#">新增作业</a></li>
			</ul>
		</div>
	</div>

	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default wk-panel ">
				<div class="panel-heading">新增作业 Create Data</div>
				<form id="taskForm" action="<%=basePath%>saveStudentTask/${taskId}.html" method="POST">
					<div class="panel-body">
						<div class="row">
							<c:forEach items="${questions}" var="var">
								<div class="form-inline">
									<div class="form-group">
										<label class="control-label wk-filed-label">题目: ${var.title}
										</label>
									</div>
								</div>
								<div class="form-inline">
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<select class="answer" name="${var.id}">
										<option value="0">请选择</option>
										<option value="A">${var.itemA}</option>
										<option value="B">${var.itemB}</option>
										<option value="C">${var.itemC}</option>
										<option value="D">${var.itemD}</option>
									</select>
								</div>
								<br>
							</c:forEach>
						</div>
					</div>

					<div class="panel-footer wk-panel-footer">
						<button id="submitBtn" type="button" class="btn btn-default wk-btn">提&nbsp;&nbsp;交</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	
	<div class="modal fade" tabindex="-1" role="dialog"
		id="taskConfirm">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header wk-modal-header">
					<button class="close" type="button" data-dismiss="modal">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4>系统提示</h4>
				</div>
				<div class="modal-body">您确定要提交这次作业？</div>
				<div class="modal-footer wk-modal-footer">
					<button id="submitBtnOK" type="submit"
						class="btn btn-default wk-btn" data-dismiss="modal">确定</button>
					<button type="button" class="btn btn-default wk-tool-btn"
						data-dismiss="modal">取消</button>
				</div>
			</div>
		</div>
	</div>

	<script>
	
	

    $("#submitBtn").on("click", function() {
		$("#taskConfirm").modal();
		$("#submitBtnOK").on("click", function() {
			location.href="<%=basePath%>saveTaskScore/${taskId}.html";         
		});
    });
    
    $('.answer').on("click",function(){
    	if($(this).val() !=0){
    		$.ajax({
    			url:"<%=basePath%>saveStudentTask.html",
    			data:{
    				"id":$(this).attr("name"),
    				"answer":$(this).val()
    			},
	    		contentType : "application/x-www-form-urlencoded",
				cache : false,
				type : "POST",
				success : function(data) {
				} 
	    		})
    	}
	})
</script>
	
</body>
</html>