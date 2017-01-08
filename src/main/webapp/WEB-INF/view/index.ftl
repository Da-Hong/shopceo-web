<!DOCTYPE html>
<html lang="zh">
<head>


<title>懒猪科技--首页</title>

<#include "head.ftl" encoding="UTF-8">

</head>
<body>
	<#-- spring 拦截器设置的绝对路径attribute -->
	<input type="hidden" id="base" value="${basePath}" />
	<div id="wrapper">

		<!-- Navigation -->
		<nav class="navbar navbar-default navbar-static-top" role="navigation"
			style="margin-bottom: 0">
			<#include "menu.ftl" encoding="UTF-8">
		</nav>

		<div id="page-wrapper">
			<#include "dashboard/dashboard.ftl" encoding="UTF-8">
		</div>
		<!-- /#page-wrapper -->

	</div>
	<!-- /#wrapper -->

	<#include "foot.ftl" encoding="UTF-8">

</body>
</html>