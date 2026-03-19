//
//  Login.swift
//  whisked
//
//  Created by Luke Skinner on 2/12/26.
//

import SwiftUI

struct Login: View{
    @EnvironmentObject var authService : AuthenticationService
    
    var body: some View {
        NavigationStack{
            VStack{
                Spacer()
                
                Image("whisked_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                
                VStack(spacing: 8){
                    Text("Whisked")
                        .font(.system(size: 40, weight: .bold))
                    
                    Text("Log your matcha. Discover new favorites.")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                
                if let error = authService.errorMessage {
                    Text(error)
                        .foregroundStyle(.red)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 24)
                }
                
                Button {
                    Task {
                        await authService.login()
                    }
                } label: {
                    if authService.isLoading {
                        ProgressView()
                            .frame(maxWidth: .infinity)
                            .padding()
                    }
                    else {
                        Text("Log In")
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity)
                            .padding()
                    }
                }
                .buttonStyle(.borderedProminent)
                .padding(.horizontal, 24)
                
                NavigationLink {
                    Signup()
                } label : {
                    Text("Create Account")
                        .fontWeight(.medium)
                        .frame(maxWidth: .infinity)
                        .padding()
                }
                .buttonStyle(.borderedProminent)
                .padding(.horizontal, 24)
                
                Spacer()
            }
            .padding()
        }
    }
}
