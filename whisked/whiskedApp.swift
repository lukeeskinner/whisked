//
//  whiskedApp.swift
//  whisked
//
//  Created by Luke Skinner on 2/1/26.
//

import SwiftUI

@main
struct whiskedApp: App {
    @StateObject private var authService = AuthenticationService()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(authService)
        }
    }
}
