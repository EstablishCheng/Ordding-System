<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.List,entity.Shop,entity.User,entity.Food" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商家列表</title>
  <meta name="description" content="这是一个 商家 页面">
  <meta name="keywords" content="index">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp" />
  <link rel="icon" type="image/png" href="assets/i/favicon.png">
  <link rel="apple-touch-icon-precomposed" href="assets/i/app-icon72x72@2x.png">
  <meta name="apple-mobile-web-app-title" content="Amaze UI" />
  <link rel="stylesheet" href="assets/css/amazeui.min.css"/>
  <link rel="stylesheet" href="assets/css/admin.css">
  <link rel="stylesheet" href="layui/css/layui.css">
</head>

<body>
<%@include file="user-head.jsp" %>

<div class="am-cf admin-main">
  <!-- sidebar start -->
  <div class="admin-sidebar am-offcanvas" id="admin-offcanvas">
    <div class="am-offcanvas-bar admin-offcanvas-bar">
      <ul class="am-list admin-sidebar-list">
        <li><a href="shopList.jsp" target="body"><span class="am-icon-home"></span> 商家列表</a></li>
        <li class="admin-parent">
          <a class="am-cf" data-am-collapse="{target: '#collapse-nav'}"><span class="am-icon-file"></span> 个人中心 <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
          <ul class="am-list am-collapse admin-sidebar-sub am-in" id="collapse-nav">
            <li><a href="/Order_Food/userInform.action?username=<%=session.getAttribute("userName") %>" class="am-cf"><span class="am-icon-check"></span> 个人基本信息<span class="am-icon-star am-fr am-margin-right admin-icon-yellow"></span></a></li>
            <li><a href="/Order_Food/orderList.action?username=<%=session.getAttribute("userName") %>"><span class="am-icon-puzzle-piece"></span> 我的订单<span class="am-icon-star am-fr am-margin-right admin-icon-yellow"></span></a></li>
           
          </ul>
        </li>
      </ul>
      <div class="am-panel am-panel-default admin-sidebar-panel">
        <div class="am-panel-bd">
          <p><i class="layui-icon" style="font-size: 25px; color: #FF5722;">&#xe645;</i> 公告</p>
          <p><marquee behavior="scroll" direction="up" loop="-1"  scrollamount="6" scrolldelay="900">
             1、吃货的思路是什么？好吃你就多吃点，不好吃多少也要吃点。<br>
             2、没有吃就没有爱情，不信你一顿饭不带请的谈一次恋爱给我看看啊。<br>
             3、永远别问一个吃货吃了没，这对吃货来说根本不是问题，要问就问吃饱没<br>
          </marquee></p>
        </div>
      </div>
    </div>
    
  </div>
  <!-- sidebar end -->

  <!-- content start -->
  <div class="admin-content">
    <div class="admin-content-body" name="body">
     
      <div class="am-cf am-padding">
        <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">首页</strong>-> <small>商家信息</small></div>       
      </div>
    
                <table class="layui-table" lay-even lay-skin="nob">
					<colgroup>
						<col width="150">
						<col width="200">
						<col>
					</colgroup>
					<thead>
						<tr>
							<th>店名</th>
							<th>选择</th>
						</tr>
					</thead>
					<tbody>
						<%
						   List<Shop> shopList=(List<Shop>)session.getAttribute("shopList");
						  for(int i=0;i<shopList.size();i++){
							  Shop shop=shopList.get(i);
						%>	
						<!-- <tr>
							<td><i class="layui-icon" style="font-size: 20px; color: #FF5722;">&#xe60c;</i> 特色小吃</td>
							<td><a href="foodList.jsp" class="layui-btn layui-btn-sm layui-btn-radius layui-btn-primary layui-anim layui-anim-up">进入查看</a></td>
						</tr> -->
						<tr>
							<td><i class="layui-icon" style="font-size: 20px; color: #FF5722;">&#xe60c;</i><%=shop.getName() %></td>
							<td><a href="/Order_Food/foodList.action?shopId=<%=shop.getShopid() %>" class="layui-btn layui-btn-sm layui-btn-radius layui-btn-primary layui-anim layui-anim-up">进入查看</a></td>
						</tr>
						<%} %>
					</tbody>
				</table>
      
    </div>

    <footer class="admin-content-footer">
      <hr>
      <p class="am-padding-left">© 2018 安徽文达信息工程学院.</p>
    </footer>
  </div>
  <!-- content end -->

</div>

<a href="#" class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu" data-am-offcanvas="{target: '#admin-offcanvas'}"></a>


<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/amazeui.min.js"></script>
<script src="assets/js/app.js"></script>
</body>
</html>