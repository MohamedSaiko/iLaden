//
//  AnySecureStorageRemover.swift
//  iLaden
//
//  Created by Mohamed Sayed on 27.03.25.
//

protocol AnySecureStorageRemover {
    func deleteSecret(forKey key: String) throws
}
