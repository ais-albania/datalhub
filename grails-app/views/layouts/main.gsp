<!doctype html>
<html lang="sq">
<head>

    <title>
        <g:layoutTitle default="Nyje.Data.al"/>
    </title>
    <!-- Meta -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Nyja qendrore ku ruhen te dhenat e Open Data Albania">
    <meta name="author" content="ARB @Albanian Institute of Science">
    <meta name="viewport" content="width=device-width, initial-scale=1"/>

    <asset:stylesheet src="application.css"/>

    <link rel='stylesheet' type='text/css'
          href='//fonts.googleapis.com/css?family=Open+Sans:400,300,600&amp;subset=cyrillic,latin'>
    <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">

    <g:layoutHead/>

    <!-- Favicon -->
    <link rel="shortcut icon" href="${assetPath(src:'favicon.ico')}">

</head>

<body ng-app="${pageProperty( name:'body.ng-app' )}">
<div class="wrapper">
    <g:render template="/layouts/header"/>
    <g:layoutBody/>

    <g:render template="/layouts/footer"/>
</div><!--/End Wrapepr-->
${grailsApplication.config.getProperty('al.data.catalog.piwik.enable')}
<asset:javascript src="application.js"/>
<g:if test="${grailsApplication.config.getProperty('al.data.catalog.piwik.enable')=="1"}">
    <g:render template="/layouts/piwik" model="[url:grailsApplication.config.getProperty('al.data.catalog.piwik.url'), siteId:grailsApplication.config.getProperty('al.data.catalog.piwik.siteId')]" />
</g:if>
</body>
</html>
