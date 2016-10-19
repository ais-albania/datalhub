<%@ page import="org.apache.commons.lang.RandomStringUtils" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <asset:stylesheet src="main.css"/>
    <asset:javascript src="uploadr.manifest.js"/>
    <asset:javascript src="disabledatasetfields.js"/>
    <asset:stylesheet href="uploadr.manifest.css"/>
    <asset:javascript src="plugins/tinymce/tinymce.min.js" />
    <script>tinymce.init({ selector:'textarea' });</script>
    <g:set var="entityName" value="${message(code: 'dataset.label', default: 'Dataset')}"/>
    <title><g:message code="default.edit.label" args="[entityName]"/></title>
</head>

<body>
<div class="container content boxed-layout">
    <a href="#edit-dataset" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                          default="Skip to content&hellip;"/></a>

    <div class="nav" role="navigation">
        <ul>
            <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
            <li><g:link class="list" action="index"><g:message code="default.list.label"
                                                               args="[entityName]"/></g:link></li>
            <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                                  args="[entityName]"/></g:link></li>
        </ul>
    </div>

    <div id="edit-dataset" class="content scaffold-edit" role="main">
        <h1><g:message code="default.edit.label" args="[entityName]"/></h1>
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
        <g:form resource="${this.dataset}" method="PUT">
            <g:hiddenField name="version" value="${this.dataset?.version}"/>
            <fieldset class="form">
                <f:all bean="dataset"/>
                <g:each in="${this.dataset.tags}">
                    <f:field property="tags" value="${it}" />
                </g:each>
                <% def path = new File(this.uploadPath+"/"+this.dataset.folder) %>
                <uploadr:add name="${this.dataset.folder}" path="${path}" direction="up" maxVisible="20" unsupported="${createLink(plugin: 'uploadr', controller: 'upload', action: 'warning')}">
                    <% path.listFiles().each { file -> %>
                    <uploadr:file name="${file.name}">
                        <uploadr:fileSize>${file.size()}</uploadr:fileSize>
                        <uploadr:fileModified>${file.lastModified()}</uploadr:fileModified>
                        <uploadr:fileId>myId-${org.apache.commons.lang.RandomStringUtils.random(32, true, true)}</uploadr:fileId>
                    </uploadr:file>
                    <% } %>
                </uploadr:add>
            </fieldset>

            <fieldset class="buttons">
                <input class="save" type="submit"
                       value="${message(code: 'default.button.update.label', default: 'Update')}"/>
            </fieldset>
        </g:form>
    </div>
</div>
</body>
</html>
