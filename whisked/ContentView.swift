//
//  ContentView.swift
//  whisked
//
//  Created by Luke Skinner on 2/1/26.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authService : AuthenticationService
    var body: some View {
//        if authService.isAuthenticated {
//            Text("logged in!")
//            // home screen
//        }
//        else {
//            Login()
//        }
//        
        Signup()
    }
}

#Preview {
    ContentView()
}
