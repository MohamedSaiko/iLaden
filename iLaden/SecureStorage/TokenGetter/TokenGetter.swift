//
//  TokenGetter.swift
//  iLaden
//
//  Created by Mohamed Sayed on 24.03.25.
//

final class TokenGetter: AnyTokenGetter {
    private let secureStorageGetter: AnySecureStorageGetter
    
    init(secureStorageGetter: AnySecureStorageGetter = KeyChainGetter()) {
        self.secureStorageGetter = secureStorageGetter
    }
    
    func getToken(forKey key: String) -> String {
        guard let token = secureStorageGetter.getSecret(forKey: key) else { return ""}
        return token
    }
}
