<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">新建广告关系</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading"><i class="fa fa-list a-fw"></i> 填写广告和商户关系</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<div class="row">
                    <div class="col-lg-12">
                        <form role="form" class="addhandleform">
      						<input type="hidden" class="pid" name="pid" value="" />
      						<div class="form-group">
    							<label>广告ID</label>
    							<input type="text" class="form-control" name="adid" placeholder="Enter text">
  							</div>
  							<div class="form-group">
    							<label>商家ID</label>
    							<input type="text" class="form-control" name="bizid" placeholder="Enter text" value="${businessid!''}" readonly >
  							</div>
  							<div class="form-group">
    							<label>备注</label>
    							<textarea class="form-control" rows="3" name="remark" placeholder="请输入广告描述..."></textarea>
  							</div>
                            <button type="button" class="addhandlebtn btn btn-primary">提交</button>
                            <button type="reset" class="btn btn-default">重置</button>
                        </form>
                    </div>
                    <!-- /.col-lg-12 (nested) -->
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

<div class="modal fade" id="addhandlemodal" role="dialog" aria-labelledby="addhandleresult" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title" id="addhandleresult">操作结果</h4>
        </div>
        <div class="modal-body">
          <div class="container-fluid">
            <div class="row">
            </div>
            <div class="row">
            	<div class="addhandleresult col-md-8 col-md-offset-2"></div>
            </div>
            <div class="row">
            </div>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        </div>
      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
  </div><!-- /.modal -->