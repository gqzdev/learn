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
	<title>查询视频[教师上传]-在线学习平台ForFuture</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="ForFuture Group、ForFuturn News,ForFuture Share,ForFuture Shopping" />
	<meta name="keywords" content="在线学习平台，知识共享!共祝教育事业！在线学习、在线教育  ganquanzhong" />
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
	            <li><a href="javascript:void(0);">课程视频管理</a></li>
	            <li><a href="javascript:void(0);">课程视频查询</a></li>
			</ul>
		</div>
	</div>
<div id="courseVideoContainer" v-cloak>
	<div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default wk-panel wk-table-tools-panel">
                <div class="panel-heading">
                                             工具栏 Tools
                </div>
                <!-- 搜索 start -->
				<div style="position: absolute;top: -14px;left: 241px;">
					<form class="navbar-form navbar-right" role="search" @submit.prevent="pageHandler()">
						<div class="form-group">
							<input type="text" class="form-control" v-model="searchContent" placeholder="课程名称">
						</div>
						<div class="form-group">
							<label for="filePath" class="control-label wk-filed-label">所属课程:
							</label> 
							<select class="selectpicker"  name="courseId" v-model="course_id">
								<option value="0">请选择所属学院</option>
								<option v-for="(course,index) in courseList"  :value="(course.id)">{{course.name}}</option>
							</select>
						</div>
						<button type="submit"  class="btn btn-default wk-tool-btn" >查询</button>
					</form>
				</div>
				<!-- 搜索 end -->  
            </div>
        </div>
    </div>

	<div class="row" >
		<div class="col-lg-12">
			<div class="panel panel-default  wk-panel">
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th>序号</th>
							<th>文件名</th>
							<th>所属课程</th>
							<c:choose>
								<c:when test="${sessionScope.role==0}">
									<th>上传者</th>
								</c:when>
								<c:when test="${sessionScope.role==2}">
									<th>上传者</th>
								</c:when>
							</c:choose>
							<th>上传时间</th>
							<c:choose>
								<c:when test="${sessionScope.role==0}">
									<th>操作</th>
								</c:when>
								<c:when test="${sessionScope.role==1}">
									<th>操作</th>
								</c:when>
							</c:choose>
						</tr>
					</thead>
					<tbody>
						<tr v-for="(courseVideo,index) in courseVideoList" class="showStyle">
							<td>{{index+1+(page-1)*pageSize}}</td>
							<td>
								<a href="javascript:void()" @click="video(courseVideo.id)">{{courseVideo.path}}
								</a>
							</td>
							<td>{{courseVideo.courseName}}</td>
							<c:choose>
								<c:when test="${sessionScope.role==0}">
									<td>{{courseVideo.teacherName}}</td>
								</c:when>
							</c:choose>
							<c:choose>
								<c:when test="${sessionScope.role==2}">
									<td>{{courseVideo.teacherName}}</td>
								</c:when>
							</c:choose>
							<td>{{dateFormat(courseVideo.recordTime)}}</td>
							<c:choose>
								<c:when test="${sessionScope.role==0}">
									<td><button type="button" class="btn btn-danger" href="javascript:void()" @click="deleteBtn(courseVideo.id)">删除</button></td>
								</c:when>
								<c:when test="${sessionScope.role==1}">
									<td><button type="button" class="btn btn-danger" href="javascript:void()" @click="deleteBtn(courseVideo.id)">删除</button></td>
								</c:when>
							</c:choose>
						</tr>
					</tbody>
					
				</table>
			</div>
			<!--分页 start-->
			<div v-if="total==0" style="text-align: center; font-size: 18px; color: red;font-weight: 600;">没有数据，请重新选择条件！</div>
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
		var courseVue=new Vue({
			el:"#courseVideoContainer",
			data:{
				courseVideoList:[],
				courseList:[],//课程列表
				searchContent:[],//搜索框里的content
				course_id:"0",//选择的学院
				page:1,//显示的是哪一页
				pageSize:6,//页面显示的数据条数
				total:100,//记录总数
				maxPage:9 //最大的页数
			},
			methods:{
				pageHandler:function(page){//跳转到page页
					this.page=page;//修改显示的页数page
					//发送Ajax请求   
					var content=this.searchContent;//处理编码问题
					var courseId=this.course_id;
					//参数params 
					var params={"page":page,"pageSize":this.pageSize};
					var paramsTerm={"page":page,"pageSize":this.pageSize,"content":content,"courseId":courseId};
					//条件查询
					if((content==null||content=="")&&courseId==0){
						this.$http.post("courseVideoListByPage.action",params,{emulateJSON:true}).then(
							function(res){
								this.courseVideoList=res.data.list;
								this.total=res.data.total;
								this.maxPage=res.data.maxPage;
							},
							function(res){
								console.log(res);
							}
						);
					}else{	
						this.$http.post("courseVideoListByTerm.action",paramsTerm,{emulateJSON:true}).then(
							function(res){
								this.courseVideoList=res.data.list;
								this.total=res.data.total;
								this.maxPage=res.data.maxPage;
							},
							function(res){
								console.log(res);
							}
						);
					} 
				},
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
				},
				video:function(id){
					location.href = "<%=basePath%>watchVideo/" + id + ".html";
				},
				deleteBtn:function(id){
			        if (id != "") {
			            $("#deleteConfirm").modal();
			            $("#deleteBtnOK").on("click", function() {
			                location.href = "<%=basePath%>deleteCollegeVideo/" + id + ".html";
			            });
			        }else{
			        	alert("请选择您需要删除的文件！！");
			        }
				}
			},
			created:function(){ 
				//加载查重条件列表
				this.$http.get("getCourseList.action").then(
					function(res){
						this.courseList=res.data;
					},
					function(res){
						console.log(res);
					}
				);
			    this.pageHandler(1); 				
			}
		});
	</script>
</body>
</html>