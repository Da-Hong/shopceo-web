<!DOCTYPE html>
<html lang="zh">
<head>

<title>后台管理--登录页</title>

<!-- Bootstrap Core CSS -->
<link href="${basePath}/static/bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="${basePath}/static/dist/css/sb-admin-2.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="${basePath}/static/bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->

</head>
<body>
	<#-- spring 拦截器设置的绝对路径attribute -->
	<input type="hidden" id="base" value="${basePath}" />
	<div class="container">
        <div class="row">
            <div class="col-md-6 col-md-offset-3">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">欢迎登录</h3>
                    </div>
                    <div class="panel-body">
                        <form role="form" name="loginform" class="loginform">
                                <div class="form-group">
									<input class="phone form-control input-lg" placeholder="手机号..." name="phone" type="text" autofocus value="${phone!''}">
                                </div>
                                <div class="form-group">
									<input class="password form-control input-lg" placeholder="密码..." name="password" type="password" value="">
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input name="remember" type="checkbox" value="1" checked>记住我
                                    </label>
                                </div>
                                <a href="javascript:;" class="loginbtn btn btn-lg btn-success btn-block">登录</a>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

	<!-- jQuery -->
	<script src="${basePath}/static/bower_components/jquery/dist/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="${basePath}/static/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

	<!-- jQuery Validate -->
	<script src="${basePath}/static/jquery-validation/jquery.validate.min.js"></script>
	<script src="${basePath}/static/jquery-validation/messages_zh.min.js"></script>
	
	<!-- login JavaScript -->
	<script src="${basePath}/static/shopceo/jquery.cookie.js"></script>
	
	<!-- sha1 JavaScript -->
	<script src="${basePath}/static/shopceo/sha1.js"></script>

	<!-- login JavaScript -->
	<script src="${basePath}/static/shopceo/login.js"></script>

</body>
</html>