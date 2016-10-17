package al.data.catalog

class HomeController {

    def index() {
        def categories= Category.list()
        int mid = (int) (categories.size() / 2)
        categories = categories.collate(mid)
        render (view:'index',model: [categories: categories])
    }

    def contact(){

    }

    def privacy(){
    }

    def terms(){

    }

    def about(){

    }

    def api(){

    }
}
