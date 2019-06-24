<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
	<title>学生 在线学习平台ForFuture</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="ForFuture Group、ForFuturn News,ForFuture Share,ForFuture Shopping" />
	<meta name="keywords" content="在线学习平台，知识共享!共祝教育事业！  ganquanzhong" />
	<meta name="author" content="ganquanzhong.top" />
	<link rel="shortcut icon"	href="https://8.url.cn/edu/edu_modules/edu-ui/img/nohash/favicon.ico">
	
	
	<base href="<%=basePath%>">
	<link rel="stylesheet" href="resource/bootstrap/css/bootstrap.min.css" >    
	<link rel="stylesheet" href="resource/bootstrap/css/bootstrap-theme.min.css">
	<script type="text/javascript" src="resource/lib/jquery-3.1.1.js"></script>
	<script type="text/javascript" src="resource/bootstrap/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="resource/css/wukong-ui.css">
	<link rel="stylesheet" href="resource/bootstrap/css/bootstrap-select.min.css">
    <script type="text/javascript" src="resource/bootstrap/js/bootstrap-select.min.js"></script>
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
		    	学生:<a class="myInfo" style="font-weight:800;font-family: cursive;">${sessionScope.user.name}</a> 
		    </div> 
		</div>
	</div>
    <!--E  系统banner -->

	<!-- 横向导航 start-->
    <div class="row">
        <div class="col-lg-12">
            <ul class="nav nav-tabs wk-nav-menu" id="wk-nav-menu">
            	<li role="presentation"><a id="leftNav">[学生模块]</a></li>
                <li role="presentation"><a href="javascript:void(0);" class="wk-main-menu-item" id="wk-menu-panel-item-searchCourse" >课程信息查询</a></li>
                <li role="presentation"><a href="javascript:void(0);" class="wk-main-menu-item" id="wk-menu-panel-item-adminSearchCourseVideo" >在线课程视频</a></li>
                <li role="presentation"><a href="javascript:void(0);" class="wk-main-menu-item" id="wk-menu-panel-item-adminSearchCourseFile" >课程文件下载</a></li>
                <li role="presentation"><a href="javascript:void(0);" class="wk-main-menu-item" id="wk-menu-panel-item-searchDiscuss" >话题讨论</a></li>
                <li role="presentation"><a href="javascript:void(0);" class="wk-main-menu-item" id="wk-menu-panel-item-searchTask" >开始考试</a></li>
                <li role="presentation"><a href="javascript:void(0);" class="wk-main-menu-item" id="wk-menu-panel-item-searchStudentTaskInfo" >查询已完成作业</a></li>
                <li role="presentation"><a href="javascript:void(0);" class="wk-main-menu-item" id="wk-menu-panel-item-searchNotice" >查看公告</a></li>
            	<li role="presentation" style="float:right;"><a href="javascript:void(0);" class="wk-main-menu-item" id="wk-menu-panel-item-exit">注销登录</a></li>
            </ul>
        </div>
    </div>
    <!-- 横向导航 end-->
    
    	
    <div class="row">
    	<!-- 右侧导航 MenuPanel  start-->
        <div class="col-lg-2" id="wk-menu-panel" style="width: 16%;">
            
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel-group wk-accordion-panel-group" id="accordion">
                        
                        <div class="panel panel-info wk-accordion-header">
                            <div class="panel-heading"> 
                                <a data-toggle="collapse" href="#BMenu" data-parent="#accordion">课程查询</a>
                            </div>
                             <div id="BMenu" class="panel-collapse collapse"> 
                                <div class="list-group wk-accordion-list-group">
                                    <button type="button" class="list-group-item" id="wk-menu-panel-item-searchCourse"> >&nbsp;&nbsp;查看课程信息</button>
                                </div>
                            </div>
                        </div>
                        
                        <div class="panel panel-info wk-accordion-header">
                            <div class="panel-heading">
                                <a data-toggle="collapse" href="#CMenu" data-parent="#accordion">文件查询</a>
                            </div>
                           
                            <div id="CMenu" class="panel-collapse collapse">    
                                <div class="list-group wk-accordion-list-group">
                                    <button type="button" class="list-group-item" id="wk-menu-panel-item-adminSearchCourseVideo"> >&nbsp;&nbsp;在线课程视频</button>
                                    <button type="button" class="list-group-item" id="wk-menu-panel-item-adminSearchCourseFile"> >&nbsp;&nbsp;下载课程文件</button>
                                </div>
                            </div>

                        </div>
                        
                        <div class="panel panel-info wk-accordion-header">
                            <div class="panel-heading">
                                <a data-toggle="collapse" href="#DMenu" data-parent="#accordion">讨论查询</a>
                            </div>
                            <div id="DMenu" class="panel-collapse collapse">    
                                <div class="list-group wk-accordion-list-group">
                                    <button type="button" class="list-group-item" id="wk-menu-panel-item-searchDiscuss"> >&nbsp;&nbsp;话题讨论</button>
                                </div>
                            </div>
                        </div>
                        
                        <div class="panel panel-info wk-accordion-header">
                            <div class="panel-heading"> 
                                <a data-toggle="collapse" href="#EMenu" data-parent="#accordion">公告查询</a>
                            </div>
                            <div id="EMenu" class="panel-collapse collapse">    
                                <div class="list-group wk-accordion-list-group">
                                    <button type="button" class="list-group-item" id="wk-menu-panel-item-searchNotice"> >&nbsp;&nbsp;查看公告</button>
                                </div>
                            </div>
                        </div>
                        
                        <div class="panel panel-info wk-accordion-header">
                            <div class="panel-heading"> 
                                <a data-toggle="collapse" href="#AMenu" data-parent="#accordion">作业查询</a>
                            </div>
                            <div id="AMenu" class="panel-collapse collapse">    
                                <div class="list-group wk-accordion-list-group">
                                    <button type="button" class="list-group-item" id="wk-menu-panel-item-searchTask"> >&nbsp;&nbsp;开始考试</button>
                                    <button type="button" class="list-group-item" id="wk-menu-panel-item-searchStudentTaskInfo"> >&nbsp;&nbsp;查询已完成作业</button>
                                </div>
                            </div>
                        </div>
                        
                        <div class="panel panel-info wk-accordion-header">
                            <div class="panel-heading"> 
                                <a data-toggle="collapse" href="#FMenu" data-parent="#accordion">个人信息</a>
                            </div>
                            <div id="FMenu" class="panel-collapse collapse">    
                                <div class="list-group wk-accordion-list-group">
                                    <button type="button" class="list-group-item" id="wk-menu-panel-item-updateStudentInfo"> >&nbsp;&nbsp;修改个人信息</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- 右侧导航 MenuPanel  end-->
        
        <!--   左侧mainFrame start -->
        <div id="rightTable" class="col-lg-10" style="padding:0px; width: 84%;">
            <iframe id="mainFrame" src="<%=basePath%>/searchNotice.html" width="100%" frameborder="0" onload="changeFrameHeight()">
            </iframe>
        </div>
        <!--  左侧mainFrame end-->
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
    
    
    	/*  设置mainFrame的高度 */
        function changeFrameHeight() {
            var ifm= document.getElementById("mainFrame"); 
            ifm.height = document.documentElement.clientHeight - $("#wk-nav-menu").height() - $("#banner").height() - 9;
        }
        window.onresize=function(){  
             changeFrameHeight();  
        } 
        
        /*  设置MenuPanel的高度 */
       	changeMenuPanelHeight();
        function changeMenuPanelHeight() {
            var panel= $("#wk-menu-panel"); 
            panel.height(document.documentElement.clientHeight - $("#wk-nav-menu").height() - $("#banner").height() - 3);
            
        }
        window.onresize=function(){  
             changeMenuPanelHeight();  
        } 
        
        /** 
        	点击纵向导航时，获取button的id(如id="wk-menu-panel-item-searchCourseInfo"),
                将从弟19个字符开始截取的保留剩下的到id[即jsp页面的名称，将id保存到mainFrame的src中
        */
        $(".list-group-item").each(function() {
            $(this).on("click", function() {
                var url = "";
                var id = $(this).attr("id").substr(19, $(this).attr("id").length);
                url="<%=basePath%>" + id + ".html";
                $("#mainFrame").attr("src",  url); 
            });
        });

        /* 点击menu横向导航跳转到相应的页面      */   
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

        $(".myInfo").each(function() {
            $(this).on("click", function() {
                $("#mainFrame").attr("src",  "<%=basePath%>" + "updateStudentInfo.html");  
            });
        });

    </script>

</body>
</html>