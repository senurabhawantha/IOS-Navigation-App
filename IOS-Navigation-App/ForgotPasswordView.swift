import SwiftUI

struct ForgotPasswordView: View {
    @State private var email: String = ""
    @State private var showOTPVerificationView: Bool = false
    
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
//                            Image(systemName: "chevron.left")
//                                .font(.title)
//                                .foregroundColor(.blue)
                        }
                        Spacer()
                    }
                    .padding(.horizontal)
                    
                    Text("Forgot Password?")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.top, 20)
                    
                    Text("Don't worry!. Please enter the email address linked with your account.")
                        .font(.body)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                    
                    TextField("Enter your email", text: $email)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        .padding(.horizontal)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                    
                    Button(action: {
                        // Handle send code action
                        // For demonstration, navigate to OTPVerificationView
                        // In a real app, you would handle sending OTP here
                        self.showOTPVerificationView = true
                    }) {
                        Text("SEND CODE")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(8)
                            .padding(.horizontal)
                    }
                    
                    NavigationLink(destination: OTPVerificationView(), isActive: $showOTPVerificationView) {
                        EmptyView()
                    }
                    .hidden()
                    
                    NavigationLink(destination: SignInView()) {
                        Text("Remember Password? Login")
                            .font(.footnote)
                            .foregroundColor(.blue)
                    }
                    .padding()
                }
                .padding(.vertical, 50)
            }
            .navigationBarHidden(true) // Hide the navigation bar
        }
    }
}

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView()
    }
}
