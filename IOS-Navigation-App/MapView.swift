import SwiftUI

struct MapView: View {
    @State private var showMapStepsView = false

    var body: some View {
        NavigationView {
            VStack {
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
                    .frame(height: 400)
                    .cornerRadius(25)
                    .padding(.horizontal)

                Spacer()
                
                // View Step Button
                Button(action: {
                    self.showMapStepsView = true
                }) {
                    Text("View Step >>")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding(.horizontal)
                Spacer()
            }
            .navigationBarHidden(true)
            .navigationBarTitle("", displayMode: .inline)
            .background(
                NavigationLink(destination: MapStepsView(), isActive: $showMapStepsView) {
                    EmptyView()
                }
                .hidden()
            )
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
