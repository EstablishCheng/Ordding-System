<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!doctype html>
<html lang="zh">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>login</title>
<link rel="stylesheet" type="text/css" href="css/styles.css">
  <link rel="stylesheet" href="layui/css/layui.css">
<style type="text/css">
body,td,th { font-family: "Source Sans Pro", sans-serif; }
body { background-color: #2B2B2B; }
select{
  border: 1px solid rgba(255, 255, 255, 0.4);
  background-color: rgba(255, 255, 255, 0.2);
  width: 250px;
  border-radius: 3px;
  padding: 10px 15px;
  margin: 0 auto 10px auto;
  text-align: center;
  font-size: 14px;
  color: white;
  -webkit-transition-duration: 0.25s;
          transition-duration: 0.25s;
  font-weight: 300;
  }
  select option{
   color:black;
  }
</style>
</head>
<body>
<div class="wrapper">
	<div class="container">
		<h1 style="font-size:30px">欢迎登录订餐管理系统</h1><br>
		<h3 style="color: red;"><%=request.getAttribute("message") %></h3>
		<form class="form" method="post" action="login.action">
				<select name="type" lay-verify="required">
					<option value="">请选择登录类型</option>
					<option value="shop">商家</option>
					<option value="admin">管理员</option>
					<option value="user">用户</option>
				</select> 
			<input name="name" type="text" placeholder="Username">
			<input name="password" type="password" placeholder="Password">
			<button type="submit" id="login-button">Login</button>
		</form>
	</div>	
	<ul class="bg-bubbles">
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
	</ul>	
</div>
</body>
</html>