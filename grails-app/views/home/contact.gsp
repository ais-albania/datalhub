<%@ page import="al.data.catalog.Dataset" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>

    <title><g:message code="al.data.catalog.contact.label"/></title>
</head>

<body>
<!--=== Breadcrumbs ===-->
<div class="breadcrumbs">
    <div class="container">

        <ul class="pull-left breadcrumb">
            <li><a href="${createLink(uri: '/', absolute: true)}"><g:message code="default.home.label"/></a></li>
            <li><g:message code="al.data.catalog.contact.label"/></li>
        </ul>
    </div><!--/container-->
</div><!--/breadcrumbs-->

<div class="container content">
    <div class="row margin-bottom-60">
        <div class="col-md-6 col-sm-6">
            <!-- Google Map -->
            <iframe style="border: 0;" src="https://www.google.com/maps/embed?pb=!1m21!1m8!1m3!1d374.4706015804082!2d19.814735132337173!3d41.3357272630421!3m2!1i1024!2i768!4f13.1!4m10!1i0!3e6!4m3!3m2!1d41.3357947!2d19.8145675!4m3!3m2!1d41.335793699999996!2d19.8145642!5e0!3m2!1sen!2sus!4v1421228912058" height="450" frameborder="0" width="500"></iframe>
            <!-- End Google Map -->
        </div>
        <div class="col-md-6 col-sm-6">
            <h3><g:message code="al.data.catalog.contact.getInTouch.title" /></h3>
            <p><g:message code="al.data.catalog.contact.getInTouch.note" /> </p>

            <hr>

            <!-- Contacts -->
            <h3><g:message code="al.data.catalog.contact.physicaladdress" /> </h3>
            <ul class="list-unstyled who">
                <li><a href="#"><i class="fa fa-home"></i>Project: Open Data Albania <br />Nr 13 /25, Kati 3<br/>
            1001, Tirana</a></li>
                <li><a href="#"><i class="fa fa-envelope"></i>info@ais.al</a></li>
                <li><a href="#"><i class="fa fa-globe"></i>http://open.data.al</a></li>
            </ul>

            <hr>

        </div>
    </div>

</div><!--/container-->
</body>
</html>