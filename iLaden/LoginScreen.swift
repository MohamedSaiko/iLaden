//
//  LoginScreen.swift
//  iLaden
//
//  Created by Mohamed Sayed on 22.01.25.
//

import SwiftUI
import GoogleSignInSwift
import GoogleSignIn

struct LoginScreen: View {
    @State var isHidden: Bool = true
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .opacity(isHidden ? 0 : 1)
        
        //GoogleSignInButton(action: handleSignInButton)
        IconTextButton(action: handleSignInButton)
        
        Button("signout") {
            getJWTIDToken()
        }
    }
    
    func handleSignInButton() {
      GIDSignIn.sharedInstance.signIn(
        withPresenting: getRootViewController() ?? UIViewController()) { signInResult, error in
          guard let result = signInResult else {
            // Inspect error
              print(error?.localizedDescription)
            return
          }
            isHidden = false// If sign in succeeded, display the app's main content View.
            print("AccessToken \(result.user.accessToken)")
            print(" IDToken: \(result.user.idToken?.tokenString)")
            print(" RefreshToken: \(result.user.refreshToken)")
        }
    }
    
    func getJWTIDToken() {
        print("hello")
        if let user = GIDSignIn.sharedInstance.currentUser {
            let idToken = user.idToken?.tokenString// This is the JWT token
            print("JWT ID Token: \(idToken ?? "No token found")")
        }
    }
    
    func getRootViewController() -> UIViewController? {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let window = windowScene.windows.first else {
            return nil
        }
        return window.rootViewController
    }
}

#Preview {
    LoginScreen()
}
