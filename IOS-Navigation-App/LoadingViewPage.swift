import SwiftUI

struct LoadingViewPage: View {
    @State private var isAnimating = false
    
    var body: some View {
        NavigationView {
            ZStack {
                // Animated Gradient Background
                LinearGradient(gradient: Gradient(colors: [Color(red: 178/255, green: 255/255, blue: 252/255).opacity(0.8), Color(red: 178/255, green: 255/255, blue: 252/255).opacity(0.4)]),
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
                        Text("NAVIGATOR APP")
                            .font(.system(size: 32, weight: .medium, design: .rounded))
                            .foregroundColor(.black.opacity(25))
                    }
                    .opacity(isAnimating ? 1 : 0.6)
                    .animation(Animation.easeIn(duration: 1.5), value: isAnimating)
                    .padding(.bottom, 40)
                    
                    // Figure with Glowing Effect (No Animation)
                    Image(systemName: "figure.walk.circle")
                        .font(.system(size: 50))
                        .foregroundColor(.red)
                        .shadow(color: Color.white.opacity(0.8), radius: 10, x: 0, y: 0) // Keeps glowing effect
                        .padding(.bottom, 20)


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
