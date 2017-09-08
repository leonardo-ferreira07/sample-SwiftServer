import Kitura

let router = Router()

router.get("/") {
    request, response, next in
    response.send("Hello World, Leonardo")
    next()
}

Kitura.addHTTPServer(onPort: 9000, with: router)

Kitura.run()
