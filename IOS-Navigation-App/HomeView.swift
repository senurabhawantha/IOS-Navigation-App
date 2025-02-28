import SwiftUI

struct HomeView: View {
    @State private var showCrowdLevelView: Bool = false
    @State private var showMapView: Bool = false
    @State private var showEventView: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
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
                .padding(.bottom, 20) // Added space between search bar and grid

                // Library Image
                Image("Image1")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
                    .padding(.bottom, 20)

                // Grid Layout for Options
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing:25) {
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
                    HomeButton(icon: "pencil.and.list.clipboard", label: "SCHEDULE")
                    HomeButton(icon: "graduationcap", label: "COMMUNITY")
                    HomeButton(icon: "person.crop.circle", label: "PROFILE")
                }
                .padding(.horizontal)
                
                NavigationLink(destination: MapView(), isActive: $showMapView) {
                    EmptyView()
                }
                .hidden()
                
                NavigationLink(destination: EventView(), isActive: $showEventView) {
                    EmptyView()
                }
                .hidden()

                Spacer()

                // Bottom Navigation Bar
                HStack {
                    BottomTabItem(icon: "house.fill", label: "Home", isActive: true)
                    BottomTabItem(icon: "map", label: "Map")
                    BottomTabItem(icon: "person.3.sequence.fill", label: "Community")
                    BottomTabItem(icon: "person.crop.circle.badge.checkmark", label: "Profile")
                }
                .padding()
                .background(Color.white)
                .shadow(radius: 5)
            }
            .navigationBarHidden(true) // Hide the navigation bar
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
                .frame(width: 60, height: 60) // Increased size
                .foregroundColor(.black)
            Text(label)
                .font(.headline) // Increased font size
                .fontWeight(.bold)
        }
        .frame(width: 110, height: 110) // Increased button size
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
