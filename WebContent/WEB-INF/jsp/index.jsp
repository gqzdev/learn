<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>

<!DOCTYPE html>
<html>
<head>
	<title>管理员 在线学习平台ForFuture</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="ForFuture Group、ForFuturn News,ForFuture Share,ForFuture Shopping" />
	<meta name="keywords" content="在线学习平台，知识共享!共祝教育事业！  ganquanzhong" />
	<meta name="author" content="ganquanzhong.top" />
	<link rel="shortcut icon"	href="https://8.url.cn/edu/edu_modules/edu-ui/img/nohash/favicon.ico">

	
	<base href="<%=basePath%>">

    <!--  导入css  js  -->
	<link rel="stylesheet" href="resource/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet"	href="resource/bootstrap/css/bootstrap-theme.min.css">
	<link rel="stylesheet" href="resource/css/wukong-ui.css">
	<link rel="stylesheet" href="resource/bootstrap/css/bootstrap-select.min.css">
	<script type="text/javascript" src="resource/lib/jquery-3.1.1.js"></script>
	<script type="text/javascript"	src="resource/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" 	src="resource//bootstrap/js/bootstrap-select.min.js"></script>
</head>

<body>
	<!--S  系统banner -->
	<div class="row">
		<div class="col-lg-12 top" >
			<div id="banner" class="logo">
					在线学习平台
			</div>
			<a href="http://ganquanzhong.top" target="_blank">
				<div class="logo" style="color:white;font-family: monospace;">
					Design By GQZ
				</div>
			</a>
			<div class="userinfo">
		    	管理员:<a class="myInfo" style="font-weight:800;font-family: cursive;">${sessionScope.user.name}</a> 
		    </div> 
		</div>
	</div>
    <!--E  系统banner -->
    
    <!-- 横向导航 start -->
	<div class="row">
		<div class="col-lg-12">
			<ul class="nav nav-tabs wk-nav-menu" id="wk-nav-menu">
				<li role="presentation"><a id="leftNav">[管理员模块]</a></li>
				<li role="presentation"><a href="javascript:void(0);" id="wk-menu-panel-item-createStudent" class="wk-main-menu-item">新增学生</a></li>
				<li role="presentation"><a href="javascript:void(0);" id="wk-menu-panel-item-searchStudent" class="wk-main-menu-item">学生管理</a></li>
				<li role="presentation"><a href="javascript:void(0);" id="wk-menu-panel-item-createTeacher" class="wk-main-menu-item">新增教师</a></li>
				<li role="presentation"><a href="javascript:void(0);" id="wk-menu-panel-item-searchTeacher" class="wk-main-menu-item">教师管理</a></li>
				<li role="presentation"><a href="javascript:void(0);" id="wk-menu-panel-item-createCollege" class="wk-main-menu-item">新增学院</a></li>
				<li role="presentation"><a href="javascript:void(0);" id="wk-menu-panel-item-searchCollege" class="wk-main-menu-item">学院管理</a></li>
				<li role="presentation"><a href="javascript:void(0);" id="wk-menu-panel-item-createCourse" class="wk-main-menu-item">新增课程</a></li>
				<li role="presentation"><a href="javascript:void(0);" id="wk-menu-panel-item-searchCourse" class="wk-main-menu-item">课程管理</a></li>
				<li role="presentation"><a href="javascript:void(0);" class="wk-main-menu-item" id="wk-menu-panel-item-searchTask">考试管理</a></li>
				<li role="presentation"><a href="javascript:void(0);" class="wk-main-menu-item" id="wk-menu-panel-item-searchDiscussInfo">话题管理</a></li>
				<li role="presentation"><a href="javascript:void(0);" class="wk-main-menu-item" id="wk-menu-panel-item-createNotice">发布公告</a></li>
				<li role="presentation" style="float:right;"><a href="javascript:void(0);" class="wk-main-menu-item" id="wk-menu-panel-item-exit">注销登录</a></li>
			</ul>
		</div>
	</div>
	 <!-- 横向导航 end -->
	
	<div class="row">
		<!-- 纵向导航 start -->
		<div class="col-lg-2" id="wk-menu-panel" style="width: 15%;">
			<div class="row">
				<div class="col-lg-12">
					<div class="panel-group wk-accordion-panel-group" id="accordion">
						<div class="panel panel-info wk-accordion-header">
							<div class="panel-heading">
								<a data-toggle="collapse" href="#AMenu" data-parent="#accordion">学生信息管理</a>
							</div>

							<div id="AMenu" class="panel-collapse collapse">
								<div class="list-group wk-accordion-list-group">
									<button type="button" class="list-group-item"
										id="wk-menu-panel-item-createStudent">
										>&nbsp;&nbsp;新增学生</button>
									<button type="button" class="list-group-item"
										id="wk-menu-panel-item-createManyStudent">
										>&nbsp;&nbsp;批量新增学生</button>
									<button type="button" class="list-group-item"
										id="wk-menu-panel-item-searchStudent">
										>&nbsp;&nbsp;学生信息查询</button>
								</div>
							</div>

						</div>

						<div class="panel panel-info wk-accordion-header">
							<div class="panel-heading">
								<a data-toggle="collapse" href="#BMenu" data-parent="#accordion">教师信息管理</a>
							</div>
							<div id="BMenu" class="panel-collapse collapse">
								<div class="list-group wk-accordion-list-group">
									<button type="button" class="list-group-item"
										id="wk-menu-panel-item-createTeacher">
										>&nbsp;&nbsp;新增教师</button>
									<button type="button" class="list-group-item"
										id="wk-menu-panel-item-createManyTeacher">
										>&nbsp;&nbsp;批量新增教师</button>
									<button type="button" class="list-group-item"
										id="wk-menu-panel-item-searchTeacher">
										>&nbsp;&nbsp;教师信息查询</button>
								</div>
							</div>
						</div>

						<div class="panel panel-info wk-accordion-header">
							<div class="panel-heading">
								<a data-toggle="collapse" href="#CMenu" data-parent="#accordion">学院管理</a>
							</div>

							<div id="CMenu" class="panel-collapse collapse">
								<div class="list-group wk-accordion-list-group">
									<button type="button" class="list-group-item"
										id="wk-menu-panel-item-createCollege">
										>&nbsp;&nbsp;新增学院</button>
									<button type="button" class="list-group-item"
										id="wk-menu-panel-item-searchCollege">
										>&nbsp;&nbsp;学院信息查询</button>
								</div>
							</div>

						</div>

						<div class="panel panel-info wk-accordion-header">
							<div class="panel-heading">
								<a data-toggle="collapse" href="#DMenu" data-parent="#accordion">课程管理</a>
							</div>
							<div id="DMenu" class="panel-collapse collapse">
								<div class="list-group wk-accordion-list-group">
									<button type="button" class="list-group-item" id="wk-menu-panel-item-createCourse">
										>&nbsp;&nbsp;新增课程</button>
									<button type="button" class="list-group-item" id="wk-menu-panel-item-searchCourse">
										>&nbsp;&nbsp;课程信息查询</button>
								</div>
							</div>
						</div>
						
						<div class="panel panel-info wk-accordion-header">
							<div class="panel-heading">
								<a data-toggle="collapse" href="#EMenu" data-parent="#accordion">课件管理</a>
							</div>
							<div id="EMenu" class="panel-collapse collapse">
								<div class="list-group wk-accordion-list-group">
									<button type="button" class="list-group-item" id="wk-menu-panel-item-adminSearchCourseFile">
										>&nbsp;&nbsp;文档管理</button>
									<button type="button" class="list-group-item" id="wk-menu-panel-item-adminSearchCourseVideo">
										>&nbsp;&nbsp;视频管理</button>
								</div>
							</div>
						</div>

						<div class="panel panel-info wk-accordion-header">
							<div class="panel-heading">
								<a data-toggle="collapse" href="#FMenu" data-parent="#accordion">论坛管理</a>
							</div>
							<div id="FMenu" class="panel-collapse collapse">
								<div class="list-group wk-accordion-list-group">
									<button type="button" class="list-group-item" id="wk-menu-panel-item-searchDiscussInfo">
										>&nbsp;&nbsp;话题讨论</button>
								</div>
							</div>
						</div>
						
						<div class="panel panel-info wk-accordion-header">
							<div class="panel-heading">
								<a data-toggle="collapse" href="#GMenu" data-parent="#accordion">考试管理</a>
							</div>
							<div id="GMenu" class="panel-collapse collapse">
								<div class="list-group wk-accordion-list-group">
									<button type="button" class="list-group-item" id="wk-menu-panel-item-searchTask">
										>&nbsp;&nbsp;考试查询</button>
								</div>
							</div>
						</div>

						<div class="panel panel-info wk-accordion-header">
							<div class="panel-heading">
								<a data-toggle="collapse" href="#HMenu" data-parent="#accordion">公告管理</a>
							</div>
							<div id="HMenu" class="panel-collapse collapse">
								<div class="list-group wk-accordion-list-group">
									<button type="button" class="list-group-item" id="wk-menu-panel-item-createNotice">
										>&nbsp;&nbsp;新增公告
									</button>
									<button type="button" class="list-group-item" id="wk-menu-panel-item-searchNotice">
										>&nbsp;&nbsp;公告信息查询
									</button>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
		<!-- 纵向导航 end -->
		
		<!-- 加载中间frame -->
		<div  id="rightTable" class="col-lg-10" style="padding:0px; width: 84%;">
			<iframe id="mainFrame" src="<%=basePath%>/searchNotice.html" width="100%" frameborder="0"	onload="changeFrameHeight()"> </iframe>
		</div>
	</div>
	

	<div class="modal fade" tabindex="-1" role="dialog" id="exitConfirm">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header wk-modal-header">
					<button class="close" type="button" data-dismiss="modal">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="confirmStyle">在线学习平台</h4>
					<h4>系统提示</h4>
				</div>
				<div class="modal-body">【注意】:您确定要退出系统！！</div>
				<div class="modal-footer wk-modal-footer">
					<button id="exitOK" type="submit"
						class="btn btn-default wk-btn" data-dismiss="modal">确定</button>
					<button type="button" class="btn btn-default wk-tool-btn"
						data-dismiss="modal">取消</button>
				</div>
			</div>
		</div>
	</div>

	<!-- footer start  Copyright &copy; 2019-2022  -->
	
	<!-- footer end -->
	
	
	<script>
		$(document).ready(function(){
		  var flag=true;
		  $("#leftNav").click(function(){
		    $("#wk-menu-panel").slideToggle();
		    if(flag){
		    	$("#rightTable").css("width", "100%");
		    	$("#rightTable").css("margin-left", "6px");
		    	flag=false;
		    }else{
		  		$("#rightTable").css("width", "84%");
		  		$("#rightTable").css("margin-left", "0px");
		  		flag=true;
		    }		    
		  });
		});
			
        function changeFrameHeight() {
            var ifm= document.getElementById("mainFrame"); 
            ifm.height = document.documentElement.clientHeight - $("#wk-nav-menu").height() - $("#banner").height() - 9;
        }
        window.onresize=function(){  
             changeFrameHeight();  
        } 
        
        changeMenuPanelHeight();
        function changeMenuPanelHeight() {
            var panel= $("#wk-menu-panel"); 
            panel.height(document.documentElement.clientHeight - $("#wk-nav-menu").height() - $("#banner").height() - 3);
            
        }
        window.onresize=function(){  
             changeMenuPanelHeight();  
        } 
        
        
        $(".list-group-item").each(function() {
            $(this).on("click", function() {
                var url = "";
                var id = $(this).attr("id").substr(19, $(this).attr("id").length);
                $("#mainFrame").attr("src",  "<%=basePath%>" + id + ".html"); 
            });
        });
 
        $(".wk-main-menu-item").each(function() {
            $(this).on("click", function() {
                var url = "";
                var id = $(this).attr("id").substr(19, $(this).attr("id").length);
                if(id=="exit"){
                	//exit
                	$("#exitConfirm").modal();
                    $("#exitOK").on("click", function() {
                        location.href = "<%=basePath%>logout.html";
                    });
                }else{
	                url="<%=basePath%>" + id + ".html";
	                $("#mainFrame").attr("src",  url);  
                }
			});
		});
		
	</script>

</body>
</html>