//
//  RootView.swift
//  iLaden
//
//  Created by Mohamed Sayed on 24.03.25.
//

import UIKit

final class AppDelegate {
    func getRootViewController() -> UIViewController {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let window = windowScene.windows.first else {
            return UIViewController()
        }
        return window.rootViewController ?? UIViewController()
    }
}
