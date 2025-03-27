//
//  AnyTokenUpdater.swift
//  iLaden
//
//  Created by Mohamed Sayed on 24.03.25.
//

protocol AnyTokenUpdater {
    func updateToken(token: String, forKey key: String) throws
}
