<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="dbfound-tags" prefix="d"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<d:includeLibrary />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>login</title>
<link rel="stylesheet" type="text/css" href="loginWindow/css/normalize.css" />
<link rel="stylesheet" type="text/css" href="loginWindow/css/demo.css" />
<link rel="stylesheet" type="text/css" href="loginWindow/css/component.css" />
<!--[if IE]>
<script src="js/html5.js"></script>
<![endif]-->
</head>
<body>
	<div class="container demo-1">
		<div class="content">
			<div id="large-header" class="large-header">
				<canvas id="demo-canvas"></canvas>
				<div class="logo_box">
					<h3>小声地欢迎你</h3>
					<form action="#" name="f" method="post">
						<div class="input_outer">
							<span class="u_user"></span> 
							<input id="logname" name="logname" class="text" style="color: #FFFFFF !important" type="text" placeholder="请输入账户">
						</div>
						<div class="input_outer">
							<span class="us_uer"></span> 
							<input id="logpass" name="logpass" class="text" style="color: #FFFFFF !important; position: absolute; z-index: 100;" value="" type="password" placeholder="请输入密码">
						</div>
						<div class="mb2">
							<a class="act-but submit" href="javascript:;" style="color: #FFFFFF" onclick="login();">登录</a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- /container -->
	<script src="loginWindow/js/TweenLite.min.js"></script>
	<script src="loginWindow/js/EasePack.min.js"></script>
	<script src="loginWindow/js/rAF.js"></script>
	<script src="loginWindow/js/demo-1.js"></script>
	<div style="text-align: center;"></div>
	<script>
		/* $("#login-button").click(login); */
		function login() {
			var logname = $("#logname").val();
			var logpass = $("#logpass").val();
			$.ajax({
				type: "POST", //提交的方法
				async: true,
				url:"sys/login.execute", //提交的地址
				data:{'user_code':logname,'password':logpass},
				success: function(data) { //成功
					resp=JSON.parse(data)
					if(resp.success){
						window.location.href="home/index.jsp";
					}else{
						$D.showError(resp.message);
					}
				}
			});
		}
		//密码框回车事件
		$(function(){
			$(document).keydown(function(event){
				if(event.keyCode==13){
					login();
				}
			});
		});
	</script>
</body>
</html>