import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isLoading: Bool = false
    @State private var errorMessage: String?

    var body: some View {
        VStack(spacing: 20) {
            TextField("Email", text: $email)
                .autocapitalization(.none)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            if let errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
            }

            Button(action: login) {
                if isLoading {
                    ProgressView()
                } else {
                    Text("Login")
                        .bold()
                }
            }
            .disabled(isLoading)
        }
        .padding()
    }

    private func login() {
        isLoading = true
        Task {
            do {
                try await AuthVM.shared.loginAsync(email: email, password: password)
            } catch {
                errorMessage = error.localizedDescription
            }
            isLoading = false
        }
    }
}

#Preview {
    LoginView()
}
