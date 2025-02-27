import SwiftUI

enum ViewState {
    case signIn, signUp, home, forgotPassword
}

struct SignInView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var viewState: ViewState = .signIn
    
    var body: some View {
        NavigationView {
            Group {
                if viewState == .signIn {
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
                                Button(action: {
                                    self.viewState = .forgotPassword
                                }) {
                                    Text("Forgotten Password?")
                                        .font(.footnote)
                                        .foregroundColor(.blue)
                                }
                                .padding(.trailing, 20)
                            }
                            
                            Button(action: {
                                // Handle login action
                                // For demonstration, navigate to HomeView
                                // In a real app, you would handle authentication here
                                self.viewState = .home
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
                            
                            Button(action: {
                                self.viewState = .signUp
                            }) {
                                Text("Don’t have an account? Sign up Now")
                                    .font(.footnote)
                                    .foregroundColor(.blue)
                            }
                            .padding(.bottom)
                        }
                        .padding()
                    }
                } else if viewState == .signUp {
                    SignUpView()
                } else if viewState == .home {
                    HomeView()
                } else if viewState == .forgotPassword {
                    ForgotPasswordView()
                }
            }
            .navigationBarHidden(true) // Hide the navigation bar
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
