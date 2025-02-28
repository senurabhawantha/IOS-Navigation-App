import SwiftUI

struct CommunityView: View {
    @State private var libraryNotBusy = true
    @State private var libraryModerate = false
    @State private var libraryBusy = false
    
    @State private var parkingNotBusy = true
    @State private var parkingModerate = false
    @State private var parkingBusy = false
    
    @State private var cafeteriaNotBusy = true
    @State private var cafeteriaModerate = false
    @State private var cafeteriaBusy = false
    
    var body: some View {
        NavigationView {
            VStack {
                // Header
                HStack {
                    Button(action: {
                        // Handle back action
                    }) {
//                        Image(systemName: "chevron.left")
//                            .font(.title)
//                            .foregroundColor(.blue)
                    }
                    Spacer()
                    Text("     Community Updates")
                        .font(.title3)
                        .fontWeight(.bold)
                    Spacer()
                    Rectangle() //added an empty button to center title
                        .foregroundColor(.clear)
                        .frame(width: 28, height: 28)
                }
                .padding()
                
                Text("17th of April 2025")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                ScrollView {
                    VStack {
                        // Library Section
                        SectionView(title: "Library",
                                    notBusy: $libraryNotBusy,
                                    moderate: $libraryModerate,
                                    busy: $libraryBusy)
                        
                        // Parking Section
                        SectionView(title: "Parking",
                                    notBusy: $parkingNotBusy,
                                    moderate: $parkingModerate,
                                    busy: $parkingBusy)
                        
                        // Cafeteria Section
                        SectionView(title: "Cafeteria",
                                    notBusy: $cafeteriaNotBusy,
                                    moderate: $cafeteriaModerate,
                                    busy: $cafeteriaBusy)
                    }
                    .padding(.horizontal)
                }
                Spacer()
            }
            .navigationBarHidden(true)
        }
    }
}

struct SectionView: View {
    let title: String
    @Binding var notBusy: Bool
    @Binding var moderate: Bool
    @Binding var busy: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack{
                Image(systemName: getIcon(for: title))
                Text(title)
                    .font(.headline)
                    .padding(.leading, 5)
            }
            .padding(.bottom, 5)
            
            StatusRow(status: "Not Busy", isSelected: $notBusy, icon: "heart.fill")
            StatusRow(status: "Moderate", isSelected: $moderate, icon: "face.smiling")
            StatusRow(status: "Busy", isSelected: $busy, icon: "exclamationmark.circle")
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(10)
        .padding(.bottom, 10)
    }
    
    private func getIcon(for title: String) -> String {
        switch title {
        case "Library":
            return "books.vertical.fill"
        case "Parking":
            return "parkingsign.circle.fill"
        case "Cafeteria":
            return "cup.and.saucer.fill"
        default:
            return "questionmark.circle"
        }
    }
}

struct StatusRow: View {
    let status: String
    @Binding var isSelected: Bool
    let icon: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(isSelected ? .blue : .gray)
            Text(status)
            Spacer()
            Image(systemName: isSelected ? "checkmark.square.fill" : "square")
                .foregroundColor(.blue)
        }
        .padding(.bottom, 3)
        .onTapGesture {
            isSelected.toggle()
        }
    }
}

struct CommunityView_Previews: PreviewProvider {
    static var previews: some View {
        CommunityView()
    }
}
