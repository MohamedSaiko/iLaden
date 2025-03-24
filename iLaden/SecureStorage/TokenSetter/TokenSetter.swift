//
//  TokenSetter.swift
//  iLaden
//
//  Created by Mohamed Sayed on 24.03.25.
//

import Foundation

final class TokenSetter: AnyTokenSetter {
    private let secureStorageManager: AnySecureStorageManager
    
    init(secureStorageManager: AnySecureStorageManager) {
        self.secureStorageManager = secureStorageManager
    }
    
    func setToken(token: String) throws {
        try secureStorageManager.set(secret: token, forKey: "IDToken")
    }
}
