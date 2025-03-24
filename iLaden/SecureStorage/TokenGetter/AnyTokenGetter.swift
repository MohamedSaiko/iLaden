//
//  AnyTokenGetter.swift
//  iLaden
//
//  Created by Mohamed Sayed on 24.03.25.
//

import Foundation

protocol AnyTokenGetter {
    func getToken(forKey key: String) -> String
}
