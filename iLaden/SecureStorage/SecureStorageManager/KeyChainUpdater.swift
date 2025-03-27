//
//  KeyChainUpdater.swift
//  iLaden
//
//  Created by Mohamed Sayed on 27.03.25.
//

import Security

final class KeyChainUpdater: AnySecureStorageUpdater {
    func updateSecret(secret: String, forKey key: String) throws {
        guard let data = secret.data(using: .utf8) else { return }
        
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key
        ]
        
        let updateQuery: [String: Any] = [
            kSecValueData as String: data
        ]
        
        let status = SecItemUpdate(query as CFDictionary, updateQuery as CFDictionary)
        
        guard status == errSecSuccess else {
            throw KeychainError.unknown(status)
        }
    }
}
