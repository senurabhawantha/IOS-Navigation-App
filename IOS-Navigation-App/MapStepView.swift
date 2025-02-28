import SwiftUI

struct MapStepsView: View {
    let steps = [
        "TAKE A LIFT",
        "SETUP OUT FROM 3 FLOOR",
        "MAKE RIGHT ON MAIN DOOR",
        "TAKE LEFT ON FIRST DOOR",
        "YOU REACHED TO HARDWARE LAB"
    ]
    
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
            
            VStack(spacing: 20){
                
                // Steps List
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        ForEach(Array(steps.enumerated()), id: \.offset) { index, step in
                            StepRow(index: index + 1, text: step)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 10)
                }
                
                Spacer()
                
                // Bottom Navigation Bar
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
        }
    }
    // Step Row with Numbered Circle & Dotted Line
    
    struct StepRow: View {
        let index: Int
        let text: String
        
        var body: some View {
            HStack(alignment: .top) {
                VStack {
                    Text("\(index)")
                        .font(.headline)
                        .frame(width: 30, height: 30)
                        .background(Color.white)
                        .foregroundColor(.black)
                        .clipShape(Circle()) // ✅ Fixed Circle error
                        .overlay(Circle().stroke(Color.gray, lineWidth: 1))
                    
                    if index != 5 { // Hide for last step
                        Rectangle()
                            .frame(width: 2, height: 40)
                            .foregroundColor(.gray.opacity(0.5))
                    }
                }
                
                Text(text)
                    .font(.body)
                    .padding(.leading, 10)
                
                Spacer()
            }
        }
    }
    
    // Bottom Navigation Bar Item (Renamed to Avoid Conflict)
    struct CustomTabItem: View { // ✅ Renamed to avoid duplicate error
        let icon: String
        let label: String
        var isActive: Bool = false
        
        var body: some View {
            VStack {
                Image(systemName: icon)
                    .resizable()
                    .frame(width: 25, height: 25)
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
