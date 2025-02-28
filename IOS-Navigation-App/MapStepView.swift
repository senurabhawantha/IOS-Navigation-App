import SwiftUI

struct MapStepsView: View {
    let steps = [
        "TAKE A LIFT",
        "SETUP OUT FROM 3 FLOOR",
        "MAKE RIGHT ON MAIN DOOR",
        "TAKE LEFT ON FIRST DOOR",
        "YOU REACHED TO HARDWARE LAB"
    ]
    
    @State private var searchText: String = ""

    var filteredSteps: [String] {
        searchText.isEmpty ? steps : steps.filter { $0.localizedCaseInsensitiveContains(searchText) }
    }

    var body: some View {
        VStack(alignment: .leading) {
            // Back Button
            HStack {
                Button(action: {
                    // Add Navigation action here
                }) {
                    HStack {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.blue)
                        Text("Back")
                            .foregroundColor(.blue)
                    }
                }
                Spacer()
            }
            .padding(.horizontal)
            .padding(.top, 10)
            
            // Title
            Text("Map - Steps")
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.top, 5)
                .frame(maxWidth: .infinity, alignment: .center)

            // Search Bar with Mic
            HStack {
                TextField("Search", text: $searchText)
                    .padding(10)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                
                Button(action: {
                    // Add voice search functionality here
                }) {
                    Image(systemName: "mic.fill")
                        .foregroundColor(.blue)
                        .padding(.trailing, 10)
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 5)

            // Steps List
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    ForEach(Array(filteredSteps.enumerated()), id: \.offset) { index, step in
                        StepRow(index: index + 1, text: step, isLast: index == filteredSteps.count - 1)
                    }
                }
                .padding(.horizontal)
                .padding(.top, 10)
            }

            Spacer()

            // Bottom Navigation Bar (Unchanged)
            HStack {
                CustomTabItem(icon: "house.fill", label: "Home", isActive: true)
                CustomTabItem(icon: "map.fill", label: "Map")
                CustomTabItem(icon: "bubble.left.and.bubble.right.fill", label: "Community")
                CustomTabItem(icon: "person.crop.circle.fill", label: "Profile")
            }
            .padding()
            .background(Color.white)
            .shadow(radius: 5)
        }
        .padding(.bottom, 10)
    }

    // Step Row with Numbered Circle & Progress Line
    struct StepRow: View {
        let index: Int
        let text: String
        let isLast: Bool

        var body: some View {
            HStack(alignment: .top, spacing: 12) {
                VStack {
                    Text("\(index)")
                        .font(.headline)
                        .frame(width: 30, height: 30)
                        .background(Color.blue.opacity(0.2))
                        .foregroundColor(.blue)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.blue, lineWidth: 1))
                        .shadow(radius: 2)

                    if !isLast {
                        Rectangle()
                            .frame(width: 2, height: 40)
                            .foregroundColor(Color.blue.opacity(0.5))
                    }
                }
                
                Text(text)
                    .font(.body)
                    .foregroundColor(.primary)
                    .padding(.vertical, 5)
                
                Spacer()
            }
        }
    }

    // Bottom Navigation Bar Item (Unchanged)
    struct CustomTabItem: View {
        let icon: String
        let label: String
        var isActive: Bool = false

        var body: some View {
            VStack {
                Image(systemName: icon)
                    .resizable()
                    .frame(width: 35, height: 30)
                    .foregroundColor(isActive ? .blue : .black)
                Text(label)
                    .font(.caption)
                    .foregroundColor(isActive ? .blue : .black)
            }
            .frame(maxWidth: .infinity)
        }
    }
}

// Preview
struct MapStepsView_Previews: PreviewProvider {
    static var previews: some View {
        MapStepsView()
    }
}
