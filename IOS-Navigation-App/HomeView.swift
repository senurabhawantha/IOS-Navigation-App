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
                            .padding(12.5)
                            .background(Color(.systemGray6))
                            .cornerRadius(25)

                        Image(systemName: "mic.fill")
                            .foregroundColor(.black)
                            .padding(.trailing, 10)
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 20)

                    // Graduation Cap Icon
                    Image(systemName: "graduationcap.fill")
                        .font(.system(size: 75))
                        .foregroundColor(.black)
                        .padding(.bottom, 20)

                    // Grid Layout for Options
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 25) {
                        NavigationLink(destination: CrowdLevelView()) {
                            HomeButton(icon: "figure.walk.circle", label: "CROWD")
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
                            HomeButton(icon: "bell.circle", label: "COMMUNITY")
                        }
                        Button(action: {
                            self.showStudentProfileView = true
                        }) {
                            HomeButton(icon: "person", label: "PROFILE")
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
                .foregroundColor(.black) // Change icon color to white
            Text(label)
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.black) // Change text color to white
        }
        .frame(width: 110, height: 110)
        .background(Color(red: 72/255, green: 201/255, blue: 176/255)) // Background color #48C9B0
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 5) // Add a shadow
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
