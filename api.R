#* @apiTitle STAC API
#* @apiDescription R STAC API server.
#* @apiVersion 1.0.0

library(openstac)

# Create an STAC server API object
api <- create_stac(
    id = "stac-ml-server",
    title = "R STAC API server",
    description = "This is a STAC API 1.0.0 compliant R backend."
)

# Set API database
db_file <- system.file("db/olm-example.rds", package = "openstac")
api <- set_db(api, driver = "local", file = db_file)

#* Landing page
#* @get /
#* @serializer unboxedJSON
#* @tag 'STAC API v1.0.0'
function(req, res) {
    api_landing_page(api, req, res)
}

#* Conformance endpoint
#* @get /conformance
#* @serializer unboxedJSON
#* @tag 'STAC API v1.0.0'
function(req, res) {
    api_conformance(api, req, res)
}

#* Collections endpoint
#* @get /collections
#* @serializer unboxedJSON
#* @tag 'STAC API v1.0.0'
function(req, res) {
    api_collections(api, req, res)
}

#* Collection endpoint
#* @get /collections/<collection_id>
#* @param collection_id:str The ID of the collection
#* @serializer unboxedJSON
#* @tag 'STAC API v1.0.0'
function(req, res, collection_id) {
    api_collection(api, req, res, collection_id)
}

#* Items endpoint
#* @get /collections/<collection_id>/items
#* @param collection_id:str The ID of the collection
#* @param limit:int Maximum number of features to return (default: 10)
#* @param bbox:str Bounding box (minx,miny,maxx,maxy)
#* @param datetime:str Datetime filter
#* @param page:int Pagination parameter (default: 1)
#* @serializer unboxedJSON
#* @tag 'STAC API v1.0.0'
function(req,
         res,
         collection_id,
         limit = 10,
         bbox,
         datetime,
         page = 1) {
    # check parameters
    if (!is.null(limit)) {
        limit <- parse_int(limit[[1]])
        check_limit(limit, min = 1, max = 10000)
    }
    if (missing(bbox)) bbox <- NULL
    if (!is.null(bbox)) {
        bbox <- parse_dbl(bbox)
        check_bbox(bbox)
    }
    if (missing(datetime)) datetime <- NULL
    if (!is.null(datetime)) {
        datetime <- parse_datetime(datetime[[1]])
    }
    if (!is.null(page)) {
        page <- parse_int(page[[1]])
        check_page(page)
    }
    # call api items
    api_items(
        api = api,
        req = req,
        res = res,
        collection_id = collection_id,
        limit = limit,
        bbox = bbox,
        datetime = datetime,
        page = page
    )
}

#* Item endpoint
#* @get /collections/<collection_id>/items/<item_id>
#* @param collection_id:str The ID of the collection
#* @param item_id:str The ID of the item
#* @serializer unboxedJSON
#* @tag 'STAC API v1.0.0'
function(req, res, collection_id, item_id) {
    api_item(api, req, res, collection_id, item_id)
}
