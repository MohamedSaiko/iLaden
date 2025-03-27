//
//  GoogleUserSignInStateManager.swift
//  iLaden
//
//  Created by Mohamed Sayed on 27.03.25.
//

import GoogleSignIn

final class GoogleUserSignInStateManager: AnyGoogleUserSignInStateManager {
    func getUserSignInState(completion: @escaping (Result<GIDGoogleUser, any Error>) -> Void) {
        GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
            guard let currentUser = user, error == nil else {
                completion(.failure(error!))
                return
            }
            
            completion(.success(currentUser))
        }
    }
}
