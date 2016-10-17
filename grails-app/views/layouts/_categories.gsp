<%@ page import="al.data.catalog.Partner" %>
<g:set var="colors" value='["icon-bg-sea", "icon-bg-red", "icon-bg-brown", "icon-bg-green", "icon-bg-dark", "icon-bg-blue", "icon-bg-yellow", "icon-bg-aqua", "icon-bg-purple", "icon-bg-orange"]'/>

<!-- Topics -->
<div class="headline"><h2><g:message code="al.data.catalog.data.topics"/> </h2></div>
<div class="row category margin-bottom-20">

    <div class="col-md-4 col-sm-6">
        <g:each in="${categories[0]}" var="category" status="i">
        <div class="content-boxes-v3 margin-bottom-10 md-margin-bottom-20">
            <i class="icon-custom icon-sm rounded-x ${colors[0]} fa fa-area-chart"></i>
            <g:set var="colors" value="${colors=colors.drop(1)}"/>
            <div class="content-boxes-in-v3">
                <h3><a href="${createLink(mapping: 'datasetscategory', params: [name:category.urlString])}"> ${category}</a></h3>
                <p>${category.description}</p>
            </div>
        </div>
        </g:each>

    </div>

    <div class="col-md-4 col-sm-6 md-margin-bottom-40">
        <g:set var="i" value="5"/>
        <g:each in="${categories[1]}" var="category" status="i">
        <div class="content-boxes-v3 margin-bottom-10 md-margin-bottom-20">
            <i class="icon-custom icon-sm rounded-x ${colors[0]} fa fa-area-chart"></i>
            <g:set var="colors" value="${colors=colors.drop(1)}"/>
            <div class="content-boxes-in-v3">
                <h3><a href="${createLink(mapping: 'datasetscategory', params: [name:category.urlString])}">  ${category}</a> </h3>
                <p>${category.description}</p>
            </div>
        </div>
        </g:each>
    </div>

    <div class="col-md-4 col-sm-12">
        <div class="section-block">
            <div class="text-center">
                <h2><g:message code="al.data.catalog.about.label" /> </h2>
                <p><g:message code="al.data.catalog.about.descriptionshort"/> </p>
                <p><g:message code="al.data.catalog.about.contribute"/> <a href="${createLink(mapping: 'contact')}"><g:message code="al.data.catalog.contact.please"/></a></p>
            </div>

        </br>
            <h2><g:message code="al.data.catalog.partners.label" /> </h2>
            <g:each in="${al.data.catalog.Partner.list()}" var="partner">
               <h3 class="heading-xs no-top-space">${partner.name}</h3>
                <div class="progress progress-u progress-xxs">
                    <div style="width: 100%" aria-valuemax="100" aria-valuemin="0" aria-valuenow="100" role="progressbar" class="progress-bar progress-bar-u">
                    </div>
                </div>
            </g:each>
        </div>
    </div>
    <!-- End Section-Block -->
</div>
<!-- End Top Categories -->