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
	<title>查询讨论回复-在线学习平台ForFuture</title>
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
				<li><a href="javascript:void(0);">在线学生学习平台</a></li>
	            <li><a href="javascript:void(0);">讨论管理</a></li>
	            <li><a href="javascript:void(0);">回复查询</a></li>
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
	                <!-- 角色判断   role不同操作不同-->
	                <c:choose>
						<c:when test="${sessionScope.role==2}">
							 <!--  若为学生则是选进入考试 -->
						</c:when>
						<c:otherwise>
						 	<!--  若为教师有权限管理自己发布的考试    管理员则可以管理所有的考试 -->
							<button id="deleteBtn" @click="deleteBtn()" type="button" class="btn btn-default wk-tool-btn">删除</button>
						</c:otherwise>
					</c:choose>
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
							<c:choose>
								<c:when test="${sessionScope.role==2}">
								</c:when>
								<c:otherwise>
									<th  width="5%">选择</th>
								</c:otherwise>
							</c:choose>
							<th  width="72%">回复内容</th>
							<th  width="8%">回复人</th>
							<th  width="15%">回复时间</th>
						</tr>
					</thead>
					<tbody>
						<input id="discussId" value='${posts[0].discussId}'  type="hidden" />
						<c:forEach items="${posts}" var="var">
						<tr class="showStyle">
							<c:choose>
								<c:when test="${sessionScope.role==2}">	</c:when>
								<c:otherwise>
									<td>
										<input id="grid_${var.id}" name="workerRadio" type="radio" aria-label="选择" />
									</td>
								</c:otherwise>
							</c:choose>
							<td style="text-indent:2em;">${var.content}</td>
							<td>${var.studentName}</td>
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
		//删除评论
	    $("#deleteBtn").on("click", function() {
	        var id = "";
	        var discuss_id = $("#discussId").val();
	        $(":radio").each(function() {
	            if ($(this).is(":checked")) {
	                id = $(this).attr("id").substr(5, $(this).attr("id").length);
	            }
	        });
	        if (id != "") {
	            $("#deleteConfirm").modal();
	            $("#deleteBtnOK").on("click", function() {
	                location.href = "<%=basePath%>deleteDiscussPost/" + id +"/"+discuss_id+ ".html";
	            });
	        }else{
			   alert("请选择您需要 删除的 评论！！");
			}
	    });
	</script>
</body>
</html>