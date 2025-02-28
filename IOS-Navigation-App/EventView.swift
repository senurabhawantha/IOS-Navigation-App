import SwiftUI

struct EventView: View {
    let columns = [GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        VStack {
            // Back Button and Title
            HStack {
//                Button(action: {
//                    // Handle back action
//                }) {
//                    Text("Back")
//                        .foregroundColor(.blue)
//                }
                Spacer()
            }
            .padding(.horizontal)

            Text("Events")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top, 5)

            // Grid Layout for Events
            LazyVGrid(columns: columns, spacing: 20) {
                EventBox(title: "Event 1")
                EventBox(title: "Event 2")
                EventBox(title: "Event 3")
                EventBox(title: "Event 4")
                EventBox(title: "Event 5")
                EventBox(title: "Event 6")
            }
            .padding()

            Spacer()

            // Bottom Navigation Bar
            BottomNavigationBar(selectedTab: .events)
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

// Event Grid Box
struct EventBox: View {
    let title: String

    var body: some View {
        VStack {
            Image(systemName: "calendar.badge.plus")
                .resizable()
                .frame(width: 50, height: 50)
                .foregroundColor(.blue)

            Text(title)
                .font(.headline)
                .fontWeight(.bold)

            Text("Details about \(title)")
                .font(.caption)
                .foregroundColor(.gray)
        }
        .frame(width: 150, height: 150)
        .background(Color.white)
        .cornerRadius(15)
        .shadow(radius: 3)
    }
}

// Bottom Navigation Bar
enum Tab {
    case home, map, events, profile
}

struct BottomNavigationBar: View {
    var selectedTab: Tab

    var body: some View {
        HStack {
            BottomTabItem(icon: "house.fill", label: "Home", isActive: selectedTab == .home)
            BottomTabItem(icon: "map", label: "Map", isActive: selectedTab == .map)
            BottomTabItem(icon: "calendar", label: "Events", isActive: selectedTab == .events)
            BottomTabItem(icon: "person.crop.circle", label: "Profile", isActive: selectedTab == .profile)
        }
        .padding()
        .background(Color.white)
        .shadow(radius: 5)
    }
}

// Bottom Navigation Bar Item
struct BottomTabItem3: View {
    let icon: String
    let label: String
    var isActive: Bool = false

    var body: some View {
        VStack {
            Image(systemName: icon)
                .resizable()
                .frame(width: 25, height: 25)
                .foregroundColor(isActive ? .blue : .gray)

            Text(label)
                .font(.caption)
                .foregroundColor(isActive ? .blue : .gray)
        }
        .frame(maxWidth: .infinity)
    }
}

struct EventView_Previews: PreviewProvider {
    static var previews: some View {
        EventView()
    }
}
