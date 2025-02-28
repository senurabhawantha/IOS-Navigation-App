import SwiftUI

struct MapView: View {
    var body: some View {
        VStack {
            // Back Button
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
            
            // Title
            Text("Map")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top, 5)

            // Location Details
            VStack(alignment: .leading, spacing: 5) {
                HStack {
                    Image(systemName: "location.fill")
                        .foregroundColor(.blue)
                    Text("Your location")
                        .fontWeight(.medium)
                    Spacer()
                }
                HStack {
                    Image(systemName: "mappin.and.ellipse")
                        .foregroundColor(.gray)
                    Text("Hardware Lab")
                        .fontWeight(.medium)
                    Spacer()
                }
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.horizontal)

            Spacer()
            
            // Map Image
            Image("Map1")
                .resizable()
                .scaledToFit()
                .frame(height: 450)
                .cornerRadius(15)
                .padding(.horizontal)

            Spacer()

            // View Step Button
            Button(action: {
                // Handle button tap
            }) {
                Text("View Step >>>")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding(.horizontal)

            
        }
    }
}

// Bottom Navigation Bar Item
struct BottomTabItem1: View {
    let icon: String
    let label: String
    var isActive: Bool = false
    var hasNotification: Bool = false

    var body: some View {
        VStack {
            ZStack {
                Image(systemName: icon)
                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundColor(isActive ? .blue : .gray)
                
                if hasNotification {
                    Circle()
                        .fill(Color.red)
                        .frame(width: 8, height: 8)
                        .offset(x: 10, y: -10)
                }
            }
            Text(label)
                .font(.caption)
                .foregroundColor(isActive ? .blue : .gray)
        }
        .frame(maxWidth: .infinity)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
