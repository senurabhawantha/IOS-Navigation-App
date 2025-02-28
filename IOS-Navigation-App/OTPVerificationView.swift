import SwiftUI

struct OTPVerificationView: View {
    @State private var otp1: String = ""
    @State private var otp2: String = ""
    @State private var otp3: String = ""
    @State private var otp4: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
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
            
            Text("Enter the verification code we just sent on your email address.")
                .font(.body)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            HStack(spacing: 15) {
                TextField("", text: $otp1)
                    .frame(width: 50, height: 50)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .multilineTextAlignment(.center)
                    .keyboardType(.numberPad)
                
                TextField("", text: $otp2)
                    .frame(width: 50, height: 50)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .multilineTextAlignment(.center)
                    .keyboardType(.numberPad)
                
                TextField("", text: $otp3)
                    .frame(width: 50, height: 50)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .multilineTextAlignment(.center)
                    .keyboardType(.numberPad)
                
                TextField("", text: $otp4)
                    .frame(width: 50, height: 50)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .multilineTextAlignment(.center)
                    .keyboardType(.numberPad)
            }
            .padding()
            
            Button(action: {
                // Handle verify code action
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
            
            Button("Didn’t receive code? Resend code") {
                // Handle resend code action
            }
            .font(.footnote)
            .foregroundColor(.blue)
            .padding()
        }
        .padding(.vertical, 50)
    }
}

struct OTPVerificationView_Previews: PreviewProvider {
    static var previews: some View {
        OTPVerificationView()
    }
}
