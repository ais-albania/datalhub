<%@ page import="al.data.catalog.Dataset" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <asset:stylesheet src="jssocials/jssocials.css"/>
    <asset:stylesheet src="jssocials/jssocials-theme-minima"/>

    <title><g:message code="al.data.catalog.metadata.label"/> & <g:message
            code="al.data.catalog.download.label"/> ${datum.name}</title>
</head>

<body>
<!--=== Breadcrumbs ===-->
<div class="breadcrumbs">
    <div class="container">

        <ul class="pull-left breadcrumb">
            <li><a href="${createLink(uri: '/', absolute: true)}"><g:message code="default.home.label"/></a></li>
            <li><g:link mapping="data"><g:message code="al.data.catalog.general.datasets"/></g:link></li>
            <li><a href="${createLink(mapping: 'dataset', params: [id: dataset.id, name: catalog.cleanUrl(name: dataset.name)])}">${dataset.name}</a>
            </li>
            <li class="active">${datum.name}</li>
        </ul>
    </div><!--/container-->
</div><!--/breadcrumbs-->
<!--=== End Breadcrumbs ===-->
<div class="container content height-500">
    <div class="row blog-page">
        <!-- Left Sidebar -->
        <div class="col-md-9">

            <div class="tag-box tag-box-v3">
                <h1>${datum.name}</h1>

            </div>

            <div class="panel panel-grey margin-bottom-40">
                <div class="panel-heading">
                    <h3 class="panel-title"><g:message code="al.data.catalog.download.label"/></h3>
                </div>

                <div class="panel-body">
                    <a href="${createLink(controller: 'download', action: 'download', params: [datumId: datum.id, datasetId: dataset.id])}"><i
                            class="icon-custom icon-lg rounded-2x icon-bg-u fa fa-download"></i></a>
                </div>
            </div>

            <div class="panel panel-grey margin-bottom-40">
                <div class="panel-heading">
                    <h3 class="panel-title"><g:message code="al.data.catalog.metadata.label"/></h3>
                </div>

                <div class="panel-body">
                    <table class="table table-bordered table-striped">
                        <thead>
                        <tr>
                            <th>Meta</th>
                            <th>Value</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>MD5</td>
                            <td>${datum.md5}</td>
                        </tr>
                        <tr>
                            <td><g:message code="al.data.catalog.metadata.created"/></td>
                            <td>${datum.created}</td>
                        </tr>
                        <tr>
                            <td><g:message code="al.data.catalog.metadata.format"/></td>
                            <td>${datum.format}</td>
                        </tr>
                        <tr>
                            <td><g:message code="al.data.catalog.metadata.status"/></td>
                            <td>${datum.status}</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="panel panel-grey margin-bottom-40">
                <div class="panel-heading">
                    <h3 class="panel-title"><g:message code="al.data.catalog.digitaldata.others"/></h3>
                </div>

                <div class="panel-body">
                    <table class="table table-bordered table-striped">
                        <thead>
                        <tr>
                            <th>Type</th>
                            <th>Document Name</th>
                            <th>Status</th>
                        </tr>
                        </thead>
                        <tbody>
                        <g:each in="${dataset.digitalData}" var="datum">
                            <tr>
                                <td><i class="fa <catalog:getExtensionIcon format="${datum.format}"/>"></i></td>
                                <td><a href="${createLink(controller: 'digitaldata', action: 'show', params: [id: datum.id])}">${datum.name}</a>
                                </td>
                                <td><a href="${createLink(controller: 'digitaldata', action: 'show', params: [id: datum.id])}"><button
                                        class="btn btn-info btn-xs"><i class="fa fa-database"></i> Metadata</button></a>
                                </td>
                            </tr>
                        </g:each>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <div class="col-md-3 magazine-page">
            <div class="posts margin-bottom-40">
                <div class="headline headline-md"><h2><g:message code="al.data.catalog.general.publisher"/></h2></div>

                <h3><a href="${createLink(mapping: 'organisation', params: [id: dataset.organisation.id, name: catalog.cleanUrl(name: dataset.organisation.name)])}">${dataset.organisation}</a>
                </h3>
                <small><g:message code="al.data.catalog.dataset.total"/> <catalog:countDatasetsPerOrganisation
                        id="${dataset.organisation}"/></small>
            </div>


            <div class="posts margin-bottom-40">
                <div class="headline headline-md">
                    <h3><g:message code="al.data.catalog.download.counts"/></h3></div>

                <div><span aria-hidden="true" class="icon-graph icon-lg"></span> ${totalDownloads}</div>
            </div>

            <div class="posts margin-bottom-40">
                <div class="headline headline-md">
                    <h3><g:message code="al.data.catalog.general.sharesocial"/></h3></div>

                <div id="share"></div>
            </div>

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