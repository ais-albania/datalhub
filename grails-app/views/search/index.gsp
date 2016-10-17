<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular.min.js"></script>
    <asset:javascript src="facet.js" />
    <title><g:message code="al.data.catalog.search.label"/></title>
</head>

<body ng-app="facetSearch">
<!--=== Breadcrumbs ===-->
<div class="breadcrumbs">
    <div class="container">
        <h1 class="pull-left"><g:message code="al.data.catalog.general.datasets"/></h1>
        <ul class="pull-right breadcrumb">
            <li><a href="${createLink(uri: '/', absolute: true)}"><g:message code="default.home.label"/></a></li>
            <li class="active"><g:message code="al.data.catalog.general.datasets"/></li>
        </ul>
    </div><!--/container-->
</div><!--/breadcrumbs-->
<!--=== End Breadcrumbs ===-->
<div class="container content height-500">
    <div class="row blog-page"  ng-controller="MainCtrl" >
        <!-- Left Sidebar -->
        <div class="col-md-9">

            <section>
                <div >
                    <h2>{{(filteredItems | filter:query).length}} <g:message code="al.data.catalog.dataset.label"/>{{(filteredItems | filter:query).length !== 1 ? 's' : null}}</h2>

                    <p class="wrapper-facets">
                        <a ng-if="activeFacets.length" class="clearFacet" ng-click="clearAllFacets()">Clear All</a>
                        <a class="clearFacet" ng-repeat="facet in activeFacets" ng-click="clearFacet(facet)">{{facet}}</a>
                    </p>

                    <div ng-repeat="item in filteredItems | filter:query  | limitTo : 50 : 0" class="blog margin-bottom-40">
                        <h2>
                            <a href="{{item.link}}">{{item.label}}</a>
                        </h2>

                        <div class="blog-post-tags">
                            <ul class="list-unstyled list-inline blog-info">
                                <li><i class="fa fa-calendar"></i> {{item.created}}
                                </li>
                                <li><i class="fa fa-pencil"></i>
                                    {{item.organisation}}
                                </li>
                            </ul>
                            <ul class="list-unstyled list-inline blog-tags">
                                <li ng-repeat="tag in item.tag">
                                    <i class="fa fa-tags"></i>
                                    {{tag}}</li>
                                </li>
                                {{item.geoGranularity}} <i class="fa fa-file-archive-o"></i>
                            </ul>
                        </div>

                    </div>
                      <p ng-if="!(filteredItems | filter:query).length">Sorry, no results found!</p>
                </div>
            </section>
        </div>

        <div class="col-md-3 magazine-page">
            <div class="headline headline-md"><h2><g:message code="al.data.catalog.search.label" /></h2></div>
            <div class="input-group margin-bottom-40">
                <input name="searchQuery" type="text" class="search-input form-control" ng-model="query" ng-init="query='${queryPost}'"/><a ng-if="query" class="clearQuery" ng-click="clearQuery()">&times;</a>
            </div>
            <section class="left">
                <div ng-repeat="group in facetGroups" class="filter">
                    <h4>{{group.name | uppercase}}</h4>
                    <div>
                        <div ng-repeat="facet in group.facets | orderBy:orderByValue">
                            <label><input type="checkbox" ng-model="useFacets[group.name][facet]"/>  {{facet}}</label>
                            <span>({{ (filteredItems | filter:query | filter:count(group.name, facet)).length }})</span>
                        </div>
                    </div>
                </div>
            </section>

        </div>
    </div>
</body>
</html>