<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">广告信息</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading"><i class="fa fa-list a-fw"></i> 广告信息列表</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<div class="">
					<form role="form" class="searchadform form-inline">
						<input type="hidden" class="searchform" name="searchform" value="searchadform" />
						<div class="row">
							<div class="col-sm-6">
								<label>广告ID:<input name="adid" placeholder="" class="form-control" value="${searchadform.adid!''}" ></label>
							</div>
							<div class="col-sm-6">
								<label>广告名:<input  name="adname" placeholder="" class="form-control" value="${searchadform.adname!''}" ></label>
							</div>
						</div>
						</br>
						<div class="row">
							<div class="col-sm-6">
								<label>广告主:<input  name="ownerid" placeholder="" class="form-control " value="${searchadform.ownerid!''}" ></label>
							</div>
							<div class="col-sm-6">
								<button type="button" class="searchadbutton btn btn-primary" >
									<span class="glyphicon glyphicon-search" aria-hidden="true"></span> 查询
								</button>
							</div>
						</div>
					</form>
                    <hr>
					<table class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th class="text-center">广告ID</th>
								<th class="text-center">广告名称</th>
								<th class="text-center">广告链接</th>
								<th class="text-center">广告描述</th>
								<th class="text-center">二维码路径</th>
								<th class="text-center">二维码图片</th>
								<th class="text-center">广告主</th>
								<th class="text-center">操作</th>
							</tr>
						</thead>
						<tbody>
							<#if page??>
								<#list page.list as ad>
									<tr class="odd gradeX">
										<td class="text-center">${ad.adid!""}</td>
										<td class="text-center">${ad.adname!""}</td>
										<td class="text-center">${ad.adurl!""}</td>
										<td class="text-center">${ad.addesc!""}</td>
										<td class="text-center">${basePath}\${ad.adtdurl!""}</td>
										<td class="text-center"><img src="${basePath}\${ad.adtdurl!''}"/></td>
										<td class="text-center ow" oid="${ad.ownerid!""}">${ad.ownerid!""}</td>
										<td class="text-center">
											<button type="button" class="btn btn-warning btn-sm" onclick="Adv.toEdit(${ad.pid!''}, '${ad.adid!''}', '${ad.adname!''}', '${ad.adurl!''}', '${ad.addesc!''}', '${ad.adtdurl!''}', '${ad.ownerid!''}');" data-toggle="modal" data-target="#editAdModal" ><span class="glyphicon glyphicon-edit" aria-hidden="true"></span> 修改</button>
											<button type="button" class="btn btn-danger btn-sm" onclick="Adv.toRemove(${ad.pid!''}, '${ad.adid!''}');" data-toggle="modal" data-target="#removeAdModal" ><span class="glyphicon glyphicon-trash" aria-hidden="true"></span> 删除</button>
										</td>
									</tr>
								</#list>
							<#else>
								<tr class="odd gradeX">
									<td class="center" colspan="8" >未查到广告信息！</td>
								</tr>
							</#if>
						</tbody>
					</table>
					<div class="adpage " >
						<#include "../pagination.ftl" encoding="UTF-8">
						<@pagination page! />
					</div>
                </div>
                <!-- /.row (nested) -->
			</div>
			<!-- /.panel-body -->
		</div>
		<!-- /.panel -->
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<!-- 编辑Modal -->
<div class="modal fade" id="editAdModal" tabindex="-1" role="dialog" aria-labelledby="myEditAdModal" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myEditAdModal">编辑广告信息</h4>
      </div>
      <div class="modal-body">
      	<form role="form" class="editadform">
      		<input type="hidden" class="pid" name="pid" value="" />
      		<div class="form-group">
    			<label>广告ID</label>
    			<input type="text" class="adid form-control" name="adid" placeholder="Enter text">
  			</div>
  			<div class="form-group">
    			<label>广告名称</label>
    			<input type="text" class="adname form-control" name="adname" placeholder="Enter text">
  			</div>
  			<div class="form-group">
    			<label>广告链接</label>
    			<input type="text" class="adurl form-control" name="adurl" placeholder="Enter text">
  			</div>
  			<div class="form-group">
    			<label>广告描述</label>
    			<textarea class="addesc form-control" rows="3" name="addesc" placeholder="请输入广告描述..."></textarea>
  			</div>
  			<div class="form-group">
    			<label>二维码路径</label>
    			<input type="text" class="adtdurl form-control" name="adtdurl" placeholder="Enter text">
  			</div>
  			<div class="form-group">
    			<label>广告主</label>
    			<input type="text" class="ownerid form-control" name="ownerid" placeholder="Enter text">
  			</div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="editadsubmit btn btn-primary" >保存</button>
      </div>
    </div>
  </div>
</div>
<!-- 删除Modal -->
<div class="modal fade" id="removeAdModal" tabindex="-1" role="dialog" aria-labelledby="myRemoveAdModal" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myRemoveAdModal">删除提醒</h4>
      </div>
      <div class="modal-body">
      	<form role="form" class="removeadform">
      		<input type="hidden" name="pid" class="pid" value="" />
        	<h4>确定要删除 <em><span class="adid"></span></em> 吗？</h4>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="removeadsubmit btn btn-danger" >提交</button>
      </div>
    </div>
  </div>
</div>