//
//  LoginScreen.swift
//  iLaden
//
//  Created by Mohamed Sayed on 22.01.25.
//

import SwiftUI
import GoogleSignIn

struct LoginView: View {
    @EnvironmentObject var navigationCoordinator: NavigationCoordinator
    @StateObject private var loginViewModel = LoginViewModel()
    
    var body: some View {
        VStack {
            IconTextButton(icon: .googleIcon, text: "Continue with Google") {
                Task {
                    loginViewModel.signInWithGoogle() {(result: Result<GIDSignInResult, Error>) in
                        switch result {
                        case .success(let googleSignInResult):
                            navigationCoordinator.push(.home)
                        case .failure(let error):
                            print(error.localizedDescription)
                        }
                    }
                }
            }
        }
        .onAppear {
            loginViewModel.getGoogleUserSignInState { (result: Result<GIDGoogleUser, Error>) in
                switch result {
                case .success(let googleCurrentUser):
                    navigationCoordinator.push(.home)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}

#Preview {
    LoginView()
}
