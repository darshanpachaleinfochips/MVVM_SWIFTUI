//
//  LogInViewModel.swift
//  DeadLock
//
//  Created by Darshan Panchal on 22/05/23.
//

import Foundation

class LogInViewModel:ObservableObject{
    
    @Published var userEmail:String = "darshan.panchal@einfochips.com"//String()
    @Published var userPassword:String = "Panchal236!"//String()
    @Published var errorMessage:String = String()
    @Published var navigate:Bool = false
    @Published var isPresentingAlertError :Bool = false
    
    private var logInvalidation = LogInValidation()
    private var logInResource =  LogInResource()
    
    func validateUserInputs() -> Bool{
        
        let result = logInvalidation.validateUserInputs(userEmail: userEmail, userPassword: userPassword)
        guard result.success else{
            errorMessage = result.errorMessage ?? "error  occured"
            isPresentingAlertError = true
            return false
        }
        return true
    }
    
    //call the api
    func authenticateUser(){
        let request = LogInRequest.init(email: userEmail, password: userPassword)
                
        logInResource.authenticate(logInRequest: request) { result in
            if result?.code == 0{
                DispatchQueue.main.async {
                    if let userID = result?.data?.id as? UserID{
                        
                        
                        print(userID.self)
                    }
                    self.navigate = true
                }
            }else{
                DispatchQueue.main.async {
                    self.errorMessage = result?.message ?? "Error Occured"
                    self.isPresentingAlertError = true
                }
            }
        }
    }
}
