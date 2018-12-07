<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html class="no-js">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>布置作业-教学管理系统</title>
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
  <script type="text/javascript" src="${pageContext.request.contextPath}/assets/laydate/laydate.js"></script>
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
    <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">布置作业</strong> / <small>publish</small></div>
  </div>

  <div class="am-tabs am-margin" data-am-tabs>
    <ul class="am-tabs-nav am-nav am-nav-tabs">
      <li class="am-active"><a href="#tab1">基本信息</a></li>
      <li><a href="#tab2">附加文件</a></li>
      <li><a href="#tab3">作业描述</a></li>
    </ul>

    <div class="am-tabs-bd">
      <div class="am-tab-panel am-fade am-in am-active" id="tab1">
        <form class="am-form">
          <div class="am-g am-margin-top">
            <div class="am-u-sm-2 am-text-right">
              作业标题
            </div>
            <div class="am-u-sm-4">
              <input type="text" class="am-input-sm" id="title" readonly="readonly" value="${project.title }-作业${workFlag+1}"> 
            </div>
            <div class="am-u-sm-6" ></div>
          </div>
          <div class="am-g am-margin-top-sm">
            <div class="am-u-sm-2 am-text-right">
              作业内容
            </div>
            <div class="am-u-sm-10">
              <textarea rows="10" placeholder="" id="content"></textarea>
            </div>
          </div>
          <div class="am-g am-margin-top">
          <div class="am-u-sm-2 am-text-right">
            提交时间
          </div>
          <div class="am-u-sm-4">
              <div class="am-form-group am-form-icon">
                <i class="am-icon-calendar"></i>
                <input type="text" class="am-form-field am-input-sm" placeholder="时间" id="time">
              </div>
          </div>
          <div class="am-u-sm-6" ></div>
          </div>
          <input id="attachment" name="attachment" type="hidden">
		  <script type="text/javascript">
		  laydate.render({
			  elem: '#time'
			  ,type: 'datetime'
			});
		  </script>
        </form>

      </div>

      <div class="am-tab-panel am-fade" id="tab2">
         <div class="am-u-md-8">
           <p>你可以上传项目的相关文档，如有多个文档请打包。 </p>
           <form class="am-form" id="uploadForm">
             <div class="am-form-group">
               <input type="file" id="file" name="file">
               <p class="am-form-help">请选择要上传的文件...</p>
               <button type="button" class="am-btn am-btn-primary am-btn-xs" onclick="upload()">上传</button>
             </div>
           </form>
         </div>
      </div>

      <div class="am-tab-panel am-fade" id="tab3">
        <form class="am-form">
          <div class="am-g am-margin-top-sm">
            <div class="am-u-sm-2 am-text-right">
              作业描述
            </div>
            <div class="am-u-sm-10">
              <textarea rows="10" placeholder="" id="description"></textarea>
            </div>
          </div>
          </div>
        </form>
      </div>

    </div>
  </div>

  <div class="am-margin">
    <button type="button" class="am-btn am-btn-primary am-btn-xs" onclick="javascript:publish();">提交保存</button>
    <button type="button" class="am-btn am-btn-primary am-btn-xs" onclick="javascript:clr();">重置表单</button>
  </div>
</div>
<!-- content end -->

</div>


<footer>
  <hr>
  <p>© 2018 版权所有.</p>
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
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/laydate/laydate.js"></script>
<script type="text/javascript">
function upload() {  
	 if(file==="")
	 {
		 layer.msg("请选择要上传的文件", {icon: 5});
		 return;
	 }
    var formData = new FormData($( "#uploadForm" )[0]); ;  
    $.ajax({  
         url: '${pageContext.request.contextPath}/upload' ,  
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
       		  $("#attachment").val(data.data);
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
function publish(){
	var title = $("#title").val();
	var description = $("#description").val();
	var attachment= $("#attachment").val();
	var time = $("#time").val();
	var content=$("#content").val();
	if(content==="")
	{
		layer.msg("请输入作业内容",{icon: 5});
		return;
	}
   	$.get("${pageContext.request.contextPath}/work/publish",
   		{title:title,description:description,attachment:attachment,content:content,commitTime:time},
	    function(data){
   		if(data.code==1){
   			layer.msg(data.message,{icon: 1});
   			setTimeout(function () {
                window.location.reload();
            }, 1500);
   		}
   		else{
   			layer.msg(data.message, {icon: 5});
   		}
           
    });
}
function clr(){
	$("#description").val("");
	$("#attachment").val("");
	$("#content").val("");
	$("#file").val("");
}
</script>
</body>
</html>
