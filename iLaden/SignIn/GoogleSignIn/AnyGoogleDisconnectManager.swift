//
//  AnyGoogleDisconnectManager.swift
//  iLaden
//
//  Created by Mohamed Sayed on 27.03.25.
//

import GoogleSignIn

protocol AnyGoogleDisconnectManager {
    func disconnect(completion: @escaping (Error) -> Void)
}
