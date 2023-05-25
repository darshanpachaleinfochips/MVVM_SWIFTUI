//
//  HttpUtility.swift
//  DeadLock
//
//  Created by Darshan Panchal on 22/05/23.
//

import Foundation

final class HttpUtility{
    static let shared = HttpUtility()
    private init(){}
    
    func postData<T:Decodable>(request:URLRequest,resultType:T.Type,completionHandler:@escaping (_ result:T?)->Void){
        URLSession.shared.dataTask(with: request) { data, response, error in
            if (error == nil && data != nil){
                let responseData  = try? JSONDecoder().decode(resultType.self, from: data!)
                completionHandler(responseData)
            }
        }.resume()
    }
    
}

