//import SwiftUI
//
//struct OTPVerificationView: View {
//    @State private var otp1: String = ""
//    @State private var otp2: String = ""
//    @State private var otp3: String = ""
//    @State private var otp4: String = ""
//    @State private var showResetPasswordView: Bool = false
//    
//    var body: some View {
//        NavigationView {
//            ZStack {
//                Color.white // Change background color to white
//                    .edgesIgnoringSafeArea(.all)
//                
//                VStack(spacing: 20) {
////                    HStack {
////                        Button(action: {
////                            // Handle back action
////                        }) {
//////                            Image(systemName: "chevron.left")
//////                                .font(.title)
//////                                .foregroundColor(.blue)
////                        }
////                        Spacer()
////                    }
////                    .padding(.horizontal)
//                    
//                    Text("OTP Verification")
//                        .font(.largeTitle)
//                        .fontWeight(.bold)
//                        .padding(.top, 20)
//                    
//                    Image(systemName: "envelope.badge.shield.half.filled")
//                        .font(.system(size: 100))
//                        .foregroundColor(.black)
//                        .padding(.bottom, 75)
//                        .padding(.top, 150)
//                    
//                    Text("Enter the verification code")
//                        .font(.title3)
//                        .foregroundColor(.black)
//                        .multilineTextAlignment(.center)
//                        .padding(.horizontal)
//                    
//                    HStack(spacing: 35) {
//                        TextField("", text: $otp1)
//                            .frame(width: 50, height: 50)
//                            .background(Color(.systemGray4))
//                            .cornerRadius(8)
//                            .multilineTextAlignment(.center)
//                            .keyboardType(.numberPad)
//                        
//                        TextField("", text: $otp2)
//                            .frame(width: 50, height: 50)
//                            .background(Color(.systemGray4))
//                            .cornerRadius(8)
//                            .multilineTextAlignment(.center)
//                            .keyboardType(.numberPad)
//                        
//                        TextField("", text: $otp3)
//                            .frame(width: 50, height: 50)
//                            .background(Color(.systemGray4))
//                            .cornerRadius(8)
//                            .multilineTextAlignment(.center)
//                            .keyboardType(.numberPad)
//                        
//                        TextField("", text: $otp4)
//                            .frame(width: 50, height: 50)
//                            .background(Color(.systemGray4))
//                            .cornerRadius(8)
//                            .multilineTextAlignment(.center)
//                            .keyboardType(.numberPad)
//                    }
//                    .padding()
//                    
//                    Button(action: {
//                        // Handle verify code action
//                        // For demonstration, navigate to ResetPasswordView
//                        // In a real app, you would handle OTP verification here
//                        self.showResetPasswordView = true
//                    }) {
//                        Text("VERIFY CODE")
//                            .font(.headline)
//                            .foregroundColor(.white)
//                            .frame(maxWidth: .infinity)
//                            .padding()
//                            .background(Color.blue)
//                            .cornerRadius(8)
//                            .padding(.horizontal)
//                    }
//                    
//                    NavigationLink(destination: ResetPasswordView(), isActive: $showResetPasswordView) {
//                        EmptyView()
//                    }
//                    .hidden()
//                    
//                    NavigationLink(destination: ForgotPasswordView()) {
//                        Text("Didn’t receive code? Resend code")
//                            .font(.body)
//                            .foregroundColor(.black)
//                            
//                    }
//                    .padding()
//                }
//                .padding(.vertical, 25)
//            }
//            .navigationBarHidden(true) // Hide the navigation bar
//        }
//    }
//}
//
//struct OTPVerificationView_Previews: PreviewProvider {
//    static var previews: some View {
//        OTPVerificationView()
//    }
//}
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
                Color.white
                    .edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 20) {
                    // Back Button (Uncomment if needed)
                    HStack {
                        Button(action: {
                            // Handle back action
                        }) {
                            Image(systemName: "chevron.left")
                                .font(.title)
                                .foregroundColor(.blue)
                        }
                        Spacer()
                    }
                    .padding(.horizontal)
                    
                    Text("OTP Verification")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.top, 20)
                    
                    Image(systemName: "envelope.badge.shield.half.filled")
                        .font(.system(size: 100))
                        .foregroundColor(.black)
                        .padding(.bottom, 75)
                        .padding(.top, 50)
                    
                    Text("Enter the verification code")
                        .font(.title3)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                    
                    HStack(spacing: 20) {
                        OTPTextField(text: $otp1)
                        OTPTextField(text: $otp2)
                        OTPTextField(text: $otp3)
                        OTPTextField(text: $otp4)
                    }
                    .padding()
                    
                    Button(action: {
                        // Handle OTP verification logic here
                        showResetPasswordView = true
                    }) {
                        Text("VERIFY CODE")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(8)
                    }
                    .padding(.horizontal)
                    
                    NavigationLink(destination: ResetPasswordView(), isActive: $showResetPasswordView) {
                        EmptyView()
                    }

                    Button(action: {
                        // Handle OTP resend logic
                    }) {
                        Text("Didn’t receive code? Resend code")
                            .font(.body)
                            .foregroundColor(.black)
                    }
                    .padding()
                }
                .padding(.vertical, 25)
            }
            .navigationBarHidden(true)
        }
    }
}

// Custom OTP TextField for cleaner UI
struct OTPTextField: View {
    @Binding var text: String
    
    var body: some View {
        TextField("", text: $text)
            .frame(width: 50, height: 50)
            .background(Color(.systemGray4))
            .cornerRadius(8)
            .multilineTextAlignment(.center)
            .keyboardType(.numberPad)
            .textContentType(.oneTimeCode)
    }
}

struct OTPVerificationView_Previews: PreviewProvider {
    static var previews: some View {
        OTPVerificationView()
    }
}
