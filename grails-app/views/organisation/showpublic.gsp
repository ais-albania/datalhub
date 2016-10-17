<%@ page import="al.data.catalog.Dataset" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <asset:stylesheet src="jssocials/jssocials.css"/>
    <asset:stylesheet src="jssocials/jssocials-theme-minima"/>

    <title>${organisation.name}</title>
</head>

<body>
<!--=== Breadcrumbs ===-->
<div class="breadcrumbs">
    <div class="container">

        <ul class="pull-left breadcrumb">
            <li><a href="${createLink(uri: '/', absolute: true)}"><g:message code="default.home.label"/></a></li>
            <li><g:link mapping="organisations"><g:message code="al.data.catalog.general.organisation"/></g:link></li>
            <li class="active">${organisation.name}</li>
        </ul>
    </div><!--/container-->
</div><!--/breadcrumbs-->
<!--=== End Breadcrumbs ===-->
<div class="container content height-500">
    <div class="row blog-page">
        <!-- Left Sidebar -->
        <div class="col-md-9">

            <div class="tag-box tag-box-v3">
                <h1>${organisation.name}</h1>
                ${organisation.description}

                <h2><g:message code="al.data.catalog.dataset.total"/> </h2>
                <g:message code="al.data.catalog.organisation.totalds.description" args="[organisation.name, totalDatasets]" />
                <a href="${createLink(mapping: 'data', params:[organisationId:organisation.id])}"><i class="fa fa-external-link"></i></a>
            </div>
        </div>

        <div class="col-md-3 magazine-page">
            <div class="posts margin-bottom-40">
                <div class="headline headline-md"><h2><g:message code="al.data.catalog.general.latestdatasets"/></h2>
                </div>
                <ul class="list-unstyled blog-trending margin-bottom-50">
                    <g:each in="${randomDataSetPerOrganization}">
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