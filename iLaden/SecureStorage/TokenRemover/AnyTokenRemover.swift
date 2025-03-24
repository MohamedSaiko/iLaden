//
//  AnyTokenRemover.swift
//  iLaden
//
//  Created by Mohamed Sayed on 24.03.25.
//

import Foundation

protocol AnyTokenRemover {
    func deleteToken(forKey key: String) throws
}
