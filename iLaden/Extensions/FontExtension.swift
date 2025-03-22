//
//  FontExtension.swift
//  iLaden
//
//  Created by Mohamed Sayed on 22.03.25.
//

import SwiftUI

extension Font {
    static func isPrimary(withSize size: CGFloat) -> Font {
        return .custom("Roboto.ttf", size: size)
    }
}
