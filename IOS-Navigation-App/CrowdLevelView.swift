
import SwiftUI

struct CrowdLevelView: View {
    struct Area: Identifiable {
        let id = UUID()
        let name: String
        let description: String
        let crowdLevel: Double // 0.0 (empty) to 1.0 (full)
        let color: Color
    }

    let areas: [Area] = [
        Area(name: "Study Area", description: "The study area is quiet and not busy, making it a great spot for focused work or peaceful reading.", crowdLevel: 0.1, color: .blue),
        Area(name: "Cafeteria", description: "The cafeteria is bustling with activity, so expect some wait time if you're grabbing a meal or a coffee.", crowdLevel: 0.9, color: .red),
        Area(name: "Parking Area", description: "The parking area is moderately busy, with some spots still available, but it may fill up soon.", crowdLevel: 0.5, color: .yellow),
        Area(name: "Library", description: "The library is calm and uncrowded, offering a perfect environment for studying or relaxing with a book.", crowdLevel: 0.2, color: .blue),
        Area(name: "Conference Halls", description: "The conference halls are busy with ongoing events, so expect a lively atmosphere and limited availability.", crowdLevel: 0.8, color: .red)
    ]

    @State private var animateList = false // State variable for animation

    var body: some View {
        VStack(spacing: 0) {
            // Top Bar with Back Button and Centered Title
            ZStack {
                Text("Crowd Level")
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .center) // Ensures it's centered
                
                HStack {
                    Button(action: {
                        // Handle back action
                    }) {
                        Text("Back")
                            .foregroundColor(.blue)
                    }
                    Spacer()
                }
            }
            .padding()

            // Search Bar with Increased Space Below
            TextField("Search", text: .constant(""))
                .padding(10)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
                .padding(.horizontal)
                .padding(.bottom, 25) // Increased space below search bar

            // List of Crowd Levels with Animation
            List(areas.indices, id: \.self) { index in
                let area = areas[index]
                HStack {
                    ZStack {
                        Circle()
                            .stroke(Color.gray.opacity(0.3), lineWidth: 6)
                            .frame(width: 40, height: 40)

                        Circle()
                            .trim(from: 0.0, to: area.crowdLevel)
                            .stroke(area.color, style: StrokeStyle(lineWidth: 6, lineCap: .round))
                            .frame(width: 40, height: 40)
                            .rotationEffect(.degrees(-90))
                    }

                    VStack(alignment: .leading) {
                        Text(area.name)
                            .font(.headline)
                            .foregroundColor(.blue)
                        Text(area.description)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                .padding(.vertical, 8) // Added extra spacing between list items
                .opacity(animateList ? 1 : 0) // Start invisible
                .offset(y: animateList ? 0 : 10) // Slide up
                .animation(.easeInOut(duration: 0.8).delay(0.1 * Double(index)), value: animateList)
            }
            .listStyle(PlainListStyle())
            .padding(.bottom, 20) // Added space before navigation bar
            .onAppear {
                animateList = true // Start animation when view appears
            }
        }
    }
}

struct CrowdLevelView_Previews: PreviewProvider {
    static var previews: some View {
        CrowdLevelView()
    }
}

