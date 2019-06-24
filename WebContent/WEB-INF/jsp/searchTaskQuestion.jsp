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
	<title>作业信息查询[管理] 在线学习平台ForFuture</title>
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
	<!--教师 查询作业 -->
	<div class="row">
		<div class="col-lg-12">
			<ul class="breadcrumb wk-breadcrumb">
				<li><a href="javascript:void(0);">在线学习平台</a></li>
	            <li><a href="javascript:void(0);">考试管理</a></li>
	            <li><a href="javascript:void(0);">考试查询</a></li>
			</ul>
		</div>
	</div>

	<div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default wk-panel wk-table-tools-panel">
                <div class="panel-heading">
                   	 工具栏 Tools
                </div>
                 <div class="panel-body panel-button">
	                <button id="deleteBtn" type="button" class="btn btn-default wk-tool-btn">删除</button>
                 </div>
            </div>
        </div>
    </div>

	<!-- 教师	查询发布的考试的题目详情 -->
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
						<tr class="showStyle">
							<td>
								<input id="grid_${var.id}" name="workerRadio"
								type="radio" aria-label="选择" title="grid_${var.taskId}" />
							</td>
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
	
	<div class="modal fade" tabindex="-1" role="dialog"
		id="deleteConfirm">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header wk-modal-header">
					<button class="close" type="button" data-dismiss="modal">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="confirmStyle">在线学习平台</h4>
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
	        var taskId = "";
	        $(":radio").each(function() {
	            if ($(this).is(":checked")) {
	                id = $(this).attr("id").substr(5, $(this).attr("id").length);
	                taskId = $(this).attr("title").substr(5, $(this).attr("title").length);
	            }
	        });
	
	        if (id != "") {
	       /*      console.log(id+" "+ taskId); */
	            $("#deleteConfirm").modal();
	            $("#deleteBtnOK").on("click", function() {
	            	/* deleteQuestion/{id}/{taskId} */
	                location.href = "<%=basePath%> deleteQuestion/"+ id+"/"+ taskId + ".html";
	            });
	            
	        }else{
	        	alert("请选择您需要删除的 题目！！");
	        }
	        
	    });
	</script>

</body>
</html>