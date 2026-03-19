import SwiftUI

struct Signup: View {
    @EnvironmentObject var authService: AuthenticationService
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack(spacing: 24) {
            Spacer()

            Image("whisked_logo")
                .resizable()
                .scaledToFit()
                .frame(width: 140, height: 180)

            VStack(spacing: 10) {
                Text("Create your Whisked account")
                    .font(.system(size: 30, weight: .bold))

                Text("Start logging matcha, rating favorites, and building your profile.")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 24)
            }

            if let error = authService.errorMessage {
                Text(error)
                    .foregroundStyle(.red)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 24)
            }

            Button {
                Task {
                    await authService.signup()
                }
            } label: {
                if authService.isLoading {
                    ProgressView()
                        .frame(maxWidth: .infinity)
                        .padding()
                } else {
                    Text("Create Account")
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .padding()
                }
            }
            .buttonStyle(.borderedProminent)
            .padding(.horizontal, 24)

            Button("Already have an account? Log in") {
                dismiss()
            }
            .padding(.top, 4)

            Spacer()
        }
        .padding()
    }
}
