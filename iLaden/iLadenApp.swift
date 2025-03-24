//
//  iLadenApp.swift
//  iLaden
//
//  Created by Mohamed Sayed on 17.01.25.
//

import SwiftUI
import GoogleSignIn

@main
struct iLadenApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onOpenURL { url in
                    GIDSignIn.sharedInstance.handle(url)
                }
        }
    }
}
