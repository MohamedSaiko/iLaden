//
//  KeychainError.swift
//  iLaden
//
//  Created by Mohamed Sayed on 27.03.25.
//

import Foundation

enum KeychainError: Error {
    case duplicateEntry
    case unknown(OSStatus)
}
