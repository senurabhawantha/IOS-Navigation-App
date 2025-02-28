import SwiftUI

struct ResetPasswordView: View {
    @State private var newPassword: String = ""
    @State private var confirmPassword: String = ""
    @State private var showSignInView: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 178/255, green: 255/255, blue: 252/255) // Mint Green background
                    .edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 20) {
                    HStack {
                        Button(action: {
                            // Handle back action
                        }) {
                            // Image(systemName: "chevron.left")
                            //     .font(.title)
                            //     .foregroundColor(.blue)
                        }
                        Spacer()
                    }
                    .padding(.horizontal)
                    
                    Text("Reset Password")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.top, 20)
                    
                    Text("Create new password")
                        .font(.headline)
                        .foregroundColor(.gray)
                        .padding(.top, 5)
                    
                    Text("Your new password must be unique from those previously used.")
                        .font(.body)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                    
                    SecureField("New Password", text: $newPassword)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        .padding(.horizontal)
                    
                    SecureField("Confirm Password", text: $confirmPassword)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        .padding(.horizontal)
                    
                    Button(action: {
                        // Handle reset password action
                        // For demonstration, navigate to SignInView
                        // In a real app, you would handle password reset here
                        self.showSignInView = true
                    }) {
                        Text("RESET PASSWORD")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(8)
                            .padding(.horizontal)
                    }
                    
                    NavigationLink(destination: SignInView(), isActive: $showSignInView) {
                        EmptyView()
                    }
                    .hidden()
                }
                .padding(.vertical, 50)
            }
            .navigationBarHidden(true) // Hide the navigation bar
        }
    }
}

struct ResetPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ResetPasswordView()
    }
}
