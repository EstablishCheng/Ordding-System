<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>发布新品</title>
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
     width:420px;
     height:315px;
     margin:20px auto;
  }
</style>
<body>
<%@include file="user-head.jsp" %>

<div class="am-cf admin-main">
  <!-- sidebar start -->
  <div class="admin-sidebar am-offcanvas" id="admin-offcanvas">
    <div class="am-offcanvas-bar admin-offcanvas-bar">
      <ul class="am-list admin-sidebar-list">
        <li><a href="/Order_Food/listFood.action?shopId=<%=session.getAttribute("shopId") %>" target="body"><span class="am-icon-home"></span> 食物列表</a></li>
        <li class="admin-parent">
          <a class="am-cf" data-am-collapse="{target: '#collapse-nav'}"><span class="am-icon-file"></span> 个人中心 <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
          <ul class="am-list am-collapse admin-sidebar-sub am-in" id="collapse-nav">
            <li><a href="addFood.jsp"><span class="am-icon-puzzle-piece"></span> 发布新品<span class="am-icon-star am-fr am-margin-right admin-icon-yellow"></span></a></li>
            <li><a href="/Order_Food/shopOrderForm.action?shopname=<%=session.getAttribute("shopName") %>"><span class="am-icon-puzzle-piece"></span> 我的订单<span class="am-icon-star am-fr am-margin-right admin-icon-yellow"></span></a></li>         
          </ul>
        </li>
      </ul>
      <div class="am-panel am-panel-default admin-sidebar-panel">
        <div class="am-panel-bd">
          <p><i class="layui-icon" style="font-size: 25px; color: #FF5722;">&#xe645;</i> 公告</p>
          <p><marquee behavior="scroll" direction="up" loop="-1"  scrollamount="6" scrolldelay="900">
             1、吃货的思路是什么？好吃你就多吃点，不好吃多少也要吃点。<br>
             2、没有吃就没有爱情，不信你一顿饭不带请的谈一次恋爱给我看看啊。好啊，看看就看看！<br>
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
        <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">个人中心</strong>-> <small>发布新品</small><p style="float:right;">欢迎光临：<strong><%=session.getAttribute("shopName") %></strong></p></div>       
      </div>
      <div class="M1">
					<form method="post" action="addFood.action?shopId=<%=session.getAttribute("shopId") %>">
						<!-- <div class="form-group">
							<div class="label">
								<label for="username"> 店铺</label>
							</div>
							<div class="field">
								<input type="text" class="input input-auto" id="username"
									name="shopname" size="30" placeholder="输入您的店铺名吧" />
							</div>
						</div> -->
						<input type="hidden" name="shopName" value="<%=session.getAttribute("shopName")%>">
						<div class="form-group">
							<div class="label">
								<label for="password"> 食物</label>
							</div>
							<div class="field">
								<input type="text" class="input input-auto" id="foodname"
									name="foodname" size="20" placeholder="输入要添加的美食吧" />
							</div>
						</div>
						<div class="form-group">
							<div class="label">
								<label for="password"> 单价</label>
							</div>
							<div class="field">
								<input type="text" class="input input-auto" id="price"
									name="price" size="20" placeholder="输入商品价格吧" />
							</div>
						</div><br>
						<div class="form-button">
							<input style="width:100px" class="button border-sub" type="submit" value="添加">
						</div>
					</form>

				</div>
      
    </div>

    <footer class="admin-content-footer">
      <hr>
      <p class="am-padding-left">© 2018 auto思维有限公司.</p>
    </footer>
  </div>
  <!-- content end -->

</div>

<a href="#" class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu" data-am-offcanvas="{target: '#admin-offcanvas'}"></a>


<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/amazeui.min.js"></script>
<script src="assets/js/app.js"></script>
<script src="layui/layui.js"></script>

</body>
</html>