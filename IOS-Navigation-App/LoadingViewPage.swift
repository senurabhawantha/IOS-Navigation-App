//import SwiftUI
//
//struct LoadingViewPage: View {
//    @State private var isPulsing = false
//    
//    var body: some View {
//        NavigationView {
//            ZStack {
//                // Background Color
//                Color(red: 173/255, green: 216/255, blue: 230/255) // Light blue color #ADD8E6
//                    .edgesIgnoringSafeArea(.all)
//                
//                VStack {
//                    
//                    
//                    // App Title at the top
//                    VStack(spacing: 5) {
//                        Text("NIBM")
//                            .font(.system(size: 75, weight: .bold, design: .rounded))
//                            .foregroundColor(.blue)
//                        Text("NAVIGATOR APP")
//                            .font(.system(size: 32, weight: .medium, design: .rounded))
//                            .foregroundColor(.black.opacity(0.25))
//                    }
//                    .padding(.top, 20) // Add some padding from the top
//                    .padding(.horizontal) // Optional: Add horizontal padding
//                    
//                    
//                    
//                    // Logo in the middle of the page
//                    Image("nibm_icon") // Ensure the asset is available
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .frame(width: 130, height: 130)
//                        .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 5)
//                    
//                    // Pushes everything to the bottom
//                    
//                    // Figure with Glowing Effect centered
//                    Image(systemName: "iphone.gen1.badge.location")
//                        .font(.system(size: 75))
//                        .foregroundColor(.red)
//                        .padding(.bottom, 85)
//                        .shadow(color: Color.white.opacity(0.8), radius: 10, x: 0, y: 0) // Keeps glowing effect
//                        .scaleEffect(isPulsing ? 1.1 : 1.0)
//                        .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true), value: isPulsing)
//                        .onAppear {
//                            isPulsing.toggle()
//                        }
//                        .frame(maxWidth: .infinity, alignment: .center) // Center horizontally
//                        .padding(.bottom, 20)
//                    
//                    
//                    // Get Started Button
//                    NavigationLink(destination: SignInView()) {
//                        HStack {
//                            Text("Get Started")
//                                .font(.system(size: 20, weight: .medium, design: .rounded))
//                            Image(systemName: "chevron.right")
//                                .font(.system(size: 18, weight: .medium))
//                        }
//                        .foregroundColor(.white)
//                        .padding(.horizontal, 35)
//                        .padding(.vertical, 15)
//                        .background(Color.black.opacity(0.4))
//                        .cornerRadius(30)
//                        .shadow(color: Color.white.opacity(0.3), radius: 10, x: 0, y: 5)
//                    }
//                    .buttonStyle(PlainButtonStyle())
//                }
//            }
//            .navigationBarHidden(true) // Hide the navigation bar
//        }
//    }
//}
//
//struct LoadingViewPage_Previews: PreviewProvider {
//    static var previews: some View {
//        LoadingViewPage()
//    }
//}
import SwiftUI

struct LoadingViewPage: View {
    @State private var isPulsing = false
    
    var body: some View {
        NavigationView { // Keep NavigationView only here
            ZStack {
                Color(red: 173/255, green: 216/255, blue: 230/255)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    VStack(spacing: 5) {
                        Text("NIBM")
                            .font(.system(size: 75, weight: .bold, design: .rounded))
                            .foregroundColor(.blue)
                        Text("NAVIGATOR APP")
                            .font(.system(size: 32, weight: .medium, design: .rounded))
                            .foregroundColor(.black.opacity(0.25))
                    }
                    .padding(.top, 20)
                    
                    Image("nibm_icon")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 130, height: 130)
                        .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 5)
                    
                    Image(systemName: "iphone.gen1.badge.location")
                        .font(.system(size: 75))
                        .foregroundColor(.red)
                        .padding(.bottom, 85)
                        .shadow(color: Color.white.opacity(0.8), radius: 10)
                        .scaleEffect(isPulsing ? 1.1 : 1.0)
                        .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true), value: isPulsing)
                        .onAppear {
                            isPulsing.toggle()
                        }
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.bottom, 20)
                    
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
                }
            }
            .navigationBarHidden(true) // Hide nav bar only on this root screen
        }
    }
}

struct LoadingViewPage_Previews: PreviewProvider {
    static var previews: some View {
        LoadingViewPage()
    }
}
