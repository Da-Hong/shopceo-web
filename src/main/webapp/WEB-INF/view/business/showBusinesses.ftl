<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">商户信息</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading"><i class="fa fa-list a-fw"></i> 商户信息列表</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<div class="">
					<form role="form" class="searchbusinessform">
						<input type="hidden" class="searchform" name="searchform" value="searchbusinessform" />
						<div class="row">
							<div class="col-sm-4">
								<label>商户ID:<input name="businessId" placeholder="" class="form-control input-sm" value="${searchbusinessform.businessId!''}" ></label>
							</div>
							<div class="col-sm-4">
								<label>商户名:<input  name="name" placeholder="" class="form-control input-sm" value="${searchbusinessform.name!''}" ></label>
							</div>
							<div class="col-sm-4">
								<label>分店名:<input  name="branchName" placeholder="" class="form-control input-sm" value="${searchbusinessform.branchName!''}" ></label>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-4">
								<label>地址:<input  name="address" placeholder="" class="form-control input-sm" value="${searchbusinessform.address!''}" ></label>
							</div>
							<div class="col-sm-4">
								<label>所在城市:<input  name="city" placeholder="" class="form-control input-sm" value="${searchbusinessform.city!''}" ></label>
							</div>
							<div class="col-sm-4">
								<button type="button" class="searchbusinessbutton btn btn-primary" >
									<span class="glyphicon glyphicon-search" aria-hidden="true"></span> 查询
								</button>
							</div>
						</div>
					</form>
					<hr>
					<table class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th class="text-center">商户ID</th>
								<th class="text-center">商户名</th>
								<th class="text-center">分店名</th>
								<th class="text-center">地址</th>
								<th class="text-center">邮箱</th>
								<th class="text-center">手机号</th>
								<th class="text-center">带区号的电话</th>
								<th class="text-center">所在城市</th>
								<th class="text-center">商户页面链接</th>
								<th class="text-center">操作</th>
							</tr>
						</thead>
						<tbody>
							<#if page??>
								<#list page.list as bs>
									<tr class="odd gradeX">
										<td class="text-center">${bs.businessId!""}</td>
										<td class="text-center">${bs.name!""}</td>
										<td class="text-center">${bs.branchName!""}</td>
										<td class="text-center">${bs.address!""}</td>
										<td class="text-center">${bs.email!""}</td>
										<td class="text-center">${bs.phone!""}</td>
										<td class="text-center">${bs.telephone!""}</td>
										<td class="text-center">${bs.city!""}</td>
										<td class="text-center">${bs.businessUrl!""}</td>
										<td class="text-center">
											<button type="button" class="btn btn-warning btn-sm" onclick="toEditBusiness(${bs.id});" data-toggle="modal" data-target="#editBusinessModal" ><span class="glyphicon glyphicon-edit" aria-hidden="true"></span> 修改</button>
											<button type="button" class="btn btn-danger btn-sm" onclick="toRemoveBusiness(${bs.id});" data-toggle="modal" data-target="#removeBusinessModal" ><span class="glyphicon glyphicon-trash" aria-hidden="true"></span> 删除</button>
										</td>
									</tr>
								</#list>
							<#else>
								<tr class="odd gradeX">
									<td class="center" colspan="10" >未查到商户信息！</td>
								</tr>
							</#if>
						</tbody>
					</table>
					<div class="businesspage " >
						<#include "../pagination.ftl" encoding="UTF-8">
						<@pagination page! />
					</div>
				</div>
				<!-- /.table-responsive -->
			</div>
			<!-- /.panel-body -->
		</div>
		<!-- /.panel -->
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<!-- 编辑Modal -->
<div class="modal fade" id="editBusinessModal" tabindex="-1" role="dialog" aria-labelledby="myEditBusinessModal" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myEditBusinessModal">编辑商户信息</h4>
      </div>
      <div class="modal-body">
      
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="editbusinesssubmit btn btn-primary" data-dismiss="modal">保存</button>
      </div>
    </div>
  </div>
</div>
<!-- 删除Modal -->
<div class="modal fade" id="removeBusinessModal" tabindex="-1" role="dialog" aria-labelledby="myRemoveBusinessModal" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myRemoveBusinessModal">删除提醒</h4>
      </div>
      <div class="modal-body">
        <h4>确定要删除吗？</h4>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="removebusinesssubmit btn btn-danger" data-dismiss="modal">提交</button>
      </div>
    </div>
  </div>
</div>