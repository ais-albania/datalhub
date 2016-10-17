<%@ page import="al.data.catalog.Dataset" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <asset:stylesheet src="jssocials/jssocials.css"/>
    <asset:stylesheet src="jssocials/jssocials-theme-minima"/>
    <title><g:message code="al.data.catalog.general.organisation"/></title>
</head>

<body>
<!--=== Breadcrumbs ===-->
<div class="breadcrumbs">
    <div class="container">

        <ul class="pull-left breadcrumb">
            <li><a href="${createLink(uri: '/', absolute: true)}"><g:message code="default.home.label"/></a></li>
            <li class="active"><g:message code="al.data.catalog.general.organisation"/></li>
        </ul>
    </div><!--/container-->
</div><!--/breadcrumbs-->
<!--=== End Breadcrumbs ===-->
<div class="container content height-500">
    <div class="row blog-page">
        <!-- Left Sidebar -->

        <div class="col-md-9">
            <div class="headline"><h2><g:message code="al.data.catalog.general.organisation"/></h2></div>
            <g:each in="${organisationList}" var="organisation">

                <div class="row clients-page">
                    <div class="col-md-12">
                        <h3><a href="${createLink(mapping:'organisation', params:[id:organisation.id, name:catalog.cleanUrl(name:organisation.name)])}" >${organisation.name}</a></h3>
                        <ul class="list-inline">
                            <li><i class="fa fa-globe color-green"></i>
                                <a class="linked" href="#"> ${organisation.website}</a></li>
                        </ul>

                        ${organisation.description}
                    </div>
                </div>

            </g:each>


            <div class="pagination">
                <g:paginate total="${organisationCount ?: 0}"/>
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