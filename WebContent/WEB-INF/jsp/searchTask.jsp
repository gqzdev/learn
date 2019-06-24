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
	<title>查询考试 在线学习平台ForFuture</title>
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
	            <li><a href="javascript:void(0);">考试管理</a></li>
	            <li><a href="javascript:void(0);">考试查询</a></li>
			</ul>
		</div>
	</div>
	
	<div id="taskContainer" v-cloak>
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
							 <button id="enterBtn" @click="enterBtn()"  type="button" class="btn btn-default wk-tool-btn">开始考试</button>
						</c:when>
						<c:when test="${sessionScope.role==1}">
							<!--  若为教师  则是选进入考试 -->
							<button id="selectScoreBtn" @click="selectScoreBtn()" type="button" class="btn btn-default wk-tool-btn">查看考试情况</button>
							<button id="deleteBtn" @click="deleteBtn()" type="button" class="btn btn-default wk-tool-btn">删除</button>
			                <button id="updateBtn" @click="updateBtn()"  type="button" class="btn btn-default wk-tool-btn">编辑</button>
			                <button id="searchQuestionBtn" @click="searchQuestionBtn()" type="button" class="btn btn-default wk-tool-btn">查看题目</button>
			                <button id="createQuestionBtn" @click="createQuestionBtn()" type="button" class="btn btn-default wk-tool-btn">录入题目</button>
						</c:when>
						<c:otherwise>
						 	<!--  若为教师有权限管理自己发布的考试    管理员则可以管理所有的考试 -->
							<button id="selectScoreBtn" @click="selectScoreBtn()" type="button" class="btn btn-default wk-tool-btn">查看考试情况</button>
							<button id="deleteBtn" @click="deleteBtn()" type="button" class="btn btn-default wk-tool-btn">删除</button>
			                <button id="searchQuestionBtn" @click="searchQuestionBtn()" type="button" class="btn btn-default wk-tool-btn">查看题目</button>
			                <button id="createQuestionBtn" @click="createQuestionBtn()" type="button" class="btn btn-default wk-tool-btn">录入题目</button>
						</c:otherwise>
					</c:choose>
                </div>
            </div>
        </div>
    </div>
    
	<!-- 查询发布的考试 [管理]-->
	<div class="row" >
		<div class="col-lg-12">
			<div class="panel panel-default  wk-panel">
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th>选择</th>
							<th>序号</th>
							<th>所属课程</th>
							<th>发布教师</th>
							<th>发布时间</th>
						</tr>
					</thead>
					<tbody>
						<tr v-for="(task,index) in taskList" class="showStyle">
							<td>
								<input :id="'grid_'+(task.id)" name="workerRadio" type="radio" aria-label="选择" />
							</td>
							<td>{{index+1+(page-1)*pageSize}}</td>
							<td>{{task.courseName}}</td>
							<c:choose>
								<c:when test="${sessionScope.role==1}">
									<td>${sessionScope.user.name}</td>
								</c:when>
								<c:otherwise>
									<td>{{task.teacherName}}</td>
								</c:otherwise>
							</c:choose>
							<td>{{dateFormat(task.recordTime)}}</td>
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

	<!-- 导入Vue -->
	<script type="text/javascript" src="resource/js/vue.min.js"></script>
	<script type="text/javascript" src="resource/js/vue-resource.js"></script>
	<!-- pageination -->
	<script type="text/javascript" src="resource/js/zpageNav.js"></script>
	<script type="text/javascript">
		var taskVue=new Vue({
			el:"#taskContainer",
			data:{
				taskList:[],
				taskfinnishedList:[],
				page:1,//显示的是哪一页
				pageSize:8,//页面显示的数据条数
				total:100,//记录总数
				maxPage:9 //最大的页数
			},
			methods:{
				pageHandler:function(page){//跳转到page页
					this.page=page;//修改显示的页数page
					//发送Ajax请求   参数params 
					var params={"page":page,"pageSize":this.pageSize};
					this.$http.post("taskListByPage.action",params,{emulateJSON:true}).then(
						function(res){
							this.taskList=res.data.list;
							this.total=res.data.total;
							this.maxPage=res.data.maxPage;
						},
						function(res){
							console.log(res);
						}
					);
				},
				deleteBtn:function(){ //删除
					var id = "";
			        $(":radio").each(function() {
			            if ($(this).is(":checked")) {
			                id = $(this).attr("id").substr(5, $(this).attr("id").length);
			            }
			        });
			        if (id != "") {
			            $("#deleteConfirm").modal();
			            $("#deleteBtnOK").on("click", function() {
			                location.href = "<%=basePath%>deleteTask/" + id + ".html";
			            });
			        }else{
			        	alert("请选择您需要删除的考试！！");
			        }
				},
				updateBtn:function(){ //更新
					var id = "";
			        $(":radio").each(function() {
			            if ($(this).is(":checked")) {
			                id = $(this).attr("id").substr(5, $(this).attr("id").length);
			            }
			        });         
			        if (id != "") {
						location.href = "<%=basePath%>updateTask/" + id + ".html";
			        }else{
			        	alert("请选择您需要更改的考试！！");
			        }
				},
				createQuestionBtn:function(){ //添加试题
					var id = "";
			        $(":radio").each(function() {
			            if ($(this).is(":checked")) {
			                id = $(this).attr("id").substr(5, $(this).attr("id").length);
			            }
			        });         
			        if (id != "") {
						location.href = "<%=basePath%>createQuestion/" + id + ".html";
			        }else{
			        	alert("请选择您需要录入试题的考试！！");
			        }
				},
				searchQuestionBtn:function(){ //查看试题
					var id = "";
			        $(":radio").each(function() {
			            if ($(this).is(":checked")) {
			                id = $(this).attr("id").substr(5, $(this).attr("id").length);
			            }
			        });         
			        if (id != "") {
						location.href = "<%=basePath%>searchQuestion/" + id + ".html";
			        }else{
			        	alert("请选择您需要查看的考试！！");
			        }
				},
				enterBtn:function(){ //进入考试
					var id = "";
			        $(":radio").each(function() {
			            if ($(this).is(":checked")) {
			                id = $(this).attr("id").substr(5, $(this).attr("id").length);
			            }
			        });
			        if (id != "") {
			        	location.href = "<%=basePath%>enterTask/" + id + ".html";
			        }else{
			        	alert("请选择你要开始的考试！！！！");
			        }
				},
				selectScoreBtn:function(){ //查看成绩
					var id = "";
			        $(":radio").each(function() {
			            if ($(this).is(":checked")) {
			                id = $(this).attr("id").substr(5, $(this).attr("id").length);
			            }
			        });
			        if (id != "") {
			        	location.href = "<%=basePath%>searchStudentTaskScore/" + id + ".html";
			        }else{
			        	alert("请选择你要查看 的考试！！！！");
			        }
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
	<!-- 判断是否已经完成考试 -->
	<script type="text/javascript">
	
	</script>
</body>
</html>