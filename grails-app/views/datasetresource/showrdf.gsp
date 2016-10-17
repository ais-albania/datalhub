<%@page contentType="text/plain"%>
${raw("""@prefix dcat: <http://www.w3.org/ns/dcat#> .
@prefix owl: <http://www.w3.org/2002/07/owl#> .
@prefix dc: <http://purl.org/dc/terms/> .
@prefix foaf: <http://xmlns.com/foaf/0.1/> .
@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> .
@prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .""")}

    <${catalog.canonicalUrl()+createLink(mapping: 'dataset', params:[id:dataset.id,name:catalog.cleanUrl(name:dataset.name)])}>
        a dcat:Dataset ;
        owl:sameAs ${raw("""<urn:uuid:"""+dataset.folder+""">""")};
  dc:description """${dataset.description}
    """ ;
      foaf:homepage ${raw("""<${catalog.canonicalUrl()}>""")} ;
  rdfs:label "${createLink(mapping: 'dataset', params:[id:dataset.id,name:catalog.cleanUrl(name:dataset.name)])}" ;
  dc:identifier "${createLink(mapping: 'dataset', params:[id:dataset.id,name:catalog.cleanUrl(name:dataset.name)])}" ;
  dc:title "${dataset.name}" ;
  dcat:distribution<g:each in="${dataset.digitalData}" var="datum">[
    a dcat:Distribution ;
    dcat:accessURL ${raw("""<${catalog.canonicalUrl()+createLink(controller: 'digitaldata',action:'show', params:[id:datum.id])}>""")}  ;
    dc:format [
      a dc:IMT ;
      rdf:value "${datum.format}" ;
      rdfs:label "${datum.format}"
    ] ;
    dc:title "${datum.name}"
  ]<g:if test="${dataset.digitalData.last()!=datum}">,</g:if>  </g:each>;
  dc:creator [
    foaf:name "${dataset.organisation.name}" ;
  ] ;
  dc:relation [
    rdfs:label "created_date" ;
    rdf:value "${dataset.created}"
  ], [
    rdfs:label "revision" ;
    rdf:value "${dataset.created}"
  ], [
    rdfs:label "license_text" ;
    rdf:value "${dataset.license}"
  ], [
    rdfs:label "lineage" ;
    rdf:value "${dataset.lineage}"
  ], [
    rdfs:label "or_author" ;
    rdf:value "${dataset.author.username}"
  ], [
    rdfs:label "or_distributor" ;
    rdf:value "${dataset.organisation}"
  ], [
    rdfs:label "or_user" ;
    rdf:value "${dataset.maintainer}"
  ], [
    rdfs:label "smallest_geography" ;
    rdf:value "${dataset.geoGranularity}"
  ], [
    rdfs:label "spatial_resolution" ;
    rdf:value "${dataset.geoCoverage}"
  ], [
    rdfs:label "topic_category" ;
    rdf:value "${dataset.category}"
  ], [
    rdfs:label "update_frequency" ;
    rdf:value "${dataset.updateFrequency}"
  ] .