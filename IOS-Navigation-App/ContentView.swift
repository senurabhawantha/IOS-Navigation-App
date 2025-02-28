//
//  ContentView.swift
//  NavigatorApp_cw
//
//  Created by Yasiru 018 on 2025-02-27.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0

    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                .tag(0)

            MapView()  // Pass selectedTab as a binding
                .tabItem {
                    Image(systemName: "map.fill")
                    Text("Map")
                }
                .tag(1)

            CommunityView()
                .tabItem {
                    Image(systemName: "person.3.fill")
                    Text("Community")
                }
                .tag(2)

            CrowdLevelView()
                .tabItem {
                    Image(systemName: "cloud.fill") // Use an appropriate icon for Crowd Level
                    Text("Crowd Level")
                }
                .tag(3)

            StudentProfileView() // Include the new ProfileView
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
                .tag(4)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
