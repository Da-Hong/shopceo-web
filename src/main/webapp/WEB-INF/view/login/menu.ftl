<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse"
			data-target=".navbar-collapse">
			<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span>
			<span class="icon-bar"></span> <span class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="${basePath}/index.html">懒猪科技</a>
	</div>
	<!-- /.navbar-header -->

	<ul class="nav navbar-top-links navbar-right">
		
		<li class="dropdown">
		<a class="dropdown-toggle" data-toggle="dropdown" href="#"> 
			<i class="fa fa-user fa-fw"></i> ${nowuser!''} <i class="fa fa-caret-down"></i>
		</a>
		<ul class="dropdown-menu dropdown-user">
			<li>
				<a href="javascript:;">
					<i class="fa fa-user fa-fw"></i> User Profile
				</a>
			</li>
			<li><a href="javascript:;"><i class="fa fa-gear fa-fw"></i> Settings</a></li>
			<li class="divider"></li>
			<li><a href="${basePath}/out.html" class=""><i class="fa fa-sign-out fa-fw"></i>退出</a></li>
		</ul> 
		<!-- /.dropdown-user -->
	</li>
	<!-- /.dropdown -->
	</ul>
	<!-- /.navbar-top-links -->

	<div class="navbar-default sidebar" role="navigation">
		<div class="sidebar-nav navbar-collapse">
			<ul class="nav" id="side-menu">
				<li>
					<a href="${basePath}/index.html"><i class="fa fa-dashboard fa-fw"></i>Dashboard</a>
				</li>
				<li>
					<a href="#">
						<i class="fa fa-list-alt fa-fw"></i>
						广告管理
						<span class="fa arrow"></span>
					</a>
					<ul class="nav nav-second-level">
						<li><a href="javascript:;" class="queryadv"><i class="fa fa-search fa-fw"></i> 查询广告</a></li>
						<li><a href="javascript:;" class="addadv"><i class="fa fa-plus fa-fw"></i> 添加广告</a></li>
					</ul> 
					<!-- /.nav-second-level -->
				</li>
				<li>
					<a href="#">
						<i class="fa fa-list-alt fa-fw"></i>
						广告关系管理
						<span class="fa arrow"></span>
					</a>
					<ul class="nav nav-second-level">
						<li><a href="javascript:;" class="hanldeadv"><i class="fa fa-search fa-fw"></i> 查询广告关系</a></li>
						<li><a href="javascript:;" class="addhandle"><i class="fa fa-plus fa-fw"></i> 添加广告关系</a></li>
					</ul> 
					<!-- /.nav-second-level -->
				</li>
			</ul>
		</div>
		<!-- /.sidebar-collapse -->
	</div>
	<!-- /.navbar-static-side -->