package catalog

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        name data: "/data"{
            controller="dataset"
            action="indexpublic"
        }

        name datasetscategory: "/c/$name"{
            controller="dataset"
            action="datasetcategory"
        }

        name search: "/search"{
            controller="search"
            action="index"
        }

        name organisation: "/organisation_$name.$id" {
            controller = 'organisation'
            action = 'showpublic'
        }

        name organisations: "/organisations" {
            controller = 'organisation'
            action = 'indexpublic'
        }

        name api: "/api" {
            controller = 'documentation'
            action = 'index'
        }

        name contact: "/contact" {
            controller = 'home'
            action = 'contact'
        }

        name privacy: "/privacy-policy" {
            controller = 'home'
            action = 'privacy'
        }

        name terms: "/terms-and-condition" {
            controller = 'home'
            action = 'terms'
        }

        name api: "/api" {
            controller = 'home'
            action = 'api'
        }

        name about: "/about-us" {
            controller = 'home'
            action = 'about'
        }

        name partners: "/partners" {
            controller = 'partner'
            action = 'indexpublic'
        }


        name dataset: "/data_$name.$id" {
            controller = 'dataset'
            action = 'showpublic'
        }

        name tag: "/tag_$name" {
            controller = 'tag'
            action = 'showpublic'
        }

        "/api/dataset(.$format)?"(controller: "datasetresource", parseRequest: true) {
            action = [GET: "index"]
        }
        "/api/dataset/listexhibit" {
            controller= 'datasetresource'
            action='listexhibit'
        }

        name datasetResource: "/api/dataset/$id(.$format)?"(controller: "datasetresource", parseRequest: true) {
            action = [GET: "show"]
        }

        name datumresource: "/api/datum/$id(.$format)?"(controller: "datumresource", parseRequest: true) {
            action = [GET: "show"]
        }

        name datasetRDF: "/api/dataset/rdf/$id"{
            controller= "datasetresource"
            action="showrdf"
        }

        "/"(controller: 'home', action: 'index')
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
