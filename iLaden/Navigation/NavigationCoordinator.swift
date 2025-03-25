//
//  NavigationCoordinator.swift
//  iLaden
//
//  Created by Mohamed Sayed on 25.03.25.
//

import Foundation

enum AppRoute: Hashable {
    case login
    case home
//    case detail(String)
}

final class NavigationCoordinator: ObservableObject {
    @Published var path: [AppRoute] = []
    
    func push(_ route: AppRoute) {
        path.append(route)
    }
    
    func pop() {
        if !path.isEmpty {
            path.removeLast()
        }
    }
    
    func reset() {
        path.removeAll()
    }
}
