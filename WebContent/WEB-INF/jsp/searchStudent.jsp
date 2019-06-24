<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<title>查询学生信息-在线学习平台ForFuture</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="ForFuture Group、ForFuturn News,ForFuture Share,ForFuture Shopping" />
	<meta name="keywords" content="在线学习平台，知识共享!共祝教育事业！在线学习、在线教育  ganquanzhong" />
	<meta name="author" content="ganquanzhong.top" />
	<link rel="shortcut icon"	href="https://8.url.cn/edu/edu_modules/edu-ui/img/nohash/favicon.ico">
			
	<base href="<%=basePath%>">
	<link rel="stylesheet" href="resource/bootstrap/css/bootstrap.min.css" >    
	<link rel="stylesheet" href="resource/bootstrap/css/bootstrap-theme.min.css">
	<link rel="stylesheet" href="resource/css/wukong-ui.css">
	<link rel="stylesheet" href="resource/bootstrap/css/bootstrap-select.min.css">
	<!-- Vue_Pageination -->
	<link rel="stylesheet" href="resource/css/zpageNav.css" type="text/css" />
	<script type="text/javascript" src="resource/lib/jquery-3.1.1.js"></script>
	<script type="text/javascript" src="resource/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="resource/bootstrap/js/bootstrap-select.min.js"></script>
	
</head>

<body>
	<div class="row">
		<div class="col-lg-12">
			<ul class="breadcrumb wk-breadcrumb">
				<li><a href="javascript:void(0);">在线学习平台</a></li>
				<li><a href="javascript:void(0);">学生信息管理</a></li>
				<li><a href="javascript:void(0);">学生信息查询</a></li>
			</ul>
		</div>
	</div>

<div id="studentContainer" v-cloak>
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default wk-panel wk-table-tools-panel">
				<div class="panel-heading">工具栏 Tools</div>
				<!-- 搜索 start -->
				<div style="position: absolute;top: -14px;left: 241px;">
					<form class="navbar-form navbar-right" role="search" @submit.prevent="pageHandler()">
						<div class="form-group">
							<input type="text" class="form-control" v-model="searchContent" placeholder="学生姓名">
						</div>
						<div class="form-group">
							<label for="filePath" class="control-label wk-filed-label">所属学院:
							</label> 
							<select class="selectpicker" name="collegeId" v-model="college_id">
								<option value="0">请选择所属学院</option>
								<option v-for="(college,index) in collegeList"  :value="(college.id)">{{college.name}}</option>
							</select>
						</div>
						<button type="submit"  class="btn btn-default wk-tool-btn" >查询</button>
					</form>
				</div>
				<!-- 搜索 end -->
				<div class="panel-body panel-button">
					<button id="deleteBtn" @click="deleteBtn()" type="button" class="btn btn-danger ">删除</button>
					<button id="updateBtn" @click="updateBtn()" type="button" class="btn btn-primary wk-tool-btn">编辑</button>
				</div>
			</div>
		</div>
	</div>

	
		<div class="row" >
			<div class="col-lg-12">
				<div class="panel panel-default  wk-panel">
					<table class="table table-striped table-hover">
						<thead>
							<tr>
								<th>选择</th>
								<th>序号</th>
								<th>学生姓名</th>
								<th>学生学号</th>
								<th>所属学院</th>
								<th>联系电话</th>
								<th>身份证号</th>
								<th>性别</th>
								<th>登录账户</th>
							</tr>
						</thead>
						<%-- 
						<tbody>
							<c:forEach items="${students}" var="var">
								<tr class="showStyle">
									<td>
										<input id="grid_${var.id}" name="workerRadio" type="radio" aria-label="选择" />
									</td>
									<td>${var.name}</td>
									<td>${var.num}</td>
									<td>${var.collegeName}</td>
									<td>${var.telphone}</td>
									<td>${var.idCardNo}</td>
									<td>${var.genderName}</td>
									<td>${var.account}</td>
								</tr>
							</c:forEach>
						</tbody> 
						--%>
						<!-- 使用Vue -->
						<tbody>
							<tr v-for="(stu,index) in studentList" class="showStyle">
								<td><input :id="'grid_'+(stu.id)" name="workerRadio"type="radio" aria-label="选择" /></td>
							    <td>{{index+1+(page-1)*pageSize}}</td>
								<td>{{stu.name}}</td>
								<td>{{stu.num}}</td>
								<td>{{stu.collegeName}}</td>
								<td>{{stu.telphone}}</td>
								<td>{{stu.idCardNo}}</td>
								<td>{{stu.genderName}}</td> 
								<td>{{stu.account}}</td>
							</tr>
						</tbody>
					</table>
				</div>
				<!--分页 start-->
				<div v-if="total==0" style="text-align: center; font-size: 18px; color: red;font-weight: 600;">没有数据，请重新选择条件！</div>
				<div >
					<zpagenav  v-bind:page="page"  v-bind:page-size="pageSize" v-bind:total="total" 
									v-bind:max-page="maxPage" v-on:pagehandler="pageHandler">
					</zpagenav>
				</div>
				<!-- 分页 end -->
			</div>
			
		</div>
	</div>
	
	<div class="modal fade" tabindex="-1" role="dialog" id="deleteConfirm">
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
		var headVue=new Vue({
			el:"#studentContainer",
			data:{
				studentList:[],
				collegeList:[],
				searchContent:[],//搜索框里的content
				college_id:"0",//选择的学院
				page:1,//显示的是哪一页
				pageSize:8,//页面显示的数据条数
				total:100,//记录总数
				maxPage:9 //最大的页数
			},
			methods:{
				pageHandler:function(page){//跳转到page页
					this.page=page;//修改显示的页数page
					//发送Ajax请求
					var content=this.searchContent;//处理编码问题
					var collegeId=this.college_id;
					//参数Params 
					var params={"page":page,"pageSize":this.pageSize};
					var paramsTerm={"page":page,"pageSize":this.pageSize,"content":content,"collegeId":collegeId};
					//条件查询
					if((content==null||content=="")&&collegeId==0){
						this.$http.post("studentListByPage.action",params,{emulateJSON:true}).then(
							function(res){
								this.studentList=res.data.list;
								this.total=res.data.total;
								this.maxPage=res.data.maxPage;
							},
							function(res){
								console.log(res);
							}
						);
					}else{	
						this.$http.post("studentListByTerm.action",paramsTerm,{emulateJSON:true}).then(
							function(res){
								this.studentList=res.data.list;
								this.total=res.data.total;
								this.maxPage=res.data.maxPage;
							},
							function(res){
								console.log(res);
							}
						);
					} 
				},
				//删除学生
				deleteBtn:function(){
					var id = "";
			        $(":radio").each(function() {
			            if ($(this).is(":checked")) {
			                id = $(this).attr("id").substr(5, $(this).attr("id").length);
			            }
			        });
			        if (id != "") {
			            $("#deleteConfirm").modal();
			            $("#deleteBtnOK").on("click", function() {
			                location.href = "<%=basePath%>deleteStudent/" + id + ".html";
			            });
			        }else{
			        	alert("请选择您需要删除的 学生！！");
			        }	
				},
				//更新学生
				updateBtn:function(){
					var id = "";
			        $(":radio").each(function() {
			            if ($(this).is(":checked")) {
			                id = $(this).attr("id").substr(5, $(this).attr("id").length);
			            }
			        });         
			        if (id != "") 
			        {
						location.href = "<%=basePath%>	updateStudent/" + id	+ ".html";
					}else{
			        	alert("请选择您需要修改的 学生！！");
			        }
				}
			},
			//created  表示页面加载完毕，立即执行
			created:function(){ 
			    //加载查重条件列表
				this.$http.get("getCollegeList.action").then(
					function(res){
						this.collegeList=res.data;
					},
					function(res){
						console.log(res);
					}
				);
				this.pageHandler(1); //分页
			}
		});
	</script>
</body>
</html>