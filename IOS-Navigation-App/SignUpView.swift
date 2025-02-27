import SwiftUI

struct SignUpView: View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    
    var body: some View {
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
                
//                // 3-Column Grid Layout
//                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 5) {
//                    GridItemView(title: "", icon: ".fill")
//                    GridItemView(title: "", icon: "apple.logo")
//                    GridItemView(title: "", icon: "")
//                }
//                .padding(.horizontal)
//
                // Login Button
                Button("Already have an account? Log In Now") {
                    // Handle login navigation
                }
                .font(.footnote)
                .foregroundColor(.blue)
            }
            .padding(.vertical, 50)
        }
    }
}

struct GridItemView: View {
    let title: String
    let icon: String
    
    var body: some View {
        VStack {
            Image(systemName: icon)
                .resizable()
                .scaledToFit()
                .frame(width: 25, height: 25)
                .foregroundColor(.blue)
            Text(title)
                .font(.footnote)
                .foregroundColor(.black)
        }
        .frame(width: 60, height: 60)
        .background(Color(.systemGray6))
        .cornerRadius(6)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
