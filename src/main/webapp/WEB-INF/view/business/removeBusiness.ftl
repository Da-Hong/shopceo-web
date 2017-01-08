<div class="container-fluid">
    <div class="row">
    	<div class="col-lg-12">
    	<#if business?? >
            <form role="form" class="removebusinessform">
            	<input type="hidden" name="id" value="${business.id!''}" >
				<h4>即将删除商家<mark>${business.name!''}</mark></h4>
            </form>
        <#else>
			<h4>查无此商户信息！</h4>
        </#if>
        </div>
        <!-- /.col-lg-12 (nested) -->
    </div>
</div>