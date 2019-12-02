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
	<title>大学生学习平台</title> 
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
            <div class="banner" id="banner"></div>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-12">
            <ul class="nav nav-tabs wk-nav-menu" id="wk-nav-menu">
                <li role="presentation"><a id="leftNav">[学生模块]</a></li>
                <li role="presentation"><a href="javascript:void();" id="wk-menu-panel-item-searchCourseInfo" class="wk-main-menu-item">课程信息查询</a></li>
                <li role="presentation"><a href="javascript:void();" id="wk-menu-panel-item-searchCollegeVideoInfo" class="wk-main-menu-item">在线课程视频</a></li>
                <li role="presentation"><a href="javascript:void();" id="wk-menu-panel-item-searchCollegeFileInfo" class="wk-main-menu-item">课程文件下载</a></li>
                <li role="presentation"><a href="javascript:void();" id="wk-menu-panel-item-searchDiscussInfo" class="wk-main-menu-item">话题讨论</a></li>
                <li role="presentation"><a href="javascript:void();" id="wk-menu-panel-item-searchNoticeInfo" class="wk-main-menu-item">查看公告</a></li>
                <li role="presentation"><a href="javascript:void();" id="wk-menu-panel-item-searchTaskInfo" class="wk-main-menu-item">完成作业</a></li>
                <li role="presentation"><a href="javascript:void();" id="wk-menu-panel-item-searchStudentTaskInfo" class="wk-main-menu-item">查询已完成作业</a></li>
                <li role="presentation"><a href="<%=basePath%>logout.html" class="wk-main-menu-item">注销登录</a></li>    
            </ul>
        </div>
    </div>
    
    <div class="row">
        <div class="col-lg-2" id="wk-menu-panel"  style="width: 15%;">
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel-group wk-accordion-panel-group" id="accordion">
                        
                        <div class="panel panel-info wk-accordion-header">
                            <div class="panel-heading"> 
                                <a data-toggle="collapse" href="#BMenu" data-parent="#accordion">课程管理</a>
                            </div>
                            <div id="BMenu" class="panel-collapse collapse">    
                                <div class="list-group wk-accordion-list-group">
                                    <button type="button" class="list-group-item" id="wk-menu-panel-item-searchCourseInfo"> >&nbsp;&nbsp;查看课程信息</button>
                                    <button type="button" class="list-group-item" id="wk-menu-panel-item-searchMyCourseInfo"> >&nbsp;&nbsp;我的课程</button>
                                </div>
                            </div>
                        </div>
                        
                        <!-- <div class="panel panel-info wk-accordion-header">
                            <div class="panel-heading">
                                <a data-toggle="collapse" href="#CMenu" data-parent="#accordion">文件管理</a>
                            </div>
                           
                            <div id="CMenu" class="panel-collapse collapse">    
                                <div class="list-group wk-accordion-list-group">
                                    <button type="button" class="list-group-item" id="wk-menu-panel-item-searchCollegeVideoInfo"> >&nbsp;&nbsp;在线课程视频</button>
                                    <button type="button" class="list-group-item" id="wk-menu-panel-item-searchCollegeFileInfo"> >&nbsp;&nbsp;下载课程文件</button>
                                </div>
                            </div>
                        </div> -->
                        
                        <!--  <div class="panel panel-info wk-accordion-header">
                            <div class="panel-heading">
                                <a data-toggle="collapse" href="#DMenu" data-parent="#accordion">讨论管理</a>
                            </div>
                            <div id="DMenu" class="panel-collapse collapse">    
                                <div class="list-group wk-accordion-list-group">
                                    <button type="button" class="list-group-item" id="wk-menu-panel-item-searchDiscussInfo"> >&nbsp;&nbsp;话题讨论</button>
                                </div>
                            </div>
                        </div> -->
                        
                        <div class="panel panel-info wk-accordion-header">
                            <div class="panel-heading"> 
                                <a data-toggle="collapse" href="#EMenu" data-parent="#accordion">公告管理</a>
                            </div>
                            <div id="EMenu" class="panel-collapse collapse">    
                                <div class="list-group wk-accordion-list-group">
                                    <button type="button" class="list-group-item" id="wk-menu-panel-item-searchNoticeInfo"> >&nbsp;&nbsp;查看公告</button>
                                </div>
                            </div>
                        </div>
                        
                        <!-- <div class="panel panel-info wk-accordion-header">
                            <div class="panel-heading"> 
                                <a data-toggle="collapse" href="#AMenu" data-parent="#accordion">作业管理</a>
                            </div>
                            <div id="AMenu" class="panel-collapse collapse">    
                                <div class="list-group wk-accordion-list-group">
                                    <button type="button" class="list-group-item" id="wk-menu-panel-item-searchTaskInfo"> >&nbsp;&nbsp;完成作业</button>
                                    <button type="button" class="list-group-item" id="wk-menu-panel-item-searchStudentTaskInfo"> >&nbsp;&nbsp;查询已完成作业</button>
                                </div>
                            </div>
                        </div> -->
                        
                        <div class="panel panel-info wk-accordion-header">
                            <div class="panel-heading"> 
                                <a data-toggle="collapse" href="#FMenu" data-parent="#accordion">个人信息管理</a>
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
        
         <div  id="rightTable" class="col-lg-10" style="padding:0px;">
            <iframe id="mainFrame" src="<%=basePath%>/searchNotice.html" width="100%" frameborder="0" onload="changeFrameHeight()">
            </iframe>
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
                
                $("#mainFrame").attr("src",  "<%=basePath%>" + id + ".html");  
            });
        });

        

    </script>

</body>
</html>