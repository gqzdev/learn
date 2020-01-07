<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title></title>
	<base href="<%=basePath%>">
	<link rel="stylesheet" href="resource/bootstrap/css/bootstrap.min.css" >    
	<link rel="stylesheet" href="resource/bootstrap/css/bootstrap-theme.min.css">
	<script type="text/javascript" src="resource/lib/jquery-3.1.1.js"></script>
	<script type="text/javascript" src="resource/bootstrap/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="resource/css/wukong-ui.css">
	<link rel="stylesheet" href="bootstrap/css/bootstrap-select.min.css">
    <script type="text/javascript" src="bootstrap/js/bootstrap-select.min.js"></script>
</head>

<body>
<div class="row">
    <div class="col-lg-12">
        <ul class="breadcrumb wk-breadcrumb">
            <li><a href="#">大学生学习平台</a></li>
            <li><a href="#">公告信息管理</a></li>
            <li><a href="#">编辑公告</a></li>
        </ul>
    </div>
</div>
    
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default wk-panel ">
                <div class="panel-heading">
                    编辑公告 Create Data
                </div>
                <form action="<%=basePath%>/editNotice/${notice.id}.html" method="POST">
                <div class="panel-body">
                    <div class="row">
                      <div class="form-inline">  
                            <div class="form-group">
                                <label for="filePath" class="control-label wk-filed-label">公告标题: </label>
                                 <div class="input-group">
                                    <input required="required" name="title" type="text" class="form-control wk-long-2col-input" value="${notice.title}" placeholder="请输入公告标题"/>
                                </div>
                            </div>
                        </div>
						<div class="form-inline"> 
							<div class="form-group">
                                <label for="filePath" class="control-label wk-filed-label">公告内容: </label>
                                <div class="input-group">
                                    <input required="required" name="content" type="text" class="form-control wk-long-2col-input" value="${notice.content}" style="height:300px;" placeholder="请输入公告内容"/>
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