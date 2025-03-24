//
//  TokenUpdater.swift
//  iLaden
//
//  Created by Mohamed Sayed on 24.03.25.
//

import Foundation

final class TokenUpdater: AnyTokenUpdater {
    private let secureStorageManager: AnySecureStorageManager
    
    init(secureStorageManager: AnySecureStorageManager = KeyChainManager()) {
        self.secureStorageManager = secureStorageManager
    }
    
    func updateToken(token: String, forKey key: String) throws {
        try secureStorageManager.update(secret: token, forKey: key)
    }
}
