<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.List,entity.Order,entity.User,entity.Food" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的订单</title>
<meta name="description" content="这是一个食物 页面">
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
  <script src="http://cdn.static.runoob.com/libs/jquery/2.0.0/jquery.min.js"></script>
</head>
<style>
  .M1{
     width:800px;
     height:430px;
     margin:85px auto;
  }
	
</style>
<body onload="he()">
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
            <li><a href="/Order_Food/orderList.action?musername=<%=session.getAttribute("userName") %>"><span class="am-icon-puzzle-piece"></span> 我的订单<span class="am-icon-star am-fr am-margin-right admin-icon-yellow"></span></a></li>           
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
        <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">个人中心</strong>-> <small>我的订单</small></div>       
      </div>
        <div class="M1" align="center">
      <table class="layui-table" lay-skin="line">
					<colgroup>
						<col width="150">
						<col width="200">
						<col>
					</colgroup>
					<thead>
						<tr>
							<th>店铺名称</th>
							<th>食物名称</th>
							<th>价格</th>
							<th>数量</th>
						</tr>
					</thead>
					<tbody>
						
						<!-- <tr>
							<td><i class="layui-icon" style="font-size: 20px; color: #FF5722;">&#xe60c;</i> 特色小吃</td>
							<td>西红柿鸡蛋面</td>
							<td class="price">15.0元/份</td>
						    <td>1001</td>										   
						</tr> -->
						<%
						   List<Order> userOrderList=(List<Order>)session.getAttribute("userOrderList");
						  for(int i=0;i<userOrderList.size();i++){
							  Order order=userOrderList.get(i);
						%>
						<tr>
							<td><i class="layui-icon" style="font-size: 20px; color: #FF5722;">&#xe60c;</i> <%=order.getShopname() %></td>
							<td><%=order.getFoodname() %></td>
							<td class="price"><%=order.getPrice() %>元/份</td>
						    <td><%=order.getNum() %></td>										   
						</tr>
						<%} %>
					</tbody>
				</table>
			 </div>
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