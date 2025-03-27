//
//  LoginViewModel.swift
//  iLaden
//
//  Created by Mohamed Sayed on 23.03.25.
//

import Foundation
import GoogleSignIn

final class LoginViewModel: ObservableObject {
    private let tokenSetter: AnyTokenSetter
    private let tokenGetter: AnyTokenGetter
    private let tokenUpdater: AnyTokenUpdater
    private let tokenRemover: AnyTokenRemover
    private let googleSignInManager: AnyGoogleSignInManager
    private let googleUserSignInStateManager: AnyGoogleUserSignInStateManager
    
    @Published private(set) var upToDateToken: String = ""
    
    init(tokenSetter: AnyTokenSetter = TokenSetter(), tokenGetter: AnyTokenGetter = TokenGetter(), tokenUpdater: AnyTokenUpdater = TokenUpdater(), tokenRemover: AnyTokenRemover = TokenRemover(), googleSignInManager: AnyGoogleSignInManager = GoogleSignInManager(), googleUserSignInStateManager: AnyGoogleUserSignInStateManager = GoogleUserSignInStateManager()) {
        self.tokenSetter = tokenSetter
        self.tokenGetter = tokenGetter
        self.tokenUpdater = tokenUpdater
        self.tokenRemover = tokenRemover
        self.googleSignInManager = googleSignInManager
        self.googleUserSignInStateManager = googleUserSignInStateManager
    }
    
    func setToken(token: String) {
        do {
            try tokenSetter.setToken(token: token, forKey: .idToken)
            getToken()
        } catch {
            updateToken(token: token)
        }
    }
    
    func getToken() {
        upToDateToken = tokenGetter.getToken(forKey: .idToken)
    }
    
    func updateToken(token: String) {
        do {
            try tokenUpdater.updateToken(token: token, forKey: .idToken)
            getToken()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func deleteToken() {
        do {
            try tokenRemover.deleteToken(forKey: .idToken)
            upToDateToken = ""
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func signInWithGoogle(completion: @escaping (Result<GIDSignInResult, Error>) -> Void) {
        googleSignInManager.signIn() {(result: Result<GIDSignInResult, Error>) in
            switch result {
            case .success(let googleSignInResult):
                guard let idToken = googleSignInResult.user.idToken?.tokenString else { return }
                print("JWT ID Token: \(idToken)")
                DispatchQueue.main.async {
                    completion(.success(googleSignInResult))
                }
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func getGoogleUserSignInState(completion: @escaping (Result<GIDGoogleUser, Error>) -> Void) {
        googleUserSignInStateManager.getUserSignInState() {(result: Result<GIDGoogleUser, Error>) in
            switch result {
            case .success(let googleCurrentUser):
                DispatchQueue.main.async {
                    completion(.success(googleCurrentUser))
                }
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
