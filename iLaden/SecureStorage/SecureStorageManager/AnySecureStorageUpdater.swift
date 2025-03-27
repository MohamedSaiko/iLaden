//
//  AnySecureStorageUpdater.swift
//  iLaden
//
//  Created by Mohamed Sayed on 27.03.25.
//

protocol AnySecureStorageUpdater {
    func updateSecret(secret: String, forKey key: String) throws
}
