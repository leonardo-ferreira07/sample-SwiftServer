import Kitura
import SwiftyJSON

#if os(Linux)
    import Glibc
srand(UInt32(time(nil)))
#else
    import Darwin.C
#endif

let router = Router()

router.get("/") {
    request, response, next in
    response.send("Hello World, Leonardo")
    next()
}

let salutations: [String] = [
    "How are you today?",
    "Where do you live?",
    "What's your job?"
]

router.get("/questions") {
    request, response, next in
    #if os(Linux)
        let idx = Int(random() % salutations.count)
    #else
        let idx = Int(arc4random_uniform(UInt32(salutations.count)))
    #endif
    response.send(json: JSON(["text": salutations[idx]]))
    next()
}

Kitura.addHTTPServer(onPort: 9000, with: router)

Kitura.run()
