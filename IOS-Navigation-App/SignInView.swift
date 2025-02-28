//import SwiftUI
//
//enum ViewState {
//    case signIn, signUp, home, forgotPassword
//}
//
//struct SignInView: View {
//    @State private var email: String = ""
//    @State private var password: String = ""
//    @State private var viewState: ViewState = .signIn
//    
//    var body: some View {
//        NavigationView {
//            Group {
//                if viewState == .signIn {
//                    VStack {
//                        Text("Welcome to NIBM")
//                            .font(.largeTitle)
//                            .fontWeight(.bold)
//                            .padding(.top, 50) // Increased top padding to move it to the top
//                        
//                        Spacer() // Pushes everything to the top
//                        
//                        Image(systemName: "graduationcap")
//                            .font(.system(size: 115))
//                            .foregroundColor(.black)
//                            .padding()
//                        
//                        Spacer() // Pushes everything to the bottom
//                        
//                        VStack(spacing: 20){
//                            
//                            VStack(alignment: .leading, spacing: 10) {
//                                Text("Email")
//                                    .font(.headline)
//                                    .foregroundColor(.black)
//                                
//                                TextField("Enter your email", text: $email)
//                                    .padding()
//                                    .background(Color(.systemGray6))
//                                    .cornerRadius(8)
//                                    .keyboardType(.emailAddress)
//                                    .autocapitalization(.none)
//                                
//                                Text("Password")
//                                    .font(.headline)
//                                    .foregroundColor(.black)
//                                
//                                SecureField("Enter your password", text: $password)
//                                    .padding()
//                                    .background(Color(.systemGray6))
//                                    .cornerRadius(8)
//                            }
//                            .padding(.horizontal)
//                            .padding(.bottom)
//                            
//                            HStack {
//                                Spacer()
//                                Button(action: {
//                                    self.viewState = .forgotPassword
//                                }) {
//                                    Text("Forgotten Password?")
//                                        .font(.footnote)
//                                        .foregroundColor(.black)
//                                }
//                                .padding(.trailing, 20)
//                            }
//                            
//                            Button(action: {
//                                // Handle login action
//                                // For demonstration, navigate to ContentView
//                                self.viewState = .home
//                            }) {
//                                Text("SIGN IN")
//                                    .font(.headline)
//                                    .foregroundColor(.white)
//                                    .frame(maxWidth: .infinity)
//                                    .padding()
//                                    .background(Color.blue)
//                                    .cornerRadius(8)
//                            }
//                            .padding(.horizontal)
////
////                            Text("Or")
////                                .font(.subheadline)
////                                .foregroundColor(.gray)
////                                .padding()
//                            
////                            // Sign-In with Apple Button
////                            Button(action: {
////
////                                // Handle sign-in with Apple action
////                            }) {
////                                HStack {
////                                    Image(systemName: "apple.logo") // Apple logo
////                                        .resizable()
////                                        .scaledToFit()
////                                        .frame(width: 20, height: 20) // Adjust size
////                                        .foregroundColor(.white) // Apple logo color
////
////                                    Text("Continue with Apple")
////                                        .font(.headline)
////                                        .foregroundColor(.white)
////                                }
////                                .frame(maxWidth: .infinity)
////                                .padding()
////                                .background(Color.black)
////                                .cornerRadius(8)
////                            }
////                            .padding(.horizontal)
//                            
//                            Button(action: {
//                                self.viewState = .signUp
//                            }) {
//                                Text("Don’t have an account? Sign up Now")
//                                    .font(.footnote)
//                                    .foregroundColor(.black)
//                            }
//                            .padding(.bottom)
//                        }
//                        .padding()
//                    }
//                    .background(Color.white) // Change background color to white
//                } else if viewState == .signUp {
//                    SignUpView()
//                } else if viewState == .home {
//                    ContentView() // Navigate to ContentView
//                } else if viewState == .forgotPassword {
//                    ForgotPasswordView()
//                }
//            }
//            .navigationBarHidden(true) // Hide the navigation bar
//        }
//    }
//}
//
//struct SignInView_Previews: PreviewProvider {
//    static var previews: some View {
//        SignInView()
//    }
//}
import SwiftUI

enum ViewState {
    case signIn, signUp, home, forgotPassword
}

struct SignInView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var viewState: ViewState = .signIn
    
    var body: some View {
        Group {
            if viewState == .signIn {
                VStack {
                    Text("Welcome to NIBM")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.top, 50)
                    
                    Spacer()
                    
                    Image(systemName: "graduationcap")
                        .font(.system(size: 115))
                        .foregroundColor(.black)
                        .padding()
                    
                    Spacer()
                    
                    VStack(spacing: 20){
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Email")
                                .font(.headline)
                                .foregroundColor(.black)
                            
                            TextField("Enter your email", text: $email)
                                .padding()
                                .background(Color(.systemGray4))
                                .cornerRadius(8)
                                .keyboardType(.emailAddress)
                                .autocapitalization(.none)
                            
                            Text("Password")
                                .font(.headline)
                                .foregroundColor(.black)
                            
                            SecureField("Enter your password", text: $password)
                                .padding()
                                .background(Color(.systemGray4))
                                .cornerRadius(8)
                        }
                        .padding(.horizontal)
                        .padding(.bottom)
                        
                        HStack {
                            Spacer()
                            NavigationLink(destination: ForgotPasswordView()) {
                                Text("Forgotten Password?")
                                    .font(.footnote)
                                    .foregroundColor(.black)
                            }
                            .padding(.trailing, 20)
                        }
                        
                        Button(action: {
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
                        
                        Button(action: {
                            self.viewState = .signUp
                        }) {
                            Text("Don’t have an account? Sign up Now")
                                .font(.footnote)
                                .foregroundColor(.black)
                        }
                        .padding(.bottom)
                    }
                    .padding()
                }
                .background(Color.white)
                .navigationBarBackButtonHidden(false) // Ensure back button works correctly
            } else if viewState == .signUp {
                SignUpView()
            } else if viewState == .home {
                ContentView()
            }
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
