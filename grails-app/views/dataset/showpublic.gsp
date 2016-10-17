<%@ page import="al.data.catalog.Dataset" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <asset:stylesheet src="main.css"/>
    <asset:stylesheet src="jssocials/jssocials.css"/>
    <asset:stylesheet src="jssocials/jssocials-theme-minima"/>

    <title>${dataset.name}</title>
</head>

<body>
<!--=== Breadcrumbs ===-->
<div class="breadcrumbs">
    <div class="container">

        <ul class="pull-left breadcrumb">
            <li><a href="${createLink(uri: '/', absolute: true)}"><g:message code="default.home.label"/></a></li>
            <li><g:link mapping="data"><g:message code="al.data.catalog.general.datasets"/></g:link></li>
            <li class="active">${dataset.name}</li>
        </ul>
    </div><!--/container-->
</div><!--/breadcrumbs-->
<!--=== End Breadcrumbs ===-->
<div class="container content height-500">
    <div class="row blog-page">
        <!-- Left Sidebar -->
        <div class="col-md-9">

            <div class="tag-box tag-box-v3">
                <h1>${dataset.name}</h1>
                ${raw(dataset.description)}
            </div>

            <div class="panel panel-grey margin-bottom-40">
                <div class="panel-heading">
                    <h3 class="panel-title"><g:message code="al.data.catalog.general.dataResources"/></h3>
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
                                <td><a href="${createLink(controller: 'digitaldata', action: 'show', params:[id:datum.id])}">${datum.name}</a></td>
                                <td><a href="${createLink(controller: 'digitaldata', action: 'show', params:[id:datum.id])}"><button class="btn btn-info btn-xs"><i class="fa fa-database"></i> Metadata</button></a>
                                </td>
                            </tr>
                        </g:each>
                        </tbody>
                    </table>
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
                            <td><g:message code="al.data.catalog.general.author"/></td>
                            <td>${dataset.author.username}</td>
                        </tr>
                        <tr>
                            <td><g:message code="al.data.catalog.general.maintainer"/></td>
                            <td>${dataset.maintainer}</td>
                        </tr>
                        <tr>
                            <td><g:message code="al.data.catalog.metadata.created"/></td>
                            <td>${dataset.created}</td>
                        </tr>
                        <tr>
                            <td><g:message code="al.data.catalog.metadata.revision"/></td>
                            <td>${dataset.revision}</td>
                        </tr>
                        <tr>
                            <td><g:message code="al.data.catalog.metadata.geoCoverage"/></td>
                            <td>${dataset.geoCoverage}</td>
                        </tr>
                        <tr>
                            <td><g:message code="al.data.catalog.metadata.lineage"/></td>
                            <td>${dataset.lineage}</td>
                        </tr>
                        <tr>
                            <td><g:message code="al.data.catalog.general.organisation"/></td>
                            <td><a href="${createLink(mapping: 'organisation', params: [id:dataset.organisation.id, name:catalog.cleanUrl(name:dataset.organisation.name)])}">${dataset.organisation}</a></td>
                        </tr>
                        <tr>
                            <td><g:message code="al.data.catalog.metadata.geoCoverage"/></td>
                            <td>${dataset.geoCoverage}</td>
                        </tr>
                        <tr>
                            <td><g:message code="al.data.catalog.metadata.geoGranularity"/></td>
                            <td>${dataset.geoGranularity}</td>
                        </tr>
                        <tr>
                            <td><g:message code="al.data.catalog.metadata.category"/></td>
                            <td><a href="${createLink(mapping:'datasetscategory', params: [name:catalog.cleanUrl(name:dataset.category.name)])}">${dataset.category}</a></td>
                        </tr>
                        <tr>
                            <td><g:message code="al.data.catalog.metadata.updateFrequency"/></td>
                            <td>${dataset.updateFrequency}</td>
                        </tr>
                        <tr>
                            <td><g:message code="al.data.catalog.metadata.license"/></td>
                            <td>${dataset.license}</td>
                        </tr>
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
                <small><g:message code="al.data.catalog.dataset.total"/> <catalog:countDatasetsPerOrganisation id="${dataset.organisation}"/></small>
            </div>

            <div class="posts margin-bottom-40">
                <div class="headline headline-md">
                    <h3><g:message code="al.data.catalog.metadata.license"/></h3></div>

                <div>${dataset.license}</div>
            </div>
            <div class="posts margin-bottom-40">
                <div class="headline headline-md">
                    <h3><g:message code="al.data.catalog.general.sharesocial"/></h3></div>
                <div id="share"></div>
            </div>

            <div class="posts margin-bottom-40">
                <div class="headline headline-md"><h2><g:message code="al.data.catalog.general.latestdatasets"/></h2></div>
                <ul class="list-unstyled blog-trending margin-bottom-50">
                    <g:each in="${randomDataSetPerOrganization}">
                    <li>
                        <a href="${createLink(mapping: 'dataset', params: [id: it.id, name: catalog.cleanUrl(name: it.name)])}">${it}</a><br>
                        <small><g:each in="${it.tags}" var="tag">${tag} / </g:each> </small>
                    </li>
                    </g:each>
                </ul>
            </div>

            <div class="posts margin-bottom-40">
                <div class="headline headline-md">
                    <h3><g:message code="al.data.catalog.metadata.availableformats"/></h3></div>
                <div><g:message code="al.data.catalog.metadata.availableFormatDescription"/>

                   <a href="${createLink(mapping:'datasetRDF',params: [id:dataset.id])}"><asset:image src="rdf.png"/></a>   <a href="${createLink(mapping: 'datasetResource', params:[id:dataset.id,format:'json'])}"><asset:image src="json.png"/></a> <a href="${createLink(mapping: 'datasetResource', params:[id:dataset.id,format:'xml'])}"><asset:image src="xml.png" height="32px" /></a>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>