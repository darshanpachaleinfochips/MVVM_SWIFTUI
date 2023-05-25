//
//  CustomClass.swift
//  MVVM_SWIFTUI
//
//  Created by Darshan Panchal on 25/05/23.
//

import Foundation
import SwiftUI

//======== UITextField ========== //
enum UserInputType{
    case email
    case password
    case text
    case number
}

struct CustomUITextField:View{
    @Binding var userInput:String
    private var placeHolderText:String
    private var type:UserInputType
 
    init(_ placeHolder: String, type:UserInputType, userInput: Binding<String>) {
            self.placeHolderText = placeHolder
            self.type = type
            self._userInput = userInput
       }
       
    var body: some View {
        if type == .password{
            SecureField(placeHolderText, text: $userInput)
                .textFieldStyle(.roundedBorder)
                .border(.foreground)
                .multilineTextAlignment(.center)
                .frame(height: userInputHeight)
                .keyboardType(self.getKeyBoard())
                .padding()
                
        }else{
            TextField(placeHolderText, text: $userInput)
                .textFieldStyle(.roundedBorder)
                .border(.foreground)
                .multilineTextAlignment(.center)
                .frame(height: userInputHeight)
                .keyboardType(self.getKeyBoard())
                .padding()
                .onAppear{
                    UITextField.appearance().clearButtonMode = .whileEditing
                }
        }
    }
    
    func getKeyBoard()->UIKeyboardType{
        switch type {
        case .email:
            return .emailAddress
        case .password:
            return .default
        case .text:
            return .emailAddress
        case .number:
            return .numberPad
            
        }
    }
}
//======== UIButton ===============//

struct CustomButton: View {
    
    var text: String
    var icon: Image?
    var clicked: (() -> Void) /// use closure for callback
    
    var body: some View {
        Button(action: clicked) { /// call the closure here
            HStack {
                Text(text) /// your text
                    .font(Font.system(size: 17))
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .frame(height: 50)
                    .foregroundColor(.white)
                    .background(.blue)
                icon /// your icon image
            }
            .padding(.horizontal,10)
            .buttonStyle(.plain)
        }
    }
}
