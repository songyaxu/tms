<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html class="no-js">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>查看项目 - 教学管理系统</title>
  <meta name="description" content="这是一个 table 页面">
  <meta name="keywords" content="table">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp" />
  <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets/i/favicon.png">
  <link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/assets/i/app-icon72x72@2x.png">
  <meta name="apple-mobile-web-app-title" content="Amaze UI" />
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
      <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">所有项目</strong> / <small>AllProject</small></div>
    </div>

    <div class="am-g">
      <div class="am-u-md-6 am-cf">
        <div class="am-fl am-cf">
          <div class="am-btn-toolbar am-fl">
            <div class="am-btn-group am-btn-group-xs">
            </div>
          </div>
        </div>
      </div>
      <div class="am-u-md-3 am-cf">
        <div class="am-fr">
          <div class="am-input-group am-input-group-sm">
            <input type="text" class="am-form-field" id="key" value="${projectKey }" onchange="pageTurn(0);">
                <span class="am-input-group-btn">
                  <button class="am-btn am-btn-default" type="button" onclick="pageTurn(0);">搜索</button>
                </span>
          </div>
        </div>
      </div>
    </div>

    <div class="am-g">
      <div class="am-u-sm-12">
          <table class="am-table am-table-striped am-table-hover table-main">
            <thead>
              <tr>
                </th><th class="table-id">#</th><th class="table-type">教师</th><th class="table-author">标题</th><th class="table-date">发布时间</th><th class="table-set">操作</th>
              </tr>
          </thead>
          <tbody>
            <c:forEach var="obj" items="${checkProjectList}" varStatus="status">
          <tr>
          	<td>${status.index+1}</td><td><a href="${pageContext.request.contextPath}/user/detail/${obj.userId}">${obj.userName}</a></td><td><a href="javascript:detail(${obj.id})">${obj.title}</a></td><td>${obj.time }</td>
            <td>
                <div class="am-btn-toolbar">
                  <div class="am-btn-group am-btn-group-xs">
                  	<button class="am-btn am-btn-default am-btn-xs am-text-default" onclick="javascript:detail(${obj.id})"><span class="am-icon-check-circle-o"></span>查看详情</button>
                    <button class="am-btn am-btn-default am-btn-xs am-text-secondary" onclick="javascript:checkWork(${obj.id})"><span class="am-icon-pencil-square-o"></span> 查看作业</button>
                    <c:if test="${ user.type==0}">
                    	<button class="am-btn am-btn-default am-btn-xs" onclick="javascript:master(${obj.id})"><span class="am-icon-sitemap"></span>申请组长</button>
                    	<button class="am-btn am-btn-default am-btn-xs am-text-primary" onclick="javascript:group(${obj.id})"><span class="am-icon-plus"></span>加入小组</button>
                  	</c:if>
                  </div>
                </div>
              </td>
          </tr>
          </c:forEach>
          </tbody>
        </table>
          <div class="am-cf">
  共 ${checkProjectPage.totalCount } 条记录
  <div class="am-fr">
    <ul class="am-pagination">
      <li class="${checkProjectPage.hasPrePage eq true ? '':'am-disabled'}"><a href="<c:if test="${checkProjectPage.hasPrePage eq true}">javascript:pageTurn(${checkProjectPage.currentPage-1})</c:if>">«</a></li>
	  <c:if test="${checkProjectPage.hasPrePage==true}">
			<li><a href="javascript:pageTurn(${checkProjectPage.currentPage-1})">${checkProjectPage.currentPage-1}</a></li>
	  </c:if>
      <li class="am-active"><a href="#">${checkProjectPage.currentPage }</a></li>
      <c:if test="${checkProjectPage.currentPage+1<=checkProjectPage.totalPage}">
			<li><a href="javascript:pageTurn(${checkProjectPage.currentPage+1})">${checkProjectPage.currentPage+1}</a></li>
	  </c:if>
	  <c:if test="${checkProjectPage.currentPage+2<=checkProjectPage.totalPage}">
			<li><a href="javascript:pageTurn(${checkProjectPage.currentPage+2})">${checkProjectPage.currentPage+2}</a></li>
	  </c:if>
	  <c:if test="${checkProjectPage.currentPage+3<=checkProjectPage.totalPage}">
			<li><a href="javascript:pageTurn(${checkProjectPage.currentPage+3})">${checkProjectPage.currentPage+3}</a></li>
	  </c:if>
      <li class="${checkProjectPage.hasNextPage eq true ? '':'am-disabled'}"><a href="<c:if test="${checkProjectPage.hasNextPage==true}">javascript:pageTurn(${checkProjectPage.currentPage+1})</c:if>">»</a></li>
    </ul>
  </div>
</div>
      </div>

    </div>
  </div>
  <!-- content end -->
</div>

<footer>
  <hr>
  <p>© 2018 版权所有.</p>
</footer>

<!--[if (gte IE 9)|!(IE)]><!-->
<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/amazeui.min.js"></script>
<!--<![endif]-->
<script src="${pageContext.request.contextPath}/assets/js/app.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/layer/layer.js"></script>
<script type="text/javascript">
$(function(){
   $("#key").focus();
   var result=$("#key").val();
   $("#key").val("")
   $("#key").val(result);
   $("#key")[0].scrollLeft=700;
})
function detail(id){
	setTimeout(function () {
		window.location = "${pageContext.request.contextPath}/project/detail/"+id;
    }, 1);
}
function group(id){
	setTimeout(function () {
		window.location = "${pageContext.request.contextPath}/group/detail/"+id;
    }, 1);
}
function checkWork(id){
	setTimeout(function () {
		window.location = "${pageContext.request.contextPath}/work/check/worklist/"+id;
    }, 1);
}
function pageTurn(page){
	var key = $("#key").val();
	setTimeout(function () {
		window.location = "${pageContext.request.contextPath}/project/check/project?page="+page+"&key="+key;
    }, 0);
}
function master(id){
	$.get("${pageContext.request.contextPath}/message/master/"+id,
		    function(data){
			if(data.code==1){
				layer.msg(data.message, {icon: 1});
			}
			else{
				layer.msg(data.message, {icon: 5});
			}
	        
	    });
}
</script>
</body>
</html>
