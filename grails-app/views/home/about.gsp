<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>

    <title><g:message code="al.data.catalog.about"/></title>
</head>

<body>
<!--=== Breadcrumbs ===-->
<div class="breadcrumbs">
    <div class="container">

        <ul class="pull-left breadcrumb">
            <li><a href="${createLink(uri: '/', absolute: true)}"><g:message code="default.home.label"/></a></li>
            <li><g:message code="al.data.catalog.about"/></li>
        </ul>
    </div><!--/container-->
</div><!--/breadcrumbs-->

<div class="container content">
    <div class="row margin-bottom-60">

        <div class="wrap container content-page">

            <p><a href="#about"
                          name="top">About ${grailsApplication.config.getProperty('al.data.catalog.site.name')}</a>
            </p>
            <ul>
                <li><a
                        href="#who">Who developed ${grailsApplication.config.getProperty('al.data.catalog.publicUrl')}?</a>
                </li>
                <li><a
                        href="#technology">With what technology is ${grailsApplication.config.getProperty('al.data.catalog.publicUrl')} built?</a>
                </li>
            </ul>

            <p><a
                    href="#adddata">Get Data on ${grailsApplication.config.getProperty('al.data.catalog.publicUrl')}</a>
            </p>
            <ul>
                <li><a
                        href="#collected">How are the datasets on ${grailsApplication.config.getProperty('al.data.catalog.publicUrl')} collected?</a>
                </li>
                <li><a
                        href="#howto">How can I add my government data to ${grailsApplication.config.getProperty('al.data.catalog.publicUrl')}?</a>
                
                </li>
            </ul>



            <h1 id="about"
                style="padding-top: 20px;">About ${grailsApplication.config.getProperty('al.data.catalog.publicUrl')}</h1>

            <h2 id="who"
                style="padding-top: 20px;">Who developed ${grailsApplication.config.getProperty('al.data.catalog.publicUrl')}?</h2>

            <p>${grailsApplication.config.getProperty('al.data.catalog.publicUrl')} is managed and hosted by Open Data Albania, a project of <a
                    href="http://ais.al" class="external ext-link" rel="external"
                    onclick="this.target = '_blank';"
                    title="This link will direct you to an external website that may have different content and privacy policies from Data.gov."
                    aria-describedby="external_disclaimer">Albanian Institute of Science</a>.<br>
                <a href="#top">Top</a></p>

            <h2 id="technology" style="padding-top: 20px;">With what technology is ${grailsApplication.config.getProperty('al.data.catalog.publicUrl')} built?</h2>

            <p>${grailsApplication.config.getProperty('al.data.catalog.publicUrl')} is powered by open source applications,&nbsp;<a href="https://github.com/ais-albania/datalhub"
                                                                            class="external ext-link" rel="external"
                                                                            onclick="this.target = '_blank';"
                                                                            title="This link will direct you to an external website that may have different content and privacy policies from Data.gov."
                                                                            aria-describedby="external_disclaimer">DATALHUB</a> DATALHUB is build with GRAILS, a GROOVY Framework<br>
                <a href="#top">Top</a></p>


              <h1 id="adddata" style="padding-top: 20px;">Get Data on ${grailsApplication.config.getProperty('al.data.catalog.publicUrl')}</h1>

            <h2 id="collected" style="padding-top: 20px;">How are the datasets on ${grailsApplication.config.getProperty('al.data.catalog.publicUrl')} collected?</h2>

            <p>Data in the catalog are harvested manually or in cooperation with public entities. In special cases, we allow data from citizens to be uploaded as well. These data should refer to prior public data and provide an intellectual analytical activity.
            </p>

            <p>Public entities looking to get their data on ${grailsApplication.config.getProperty('al.data.catalog.publicUrl')} should contact us for more information</p>



            <h2 id="howto" style="padding-top: 20px;">How can I add my government data to ${grailsApplication.config.getProperty('al.data.catalog.publicUrl')}?</h2>

            <p>Contact US</p>




            <h2 id="difficulty"
                style="padding-top: 20px;">What if I am having difficulty downloading a dataset from the catalog?</h2>

            <p>Please tell us what the problem with the dataset is so that we can correct it.<br>
                <a href="#top">Top</a></p>




    </div>
</div>
</div><!--/container-->
</body>
</html>