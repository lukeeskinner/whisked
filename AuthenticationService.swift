import Foundation
import Auth0
import Combine

@MainActor
class AuthenticationService: ObservableObject {
    @Published var isAuthenticated = false
    @Published var user: UserInfo?
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private let credentialsManager = CredentialsManager(authentication: Auth0.authentication())
    
    init() {
        Task {
            await checkAuthenticationStatus()
        }
    }
    
    private func checkAuthenticationStatus() async {
        isLoading = true
        defer { isLoading = false }
        
        guard let credentials = try? await credentialsManager.credentials() else {
            isAuthenticated = false
            return
        }
        
        isAuthenticated = true
        // Get user info from the ID token
        user = credentialsManager.user
    }
    
    
    func signup() async {
           isLoading = true
           errorMessage = nil
           defer { isLoading = false }

           do {
               let credentials = try await Auth0
                   .webAuth()
                   .scope("openid profile email offline_access")
                   .parameters(["screen_hint": "signup"])
                   .start()

               _ = credentialsManager.store(credentials: credentials)
               isAuthenticated = true
               user = credentialsManager.user
           } catch {
               errorMessage = "Sign up failed: \(error.localizedDescription)"
           }
       }

    
    func login() async {
        isLoading = true
        errorMessage = nil
        defer { isLoading = false }
        
        do {
            let credentials = try await Auth0
                .webAuth()
                .scope("openid profile email offline_access")
                .start()
            
            _ = credentialsManager.store(credentials: credentials)
            isAuthenticated = true
            // Get user info from the ID token
            user = credentialsManager.user
        } catch {
            errorMessage = "Login failed: \(error.localizedDescription)"
        }
    }
    
    func logout() async {
        isLoading = true
        defer { isLoading = false }
        
        do {
            try await Auth0
              .webAuth()
              .clearSession()
            _ = credentialsManager.clear()
            isAuthenticated = false
            user = nil
        } catch {
            errorMessage = "Logout failed: \(error.localizedDescription)"
        }
    }
}
