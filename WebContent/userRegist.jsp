<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户注册页面</title>
 <link rel="stylesheet" href="css/registStyle.css">
 <link rel="stylesheet" href="layui/css/layui.css">
 <link rel="stylesheet" href="pintuer/pintuer.css">
 <link rel="stylesheet" href="css/verify.css">
  <script src="pintuer/jquery.js"></script>
  <script src="pintuer/pintuer.js"></script>
  <script src="pintuer/respond.js"></script>
</head>
<style>
body{
	background-color:#aaa;
}
.D1{
	width:500px;
	margin:30px auto;
	background-color:white;
}
.D2{
	width:300px;
	height:300px;
	margin:20px auto; 
	padding-left:20px;
}
.icon{
margin-top:10px;
}
.layui-tab-title li{
padding:0 65px;
}
.button{
    padding: 6px 25px;
    border:1px solid #01AAED;
}
</style>
<body>
	<div class="D1">
		<div class="layui-tab layui-tab-card">
			<ul class="layui-tab-title">
				<li class="layui-this">用户注册</li>
				<li>商家/管理员注册</li>
			</ul>
			<p><%=request.getAttribute("message") %></p>
			<div class="layui-tab-content" style="height: 350px;">
				<!-- 用户注册 -->
				<div class="layui-tab-item layui-show">
				    <div class="D2">
					<form action="userRegist.action" method="post" class="form-auto" id="submit">
						<div class="form-group">
							<div class="field field-icon">
								<input type="text" class="input" id="username" name="username"
									size="30" placeholder="用户名" /> <span class="icon icon-user"></span>									
							</div>
						</div>
						<div class="form-group">
							<div class="field field-icon">
								<input type="password" class="input" id="password"
									name="password" size="30" placeholder="请输入密码" /> <span class="icon icon-key"></span>							
							</div>
						</div>
						<div class="form-group">
							<div class="field field-icon">
								<input type="text" class="input" id="tel"
									name="tel" size="30" placeholder="请输入电话号码" /> <span class="icon icon-fax"></span>							
							</div>
						</div>
						<div class="form-group">
							<div class="field field-icon">
								<input type="text" class="input" id="address"
									name="address" size="30" placeholder="请输入收货地址" /> <span class="icon icon-bank (alias)"></span>							
							</div>
						</div>
						<div class="form-group">
							<div class="field field-icon">
								<input type="text" class="input" id="email"
									name="email" size="30" placeholder="请输入邮箱" /> <span class="icon icon-envelope"></span>							
							</div>
						</div>
						
						<!-- 验证码 -->
						<div id="mpanel3"></div>
						
						<div class="form-button">
							<button id="check-btn2" class="button border-sub" type="button">注册</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<a href="login.jsp" class="button">登录</a>
						</div>
					</form>
					</div>
				</div>
				
				<!-- 商家注册 -->
				<div class="layui-tab-item">
				     <div class="D2">
					<form action="shopRegist.action" method="post" class="form-auto">
						<div class="form-group">
							<div class="field field-icon">
								<input type="text" class="input" id="username" name="username"
									size="30" placeholder="商铺名称" /> <span class="icon icon-user"></span>									
							</div>
						</div><br>
						<div class="form-group">
							<div class="field field-icon">
								<input type="password" class="input" id="password"
									name="password" size="30" placeholder="请输入密码" /> <span class="icon icon-key"></span>							
							</div>
						</div><br>
						<div class="form-group">
							<div class="field field-icon">
								<input type="text" class="input" id="tel"
									name="tel" size="30" placeholder="请输入电话号码" /> <span class="icon icon-fax"></span>							
							</div>
						</div>
						<div class="form-group">
						   <input type="radio"  name="type" value="shop" checked>商家&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						   <input type="radio"  name="type" value="admin">管理员
						</div><br>
						<div class="form-button">
							<button class="button border-sub" type="submit">注册</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<a href="login.jsp" class="button">登录</a>
						</div>
					</form>
					</div>
				</div>
			</div>
		</div>
	</div>

<script src="layui/layui.js"></script>
<script type="text/javascript" src="js/verify.js" ></script>
<script>
	layui.use('element', function() {
		var element = layui.element;
		//一些事件监听
		element.on('tab(demo)', function(data) {
			console.log(data);
		});
	});
	 $('#mpanel3').codeVerify({
 		type : 2,
 		figure : 100,	//位数，仅在type=2时生效
 		arith : 0,	//算法，支持加减乘，不填为随机，仅在type=2时生效
	    	width : '150px',
	    	height : '50px',
	    	fontSize : '30px',
	    	btnId : 'check-btn2',
	    	ready : function() {
	    	},
	    	success : function() {
	    		$("#submit").submit();
	    	},
	    	error : function() {
	    		alert('验证码不匹配！');
	    		return false;
	    	}
	    });
</script>
</body>
</html>