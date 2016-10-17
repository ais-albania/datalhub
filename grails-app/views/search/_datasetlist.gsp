<g:each in="${datasetList}">
    <div class="blog margin-bottom-40">
        <h2><a href="${createLink(mapping: 'dataset', params: [id: it.id, name: catalog.cleanUrl(name: it.name)])}">${it.name}</a>
        </h2>

        <div class="blog-post-tags">
            <ul class="list-unstyled list-inline blog-info">
                <li><i class="fa fa-calendar"></i> <g:formatDate format="dd-MM-yyyy" date="${it.created}"/>
                </li>
                <li><i class="fa fa-pencil"></i>
                    <a href="${createLink(mapping: 'organisation', params: [id: it.organisation.id, name: catalog.cleanUrl(name: it.organisation.name)])}">${it.organisation.name}</a>
                </li>
            </ul>
            <ul class="list-unstyled list-inline blog-tags">
                <li>
                    <i class="fa fa-tags"></i>
                    <g:each in="${it.tags}" var="tag">
                        <a href="${createLink(mapping: 'tag', params: [name: catalog.cleanUrl(name: tag)])}">${tag}</a>
                    </g:each>
                </li>
                ${it.digitalData.size()} <i class="fa fa-file-archive-o"></i>
            </ul>
        </div>

    </div>
</g:each>
<div class="pagination">
    <g:paginate total="${datasetCount ?: 0}"/>
</div>