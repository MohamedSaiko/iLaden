//
//  HomeView.swift
//  iLaden
//
//  Created by Mohamed Sayed on 24.03.25.
//

import SwiftUI
import GoogleSignIn

struct HomeView: View {
    @EnvironmentObject var navigationCoordinator: NavigationCoordinator
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .navigationBarBackButtonHidden(true)
        
        Button("Go to Product") {
            navigationCoordinator.push(.product)
        }
        
        Button("Sign Out") {
            GIDSignIn.sharedInstance.signOut()
            navigationCoordinator.pop()
        }
    }
}

#Preview {
    HomeView()
}
