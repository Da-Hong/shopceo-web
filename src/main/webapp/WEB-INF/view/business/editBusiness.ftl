<div class="container-fluid">
    <div class="row">
    	<div class="col-lg-12">
    	<#if business?? >
            <form role="form" class="editbusinessform">
            	<input type="hidden" name="id" value="${business.id!''}" >
                <div class="form-group">
                    <label>商户ID</label>
                    <input class="form-control" name="businessId" value="${business.businessId!''}" placeholder="Enter text">
                </div>
                <div class="form-group">
                    <label>商户名</label>
                    <input class="form-control" name="name" value="${business.name!''}" placeholder="Enter text">
                </div>
                <div class="form-group">
                    <label>分店名</label>
                    <input class="form-control" name="branchName" value="${business.branchName!''}" placeholder="Enter text">
                </div>
                <div class="form-group">
                    <label>地址</label>
                    <input class="form-control" name="address" value="${business.address!''}" placeholder="Enter text">
                </div>
                <div class="form-group">
                    <label>带区号的电话</label>
                    <input class="form-control" name="telephone" value="${business.telephone!''}" placeholder="Enter text">
                </div>
                <div class="form-group">
                    <label>所在城市</label>
                    <input class="form-control" name="city" value="${business.city!''}" placeholder="Enter text">
                </div>
                <div class="form-group">
                    <label>商户页面链接</label>
                    <input class="form-control" name="businessUrl" value="${business.businessUrl!''}" placeholder="Enter text">
                </div>
            </form>
        <#else>
			<h4>查无此商户信息！</h4>
        </#if>
        </div>
        <!-- /.col-lg-12 (nested) -->
    </div>
</div>