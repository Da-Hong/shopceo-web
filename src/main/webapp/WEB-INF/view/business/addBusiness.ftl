<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">添加商户</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading"><i class="fa fa-list a-fw"></i> 填写商户信息</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<div class="row">
                    <div class="col-lg-12">
                        <form role="form" class="addbusinessform">
                            <div class="form-group">
                                <label>商户ID*：</label>
                                <input class="form-control" name="businessId" placeholder="Enter text">
                            </div>
                            <div class="form-group">
                                <label>商户名*：</label>
                                <input class="form-control" name="name" placeholder="Enter text">
                            </div>
                            <div class="form-group">
                                <label>分店名</label>
                                <input class="form-control" name="branchName" placeholder="Enter text">
                            </div>
                            <div class="form-group">
                                <label>地址*：</label>
                                <input class="form-control" name="address" placeholder="Enter text">
                            </div>
                            <div class="form-group">
                                <label>邮箱*：</label>
                                <input class="form-control" name="email" placeholder="Enter text">
                            </div>
                            <div class="form-group">
                                <label>手机号*：</label>
                                <input class="form-control" name="phone" placeholder="Enter text">
                            </div>
                            <div class="form-group">
                                <label>带区号的电话</label>
                                <input class="form-control" name="telephone" placeholder="Enter text">
                            </div>
                            <div class="form-group">
                                <label>所在城市*：</label>
                                <input class="form-control" name="city" placeholder="Enter text">
                            </div>
                            <div class="form-group">
                                <label>商户页面链接</label>
                                <input class="form-control" name="businessUrl" placeholder="Enter text">
                            </div>
                            <button type="button" class="addbusinesssubmit btn btn-primary">提交</button>
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

<div class="modal fade" role="dialog" aria-labelledby="addbusinessresult" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title" id="addbusinessresult">操作结果</h4>
        </div>
        <div class="modal-body">
          <div class="container-fluid">
            <div class="row">
            </div>
            <div class="row">
            	<div class="addbusinessresult col-md-8 col-md-offset-2"></div>
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