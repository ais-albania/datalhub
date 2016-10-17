<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <asset:stylesheet src="jssocials/jssocials.css"/>
    <asset:stylesheet src="jssocials/jssocials-theme-minima"/>
    <g:set var="entityName" value="${message(code: 'partner.label', default: 'Partner')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<!--=== Breadcrumbs ===-->
<div class="breadcrumbs">
    <div class="container">

        <ul class="pull-left breadcrumb">
            <li><a href="${createLink(uri: '/', absolute: true)}"><g:message code="default.home.label"/></a></li>
            <li class="active"><g:message code="al.data.catalog.partners.label"/></li>
        </ul>
    </div><!--/container-->
</div><!--/breadcrumbs-->
<!--=== End Breadcrumbs ===-->
<div class="container">
    <div class="row blog-page">
        <div class="col-md-9">
            <div class="headline"><h2><g:message code="al.data.catalog.partners.label"/></h2></div>
            <g:each in="${partnerList}" var="partner">

                <div class="row clients-page">
                    <div class="col-md-12">
                        <h3>${partner.name}</h3>
                        <ul class="list-inline">
                            <li><i class="fa fa-globe color-green"></i>
                                <a class="linked" href="#">${partner.urlString}</a></li>
                        </ul>

                        ${partner.description}
                    </div>
                </div>

            </g:each>


            <div class="pagination">
                <g:paginate total="${partnerCount ?: 0}"/>
            </div>
        </div>

        <div class="col-md-3 magazine-page">
            <div class="posts margin-bottom-40">
                <div class="headline headline-md"><h2><g:message code="al.data.catalog.general.latestdatasets"/></h2>
                </div>
                <ul class="list-unstyled blog-trending margin-bottom-50">
                    <g:each in="${randomDatasets}">
                        <li>
                            <a href="${createLink(mapping: 'dataset', params: [id: it.id, name: catalog.cleanUrl(name: it.name)])}">${it}</a><br>
                            <small><g:each in="${it.tags}" var="tag">${tag} /</g:each></small>
                        </li>
                    </g:each>
                </ul>
            </div>

        </div>
    </div>
</div>
</body>
</html>