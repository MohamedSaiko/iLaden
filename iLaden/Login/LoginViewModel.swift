//
//  LoginViewModel.swift
//  iLaden
//
//  Created by Mohamed Sayed on 23.03.25.
//

import Foundation

final class LoginViewModel: ObservableObject {
    private let tokenSetter: AnyTokenSetter
    private let tokenGetter: AnyTokenGetter
    private let tokenUpdater: AnyTokenUpdater
    private let tokenRemover: AnyTokenRemover
    private let googleSignInManager: AnyGoogleSignInManager
    
    @Published private(set) var upToDateToken: String = ""
    
    init(tokenSetter: AnyTokenSetter = TokenSetter(), tokenGetter: AnyTokenGetter = TokenGetter(), tokenUpdater: AnyTokenUpdater = TokenUpdater(), tokenRemover: AnyTokenRemover = TokenRemover(), googleSignInManager: AnyGoogleSignInManager = GoogleSignInManager()) {
        self.tokenSetter = tokenSetter
        self.tokenGetter = tokenGetter
        self.tokenUpdater = tokenUpdater
        self.tokenRemover = tokenRemover
        self.googleSignInManager = googleSignInManager
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
    
    func signInWithGoogle() {
        googleSignInManager.signIn()
    }
}
