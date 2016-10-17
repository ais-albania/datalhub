<i class="style-switcher-btn fa fa-cogs hidden-xs"></i>
<div class="style-switcher animated fadeInRight">
    <div class="style-swticher-header">
        <div class="style-switcher-heading">Admin Menu</div>
        <div class="theme-close"><i class="icon-close"></i></div>
    </div>

    <div class="style-swticher-body">
        <div class="style-switcher-heading"><sec:loggedInUserInfo field="username"/></div>
        <div class="row no-col-space margin-bottom-10">
            <div class="col-xs-6">
                <a href="${createLink(controller: 'dataset', action: 'index')}" class="btn-u btn-u-xs btn-u-dark btn-block"><g:message code="al.data.catalog.dataset.label"/></a>
            </div>
            <div class="col-xs-6">
                <a href="${createLink(controller: 'organisation', action:'index')}" class="btn-u btn-u-xs btn-u-dark btn-block"><g:message code="al.data.catalog.general.organisation"/></a>
            </div>
        </div>

        <div class="row no-col-space margin-bottom-10">
            <div class="col-xs-6">
                <a href="${createLink(controller:'category', action: 'index')}" class="btn-u btn-u-xs btn-u-dark btn-block"><g:message code="al.data.catalog.metadata.category"/> </a>
            </div>
            <div class="col-xs-6">
                <a href="${createLink(controller: 'license', action: 'index')}" class="btn-u btn-u-xs btn-u-dark btn-block"><g:message code="al.data.catalog.metadata.license"/></a>
            </div>
        </div>


        <div class="row no-col-space">
            <div class="col-xs-6">
                <a href="${createLink(controller:'partner', action: 'index')}" class="btn-u btn-u-xs btn-u-dark btn-block"><g:message code="al.data.catalog.partners.label"/> </a>
            </div>
            <div class="col-xs-6">
                <a href="${createLink(controller: 'user', action: 'index')}" class="btn-u btn-u-xs btn-u-dark btn-block">Profile</a>
            </div>
        </div>

    </div>

    <g:if test="${sec.username()=='admin'}">
    <div id="controllers" role="navigation">
        <h5>Available Controllers:</h5>
        <ul>
            <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">

                    <g:link controller="${c.logicalPropertyName}">${c.name}</g:link><br />

            </g:each>
        </ul>
    </div>
    </g:if>
</div>