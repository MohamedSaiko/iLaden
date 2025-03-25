//
//  RootView.swift
//  iLaden
//
//  Created by Mohamed Sayed on 25.03.25.
//

import SwiftUI

struct RootView: View {
    @StateObject var navigationCoordinator = NavigationCoordinator()
    
    var body: some View {
        NavigationStack(path: $navigationCoordinator.path) {
            LoginView()
                .environmentObject(navigationCoordinator)
                .navigationDestination(for: AppRoute.self) { route in
                    switch route {
                    case .login:
                        LoginView()
                    case .home:
                        HomeView()
//                    case .detail(let text):
//                        DetailView(detailText: text)
                    }
                }
        }
    }
}
