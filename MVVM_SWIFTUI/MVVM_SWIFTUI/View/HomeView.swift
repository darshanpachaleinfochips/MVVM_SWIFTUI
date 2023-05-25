//
//  HomeView.swift
//  MVVM_SWIFTUI
//
//  Created by Darshan Panchal on 25/05/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        Text("Hello, Darshan!\nWelcome to Home!")
            .multilineTextAlignment(.center)
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.large)
        }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
