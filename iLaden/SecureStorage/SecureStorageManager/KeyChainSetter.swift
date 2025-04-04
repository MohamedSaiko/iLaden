//
//  KeyChainSetter.swift
//  iLaden
//
//  Created by Mohamed Sayed on 27.03.25.
//

import Security

final class KeyChainSetter: AnySecureStorageSetter {
    func setSecret(secret: String, forKey key: String) throws {
        guard let data = secret.data(using: .utf8) else { return }
        
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key,
            kSecValueData as String: data,
            kSecAttrAccessible as String: kSecAttrAccessibleWhenUnlocked
        ]
        
        let status = SecItemAdd(query as CFDictionary, nil)
        
        guard status != errSecDuplicateItem else {
            throw KeychainError.duplicateEntry
        }
        
        guard status == errSecSuccess else {
            throw KeychainError.unknown(status)
        }
    }
}
