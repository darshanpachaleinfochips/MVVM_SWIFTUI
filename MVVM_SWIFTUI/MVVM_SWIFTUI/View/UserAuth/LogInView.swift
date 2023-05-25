//
//  ContentView.swift
//  MVVM_SWIFTUI
//
//  Created by Darshan Panchal on 25/05/23.
//

import SwiftUI



struct LogInView: View {
    
    @State var email:String = ""
    @State var password:String = ""
    @ObservedObject var loginViewModel = LogInViewModel()
    
    var body: some View {
        NavigationView{
            VStack(alignment: .center, spacing:0.0){
                Image("logo")
                CustomUITextField.init("Email", type: .email, userInput: $loginViewModel.userEmail)
                CustomUITextField.init("Password", type: .password, userInput:$loginViewModel.userPassword)
                
                
                
                NavigationLink(destination: HomeView(), isActive: $loginViewModel.navigate) {
                    
                }
                CustomButton.init(text: "Submit", icon: nil) {
                    if loginViewModel.validateUserInputs(){
                        loginViewModel.authenticateUser()
                    }else{
                        
                    }
                }.alert(isPresented: $loginViewModel.isPresentingAlertError) {
                    Alert.init(title:
                            Text("Alert"),message:Text(loginViewModel.errorMessage),dismissButton:.cancel(Text("Ok")))}
            }
            .padding()
            .navigationTitle("LogIn")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}
