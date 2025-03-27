//
//  TokenUpdater.swift
//  iLaden
//
//  Created by Mohamed Sayed on 24.03.25.
//

final class TokenUpdater: AnyTokenUpdater {
    private let secureStorageUpdater: AnySecureStorageUpdater
    
    init(secureStorageUpdater: AnySecureStorageUpdater = KeyChainUpdater()) {
        self.secureStorageUpdater = secureStorageUpdater
    }
    
    func updateToken(token: String, forKey key: String) throws {
        try secureStorageUpdater.updateSecret(secret: token, forKey: key)
    }
}
