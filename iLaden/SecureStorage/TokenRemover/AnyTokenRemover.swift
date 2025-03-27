//
//  AnyTokenRemover.swift
//  iLaden
//
//  Created by Mohamed Sayed on 24.03.25.
//

protocol AnyTokenRemover {
    func deleteToken(forKey key: String) throws
}
