<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <asset:stylesheet src="main.css"/>
    <g:set var="entityName" value="${message(code: 'datum.label', default: 'Datum')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<div class="container content boxed-layout">
    <a href="#list-datum" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                          default="Skip to content&hellip;"/></a>

    <div class="nav" role="navigation">
        <ul>
            <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
            <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                                  args="[entityName]"/></g:link></li>
        </ul>
    </div>

    <div id="list-datum" class="content scaffold-list" role="main">
        <h1><g:message code="default.list.label" args="[entityName]"/></h1>
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>
        <f:table collection="${datumList}"/>

        <div class="pagination">
            <g:paginate total="${datumCount ?: 0}"/>
        </div>
    </div>
</div>
</body>
</html>