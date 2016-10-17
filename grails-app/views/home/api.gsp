<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>

    <title><g:message code="al.data.catalog.terms"/></title>
</head>

<body>
<!--=== Breadcrumbs ===-->
<div class="breadcrumbs">
    <div class="container">

        <ul class="pull-left breadcrumb">
            <li><a href="${createLink(uri: '/', absolute: true)}"><g:message code="default.home.label"/></a></li>
            <li>API</li>
        </ul>
    </div><!--/container-->
</div><!--/breadcrumbs-->

<div class="container content">
    <div class="row margin-bottom-60">

            <p>This section documents DATALHUB’s API, for developers who want to write code that interacts with DATALHUB sites and their data.
            The following are a set of operations you can handle through the API</p>

            <h2>
                <a id="user-content-get-json-formatted-lists-of-a-sites-datasets" class="anchor" href="#get-json-formatted-lists-of-a-sites-datasets" aria-hidden="true"><svg aria-hidden="true" class="octicon octicon-link" height="16" version="1.1" viewBox="0 0 16 16" width="16"><path d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>Get JSON-formatted lists of a site’s datasets:</h2>

            <pre><code>http://$DOMAIN/api/dataset
            </code></pre>

            <h2>
                <a id="user-content-get-jsonxml-formatted-list-of-a-specific-dataset" class="anchor" href="#get-jsonxml-formatted-list-of-a-specific-dataset" aria-hidden="true"><svg aria-hidden="true" class="octicon octicon-link" height="16" version="1.1" viewBox="0 0 16 16" width="16"><path d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>GET JSON/XML formatted list of a specific dataset</h2>

            <pre><code>http://$DOMAIN/api/dataset/$datasetID
            </code></pre>

            <p>The default response is JSON, but you can easily switch to XML by appending .xml by the end of the call.</p>

            <pre><code>http://$DOMAIN/api/dataset.xml
            </code></pre>

            <h2>
                <a id="user-content-get-jsonxml-formatted-metadata-for-a-specific-digital-asset" class="anchor" href="#get-jsonxml-formatted-metadata-for-a-specific-digital-asset" aria-hidden="true"><svg aria-hidden="true" class="octicon octicon-link" height="16" version="1.1" viewBox="0 0 16 16" width="16"><path d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>GET JSON/XML formatted metadata for a specific digital asset</h2>

            <pre><code>http://$DOMAIN/api/datum/$datumID
            </code></pre>

            <p>The list of the digital assets is provided in the retrieval of a dataset. The get datum call returns the metadata for a digital data. The download path for a specific digital asset is:
            http://$DOMAIN/download/download?datumId=$datumID&amp;datasetId=$datasetID</p>

            <p>API calls for creation, upload, update of Datasets and Digital Assets is not active at this stage. If you would like to use this application and need these calls, drop <a href="mailto:ab@ais.al">me</a> a line.</p>


    </div>

</div><!--/container-->
</body>
</html>