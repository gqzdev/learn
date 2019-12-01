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
                <li role="presentation"><a id="leftNav">[管理员模块]</a></li>
                <li role="presentation"><a href="javascript:void();" id="wk-menu-panel-item-createStudent" class="wk-main-menu-item">新增学生</a></li>
                <li role="presentation"><a href="javascript:void();" id="wk-menu-panel-item-searchStudent" class="wk-main-menu-item">学生信息查询</a></li>
                <li role="presentation"><a href="javascript:void();" id="wk-menu-panel-item-createTeacher" class="wk-main-menu-item">新增教师</a></li>
                <li role="presentation"><a href="javascript:void();" id="wk-menu-panel-item-searchTeacher" class="wk-main-menu-item">教师信息查询</a></li>
                <li role="presentation"><a href="javascript:void();" id="wk-menu-panel-item-createCollege" class="wk-main-menu-item">新增学院</a></li>
                <li role="presentation"><a href="javascript:void();" id="wk-menu-panel-item-searchCollege" class="wk-main-menu-item">学院信息管理</a></li>
                <li role="presentation"><a href="javascript:void();" id="wk-menu-panel-item-createCourse" class="wk-main-menu-item">新增课程</a></li>
                <li role="presentation"><a href="javascript:void();" id="wk-menu-panel-item-searchCourse" class="wk-main-menu-item">课程信息查询</a></li>
                <li role="presentation"><a href="<%=basePath%>logout.html" class="wk-main-menu-item">注销登录</a></li>    
            </ul>
        </div>
    </div>
    
    <div class="row">
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
                                    <button type="button" class="list-group-item" id="wk-menu-panel-item-createStudent"> >&nbsp;&nbsp;新增学生</button>
                                     <button type="button" class="list-group-item" id="wk-menu-panel-item-createManyStudent"> >&nbsp;&nbsp;批量新增学生</button>
                                    <button type="button" class="list-group-item" id="wk-menu-panel-item-searchStudent"> >&nbsp;&nbsp;学生信息查询</button>
                                </div>
                            </div>

                        </div>
                        
                        <div class="panel panel-info wk-accordion-header">
                            <div class="panel-heading"> 
                                <a data-toggle="collapse" href="#BMenu" data-parent="#accordion">教师信息管理</a>
                            </div>
                             <div id="BMenu" class="panel-collapse collapse">    
                                <div class="list-group wk-accordion-list-group">
                                    <button type="button" class="list-group-item" id="wk-menu-panel-item-createTeacher"> >&nbsp;&nbsp;新增教师</button>
                                    <button type="button" class="list-group-item" id="wk-menu-panel-item-createManyTeacher"> >&nbsp;&nbsp;批量新增教师</button>
                                    <button type="button" class="list-group-item" id="wk-menu-panel-item-searchTeacher"> >&nbsp;&nbsp;教师信息查询</button>
                                </div>
                            </div>
                        </div>
                        
                        <div class="panel panel-info wk-accordion-header">
                            <div class="panel-heading">
                                <a data-toggle="collapse" href="#CMenu" data-parent="#accordion">学院管理</a>
                            </div>
                           
                            <div id="CMenu" class="panel-collapse collapse">    
                                <div class="list-group wk-accordion-list-group">
                                    <button type="button" class="list-group-item" id="wk-menu-panel-item-createCollege"> >&nbsp;&nbsp;新增学院</button>
                                    <button type="button" class="list-group-item" id="wk-menu-panel-item-searchCollege"> >&nbsp;&nbsp;学院信息查询</button>
                                </div>
                            </div>

                        </div>
                        
                        <div class="panel panel-info wk-accordion-header">
                            <div class="panel-heading">
                                <a data-toggle="collapse" href="#DMenu" data-parent="#accordion">课程管理</a>
                            </div>
                            <div id="DMenu" class="panel-collapse collapse">    
                                <div class="list-group wk-accordion-list-group">
                                    <button type="button" class="list-group-item" id="wk-menu-panel-item-createCourse"> >&nbsp;&nbsp;新增课程</button>
                                    <button type="button" class="list-group-item" id="wk-menu-panel-item-searchCourse"> >&nbsp;&nbsp;课程信息查询</button>
                                </div>
                            </div>
                        </div>
                        
                        <div class="panel panel-info wk-accordion-header">
                            <div class="panel-heading">
                                <a data-toggle="collapse" href="#EMenu" data-parent="#accordion">论坛管理</a>
                            </div>
                            <div id="EMenu" class="panel-collapse collapse">    
                                <div class="list-group wk-accordion-list-group">
                                    <button type="button" class="list-group-item" id="wk-menu-panel-item-searchDiscussInfo"> >&nbsp;&nbsp;话题讨论</button>
                                </div>
                            </div>
                        </div>
                        
                        <div class="panel panel-info wk-accordion-header">
                            <div class="panel-heading">
                                <a data-toggle="collapse" href="#FMenu" data-parent="#accordion">公告管理</a>
                            </div> 
                            <div id="FMenu" class="panel-collapse collapse">    
                                <div class="list-group wk-accordion-list-group">
                                    <button type="button" class="list-group-item" id="wk-menu-panel-item-createNotice"> >&nbsp;&nbsp;新增公告</button>
                                    <button type="button" class="list-group-item" id="wk-menu-panel-item-searchNotice"> >&nbsp;&nbsp;公告信息查询</button>
                                </div>
                            </div>
                        </div>
                        
                        <!-- 添加功能点 -->
                        <div class="panel panel-info wk-accordion-header">
                            <div class="panel-heading"> 
                                <a data-toggle="collapse" href="#GMenu" data-parent="#accordion">个人信息管理</a>
                            </div>
                            <div id="GMenu" class="panel-collapse collapse">    
                                <div class="list-group wk-accordion-list-group">
                                    <button type="button" class="list-group-item" id="wk-menu-panel-item-updateAdminInfo"> >&nbsp;&nbsp;个人信息修改</button>
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