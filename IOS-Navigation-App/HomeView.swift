import SwiftUI

struct HomeView: View {
    @State private var selectedTab: Tab = .home
    @State private var showCrowdLevelView: Bool = false
    @State private var showMapView: Bool = false
    @State private var showEventView: Bool = false
    @State private var showCommunityView: Bool = false
    @State private var showStudentProfileView: Bool = false
    @State private var showScheduleView: Bool = false

    enum Tab {
        case home, map, community, profile
    }

    var body: some View {
        NavigationView {
            VStack {
                if selectedTab == .home {
                    // Welcome Text
                    Text("Welcome to NIBM")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.top, 10)

                    // Search Bar
                    HStack {
                        TextField("Search", text: .constant(""))
                            .padding(10)
                            .background(Color(.systemGray6))
                            .cornerRadius(10)

                        Image(systemName: "mic.fill")
                            .foregroundColor(.blue)
                            .padding(.trailing, 10)
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 20)

                    // Library Image
                    Image("Image1")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 150)
                        .padding(.bottom, 20)

                    // Grid Layout for Options
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 25) {
                        NavigationLink(destination: CrowdLevelView()) {
                            HomeButton(icon: "person.2.circle", label: "CROWD")
                        }
                        Button(action: {
                            self.showMapView = true
                        }) {
                            HomeButton(icon: "location", label: "MAP")
                        }
                        Button(action: {
                            self.showEventView = true
                        }) {
                            HomeButton(icon: "calendar", label: "EVENTS")
                        }
                        Button(action: {
                            self.showScheduleView = true
                        }) {
                            HomeButton(icon: "pencil.and.list.clipboard", label: "SCHEDULE")
                        }
                        Button(action: {
                            self.showCommunityView = true
                        }) {
                            HomeButton(icon: "graduationcap", label: "COMMUNITY")
                        }
                        Button(action: {
                            self.showStudentProfileView = true
                        }) {
                            HomeButton(icon: "person.crop.circle", label: "PROFILE")
                        }
                    }
                    .padding(.horizontal)

                    // Navigation Links for Modals (hidden)
                    NavigationLink(destination: MapView(), isActive: $showMapView) { EmptyView() }.hidden()
                    NavigationLink(destination: EventView(), isActive: $showEventView) { EmptyView() }.hidden()
                    NavigationLink(destination: CommunityView(), isActive: $showCommunityView) { EmptyView() }.hidden()
                    NavigationLink(destination: StudentProfileView(), isActive: $showStudentProfileView) { EmptyView() }.hidden()
                    NavigationLink(destination: ScheduleView(), isActive: $showScheduleView) { EmptyView() }.hidden()
                } else if selectedTab == .map {
                    MapView()
                } else if selectedTab == .community {
                    CommunityView()
                } else if selectedTab == .profile {
                    StudentProfileView()
                }

                Spacer()

//                // Bottom Navigation Bar
//                HStack {
//                    Button(action: {
//                        self.selectedTab = .home
//                    }) {
//                        BottomTabItem(icon: "house.fill", label: "Home", isActive: selectedTab == .home)
//                    }
//                    Button(action: {
//                        self.selectedTab = .map
//                    }) {
//                        BottomTabItem(icon: "map", label: "Map", isActive: selectedTab == .map)
//                    }
//                    Button(action: {
//                        self.selectedTab = .community
//                    }) {
//                        BottomTabItem(icon: "person.3.sequence.fill", label: "Community", isActive: selectedTab == .community)
//                    }
//                    Button(action: {
//                        self.selectedTab = .profile
//                    }) {
//                        BottomTabItem(icon: "person.crop.circle.badge.checkmark", label: "Profile", isActive: selectedTab == .profile)
//                    }
//                }
//                .padding()
//                .background(Color.white)
//                .shadow(radius: 5)
            }
            .navigationBarTitle("", displayMode: .inline) // Set title to empty to avoid showing any title
            .navigationBarHidden(true) // Ensure the navigation bar is hidden
        }
    }
}

// Home Page Buttons
struct HomeButton: View {
    let icon: String
    let label: String

    var body: some View {
        VStack {
            Image(systemName: icon)
                .resizable()
                .frame(width: 60, height: 60)
                .foregroundColor(.black)
            Text(label)
                .font(.headline)
                .fontWeight(.bold)
        }
        .frame(width: 110, height: 110)
        .background(Color.white)
        .cornerRadius(15)
        .shadow(radius: 3)
    }
}

// Bottom Navigation Bar Item
struct BottomTabItem: View {
    let icon: String
    let label: String
    var isActive: Bool = false

    var body: some View {
        VStack {
            Image(systemName: icon)
                .resizable()
                .frame(width: 35, height: 30)
                .foregroundColor(isActive ? .blue : .gray)
            Text(label)
                .font(.caption)
                .foregroundColor(isActive ? .blue : .gray)
        }
        .frame(maxWidth: .infinity)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
