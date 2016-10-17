<!--=== Search Block ===-->
<div class="search-block parallaxBg">
    <div class="container">
        <div class="col-md-6 col-md-offset-3">
            <h1><g:message code="al.data.catalog.search.label" /><span class="color-green"> <catalog:countTotalDatasets/></span>  <g:message code="al.data.catalog.general.datasets"/></h1>
            <form action="${createLink(mapping: 'search')}" method="post" class="sky-form page-search-form">
                <div class="input-group">
                    <input type="text" class="form-control" name="query" placeholder="Search  ...">
                    <span class="input-group-btn">
                        <button class="btn-u btn-u-lg" type="submit"><i class="fa fa-search"></i></button>
                    </span>
                </div>
            </form>
        </div>
    </div>
</div><!--/container-->
<!--=== End Search Block ===-->
