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

                // Divider below search bar
                Divider()
                    .background(Color.gray.opacity(0.5))
                    .padding(.horizontal)

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

                // Divider below schedule list
                Divider()
                    .background(Color.gray.opacity(0.5))
                    .padding(.horizontal)

                Spacer()
            }
            .navigationTitle("NIBM Schedule")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {}) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.blue)
                    }
                }

                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {}) {
                        Image(systemName: "gearshape")
                            .foregroundColor(.blue)
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
        VStack {
            HStack {
                Text(scheduleItem.batch)
                    .frame(width: 80,height: 50, alignment: .leading)
                Spacer()
                Text(scheduleItem.hall)
                    .frame(width: 30, alignment: .center)
                Spacer()
                Text(scheduleItem.time)
                    .frame(width: 130, alignment: .trailing)
            }
            .padding(.horizontal)
            .padding(.vertical, 8)
            .background(Color.white)
            .cornerRadius(5)
            .shadow(radius: 1)

            // Divider between each schedule item
            Divider()
                .background(Color.gray.opacity(0.3))
                .padding(.horizontal)
        }
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
                Button(action: { self.searchText = "" }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                        .opacity(searchText.isEmpty ? 0 : 1)
                }
            }
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(10.0)
        .padding(.horizontal)
    }
}

struct ScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleView()
    }
}
