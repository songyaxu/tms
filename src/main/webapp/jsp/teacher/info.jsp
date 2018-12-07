<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html class="no-js">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>个人信息-教学管理系统</title>
  <meta name="description" content="这是一个 user 页面">
  <meta name="keywords" content="user">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp" />
  <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets/i/favicon.png">
  <link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/assets/i/app-icon72x72@2x.png">
  <meta name="apple-mobile-web-app-title" content="教学管理系统" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/amazeui.min.css"/>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin.css">
</head>
<body>
<!--[if lte IE 9]>
<p class="browsehappy">你正在使用<strong>过时</strong>的浏览器，Amaze UI 暂不支持。 请 <a href="http://browsehappy.com/" target="_blank">升级浏览器</a>
  以获得更好的体验！</p>
<![endif]-->

<header class="am-topbar admin-header">
  <div class="am-topbar-brand">
    <strong>教学管理系统</strong>
  </div>

  <button class="am-topbar-btn am-topbar-toggle am-btn am-btn-sm am-btn-success am-show-sm-only" data-am-collapse="{target: '#topbar-collapse'}"><span class="am-sr-only">导航切换</span> <span class="am-icon-bars"></span></button>

  <div class="am-collapse am-topbar-collapse" id="topbar-collapse">

    <ul class="am-nav am-nav-pills am-topbar-nav am-topbar-right admin-header-list">
      <li><a href="${pageContext.request.contextPath}/message/myreceiver/0"><span class="am-icon-envelope-o"></span> 收件箱 <span class="am-badge am-badge-warning">${unreadCount eq 0 ? "":unreadCount}</span></a></li>
      <li class="am-dropdown" data-am-dropdown>
        <a class="am-dropdown-toggle" data-am-dropdown-toggle href="javascript:;">
          <span class="am-icon-users"></span> ${user.name }-${user.type==0 ?"学生":"教师" } <span class="am-icon-caret-down"></span>
        </a>
        <ul class="am-dropdown-content">
          <li><a href="${pageContext.request.contextPath}/user/info"><span class="am-icon-user"></span> 资料</a></li>
          <li><a href="${pageContext.request.contextPath}/user/logout"><span class="am-icon-power-off"></span> 退出</a></li>
        </ul>
      </li>
      <li><a href="javascript:;" id="admin-fullscreen"><span class="am-icon-arrows-alt"></span> <span class="admin-fullText">开启全屏</span></a></li>
    </ul>
  </div>
</header>

<div class="am-cf admin-main">
    <!-- sidebar start -->
  <div class="admin-sidebar">
    <ul class="am-list admin-sidebar-list">
      <li><a href="${pageContext.request.contextPath}/user/index"><span class="am-icon-home"></span> 首页</a></li>
      <li class="admin-parent">
        <a class="am-cf" data-am-collapse="{target: '#collapse-nav'}"><span class="am-icon-file"></span> 页面模块 <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
        <ul class="am-list am-collapse admin-sidebar-sub am-in" id="collapse-nav">
          <li><a href="${pageContext.request.contextPath}/user/info" class="am-cf"><span class="am-icon-check"></span> 个人资料<span class="am-icon-star am-fr am-margin-right admin-icon-yellow"></span></a></li>
          <c:if test="${user.type==1 }">
          	<li><a href="${pageContext.request.contextPath}/project/publish/init"><span class="am-icon-puzzle-piece"></span> 发布项目</a></li>
          </c:if>
          <li><a href="${pageContext.request.contextPath}/project/check/project"><span class="am-icon-puzzle-piece"></span> 查看项目</a></li>
          <li><a href="${pageContext.request.contextPath}/project/myproject"><span class="am-icon-th"></span> 我的项目<span class="am-badge am-badge-secondary am-margin-right am-fr">${myProjectCount }</span></a></li>
          <li><a href="${pageContext.request.contextPath}/message/init"><span class="am-icon-edit"></span> 写邮件</a></li>
          <li><a href="${pageContext.request.contextPath}/message/myreceiver/0"><span class="am-icon-inbox"></span> 收件箱</a></li>
          <li><a href="${pageContext.request.contextPath}/message/mysend/0"><span class="am-icon-send"></span> 发件箱</a></li>
        </ul>
      </li>
      <li><a href="${pageContext.request.contextPath}/user/logout"><span class="am-icon-sign-out"></span> 注销</a></li>
    </ul>

    <div class="am-panel am-panel-default admin-sidebar-panel">
      <div class="am-panel-bd">
        <p><span class="am-icon-bookmark"></span> 公告</p>
        <p>合理安排学习和休息，才能事半功倍。</p>
      </div>
    </div>
  </div>
  <!-- sidebar end -->

  <!-- content start -->
  <div class="admin-content">
    <div class="am-cf am-padding">
      <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">个人资料</strong> / <small>Personal information</small></div>
    </div>

    <hr/>

    <div class="am-g">

      <div class="am-u-sm-12 am-u-md-4 am-u-md-push-8">
        <div class="am-panel am-panel-default" style="display: none">
          <div class="am-panel-bd">
            
          </div>
        </div>

        <div class="am-panel am-panel-default" style="display: none">
          <div class="am-panel-bd">
           
          </div>
        </div>

      </div>

      <div class="am-u-sm-12 am-u-md-8 am-u-md-pull-4">
        <form class="am-form am-form-horizontal" id="updateForm">
          
          <div class="am-form-group">
            <label for="user-name" class="am-u-sm-3 am-form-label">ID</label>
            <div class="am-u-sm-9">
              <input type="text" id="id" name="id" value="${user.id}" readonly="readonly"/>
            </div>
          </div>
          
          <div class="am-form-group">
            <label for="user-name" class="am-u-sm-3 am-form-label">姓名</label>
            <div class="am-u-sm-9">
              <input type="text" id="name" name="name" placeholder="姓名" value="${user.name}">
            </div>
          </div>

          <div class="am-form-group">
            <label for="user-email" class="am-u-sm-3 am-form-label">邮箱</label>
            <div class="am-u-sm-9">
              <input type="email" id="email" name="email" placeholder="输入你的电子邮件 "  value="${user.email}" >
            </div>
          </div>
			
		  <div class="am-form-group">
            <label for="userphone" class="am-u-sm-3 am-form-label">电话</label>
            <div class="am-u-sm-9">
              <input type="text" id="phone" name="phone" value="${user.phone}" placeholder="输入你的电话号码">
            </div>
          </div>
			
			
          <div class="am-form-group">
            <label for="user-newpwd" class="am-u-sm-3 am-form-label">新密码</label>
            <div class="am-u-sm-9">
              <input type="text" id="pwd" name="pwd" placeholder="输入你的新密码">
            </div>
          </div>

          <div class="am-form-group">
            <label for="user-oldpwd" class="am-u-sm-3 am-form-label">原密码</label>
            <div class="am-u-sm-9">
              <input type="text" id="oldpwd" name="oldpwd" placeholder="输入你的原密码">
              <small>修改密码需输入原密码</small>
            </div>
          </div>

          <div class="am-form-group">
            <label for="user-intro" class="am-u-sm-3 am-form-label">简介</label>
            <div class="am-u-sm-9">
              <textarea class="" rows="5" id="resume" name="resume" placeholder="输入个人简介">${user.resume}</textarea>
            </div>
          </div>

          <div class="am-form-group">
            <div class="am-u-sm-9 am-u-sm-push-3">
              <button type="button" class="am-btn am-btn-primary" onclick="javascript:update();">保存修改</button>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
  <!-- content end -->

</div>

<footer>
  <hr>
  <p class="am-padding-left">© 2018 版权所有.</p>
</footer>

<!--[if lt IE 9]>
<script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="assets/js/polyfill/rem.min.js"></script>
<script src="assets/js/polyfill/respond.min.js"></script>
<script src="assets/js/amazeui.legacy.js"></script>
<![endif]-->

<!--[if (gte IE 9)|!(IE)]><!-->
<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/amazeui.min.js"></script>
<!--<![endif]-->
<script src="${pageContext.request.contextPath}/assets/js/app.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/layer/layer.js"></script>
<script type="text/javascript">
	function update() {  
		 var pwd = $("#pwd").val();
		 var oldpwd=$("#oldpwd").val();
		 if((pwd!=null&&pwd!="")&&(oldpwd==null&&oldpwd===""))
		 {
			 layer.msg("修改密码需填写原密码", {icon: 5});
			 return;
		 }
	     var formData = new FormData($( "#updateForm" )[0]);  
	     $.ajax({  
	          url: '${pageContext.request.contextPath}/user/update' ,  
	          type: 'POST',  
	          data: formData,  
	          async: false,  
	          cache: false,  
	          contentType: false,  
	          processData: false,  
	          success: function (data) {  
	        	  if(data.code==1)
	        	  {
	        		  layer.msg(data.message, {icon: 1});
	        	  }
	        	  else{
	        		  layer.msg(data.message, {icon: 5});
	        	  }
	          },  
	          error: function (returndata) {  
	        	  layer.msg(data.message, {icon: 5});
	          }  
	     });
	}
</script>
</body>
</html>
