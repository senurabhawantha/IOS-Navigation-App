import SwiftUI

struct ScheduleView: View {
    @State private var searchText: String = ""
    let scheduleData: [ScheduleItem] = [
        ScheduleItem(batch: "DSE22", hall: "8", time: "8.00AM-3.00PM"),
        ScheduleItem(batch: "DSE23", hall: "8", time: "8.00AM-3.00PM"),
        ScheduleItem(batch: "DSE21", hall: "8", time: "8.00AM-3.00PM"),
        ScheduleItem(batch: "DSE20", hall: "8", time: "8.00AM-3.00PM"),
        ScheduleItem(batch: "DSE19", hall: "8", time: "8.00AM-3.00PM"),
        ScheduleItem(batch: "DSE24", hall: "8", time: "8.00AM-3.00PM"),
        ScheduleItem(batch: "DSE25", hall: "8", time: "8.00AM-3.00PM"),
        ScheduleItem(batch: "DSE16", hall: "8", time: "8.00AM-3.00PM")
    ]

    var filteredScheduleData: [ScheduleItem] {
        if searchText.isEmpty {
            return scheduleData
        } else {
            return scheduleData.filter { $0.batch.localizedCaseInsensitiveContains(searchText) }
        }
    }

    var body: some View {
        NavigationView {
            VStack {
                // Search Bar
                SearchBar(searchText: $searchText)
                    .padding(.top, 8)

                // Schedule List
                ScrollView {
                    LazyVStack(spacing: 10) {
                        ForEach(filteredScheduleData, id: \.self) { item in
                            ScheduleItemView(scheduleItem: item)
                        }
                    }
                    .padding()
                }
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding()

                Spacer()

                // Bottom Tab Bar
                BottomTabBar()
            }
            .navigationTitle("NIBM Schedule")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Back") {
                        // Handle back button action
                    }
                }
            }
        }
    }
}

// Data Model
struct ScheduleItem: Hashable {
    let batch: String
    let hall: String
    let time: String
}

// Schedule Item View
struct ScheduleItemView: View {
    let scheduleItem: ScheduleItem

    var body: some View {
        HStack {
            Text(scheduleItem.batch)
                .frame(width: 80, alignment: .leading) // Adjust width as needed
            Spacer()
            Text(scheduleItem.hall)
                .frame(width: 40, alignment: .center) // Adjust width as needed
            Spacer()
            Text(scheduleItem.time)
                .frame(width: 120, alignment: .trailing) // Adjust width as needed
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
        .background(Color.white)
        .cornerRadius(5)
        .shadow(radius: 1)
    }
}

// Search Bar
struct SearchBar: View {
    @Binding var searchText: String

    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            TextField("Search", text: $searchText)
                .foregroundColor(.primary)

            if !searchText.isEmpty {
                Button(action: {
                    self.searchText = ""
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                        .opacity(searchText.isEmpty ? 0 : 1)
                }
            }
        }
        .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8))
        .foregroundColor(.secondary)
        .background(Color(.systemGray6))
        .cornerRadius(10.0)
        .padding(.horizontal)
    }
}

// Bottom Tab Bar
struct BottomTabBar: View {
    var body: some View {
        HStack {
            TabBarItem(iconName: "house.fill", title: "Home", isSelected: true)
            TabBarItem(iconName: "map", title: "Map", isSelected: false)
            TabBarItem(iconName: "person.3", title: "Community", isSelected: false)
            TabBarItem(iconName: "person", title: "Profile", isSelected: false)
        }
        .padding(.horizontal)
        .frame(height: 60)
        .background(Color.white)
        .shadow(radius: 3)
    }
}

// Tab Bar Item
struct TabBarItem: View {
    let iconName: String
    let title: String
    let isSelected: Bool

    var body: some View {
        VStack {
            Image(systemName: iconName)
                .font(.system(size: 22))
                .foregroundColor(isSelected ? .blue : .gray)
            Text(title)
                .font(.caption)
                .foregroundColor(isSelected ? .blue : .gray)
        }
        .frame(maxWidth: .infinity)
    }
}

struct ScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleView()
    }
}

