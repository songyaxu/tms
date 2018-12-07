<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head lang="en">
<meta charset="UTF-8">
<title>登录-教学管理系统</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="format-detection" content="telephone=no">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="alternate icon" type="image/png"
	href="${pageContext.request.contextPath}/assets/i/favicon.png">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/amazeui.min.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/layer/layer.js"></script>
<style>
.header {
	text-align: center;
}

.header h1 {
	font-size: 200%;
	color: #333;
	margin-top: 30px;
}

.header p {
	font-size: 14px;
}
</style>
</head>
<body>
	<div class="header">
		<hr />
	</div>
	<div class="am-g">
		<div class="am-u-lg-6 am-u-md-8 am-u-sm-centered">
			<h3>登录</h3>
			<hr>
			<br> <br>

			<form class="am-form">
				<label for="id">用户名:</label> 
				<input type="text" name="id" id="id" value="111"> <br> 
				<label for="password">密码:</label>
				<input type="password" name="pwd" id="pwd" value="111"> <br />
				<div class="am-cf">
					<input type="button" value="登录"
						class="am-btn am-btn-primary am-btn-sm am-fl"
						onclick="javascript:login();">
				</div>
			</form>
			<hr>
			<p>© 2018 版权所有.</p>
		</div>
	</div>
</body>
<script type="text/javascript">
function login(){
	var id=$("#id").val();
	var pwd=$("#pwd").val();
	$.get("${pageContext.request.contextPath}/user/login",{id:id,pwd:pwd},
	    function(data){
		if(data.code==1){
			layer.msg(data.message, {
				  icon: 16
				  ,shade: 0.01
				});
            setTimeout(function () {
                window.location = "${pageContext.request.contextPath}/user/index";
            }, 1500);
		}
		else{
			layer.msg(data.message, {icon: 5});
		}
        
    });
}
</script>
</html>