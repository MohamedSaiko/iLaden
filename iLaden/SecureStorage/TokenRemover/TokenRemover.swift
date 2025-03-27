//
//  TokenRemover.swift
//  iLaden
//
//  Created by Mohamed Sayed on 24.03.25.
//

final class TokenRemover: AnyTokenRemover {
    private let secureStorageRemover: AnySecureStorageRemover
    
    init(secureStorageRemover: AnySecureStorageRemover = KeyChainRemover()) {
        self.secureStorageRemover = secureStorageRemover
    }
    
    func deleteToken(forKey key: String) throws {
        try secureStorageRemover.deleteSecret(forKey: key)
    }
}
