<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <asset:stylesheet src="main.css"/>
    <asset:javascript src="uploadr.manifest.js"/>
    <asset:stylesheet href="uploadr.manifest.css"/>
    <asset:javascript src="plugins/tinymce/tinymce.min.js" />
    <script>tinymce.init({ selector:'textarea' });</script>
    <g:set var="entityName" value="${message(code: 'dataset.label', default: 'Dataset')}"/>
    <title><g:message code="default.create.label" args="[entityName]"/></title>
</head>

<body>
<div class="container content boxed-layout">
    <a href="#create-dataset" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                            default="Skip to content&hellip;"/></a>

    <div class="nav" role="navigation">
        <ul>
            <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
            <li><g:link class="list" action="index"><g:message code="default.list.label"
                                                               args="[entityName]"/></g:link></li>
        </ul>
    </div>

    <div id="create-dataset" class="content scaffold-create" role="main">
        <h1><g:message code="default.create.label" args="[entityName]"/></h1>
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>
        <g:hasErrors bean="${this.dataset}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.dataset}" var="error">
                    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                            error="${error}"/></li>
                </g:eachError>
            </ul>
        </g:hasErrors>

        <g:form action="save">
            <fieldset class="form">
                <f:with bean="dataset">
                    <f:field property="name"/>
                    <f:field property="name_en"/>
                    <f:field property="description"/>
                    <f:field property="organisation"/>
                    <f:field property="author"/>
                    <f:field property="maintainer"/>
                    <f:field property="created"/>
                    <f:field property="revision"/>
                    <f:field property="lineage"/>
                    <f:field property="geoCoverage"/>
                    <f:field property="geoGranularity"/>
                    <f:field property="category"/>
                    <f:field property="updateFrequency"/>
                    <f:field property="license"/>
                    <f:field property="folder" value="${params.folder}" />
                </f:with>
            </fieldset>
            <div class="row margin-bottom-10">
                <div class="col-md-9">
                    <div class="bg-light" style="height: 150px;">
                        <uploadr:add name="${params.folder}" path="${this.uploadPath+"/"+params.folder}" direction="up" maxVisible="20"  rating="false" voting="false" colorPicker="false" maxSize="0" />
                    </div>

                </div>
                <div class="col-md-12 ">
                    <div >
                        <g:each in="[1,2,3]">
                            <g:render template="tag" />
                        </g:each>
                    </div>
                </div>
            </div>


            <fieldset class="buttons">
                <g:submitButton name="create" class="save"
                                value="${message(code: 'default.button.create.label', default: 'Create')}"/>
            </fieldset>
        </g:form>
    </div>
</div>
</body>
</html>
