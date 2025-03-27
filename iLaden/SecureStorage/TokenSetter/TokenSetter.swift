//
//  TokenSetter.swift
//  iLaden
//
//  Created by Mohamed Sayed on 24.03.25.
//

final class TokenSetter: AnyTokenSetter {
    private let secureStorageSetter: AnySecureStorageSetter
    
    init(secureStorageSetter: AnySecureStorageSetter = KeyChainSetter()) {
        self.secureStorageSetter = secureStorageSetter
    }
    
    func setToken(token: String, forKey key: String) throws {
        try secureStorageSetter.setSecret(secret: token, forKey: key)
    }
}
