<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html class="no-js">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>分配任务-教学管理系统</title>
  <meta name="description" content="这是一个form页面">
  <meta name="keywords" content="form">
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
          <c:if test="${user.type==0 }">
	          <li><a href="${pageContext.request.contextPath}/work/mywork"><span class="am-icon-th"></span> 我的作业<span class="am-badge am-badge-secondary am-margin-right am-fr">${myWorkCount }</span></a></li>
	          <li><a href="${pageContext.request.contextPath}/task/mytask"><span class="am-icon-th"></span> 我的任务<span class="am-badge am-badge-secondary am-margin-right am-fr">${myTaskCount }</span></a></li>
          </c:if>
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
    <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">分配任务</strong> / <small>Distribute</small></div>
  </div>

  <div class="am-tabs am-margin" data-am-tabs>
    <ul class="am-tabs-nav am-nav am-nav-tabs">
      <c:forEach var="obj" items="${userList}" varStatus="status">
      	  <li class="<c:if test="${status.index==0}">am-active</c:if>"><a href="#tab${status.index+1}">${obj.name }的任务</a></li>
      </c:forEach>
    </ul>
	
    <div class="am-tabs-bd">
      <c:forEach var="obj" items="${userList}" varStatus="status">
	      <div class="am-tab-panel am-fade <c:if test="${status.index==0}"> am-in am-active</c:if>" id="tab${status.index+1}">
	        <form class="am-form">
	          <c:if test="${obj.task!=null and obj.task.content!='' }">
	          	<div class="am-g am-margin-top-sm">
		            <div class="am-u-sm-2 am-text-right">
		              	已分配任务
		            </div>
		            <div class="am-u-sm-10">
		              <textarea rows="10" placeholder="" id="description" readonly="readonly">${obj.task.content }</textarea>
		            </div>
	          	</div>
	          	<div class="am-g am-margin-top">
	            <div class="am-u-sm-2 am-text-right">
	             	任务进度
	            </div>
	            <div class="am-u-sm-4">
	              <input type="text" class="am-input-sm" id="process" value="${obj.task.process }" readonly="readonly">
	            </div>
	            <div class="am-u-sm-6" ></div>
	          </div>
	          	<div class="am-g am-margin-top">
	            <div class="am-u-sm-2 am-text-right">
	             	分配时间
	            </div>
	            <div class="am-u-sm-4">
	              <input type="text" class="am-input-sm" id="time" value="${obj.task.time }" readonly="readonly">
	            </div>
	            <div class="am-u-sm-6" ></div>
	          </div>
	          </c:if>
	          <div class="am-g am-margin-top-sm">
	            <div class="am-u-sm-2 am-text-right">
	              	${obj.task==null?"任务详情":"追加任务"}
	            </div>
	            <div class="am-u-sm-10">
	              <textarea rows="10" placeholder="" id="description${status.index+1}"></textarea>
	            </div>
	            	<input type="hidden" id="userId${status.index+1}" value="${obj.id}">
	          </div>
	        </form>
	        <div class="am-margin" style="float: right">
			    <button type="button" class="am-btn am-btn-primary am-btn-xs" onclick="javascript:assgin(${status.index+1});">提交保存</button>
		  </div>
	      </div>
      </c:forEach>
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
function assgin(id) {
	var userId = $("#userId"+id).val();
	var description = $("#description"+id).val();
	$.post("${pageContext.request.contextPath}/task/assgin",
			{userId:userId,workId:${task.workId},projectId:${task.projectId},groupId:${task.groupId},content:description},
		function(data){
			if(data.code==1){
				layer.msg(data.message,{icon: 1});
				setTimeout(function () {
	                window.location.reload();
	            }, 1500);
			}else{
				layer.msg(data.message,{icon: 5});
			}
	})
}

</script>
</body>
</html>
