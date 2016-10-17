
<div class="footer-v1">
    <div class="footer">
        <div class="container">
            <div class="row">
                <!-- About -->
                <div class="col-md-3 md-margin-bottom-40">
                    <a href="/"><asset:image src="logo-data.al.transparent.png" id="logo-footer" /></a>
                    <p>Data.al is managed and hosted by the <a href="http://open.data.al">Open Data Albania</a></p>
                    <p>Open Data Albania is a project of <a href="http://www.ais.al" target="_blank">Albanian Institute of Science</a>.</p>
                </div><!--/col-md-3-->
            <!-- End About -->

            <!-- Latest -->
                <div class="col-md-3 md-margin-bottom-40">
                    <div class="posts">
                        <div class="headline"><h2>${grailsApplication.config.getProperty('al.data.catalog.parentFeed.title')}</h2></div>
                        <g:feedAsLi url="${grailsApplication.config.getProperty('al.data.catalog.parentFeed.url')}" />
                    </div>
                </div><!--/col-md-3-->
            <!-- End Latest -->

            <!-- Link List -->
                <div class="col-md-3 md-margin-bottom-40">
                    <div class="headline"><h2>${grailsApplication.config.getProperty('al.data.catalog.rssFeed.title')}</h2></div>
                   <g:feedAsLi url="${grailsApplication.config.getProperty('al.data.catalog.rssFeed.url')}" />
                </div><!--/col-md-3-->
            <!-- End Link List -->

            <!-- Address -->
                <div class="col-md-3 map-img md-margin-bottom-40">
                    <div class="headline"><h2>Contact Us</h2></div>
                    <address class="md-margin-bottom-40">
                        Project: Open Data Albania <br>
                        Rruga “Asim Vokshi”<br>
                        Nr 13 /25, Kati 3<br>
                        1001, Tirana<br>
                        Email: <a href="mailto:info@ais.al" class="">info@ais.al</a>
                    </address>
                </div><!--/col-md-3-->
            <!-- End Address -->
            </div>
        </div>
    </div><!--/footer-->

    <div class="copyright">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <p>
                        ${Calendar.getInstance().get(Calendar.YEAR)} &copy; <g:message code="al.data.catalog.rights.note"/>.
                        <a href="${createLink(mapping:'privacy')}"><g:message code="al.data.catalog.privacy.policy"/></a> | <a href="${createLink(mapping: 'terms')}"><g:message code="al.data.catalog.terms" /> </a>
                    </p>
                </div>

                <!-- Social Links -->
                <div class="col-md-6">
                    <ul class="footer-socials list-inline">
                        <li>
                            <a href="https://www.facebook.com/AlbanianInstituteOfScience/" class="tooltips" data-toggle="tooltip" data-placement="top" title="" data-original-title="Facebook">
                                <i class="fa fa-facebook"></i>
                            </a>
                        </li>
                        <li>
                            <a href="https://twitter.com/AIScience" class="tooltips" data-toggle="tooltip" data-placement="top" title="" data-original-title="Twitter">
                                <i class="fa fa-twitter"></i>
                            </a>
                        </li>
                    </ul>
                </div>
                <!-- End Social Links -->
            </div>
        </div>
    </div><!--/copyright-->
</div>
