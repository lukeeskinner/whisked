//
//  Login.swift
//  whisked
//
//  Created by Luke Skinner on 2/12/26.
//

import SwiftUI

struct Login: View{
    
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isLoading = false
    @State private var errorMessage : String?
    
    var isFormValid : Bool {
        return !username.isEmpty && !password.isEmpty
    }
    
    var body: some View {
        VStack{
            
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
            .padding(.bottom, 40)
            
            VStack(spacing: 16){
                TextField("Username or Email", text: $username)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled(true)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                
                SecureField("Password", text:$password)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                
            }
            
            if let errorMessage {
                Text(errorMessage)
                    .foregroundStyle(.red)
                    .font(.footnote)
                    .padding(.top, 8)
            }
            
            
    
            
            Button() {
                signIn()
                
            } label: {
                if isLoading {
                    ProgressView()
                    .tint(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                }
                else {
                    Text("Sign in")
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .padding()
                }
                
            }
            
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(14)
            .disabled(!isFormValid || isLoading)
            .padding(.top, 16)
            Spacer()
            
            HStack {
                Text("Don't have an account?")
                    .foregroundStyle(.secondary)
                Button("Sign Up"){
                    // nav
                }
                
                .fontWeight(.semibold)
            }
            .font(.footnote)
            .padding(.bottom, 30)
    
            
        }
        .padding(.horizontal, 24)
    }
    
    private func signIn() {
            isLoading = true
            errorMessage = nil
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                isLoading = false
                
                if username != "test" {
                    errorMessage = "Invalid username or password"
                }
            }
        }
}


