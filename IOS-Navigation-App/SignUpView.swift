import SwiftUI

struct SignUpView: View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var showHomeView: Bool = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                Text("Welcome to NIBM !")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, 50)
                
                VStack(spacing: 20){
                    
                    // Name Field
                    VStack(alignment: .leading) {
                        Text("Full Name")
                            .font(.subheadline)
                            .foregroundColor(.black)
                        TextField("Enter your Name", text: $name)
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(8)
                    }
                    .padding(.horizontal)
                    
                    // Email Field
                    VStack(alignment: .leading) {
                        Text("Email Address")
                            .font(.subheadline)
                            .foregroundColor(.black)
                        TextField("Enter your Email", text: $email)
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(8)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                    }
                    .padding(.horizontal)
                    
                    // Password Field
                    VStack(alignment: .leading) {
                        Text("Password")
                            .font(.subheadline)
                            .foregroundColor(.black)
                        SecureField("Enter your Password", text: $password)
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(8)
                    }
                    .padding(.horizontal)
                    
                    // Confirm Password Field
                    VStack(alignment: .leading) {
                        Text("Confirm Password")
                            .font(.subheadline)
                            .foregroundColor(.black)
                        SecureField("Confirm your password", text: $confirmPassword)
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(8)
                    }
                    .padding(.horizontal)
                    
                    // Sign-Up Button
                    Button(action: {
                        // Handle sign-up action
                        // For demonstration, navigate to HomeView
                        // In a real app, you would handle registration here
                        self.showHomeView = true
                    }) {
                        Text("SIGN UP")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(8)
                    }
                    .padding(.horizontal)
                    
                    NavigationLink(destination: HomeView(), isActive: $showHomeView) {
                        EmptyView()
                    }
                    .hidden()
                    
                    // Or Text
                    Text("Or")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(5)
                    
                    
                    // Sign-Up Button
                    Button(action: {
                        // Handle sign-up action
                    }) {
                        Text("Continue with Apple")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.black)
                            .cornerRadius(8)
                    }
                    .padding(.horizontal)
                    
                    // Login Button
                    NavigationLink(destination: SignInView()) {
                        Text("Already have an account? Log In Now")
                            .font(.footnote)
                            .foregroundColor(.blue)
                    }
                }
                .padding(.vertical, 50)
            }
            .navigationBarHidden(true) // Hide the navigation bar
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
