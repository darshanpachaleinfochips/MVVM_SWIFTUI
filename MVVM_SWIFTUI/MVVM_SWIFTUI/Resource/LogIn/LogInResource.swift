//
//  LogInResource.swift
//  MVVM_SWIFTUI
//
//  Created by Darshan Panchal on 25/05/23.
//

import Foundation

struct LogInResource{
    
    func authenticate(logInRequest:LogInRequest, completionHandler:@escaping (_ result:LogInResponse?)-> Void){
        
        guard let urlRequest = UserAuthAPI.login.generateURLRequest(data: try? JSONEncoder().encode(logInRequest)) else{
            return
        }
        HttpUtility.shared.postData(request: urlRequest, resultType: LogInResponse.self) { result in
            completionHandler(result)
        }
    }
    
}
