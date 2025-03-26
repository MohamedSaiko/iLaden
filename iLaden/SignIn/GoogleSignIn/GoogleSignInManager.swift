//
//  GoogleSignInManager.swift
//  iLaden
//
//  Created by Mohamed Sayed on 24.03.25.
//

import Foundation
import GoogleSignIn

final class GoogleSignInManager: AnyGoogleSignInManager {
    func signIn(completion: @escaping (Result<GIDSignInResult, Error>) -> Void) {
        GIDSignIn.sharedInstance.signIn(withPresenting: AppDelegate().getRootViewController()) { signInResult, signInError in
            guard signInError == nil, let result = signInResult else {
                completion(.failure(signInError!))
                return
            }
            
            completion(.success(result))
            guard let idToken = result.user.idToken?.tokenString else { return }
            print("JWT ID Token: \(idToken)")
        }
    }
}
