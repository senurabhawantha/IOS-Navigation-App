import SwiftUI

struct ResetPasswordView: View {
    @State private var newPassword: String = ""
    @State private var confirmPassword: String = ""
    @State private var showSignInView: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 72/255, green: 201/255, blue: 176/255) // Background color #48C9B0
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
                    
//                    Text("Create new password")
//                        .font(.headline)
//                        .foregroundColor(.black)
//                        .padding(.top, 5)
                    
                    Text("Your new password must be unique from those previously used.")
                        .font(.body)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("     New Password")
                            .font(.headline)
                            .foregroundColor(.black)
                        SecureField("New Password", text: $newPassword)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        .padding(.horizontal)
                    }
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("     Confirm Password")
                            .font(.headline)
                            .foregroundColor(.black)
                        SecureField("Confirm Password", text: $confirmPassword)
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(8)
                            .padding(.horizontal)
                    }
                    
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
