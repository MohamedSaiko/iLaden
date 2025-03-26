//
//  AnyGoogle.swift
//  iLaden
//
//  Created by Mohamed Sayed on 24.03.25.
//

import GoogleSignIn

protocol AnyGoogleSignInManager {
    func signIn(completion: @escaping (Result<GIDSignInResult, Error>) -> Void)
}
