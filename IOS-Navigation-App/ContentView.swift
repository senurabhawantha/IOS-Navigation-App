import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0

    var body: some View {
        VStack {
            // Your main content here
            if selectedTab == 0 {
                HomeView()
            } else if selectedTab == 1 {
                MapView()
            } else if selectedTab == 2 {
                CommunityView()
            } else if selectedTab == 3 {
                CrowdLevelView()
            } else if selectedTab == 4 {
                StudentProfileView()
            }

            // Custom navigation bar
            HStack {
                Button(action: {
                    self.selectedTab = 0
                }) {
                    VStack {
                        Image(systemName: "house.fill")
                            .font(.system(size: 25)) // Increase icon size
                            .foregroundColor(selectedTab == 0 ? .blue : .black)
//                        Text("")
//                            .foregroundColor(selectedTab == 0 ? .blue : .black)
                    }
                }
                Spacer()
                Button(action: {
                    self.selectedTab = 1
                }) {
                    VStack {
                        Image(systemName: "location.fill")
                            .font(.system(size: 30)) // Increase icon size
                            .foregroundColor(selectedTab == 1 ? .blue : .black)
//                        Text("")
//                            .foregroundColor(selectedTab == 1 ? .blue : .black)
                    }
                }
                Spacer()
                Button(action: {
                    self.selectedTab = 2
                }) {
                    VStack {
                        Image(systemName: "bell.circle.fill")
                            .font(.system(size: 35)) // Increase icon size
                            .foregroundColor(selectedTab == 2 ? .blue : .black)
//                        Text("")
//                            .foregroundColor(selectedTab == 2 ? .blue : .black)
                    }
                }
                Spacer()
                Button(action: {
                    self.selectedTab = 3
                }) {
                    VStack {
                        Image(systemName: "figure.walk")
                            .font(.system(size: 30)) // Increase icon size
                            .foregroundColor(selectedTab == 3 ? .blue : .black)
//                        Text("")
//                            .foregroundColor(selectedTab == 3 ? .blue : .black)
                    }
                }
                Spacer()
                Button(action: {
                    self.selectedTab = 4
                }) {
                    VStack {
                        Image(systemName: "person.fill")
                            .font(.system(size: 25)) // Increase icon size
                            .foregroundColor(selectedTab == 4 ? .blue : .black)
//                        Text("")
//                            .foregroundColor(selectedTab == 4 ? .blue : .black)
                    }
                }
            }
            .padding()
            .background(Color.white)
            .shadow(radius: 2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
