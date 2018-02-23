<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.List,entity.Shop,entity.User" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员首页</title>
<meta name="description" content="这是一个 index 页面">
  <meta name="keywords" content="index">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp" />
  <link rel="icon" type="image/png" href="assets/i/favicon.png">
  <link rel="apple-touch-icon-precomposed" href="assets/i/app-icon72x72@2x.png">
  <meta name="apple-mobile-web-app-title" content="Amaze UI" />
  <link rel="stylesheet" href="assets/css/amazeui.min.css"/>
  <link rel="stylesheet" href="assets/css/admin.css">
  <link rel="stylesheet" href="layui/css/layui.css" media="all">
  <link rel="stylesheet" href="pintuer/pintuer.css">
</head>
<style>
 .M1{
     width:800px;
     height:430px;
     margin:65px auto;
  }
	
.D1{
	width:1000px;
	margin:60px auto;
	background-color:white;
}
.D2{
	width:300px;
	height:800px;
	margin:20px auto; 
	padding-left:20px;
}
.layui-tab-title li{
padding:0 50px;
}
.layui-tab-item{
 overflow:auto;
}
</style>
<body>
<%@include file="user-head.jsp" %>
	<div class="D1">
		<div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
			<ul class="layui-tab-title">
				
				<li class="layui-this">用户管理</li>
				<li>商家管理</li>
				<li><i class="layui-icon" style="font-size: 30px; color: #1E9FFF;">&#xe60c;</i>  </li>
				<li><i class="layui-icon" style="font-size: 30px; color: #1E9FFF;">&#xe60c;</i> </li>
				<li><i class="layui-icon" style="font-size: 30px; color: #1E9FFF;">&#xe60c;</i> </li>
			</ul>
			<div class="layui-tab-content">
			      <div class="layui-tab-item layui-show">
			          <table class="layui-table" lay-skin="line">
						<colgroup>
							<col width="150">
							<col width="200">
							<col>
						</colgroup>
						<thead>
							<tr>
								<th>姓名</th>
								<th>密码</th>
								<th>电话</th>
								<th>地址</th>
								<th>邮箱</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>

							<!-- <tr>
								<td>大胖子</td>
								<td>66666</td>
								<td>110</td>
								<td>皖水公寓</td>
								<td>1326126634@qq.com</td>
								<td><a href="#" class="layui-btn  layui-btn-xs layui-btn-radius layui-btn-primary">删除</a></td>
							</tr> -->
						<% 
						   List<User> userList=(List<User>)session.getAttribute("userList");
						  for(int i=0;i<userList.size();i++){
							  User user=userList.get(i);
						%>
							<tr>
								<td type="hidden"><%=user.getUserid() %></td>
								<td><%=user.getName() %></td>
								<td><%=user.getPassword() %></td>
								<td><%=user.getTel() %></td>
								<td><%=user.getAddress() %></td>
								<td><%=user.getEmail() %></td>
								<td><a href="/delUser.action?userid=<%=user.getUserid() %>" class="layui-btn  layui-btn-xs layui-btn-radius layui-btn-primary">删除</a></td>
							</tr>
						<%} %>
						</tbody>
					</table>
			      </div>
                  
                  <div class="layui-tab-item">
                      <table class="layui-table" lay-skin="line">
						<colgroup>
							<col width="150">
							<col width="200">
							<col>
						</colgroup>
						<thead>
							<tr>
								<th>商家ID</th>
								<th>商家名字</th>
								<th>密码</th>
								<th>电话</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>

							<!-- <tr>
								<td>121</td>
								<td>哈哈</td>
								<td>110</td>
								<td><a href="#" class="layui-btn  layui-btn-xs layui-btn-radius layui-btn-primary">删除</a></td>
							</tr> -->
						<% 
						   List<Shop> shopList=(List<Shop>)session.getAttribute("shopList");
						  for(int i=0;i<shopList.size();i++){
							  Shop shop=shopList.get(i);
						%>
							<tr>
								<td><%=shop.getShopid() %></td>
								<td><%=shop.getName() %></td>
								<td><%=shop.getPassword() %></td>
								<td><%=shop.getTel() %></td>
								<td><a href="/delShop.action?shopid=<%=shop.getShopid() %>" class="layui-btn  layui-btn-xs layui-btn-radius layui-btn-primary">删除</a></td>
							</tr>
						<%} %>
						</tbody>
					</table>
                  </div>
			
				
			</div>
		</div>

	</div>



<a href="#" class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu" data-am-offcanvas="{target: '#admin-offcanvas'}"></a>

<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/amazeui.min.js"></script>
<script src="assets/js/app.js"></script>
<script src="layui/layui.js"></script>

<script>
	layui.use('element', function() {
		var element = layui.element;
		//一些事件监听
		element.on('tab(demo)', function(data) {
			console.log(data);
		});
	});
</script>
</body>
</html>