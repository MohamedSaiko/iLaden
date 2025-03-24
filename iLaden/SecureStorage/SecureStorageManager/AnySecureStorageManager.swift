//
//  AnySecureStorage.swift
//  iLaden
//
//  Created by Mohamed Sayed on 23.03.25.
//

import Foundation

protocol AnySecureStorageManager: AnySecureStorageSetter, AnySecureStorageGetter, AnySecureStorageUpdater, AnySecureStorageRemover {
}

protocol AnySecureStorageSetter {
    func setSecret(secret: String, forKey key: String) throws
}

protocol AnySecureStorageGetter {
    func getSecret(forKey key: String) -> String?
}

protocol AnySecureStorageUpdater {
    func updateSecret(secret: String, forKey key: String) throws
}

protocol AnySecureStorageRemover {
    func deleteSecret(forKey key: String) throws
}
