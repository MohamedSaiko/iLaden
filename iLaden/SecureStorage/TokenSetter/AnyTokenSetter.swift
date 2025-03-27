//
//  AnyTokenSetter.swift
//  iLaden
//
//  Created by Mohamed Sayed on 24.03.25.
//

protocol AnyTokenSetter {
    func setToken(token: String, forKey key: String) throws
}
