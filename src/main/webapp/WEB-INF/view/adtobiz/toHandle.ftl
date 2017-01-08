<#assign base = request.contextPath/>
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">广告关系信息</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				<i class="fa fa-list a-fw"></i> 广告关系列表信息
			</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<div class="">
					<form role="form" class="searchatbform form-inline">
						<input type="hidden" class="searchform" name="searchform" value="searchatbform" />
						<div class="row">
							<div class="col-sm-6">
								<label>广告ID:<input name="adid" placeholder="" class="form-control" value="${searchatbform.adid!''}" ></label>
							</div>
							<div class="col-sm-6">
								<label>备注信息:<input  name="remark" plamceholder="" class="form-control" value="${searchatbform.remark!''}" ></label>
							</div>
						</div>
						</br>
						<div class="row">
							<div class="col-sm-6">
								<label>商家ID:<input  name="bizid" placeholder="" class="form-control " value="${searchatbform.bizid!''}" ></label>
							</div>
							<div class="col-sm-6">
								<button type="button" class="searchatbbutton btn btn-primary" >
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
								<th class="text-center">商户ID</th>
								<th class="text-center">二维码路径</th>
								<th class="text-center">二维码图片</th>
								<th class="text-center">备注</th>
								<th class="text-center">操作</th>
							</tr>
						</thead>
						<tbody>
							<#if page??>
								<#list page.list as ad2b>
									<tr class="odd gradeX">
										<td class="text-center">${ad2b.adid!""}</td>
										<td class="text-center">${ad2b.bizid!""}</td>
										<td class="text-center">${basePath}\${ad2b.codeurl!""}</td>
										<td class="text-center"><img src="${basePath}\${ad2b.codeurl!''}"/></td>
										<td class="text-center">${ad2b.remark!""}</td>
										<td class="text-center">
											<button type="button" class="btn btn-warning btn-sm" onclick="Ad2B.toEdit(${ad2b.pid!''}, '${ad2b.adid!''}', '${ad2b.bizid!''}', '${ad2b.codeurl!''}', '${ad2b.remark!''}');" data-toggle="modal" data-target="#editATBModal" ><span class="glyphicon glyphicon-edit" ariadden="true"></span> 修改</button>
											<button type="button" class="btn btn-danger btn-sm" onclick="Ad2B.toRemove(${ad2b.pid!''}, '${ad2b.adid!''}', '${ad2b.bizid!''}');" data-toggle="modal" data-target="#removeATBModal" ><span class="glyphicon glyphicon-trash" aria-hidden="true"></span> 删除</button>
										</td>
									</tr>
								</#list>
							<#else>
								<tr class="odd gradeX">
									<td class="center" colspan="6" >未查到信息！</td>
								</tr>
							</#if>
						</tbody>
					</table>
					<div class="atbpage " >
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
<div class="modal fade" id="editATBModal" tabindex="-1" role="dialog" aria-labelledby="myEditATBModal" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myEditATBModal">编辑广告关系信息</h4>
      </div>
      <div class="modal-body">
      	<form role="form" class="editatbform">
      		<input type="hidden" class="pid" name="pid" value="" />
      		<div class="form-group">
    			<label>广告ID</label>
    			<input type="text" class="adid form-control" name="adid" placeholder="Enter text">
  			</div>
  			<div class="form-group">
    			<label>商家ID</label>
    			<input type="text" class="bizid form-control" name="bizid" placeholder="Enter text">
  			</div>
			<div class="form-group">
    			<label>二维码路径</label>
    			<input type="text" class="codeurl form-control" name="codeurl" placeholder="Enter text">
  			</div>
  			<div class="form-group">
    			<label>备注</label>
    			<textarea class="remark form-control" rows="3" name="remark" placeholder="请输入广告描述..."></textarea>
  			</div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="editatbsubmit btn btn-primary" >保存</button>
      </div>
    </div>
  </div>
</div>
<!-- 删除Modal -->
<div class="modal fade" id="removeATBModal" tabindex="-1" role="dialog" aria-labelledby="myRemoveATBModal" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myRemoveATBModal">删除提醒</h4>
      </div>
      <div class="modal-body">
      	<form role="form" class="removeatbform">
      		<input type="hidden" name="pid" class="pid" value="" />
        	<h4>确定要删除 广告 <em><span class="adid"></span></em> 和 商户 <em><span class="bizid"></span></em> 的关系吗？</h4>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="removeatbsubmit btn btn-danger" >提交</button>
      </div>
    </div>
  </div>
</div>