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
	<title>进入考试-在线学习平台ForFuture</title>
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
	<style type="text/css">
		.showTask{
			border: solid 1px #1e9fd945;
		    margin: 0px 0px 20px 19px;
		    padding-bottom: 12px;
		}
	</style>
</head>

<body >
	<div class="row">
		<div class="col-lg-12">
			<ul class="breadcrumb wk-breadcrumb">
				<li><a href="javascript:void(0);">在线学习平台</a></li>
				<li><a href="javascript:void(0);">作业查询</a></li>
				<li><a href="javascript:void(0);">开始考试</a></li>
			</ul>
		</div>
	</div>

	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default wk-panel ">
				<div class="panel-heading">开始考试</div>
				<form id="taskForm" action="<%=basePath%>saveStudentTask/${taskId}.html" method="POST">
					<div class="panel-body">
						<div class="row">
						
							<c:forEach items="${questions}" var="var" varStatus="idxStatus">
								<!-- 试题 -->
								<div class="showTask">
									<div class="form-inline">
										<div class="form-group">
											<label class="control-label wk-filed-label" style="font-weight:600;">
												题目${idxStatus.index+1}: ${var.title}
											</label>
										</div>
									</div>
									<div class="form-inline">
										<label class="control-label wk-filed-label">答案：</label>
								 		
								        <div style="font-size:16px;margin-left: 82px;margin-top: -28px;" class="userAnswer" name="${var.id}"> 		
											<input type="radio" required="required" value="A" name="${var.id}"/>
											A:&nbsp;${var.itemA} </br>
											<input type="radio" required="required" value="B" name="${var.id}"/>
											B:&nbsp;${var.itemB} </br>
											<input type="radio" required="required" value="C" name="${var.id}"/>
											C:&nbsp;${var.itemC} </br>
											<input type="radio" required="required" value="D" name="${var.id}"/>
											D:&nbsp;${var.itemD} </br>
										</div>	
										</hr>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>

					<div class="panel-footer wk-panel-footer">
						<button id="submitBtn" type="button" class="btn btn-default wk-btn">完成考试</button>
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
					<h4>【在线学习平台】系统提示</h4>
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
				location.href="<%=basePath%>addStudentScore/${taskId}.html";         
			});
	    });
	     
	   
	   $('.userAnswer').on("click",function(){
	    	var id=$(this).attr("name");//获取当前题号
			var answer=$("input[name="+id+"]:checked").val();//获取用户当前题目所选择的答案
	    	if(answer !=0){
	    		$.ajax({
	    			url:"<%=basePath%>saveStudentTask.html",
	    			data:{
	    				"id":id,
	    				"answer":answer
	    			},
		    		contentType : "application/x-www-form-urlencoded",
					cache : false,
					type : "POST",
					success : function(data) {
					} 
		    	});
	    	}
		}) 
		
		
	   <%--  $('.answer').on("click",function(){
	    	if($(this).val() !=0){
	    		alert($(this).attr("name")+"  ccc"+$(this).val());
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
		    	});
	    	}
		}) --%>
	</script>
	
</body>
</html>