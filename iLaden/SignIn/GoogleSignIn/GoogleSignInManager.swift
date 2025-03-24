//
//  GoogleSignInManager.swift
//  iLaden
//
//  Created by Mohamed Sayed on 24.03.25.
//

import Foundation
import GoogleSignIn

final class GoogleSignInManager: AnyGoogleSignInManager {
    func signIn() {
        GIDSignIn.sharedInstance.signIn(withPresenting: RootView().getRootViewController()) { signInResult, error in
            guard error == nil, let result = signInResult else {
                print("Error Signing In With Google: \(error?.localizedDescription ?? "No error description")")
                return
            }
            
            guard let idToken = result.user.idToken?.tokenString else { return }
            print("JWT ID Token: \(idToken)")
        }
    }
}
