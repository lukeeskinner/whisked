//
//  Login.swift
//  whisked
//
//  Created by Luke Skinner on 2/12/26.
//

import SwiftUI
import UIKit

struct Login: View{
    
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isLoading = false
    @State private var errorMessage : String?
    
    var body: some View {
        VStack(spacing: 25){
           Text("Welcome to whisked")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(.green)
            TextField("Username", text: $username)
                .textFieldStyle(.roundedBorder)
                .autocapitalization(.none)
                .autocorrectionDisabled(true)
            SecureField("Password", text:$password)
                .textFieldStyle(.roundedBorder)
            
                        
                
            
            
        }
        
        
    }
    
    
    
    
}


