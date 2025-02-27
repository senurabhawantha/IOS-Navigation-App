import SwiftUI

struct SignInView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack {
            Text("Welcome to NIBM")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 50) // Increased top padding to move it to the top
            Spacer() // Pushes everything to the top
            
            VStack(spacing: 20){
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Email")
                        .font(.headline)
                        .foregroundColor(.black)
                    
                    TextField("Enter your email", text: $email)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                    
                    Text("Password")
                        .font(.headline)
                        .foregroundColor(.black)
                    
                    SecureField("Enter your password", text: $password)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                }
                .padding(.horizontal)
                .padding(.bottom)
                
                HStack {
                    Spacer()
                    Button("Forgotten Password?") {
                        // Handle forgotten password action
                    }
                    .font(.footnote)
                    .foregroundColor(.blue)
                    .padding(.trailing, 20)
                }
                
                Button(action: {
                    // Handle login action
                }) {
                    Text("SIGN IN")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(8)
                }
                .padding(.horizontal)
                
                Text("Or")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding()
                
                // Sign-In with Apple Button
                Button(action: {
                    // Handle sign-in with Apple action
                }) {
                    HStack {
                        Image(systemName: "apple.logo") // Apple logo
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20) // Adjust size
                            .foregroundColor(.white) // Apple logo color
                        
                        Text("Continue with Apple")
                            .font(.headline)
                            .foregroundColor(.white)
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(8)
                }
                .padding(.horizontal)
                
                Button("Don’t have an account? Sign up Now") {
                    // Handle sign-up action
                }
                .font(.footnote)
                .foregroundColor(.blue)
                .padding(.bottom)
            }
            .padding()
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
