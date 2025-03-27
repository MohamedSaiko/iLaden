//
//  GoogleDisconnectManager.swift
//  iLaden
//
//  Created by Mohamed Sayed on 27.03.25.
//

import GoogleSignIn

final class GoogleDisconnectManager: AnyGoogleDisconnectManager {
    func disconnect(completion: @escaping (Error) -> Void) {
        GIDSignIn.sharedInstance.disconnect { error in
            guard error == nil else { return }
            completion(error!)
        }
    }
}
