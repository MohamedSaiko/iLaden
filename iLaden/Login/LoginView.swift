//
//  LoginScreen.swift
//  iLaden
//
//  Created by Mohamed Sayed on 22.01.25.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var navigationCoordinator: NavigationCoordinator
    @StateObject private var loginViewModel = LoginViewModel()
    
    var body: some View {
        IconTextButton(icon: .googleIcon, text: "Continue with Google") {
            loginViewModel.signInWithGoogle()
            navigationCoordinator.push(.home)
        }
    }
}

#Preview {
    LoginView()
}
