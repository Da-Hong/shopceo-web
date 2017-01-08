<#macro pagination page >
<#assign url=pageUrl pageNumber=(page.pageNum)!1 pageSize=(page.pageSize)!10 totalPage=(page.pages)!0 totalRow=(page.total)!0>
<nav class="navigation paging" role="navigation">
    <div>
        <input type="hidden" name="pageNumber" class="page-no" value="${pageNumber}" />
        <input type="hidden" name="pageSize" class="page-size" value="${pageSize}" />
    </div>
    <#if totalPage == 0>
        <div class="col-sm-12 text-center">没有记录</div>
    <#else>
		<div class="row" >
        	<div class="col-sm-3">
				<div class="page-info pull-left text-center">
					<label>共<strong>${totalRow}</strong>条 / 共<strong>${totalPage}</strong>页</label>
				</div>
			</div>
			<div class="col-sm-9">
                <ul class="pagination pull-right no-margin">
                    <#assign pagingSize = 7>
                    <!-- 首页 -->
                    <#if (totalPage > pagingSize)>
                        <#if pageNumber == 1>
                            <li class="first disabled"><a href="javascript:;">首页</a></li> 
                        <#else>
                            <li class="first" data-page-no="1"><a href="javascript:;" onclick="toPage(1, '${url}');">首页</a></li>
                        </#if>
                    </#if>
 
                    <!-- 上一页 -->
                    <#if pageNumber == 1>
                        <li class="previous disabled"><a href="javascript:;" >上一页</a></li> 
                    <#else>
                        <li class="previous" data-page-no="${pageNumber-1}"><a href="javascript:;" onclick="toPage(${pageNumber-1}, '${url}');">上一页</a></li>
                    </#if>
                     
                    <!-- 不能全部显示 -->
                    <#if (totalPage > pagingSize)>
                        <#assign startPage = pageNumber - (pagingSize / 2) ? floor>
                        <#if (startPage < 1)>
                            <#assign startPage = 1>
                        </#if>
                         
                        <#assign endPage = startPage + pagingSize - 1>
                         
                        <#if (endPage > totalPage)>
                            <#assign endPage = totalPage startPage = totalPage - pagingSize + 1>
                        </#if>
                    <#else>
                        <#assign startPage = 1 endPage = totalPage>
                    </#if>
                     
                    <!-- ... -->
                    <#if (totalPage > pagingSize && startPage != 1)>
                        <li class="extend disabled"><a href="javascript:;">...</a></li>
                    </#if>
                     
                    <#list startPage..endPage as i>
                        <#if pageNumber == i>
                            <!-- 当前页 -->
                            <li class="current active"><a href="javascript:;">${i}</a></li>
                        <#else>
                            <li class="" data-page-no="${i}"><a href="javascript:;" onclick="toPage(${i}, '${url}');">${i}</a></li>
                        </#if>
                         
                    </#list>
                     
                    <!-- ... -->
                    <#if (totalPage > pagingSize && endPage != totalPage)>
                        <li class="extend disabled"><a href="javascript:;">...</a></li>
                    </#if>
                     
                    <!-- 下一页 -->
                    <#if pageNumber == totalPage>
                        <li class="next disabled"><a href="javascript:;">下一页</a></li> 
                    <#else>
                        <li class="next" data-page-no="${pageNumber+1}"><a href="javascript:;" onclick="toPage(${pageNumber+1}, '${url}');">下一页</a></li>
                    </#if>
                     
                    <!-- 尾页 -->
                    <#if (totalPage > pagingSize)>
                        <#if pageNumber == totalPage>
                            <li class="last disabled"><a href="javascript:;">尾页</a></li> 
                        <#else>
                            <li class="last" data-page-no="${totalPage}"><a href="javascript:;" onclick="toPage(${totalPage}, '${url}');">尾页</a></li>
                        </#if>
                    </#if>
                </ul>
            </div>
        </div>
    </#if>
</nav>
</#macro>