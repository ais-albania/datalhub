<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <asset:stylesheet src="jssocials/jssocials.css"/>
    <asset:stylesheet src="jssocials/jssocials-theme-minima"/>
    <g:if test="${paramkey == "category"}">
        <title>${categoryName}</title>
    </g:if>
    <g:else>
        <g:set var="entityName" value="${message(code: 'dataset.label', default: 'Dataset')}"/>
        <title><g:message code="default.list.label" args="[entityName]"/></title>
    </g:else>
</head>

<body>
<!--=== Breadcrumbs ===-->
<div class="breadcrumbs">
    <div class="container">
        <h1 class="pull-left"><g:message code="al.data.catalog.general.datasets"/> ${categoryName}</h1>
        <ul class="pull-right breadcrumb">
            <li><a href="${createLink(uri: '/', absolute: true)}">Home</a></li>
            <li class="active"><g:message code="al.data.catalog.general.datasets"/></li>
        </ul>
    </div><!--/container-->
</div><!--/breadcrumbs-->
<!--=== End Breadcrumbs ===-->
<div class="container content">
    <div class="row blog-page">
        <!-- Left Sidebar -->
        <div class="col-md-9">
        <g:message code="al.data.catalog.dataset.total"/> ${datasetCount}
            <g:each in="${datasetList}">
                <div class="blog">
                    <h4><a href="${createLink(mapping: 'dataset', params: [id: it.id, name: catalog.cleanUrl(name: it.name)])}">${it.name}</a>
                    </h4>

                    <div class="blog-post-tags">
                        <ul class="list-unstyled list-inline blog-info">
                            <li><i class="fa fa-calendar"></i> <g:formatDate format="dd-MM-yyyy" date="${it.created}"/>
                            </li>
                            <li><i class="fa fa-pencil"></i>
                                <a href="${createLink(mapping: 'organisation', params: [id: it.organisation.id, name: catalog.cleanUrl(name: it.organisation.name)])}">${it.organisation.name}</a>
                            </li>
                        </ul>
                        <ul class="list-unstyled list-inline blog-tags">
                            <li>
                                <i class="fa fa-tags"></i>
                                <g:each in="${it.tags}" var="tag">
                                    <a href="${createLink(mapping: 'tag', params: [name: catalog.cleanUrl(name: tag)])}">${tag}</a>
                                </g:each>
                            </li>
                            <g:message code="al.data.catalog.data.label"/> ${it.digitalData.size()} <i class="fa fa-file-archive-o"></i>
                        </ul>
                    </div>

                </div>
            </g:each>

            <div class="pagination">
                <g:if test="${paramkey}">
                    <g:if test="${paramkey == "category"}">
                        <g:paginate total="${datasetCount ?: 0}" mapping="datasetscategory"
                                    params="[name: paramvalue]"/>
                    </g:if><g:else>
                    <g:paginate total="${datasetCount ?: 0}" params="[(paramkey): paramvalue]"/>
                </g:else>
                </g:if>
                <g:else>
                    <g:paginate total="${datasetCount ?: 0}"/>
                </g:else>
            </div>
        </div>

        <div class="col-md-3 magazine-page">
            <div class="posts margin-bottom-40">
                <div class="headline headline-md">
                    <h3><g:message code="al.data.catalog.general.sharesocial"/></h3></div>
                <div id="share"></div>
            </div>

            <div class="posts margin-bottom-40">
                <div class="headline headline-md"><h2><g:message code="al.data.catalog.general.latestdatasets"/></h2></div>
                <ul class="list-unstyled blog-trending margin-bottom-50">
                    <g:each in="${randomDataset}">
                        <li>
                            <a href="${createLink(mapping: 'dataset', params: [id: it.id, name: catalog.cleanUrl(name: it.name)])}">${it}</a><br>
                            <small><g:each in="${it.tags}" var="tag">${tag} / </g:each> </small>
                        </li>
                    </g:each>
                </ul>
            </div>
        </div>
    </div>
</div>
</body>
</html>