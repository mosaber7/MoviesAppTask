//
//  MoviesURLFactory.swift
//  MoviesAppTask_GizaSys
//
//  Created by Saber on 19/09/2021.
//

import Foundation
import Alamofire

enum MoviesRequestFactory: URLRequestConvertible  {
    
    
    static let baseURL = "https://pastebin.com/raw/"
    case categories
    case channels
    case media
    
    var httpMethod: HTTPMethod?{
        switch self {
        case .categories ,.channels, .media:
            return .get
        }
    }
    
    var path:String{
        switch self {
        
        case .categories:
            return "A0CgArX3"
        case .channels:
            return "Xt12uVhM"
        case .media:
            return "z5AExTtw"
        }
    }
    
    var parameters:  [String: Any]?{
        switch self {
        case _ :
            return nil
        }
    }
    var headers: [String: String]{
        switch self {
        case _:
            return [:]
        }
    }
    var encoding: ParameterEncoding{
        switch self {
        case _:
            return JSONEncoding.default
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let urlString = MoviesRequestFactory.baseURL + path
        guard let url = URL(string: urlString) else {
            
            fatalError("URL is not correct")
        }
        var req = URLRequest(url: url)
        req.method = httpMethod
        req.headers = HTTPHeaders(headers)
        return try! encoding.encode(req, with: parameters)
    }
    
}
