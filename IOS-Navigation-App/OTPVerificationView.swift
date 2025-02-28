import SwiftUI

struct OTPVerificationView: View {
    @State private var otp1: String = ""
    @State private var otp2: String = ""
    @State private var otp3: String = ""
    @State private var otp4: String = ""
    @State private var showResetPasswordView: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.white // Change background color to white
                    .edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 20) {
//                    HStack {
//                        Button(action: {
//                            // Handle back action
//                        }) {
////                            Image(systemName: "chevron.left")
////                                .font(.title)
////                                .foregroundColor(.blue)
//                        }
//                        Spacer()
//                    }
//                    .padding(.horizontal)
                    
                    Text("OTP Verification")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.top, 20)
                    
                    Image(systemName: "envelope.badge.shield.half.filled")
                        .font(.system(size: 100))
                        .foregroundColor(.black)
                        .padding(.bottom, 75)
                        .padding(.top, 150)
                    
                    Text("Enter the verification code we just sent on your email address.")
                        .font(.body)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                    
                    HStack(spacing: 15) {
                        TextField("", text: $otp1)
                            .frame(width: 50, height: 50)
                            .background(Color(.systemGray4))
                            .cornerRadius(8)
                            .multilineTextAlignment(.center)
                            .keyboardType(.numberPad)
                        
                        TextField("", text: $otp2)
                            .frame(width: 50, height: 50)
                            .background(Color(.systemGray4))
                            .cornerRadius(8)
                            .multilineTextAlignment(.center)
                            .keyboardType(.numberPad)
                        
                        TextField("", text: $otp3)
                            .frame(width: 50, height: 50)
                            .background(Color(.systemGray4))
                            .cornerRadius(8)
                            .multilineTextAlignment(.center)
                            .keyboardType(.numberPad)
                        
                        TextField("", text: $otp4)
                            .frame(width: 50, height: 50)
                            .background(Color(.systemGray4))
                            .cornerRadius(8)
                            .multilineTextAlignment(.center)
                            .keyboardType(.numberPad)
                    }
                    .padding()
                    
                    Button(action: {
                        // Handle verify code action
                        // For demonstration, navigate to ResetPasswordView
                        // In a real app, you would handle OTP verification here
                        self.showResetPasswordView = true
                    }) {
                        Text("VERIFY CODE")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(8)
                            .padding(.horizontal)
                    }
                    
                    NavigationLink(destination: ResetPasswordView(), isActive: $showResetPasswordView) {
                        EmptyView()
                    }
                    .hidden()
                    
                    NavigationLink(destination: ForgotPasswordView()) {
                        Text("Didn’t receive code? Resend code")
                            .font(.footnote)
                            .foregroundColor(.black)
                    }
                    .padding()
                }
                .padding(.vertical, 25)
            }
//            .navigationBarHidden(true) // Hide the navigation bar
        }
    }
}

struct OTPVerificationView_Previews: PreviewProvider {
    static var previews: some View {
        OTPVerificationView()
    }
}
