//
//  TokenRemover.swift
//  iLaden
//
//  Created by Mohamed Sayed on 24.03.25.
//

import Foundation

final class TokenRemover: AnyTokenRemover {
    private let secureStorageManager: AnySecureStorageManager
    
    init(secureStorageManager: AnySecureStorageManager = KeyChainManager()) {
        self.secureStorageManager = secureStorageManager
    }

    func deleteToken(forKey key: String) throws {
        try secureStorageManager.delete(forKey: key)
    }
}
