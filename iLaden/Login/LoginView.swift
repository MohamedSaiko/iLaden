//
//  LoginScreen.swift
//  iLaden
//
//  Created by Mohamed Sayed on 22.01.25.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var loginViewModel = LoginViewModel()
    
    var body: some View {
        IconTextButton(icon: .googleIcon, text: "Continue with Google") {
            loginViewModel.signInWithGoogle()
            //Navigate To Home View
        }
    }
}

#Preview {
    LoginView()
}
