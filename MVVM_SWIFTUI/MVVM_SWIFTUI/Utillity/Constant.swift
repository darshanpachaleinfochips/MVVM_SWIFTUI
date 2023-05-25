//
//  Utility.swift
//  MVVM_SWIFTUI
//
//  Created by Darshan Panchal on 25/05/23.
//

import Foundation
import SwiftUI

let userInputHeight = 50.0

enum API{
    static let kBaseURL:String = "http://restapi.adequateshop.com/api"
    static let kLogIn = "/authaccount/login"
    static let kRegister = "/authaccount/registration"
}
//====== User Auth ======= //
enum UserAuthAPI{
    case login
    case register
}
//====== User List ======= //



protocol URLEndPoint{
        var url:URL{get}
        var method: HttpMethod { get }
        func generateURLRequest(data:Data?) -> URLRequest?
}
extension UserAuthAPI:URLEndPoint{
    var url: URL {
        switch self{
            case .login:
                return URL.init(string: API.kBaseURL+API.kLogIn)!
            case .register:
                return URL.init(string: API.kBaseURL+API.kLogIn)!
        }
    }
    var method: HttpMethod {
        switch self{
            case .login:
                return HttpMethod.post
            case .register:
                return HttpMethod.post
        }
    }
    func generateURLRequest(data:Data?) -> URLRequest? {
        var urlRequest = URLRequest.init(url: url)
        urlRequest.httpMethod = method.rawValue
        if let data{
            urlRequest.httpBody = data
        }
        urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
        return urlRequest
    }
}
enum HttpMethod:String{
    case post = "post"
    case get = "get"
    case delete = "delete"
    case put = "put"
    case option = "option"
}

