//
//  TokenGetter.swift
//  iLaden
//
//  Created by Mohamed Sayed on 24.03.25.
//

import Foundation

final class TokenGetter: AnyTokenGetter {
    private let secureStorageManager: AnySecureStorageManager
    
    init(secureStorageManager: AnySecureStorageManager = KeyChainManager()) {
        self.secureStorageManager = secureStorageManager
    }
    
    func getToken(forKey key: String) -> String {
        guard let token = secureStorageManager.get(forKey: key) else { return ""}
        return token
    }
}
