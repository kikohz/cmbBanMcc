import Routing
import Vapor

public func routes(_ router: Router) throws {
    router.get { (request) -> String in
        let array = User.query(on: request).all()
        print(array)
        return "word"
    }
    
    

//    router.get("users") { req in
//        User.query(on: req).all()
//        return ""
//    }
    
//    router.get(DynamicPathComponentRepresentable as! DynamicPathComponentRepresentable) { (req) -> ResponseEncodable in
//        return User.query(on: req).all()
//    }
}

