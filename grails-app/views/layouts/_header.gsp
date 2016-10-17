<%@ page import="org.springframework.context.i18n.LocaleContextHolder" %>
<!--=== Header ===-->
<div class="header">
    <div class="container">
        <!-- Logo -->
        <a class="logo" href="/">
            <asset:image src="logo-data.al.jpg"/>
        </a>
        <!-- End Logo -->

        <!-- Topbar -->
        <div class="topbar">

        <g:set var="lang" value="${org.springframework.context.i18n.LocaleContextHolder.getLocale()}"/>
            <ul class="loginbar pull-right">
                <li class="hoverSelector">
                    <i class="fa fa-globe"></i>
                    <a>Languages</a>
                    <catalog:selector/>

                </li>
                <li class="topbar-devider"></li>
                <li><a href="${createLink(mapping: 'about')}"><g:message code="al.data.catalog.about" /></a></li>
                <li class="topbar-devider"></li>
                <li><sec:ifNotLoggedIn>
                    <g:link controller='login' action='auth'>Login</g:link>
                </sec:ifNotLoggedIn><sec:ifLoggedIn>
                <a href="/logout">Logout</a>
                </sec:ifLoggedIn></li>
            </ul>
        </div>
        <!-- End Topbar -->

        <!-- Toggle get grouped for better mobile display -->
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-responsive-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="fa fa-bars"></span>
        </button>
        <!-- End Toggle -->
    </div><!--/end container-->

<!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse mega-menu navbar-responsive-collapse">
        <div class="container">
            <ul class="nav navbar-nav">
                <!-- Home -->
                <li>
                    <a href="${createLink(url:'/',absolute: true)}" >
                        <g:message code="default.home.label"/>
                    </a>
                   </li>
                <!-- End Home -->

                <li >
                    <a href="${createLink(mapping:'data')}"  >
                        <g:message code="al.data.catalog.data.label"/>
                    </a>
                </li>


                <li class="dropdown">
                    <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown">
                        <g:message code="al.data.catalog.data.topics" />
                    </a>
                    <ul class="dropdown-menu">
                   <g:each in="${["Agrikulture", "Biznes", "Konsumatori", "Ekologji", "Arsim", "Energjitika", "Finance", "Shendetesi", "Qeveri Lokale", "Siguria dhe Rendi"]}">
                        <li><a href="/c/${catalog.cleanUrl(name:it)}"> ${it}</a></li>
                   </g:each>
                    </ul>
                </li>


                <li>
                    <a href="${createLink(mapping: 'organisations')}" >
                        <g:message code="al.data.catalog.organisations.label" />
                    </a>
                </li>

                <li>
                    <a href="${createLink(mapping: 'partners')}" >
                        <g:message code="al.data.catalog.partners.label" />
                    </a>
                </li>
                <!-- Features -->
                <li>
                    <a href="${createLink(mapping:'api')}" >
                        API
                    </a>
                </li>
                <!-- End Features -->


                <li class="mega-menu-fullwidth">
                    <a href="${createLink(mapping:'contact')}" >
                        <g:message code="al.data.catalog.contact.label"/>
                    </a>
                </li>


                <!-- Search Block -->
                <li>
                    <i class="search fa fa-search search-btn"></i>
                <form action="${createLink(mapping: 'search')}" method="post" >
                    <div class="search-open">
                        <div class="input-group animated fadeInDown">
                            <input type="text" class="form-control" placeholder="Search">
                            <span class="input-group-btn">
                                <input type="submit" class="btn-u" value="${g.message(code:"al.data.catalog.go.label")}" />
                            </span>
                        </div>
                    </div>
                    </form>
                </li>
                <!-- End Search Block -->
            </ul>
        </div><!--/end container-->
    </div><!--/navbar-collapse-->
<sec:ifLoggedIn>
<g:render template="/layouts/adminflyout" /></sec:ifLoggedIn>
</div>
<!--=== End Header ===-->
