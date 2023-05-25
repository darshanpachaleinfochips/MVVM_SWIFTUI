//
//  LogInValidation.swift
//  DeadLock
//
//  Created by Darshan Panchal on 22/05/23.
//

import Foundation

struct ValidationResult{
    var success:Bool = false
    var errorMessage:String?
}
struct LogInValidation{
    
    //Check for valid email and password
    func validateUserInputs(userEmail:String,userPassword:String)->ValidationResult{
        
        if (userEmail.isEmpty || userPassword.isEmpty){
            return ValidationResult(success: false,errorMessage: "User email and password cannot be empty")
        }
        if !self.isValidEmail(value: userEmail) {
            return ValidationResult(success: false,errorMessage: "User email is not in valid format")
        }
       
        
        return ValidationResult.init(success: true,errorMessage: nil)
    }
    private func isValidEmail(value:String)->Bool{
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

            let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            return emailPred.evaluate(with: value)
    }
}
