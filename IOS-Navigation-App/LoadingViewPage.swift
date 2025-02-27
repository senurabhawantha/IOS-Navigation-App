import SwiftUI

struct LoadingViewPage: View {
    @State private var isAnimating = false
    
    var body: some View {
        NavigationView {
            ZStack {
                // Animated Gradient Background
                LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.7), Color.purple.opacity(0.7)]),
                               startPoint: isAnimating ? .topLeading : .bottomTrailing,
                               endPoint: isAnimating ? .bottomTrailing : .topLeading)
                    .edgesIgnoringSafeArea(.all)
                    .animation(Animation.spring(response: 2, dampingFraction: 0.5, blendDuration: 1).repeatForever(autoreverses: true), value: isAnimating)
                    .onAppear {
                        isAnimating.toggle()
                    }
                
                VStack {
                    Spacer()

                    // Logo with subtle bounce animation
                    Image("nibm_icon") // Ensure the asset is available
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 130, height: 130)
                        .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 5)
                        .scaleEffect(isAnimating ? 1.1 : 0.9)
                        .animation(Animation.interpolatingSpring(stiffness: 100, damping: 5).repeatForever(autoreverses: true), value: isAnimating)
                    
                    // App Title with animated fade-in effect
                    VStack(spacing: 5) {
                        Text("NIBM")
                            .font(.system(size: 75, weight: .bold, design: .rounded))
                            .foregroundColor(.blue)
                        Text("Navigator App")
                            .font(.system(size: 32, weight: .medium, design: .rounded))
                            .foregroundColor(.white.opacity(0.9))
                    }
                    .opacity(isAnimating ? 1 : 0.6)
                    .animation(Animation.easeIn(duration: 1.5), value: isAnimating)
                    .padding(.bottom, 40)
                    
                    // Animated Loading Indicator
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                        .scaleEffect(1.5)
                        .padding(.bottom, 30)
                        .opacity(isAnimating ? 1 : 0.5)
                        .animation(Animation.spring(response: 1, dampingFraction: 0.6, blendDuration: 1).repeatForever(autoreverses: true), value: isAnimating)
                    
                    // Get Started Button with glowing effect
                    NavigationLink(destination: SignInView()) {
                        HStack {
                            Text("Get Started")
                                .font(.system(size: 20, weight: .medium, design: .rounded))
                            Image(systemName: "chevron.right")
                                .font(.system(size: 18, weight: .medium))
                        }
                        .foregroundColor(.white)
                        .padding(.horizontal, 35)
                        .padding(.vertical, 15)
                        .background(Color.black.opacity(0.4))
                        .cornerRadius(30)
                        .shadow(color: Color.white.opacity(0.3), radius: 10, x: 0, y: 5)
                    }
                    .buttonStyle(PlainButtonStyle())
                    Spacer()
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct LoadingViewPage_Previews: PreviewProvider {
    static var previews: some View {
        LoadingViewPage()
    }
}

struct LogInView: View {
    var body: some View {
        Text("Sign In View")
            .navigationTitle("Sign In")
    }
}
