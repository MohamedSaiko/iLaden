//
//  AnySecureStorageGetter.swift
//  iLaden
//
//  Created by Mohamed Sayed on 27.03.25.
//

protocol AnySecureStorageGetter {
    func getSecret(forKey key: String) -> String?
}
