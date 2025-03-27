//
//  AnySecureStorageSetter.swift
//  iLaden
//
//  Created by Mohamed Sayed on 27.03.25.
//

protocol AnySecureStorageSetter {
    func setSecret(secret: String, forKey key: String) throws
}
