//
//  KeyChainRemover.swift
//  iLaden
//
//  Created by Mohamed Sayed on 27.03.25.
//

import Security

final class KeyChainRemover: AnySecureStorageRemover {
    func deleteSecret(forKey key: String) throws {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key
        ]
        
        let status = SecItemDelete(query as CFDictionary)
        
        guard status == errSecSuccess else {
            throw KeychainError.unknown(status)
        }
    }
}
