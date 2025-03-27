//
//  AnyGoogleUserSignInStateManager.swift
//  iLaden
//
//  Created by Mohamed Sayed on 27.03.25.
//

import GoogleSignIn

protocol AnyGoogleUserSignInStateManager {
    func getUserSignInState(completion: @escaping (Result<GIDGoogleUser, Error>) -> Void)
}
