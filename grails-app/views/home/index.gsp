<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>${grailsApplication.config.getProperty('al.data.catalog.site.name')}</title>

</head>
<body>
<g:render template="/layouts/search"/>
<!--=== Content ===-->
<div class="container content">
        <g:render template="/layouts/categories" />
</div><!--/container-->
<!--=== End Content ===-->

<!--=== Parallax Counter ===-->
<div class="parallax-counter-v2 parallaxBg1">
    <div class="container">
        <ul class="row list-row">
            <li class="col-md-3 col-sm-6 col-xs-12 md-margin-bottom-30">
                <div class="counters rounded">
                    <span class="counter"><catalog:countTotalDatasets/></span>
                    <h4><g:message code="al.data.catalog.general.datasets" /></h4>
                </div>
            </li>
            <li class="col-md-3 col-sm-6 col-xs-12 md-margin-bottom-30">
                <div class="counters rounded">
                    <span class="counter"><catalog:countTotalData /></span>
                    <h4><g:message code="al.data.catalog.data.uploadeddata" /></h4>
                </div>
            </li>
            <li class="col-md-3 col-sm-6 col-xs-12 sm-margin-bottom-30">
                <div class="counters rounded">
                    <span class="counter"><catalog:countTotalDownloads /></span>
                    <h4><g:message code="al.data.catalog.download.total" /></h4>
                </div>
            </li>
            <li class="col-md-3 col-sm-6 col-xs-12">
                <div class="counters rounded">
                    <span class="counter"><catalog:countTotalOrganisations /></span>
                    <h4><g:message code="al.data.catalog.organisations.label" /></h4>
                </div>
            </li>
        </ul>
    </div>
</div>
<!--=== End Parallax Counter ===-->

<!--=== Container Part ===-->
<div class="bg-grey">
    <div class="container content-md">
        <ul class="row list-row margin-bottom-30">
            <li class="col-md-4 md-margin-bottom-30">
                <div class="content-boxes-v3 block-grid-v1 rounded">
                    <img class="rounded-x pull-left block-grid-v1-img" src="http://ais.al/new/wp-content/uploads/mgplogo3-300x3001-180x180.jpg" alt="Money Government & Politics Albania">
                    <div class="content-boxes-in-v3">
                        <h3><a href="http://ais.al/new/en/money-government-politics/">Money Government & Politics </a></h3>
                        <p>Money, Government and Politics project and its activities address issues of abuse, corruption, and conflict of interest in the context of governance and politics in Albania. The program aims at opening data about the wealth of high state officials, expenditures of state institutions ... </p>
                    </div>
                </div>
            </li>
            <li class="col-md-4 md-margin-bottom-30">
                <div class="content-boxes-v3 block-grid-v1 rounded">
                    <img class="rounded-x pull-left block-grid-v1-img" src="http://ais.al/new/wp-content/uploads/zalartthu-180x180.jpg" alt="">
                    <div class="content-boxes-in-v3">
                        <h3><a href="#">ZA'LART</a></h3>
                        <p>ZA´LART 2015, is a project where the citizens are invited to denounce (report and alert) on an open source platform (website & app mobile), about problems they encounter during electoral campaigns and electoral day. Citizens are empowered with tools that allow them to participate in a real time monitoring process. </p>
                    </div>
                </div>
            </li>
            <li class="col-md-4">
                <div class="content-boxes-v3 block-grid-v1 rounded">
                    <img class="rounded-x pull-left block-grid-v1-img" src="http://ais.al/new/wp-content/uploads/academicalthu-180x180.jpg" alt="">
                    <div class="content-boxes-in-v3">
                        <h3><a href="#">ACADEMIC'AL</a></h3>
                        <p>As part of the scope to base our projects ICT Solutions, AIS implemented during the first 6 months of 2013 a platform for the Albanian scientific research. The aim of the platform was to increase the visibility of scientific researchers and their scientific works. The project delivery include a central portal that provides information on  </p>
                    </div>
                </div>
            </li>
        </ul>

        <ul class="row list-row">
            <li class="col-md-4 md-margin-bottom-30">
                <div class="content-boxes-v3 block-grid-v1 rounded">
                    <img class="rounded-x pull-left block-grid-v1-img" src="http://ais.al/new/wp-content/uploads/smartturistalbaniathu-180x180.jpg" alt="">
                    <div class="content-boxes-in-v3">
                        <h3><a href="http://ais.al/new/en/smart-tourist-albania/">Smart Tourist Albania </a></h3>
                        <p>This project establishes a social media outlet where citizen-fed information becomes important and stimulates the solution of problems. Goal: Create a movement in which citizens intervened directly with voluntary actions on environment, culture and tourism in the country. </p>
                    </div>
                </div>
            </li>
            <li class="col-md-4 md-margin-bottom-30">
                <div class="content-boxes-v3 block-grid-v1 rounded">
                    <img class="rounded-x pull-left block-grid-v1-img" src="http://ais.al/new/wp-content/uploads/opendatathu-180x180.jpg" alt="">
                    <div class="content-boxes-in-v3">
                        <h3><a href="http://ais.al/new/en/open-data-albania/">Open Data Albania </a></h3>
                        <p>Open Data Albania is an initiative that embraces the Open Data principles. The project aims to collect from public offices data on socio-economic indicators, process and publish them based on emerging topics and semantic technologies. Donor: Open Society Foundation  </p>
                    </div>
                </div>
            </li>
            <li class="col-md-4">
                <div class="content-boxes-v3 block-grid-v1 rounded">
                    <img class="rounded-x pull-left block-grid-v1-img" src="http://ais.al/new/wp-content/uploads/oca-180x155.jpg" alt="">
                    <div class="content-boxes-in-v3">
                        <h3><a href="http://ais.al/new/en/open-corporates-business-companies/">Open Corporates</a></h3>
                        <p>This project aims at opening data about business companies operating in the country. Through the Business Companies application, anyone may easily find and use data including the name of a company, its tax number (NIPT), year of establishment and its legal status.  […] </p>
                    </div>
                </div>
            </li>
        </ul>
    </div>
</div>



</body>
</html>
