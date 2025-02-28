import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0

    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                        .foregroundColor(.black)
                    Text("Home")
                        .foregroundColor(.black)
                }
                .tag(0)

            MapView()  // Pass selectedTab as a binding
                .tabItem {
                    Image(systemName: "map.fill")
                        .foregroundColor(.black)
                    Text("Map")
                        .foregroundColor(.black)
                }
                .tag(1)

            CommunityView()
                .tabItem {
                    Image(systemName: "person.3.fill")
                        .foregroundColor(.black)
                    Text("Community")
                        .foregroundColor(.black)
                }
                .tag(2)

            CrowdLevelView()
                .tabItem {
                    Image(systemName: "cloud.fill") // Use an appropriate icon for Crowd Level
                        .foregroundColor(.black)
                    Text("Crowd Level")
                        .foregroundColor(.black)
                }
                .tag(3)

            StudentProfileView() // Include the new ProfileView
                .tabItem {
                    Image(systemName: "person.fill")
                        .foregroundColor(.black)
                    Text("Profile")
                        .foregroundColor(.black)
                }
                .tag(4)
        }
        .accentColor(.green) // Change the accent color to black
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
