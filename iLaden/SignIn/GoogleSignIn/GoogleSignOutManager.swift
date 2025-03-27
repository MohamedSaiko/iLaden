//
//  GoogleSignOutManager.swift
//  iLaden
//
//  Created by Mohamed Sayed on 27.03.25.
//

import GoogleSignIn

final class GoogleSignOutManager: AnyGoogleSignOutManager {
    func signOut() {
        GIDSignIn.sharedInstance.signOut()
    }
}
