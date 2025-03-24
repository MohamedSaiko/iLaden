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
    func set(secret: String, forKey key: String) throws
}

protocol AnySecureStorageGetter {
    func get(forKey key: String) -> String?
}

protocol AnySecureStorageUpdater {
    func update(secret: String, forKey key: String) throws
}

protocol AnySecureStorageRemover {
    func delete(forKey key: String) throws
}
