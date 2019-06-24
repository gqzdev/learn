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
	<title>查询讨论[管理]-在线学习平台ForFuture</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="ForFuture Group、ForFuturn News,ForFuture Share,ForFuture Shopping" />
	<meta name="keywords" content="在线学习平台，知识共享!共祝教育事业！  ganquanzhong" />
	<meta name="author" content="ganquanzhong.top" />
	<link rel="shortcut icon"	href="https://8.url.cn/edu/edu_modules/edu-ui/img/nohash/favicon.ico">
			
	<base href="<%=basePath%>">
	<!-- Vue_Pageination -->
	<link rel="stylesheet" href="resource/css/zpageNav.css" type="text/css" />
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
				<li><a href="javascript:void(0);">在线学习平台</a></li>
	            <li><a href="javascript:void(0);">讨论管理</a></li>
	            <li><a href="javascript:void(0);">讨论查询</a></li>
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
							<!--  若为学生 查看和回复讨论  -->
							<button id="scanBtn" type="button" class="btn btn-default wk-tool-btn">查看回复</button>
	                		<button id="replyBtn" type="button" class="btn btn-default wk-tool-btn">回复</button>
						</c:when>
						<c:when test="${sessionScope.role==1}">
							<!--  若为教师  则是管理自己发布的 -->
							<button id="deleteBtn" type="button" class="btn btn-default wk-tool-btn">删除</button>
	                		<button id="updateBtn" type="button" class="btn btn-default wk-tool-btn">编辑</button>
	                		<button id="scanBtn" type="button" class="btn btn-default wk-tool-btn">查看回复</button>
						</c:when>
						<c:otherwise>
						 	<!--  若为管理员 有权限管理所有的话题讨论 -->
	                		<button id="deleteBtn" type="button" class="btn btn-default wk-tool-btn">删除</button>
	                		<button id="updateBtn" type="button" class="btn btn-default wk-tool-btn">编辑</button>
	                		<button id="scanBtn" type="button" class="btn btn-default wk-tool-btn">查看回复</button>
						</c:otherwise>
					</c:choose>
                 </div>
            </div>
        </div>
    </div>

	<div class="row" id="discussContainer" v-cloak>
		<div class="col-lg-12">
			<div class="panel panel-default  wk-panel">
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th width=3%>选择</th>
							<th width=2%>序号</th>
							<th width=20%>讨论标题</th>
							<th width=50%>讨论内容</th>
							<th width=10%>所属课程</th>
							<th width=5%>发布教师</th>
							<th width=10%>发布日期</th>
						</tr>
					</thead>
					<tbody>
						<tr v-for="(discuss,index) in discussList" class="showStyle">
							<td>
								<input :id="'grid_'+(discuss.id)" name="workerRadio" type="radio" aria-label="选择" />
							</td>
							<td>{{index+1+(page-1)*pageSize}}</td>
							<td>{{discuss.title}}</td>
							<td>{{discuss.content}}</td>
							<td>{{discuss.courseName}}</td>
							<td>{{discuss.teacherName}}</td>
							<td>{{dateFormat(discuss.recordTime)}}</td>
						</tr>
					</tbody>
					
				</table>
			</div>
			<!--分页 start-->
			<div style="width: 300px; margin: 0 auto; margin-top: 10px;">
				<zpagenav  v-bind:page="page"  v-bind:page-size="pageSize" v-bind:total="total" 
							v-bind:max-page="maxPage" v-on:pagehandler="pageHandler">
				</zpagenav>
			</div>
			<!-- 分页 end -->
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
		/* 删除讨论话题 */
	    $("#deleteBtn").on("click", function() {
	        var id = "";
	        $(":radio").each(function() {
	            if ($(this).is(":checked")) {
	                id = $(this).attr("id").substr(5, $(this).attr("id").length);
	            }
	        });
	        if (id != "") {
	            $("#deleteConfirm").modal();
	            $("#deleteBtnOK").on("click", function() {
	                location.href = "<%=basePath%>deleteDiscuss/" + id + ".html";
	            });
	        }else{
        		alert("请选择您需要删除的话题！！");
     		}
	        
	    });
		/* 更新讨论话题 */
	     $("#updateBtn").on("click", function() {
	        var id = "";
	        $(":radio").each(function() {
	            if ($(this).is(":checked")) {
	                id = $(this).attr("id").substr(5, $(this).attr("id").length);
	            }
	        });         
	        if (id != "") {
				location.href = "<%=basePath%>updateDiscuss/" + id + ".html";
	        }else{
        		alert("请选择您需要更改的话题！！");
     		}
	    });
	    /* 回复话题讨论 */
	    $("#replyBtn").on("click", function() {
	        var id = "";
	        $(":radio").each(function() {
	            if ($(this).is(":checked")) {
	                id = $(this).attr("id").substr(5, $(this).attr("id").length);
	            }
	        });
	        if (id != "") {
	        	location.href = "<%=basePath%>createReply/" + id + ".html";
	        }else{
	        	alert("请选择您要回复的话题！！！");
	        }
	    });
	    
		/* 查询话题讨论 */
	     $("#scanBtn").on("click", function() {
	        var id = "";
	        $(":radio").each(function() {
	            if ($(this).is(":checked")) {
	                id = $(this).attr("id").substr(5, $(this).attr("id").length);
	            }
	        });         
	        if (id != "") {
				location.href = "<%=basePath%>searchDiscussReply/" + id + ".html";
	        }else{
	        	alert("请选择您查看的话题！！！");
	        }
	    });
	</script>
	<!-- 导入Vue -->
	<script type="text/javascript" src="resource/js/vue.min.js"></script>
	<script type="text/javascript" src="resource/js/vue-resource.js"></script>
	<!-- pageination -->
	<script type="text/javascript" src="resource/js/zpageNav.js"></script>
	<script type="text/javascript">
		var discussVue=new Vue({
			el:"#discussContainer",
			data:{
				discussList:[],
				page:1,//显示的是哪一页
				pageSize:5,//页面显示的数据条数
				total:100,//记录总数
				maxPage:9 //最大的页数
			},
			methods:{
				pageHandler:function(page){//跳转到page页
					this.page=page;//修改显示的页数page
					//发送Ajax请求   参数params 
					var params={"page":page,"pageSize":this.pageSize};
					//
					this.$http.post("discussListByPage.action",params,{emulateJSON:true}).then(
						function(res){
							this.discussList=res.data.list;
							this.total=res.data.total;
							this.maxPage=res.data.maxPage;
						},
						function(res){
							console.log(res);
						}
					);
				},
				//格式化时间
				dateFormat:function(time) {
				    var date=new Date(time);
				    var year=date.getFullYear();
				    /* 在日期格式中，月份是从0开始的，因此要加0
				     * 使用三元表达式在小于10的前面加0，以达到格式统一  如 09:11:05
				     * */
				    var month= date.getMonth()+1<10 ? "0"+(date.getMonth()+1) : date.getMonth()+1;
				    var day=date.getDate()<10 ? "0"+date.getDate() : date.getDate();
				    var hours=date.getHours()<10 ? "0"+date.getHours() : date.getHours();
				    var minutes=date.getMinutes()<10 ? "0"+date.getMinutes() : date.getMinutes();
				    var seconds=date.getSeconds()<10 ? "0"+date.getSeconds() : date.getSeconds();
				    // 拼接
				    return year+"-"+month+"-"+day+" "+hours+":"+minutes+":"+seconds;
				}
			},
			created:function(){ 
			    this.pageHandler(1); 				
			}
		});
	</script>
</body>
</html>