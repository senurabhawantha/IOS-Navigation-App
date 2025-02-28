import SwiftUI

struct StudentProfileView: View {
    @State private var editMode: Bool = false

    @State private var profileImage: Image? = nil  // Placeholder for the image
    @State private var name: String = "John Doe"
    @State private var email: String = "john.doe@example.com"
    @State private var studentID: String = "1234567"
    @State private var address: String = "123 Main St"
    @State private var age: String = "20"
    @State private var description: String = "A dedicated student."

    @State private var notificationsEnabled: Bool = true
    @State private var darkModeEnabled: Bool = false
    @State private var locationServicesEnabled: Bool = true
    @State private var faceIDEnabled: Bool = false // New setting
    @State private var twoFactorAuthEnabled: Bool = false // New setting

    var body: some View {
        NavigationView {
            VStack {
                // Header
                HStack {
//                    Button(action: {
//                        // Handle back action
//                    }) {
////                        Image(systemName: "chevron.left")
////                            .font(.title)
////                            .foregroundColor(.blue)
//                    }
                    Spacer()
                    Text("             Student Profile")
                        .font(.title3)
                        .fontWeight(.bold)
                    Spacer()
                    Button(action: {
                        editMode.toggle()
                    }) {
                        Text(editMode ? "Save" : "Edit")
                            .foregroundColor(.blue)
                            .padding(.horizontal)
                    }
                }
                .padding()

                ScrollView {
                    VStack {
                        // Profile Picture
                        ProfilePictureSection(image: $profileImage, editMode: $editMode)

                        // Profile Information
                        ProfileSectionView(editMode: $editMode, name: $name, email: $email, studentID: $studentID, address: $address, age: $age, description: $description)

                        // Settings
                        SettingsSectionView(notificationsEnabled: $notificationsEnabled, darkModeEnabled: $darkModeEnabled, locationServicesEnabled: $locationServicesEnabled, faceIDEnabled: $faceIDEnabled, twoFactorAuthEnabled: $twoFactorAuthEnabled, editMode: $editMode)
                    }
                    .padding(.horizontal)
                }

                Spacer()

            }
            .navigationBarHidden(true)
        }
    }
}

struct ProfilePictureSection: View {
    @Binding var image: Image?
    @Binding var editMode: Bool

    var body: some View {
        VStack {
            if let image = image {
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
            } else {
                Image(systemName: "person.circle.fill")  // Placeholder
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.gray)
            }

            if editMode {
                Button("Change Picture") {
                    // Implement action to choose new picture (e.g., using UIImagePickerController)
                    // For now, let's just change it programmatically to demonstrate the refresh
                    //  image = Image("default_profile") // Change this accordingly
                }
            }
        }
        .padding(.bottom, 10)
    }
}

struct ProfileSectionView: View {
    @Binding var editMode: Bool
    @Binding var name: String
    @Binding var email: String
    @Binding var studentID: String
    @Binding var address: String
    @Binding var age: String
    @Binding var description: String

    var body: some View {
        VStack(alignment: .leading) {
            Text("Personal Information")
                .font(.headline)
                .padding(.bottom, 5)

            ProfileRow(label: "Name", value: $name.wrappedValue, editable: editMode, text: $name)
            ProfileRow(label: "Email", value: $email.wrappedValue, editable: editMode, text: $email)
            ProfileRow(label: "StudentID", value: studentID, editable: false, text: .constant("")) // Not Editable, no binding needed
            ProfileRow(label: "Address", value: $address.wrappedValue, editable: editMode, text: $address)
            ProfileRow(label: "Age", value: $age.wrappedValue, editable: editMode, text: $age)
            ProfileRow(label: "Description", value: $description.wrappedValue, editable: editMode, text: $description)

        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(10)
        .padding(.bottom, 10)
    }
}

struct ProfileRow: View {
    let label: String
    let value: String
    let editable: Bool
    @Binding var text: String  //For the textfields.
    var body: some View {
        HStack {
            Text(label + ":")
                .fontWeight(.bold)
                .frame(width: 100, alignment: .leading)  // Fixed width for alignment
            if editable {
                TextField(label, text: $text)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

            } else {
                Text(value)
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity, alignment: .leading) // Use available width
            }
        }
        .padding(.bottom, 3)
    }
}
struct SettingsSectionView: View {
    @Binding var notificationsEnabled: Bool
    @Binding var darkModeEnabled: Bool
    @Binding var locationServicesEnabled: Bool
    @Binding var faceIDEnabled: Bool  // Added Face ID setting
    @Binding var twoFactorAuthEnabled: Bool // Added Two-Factor Auth setting
    @Binding var editMode: Bool

    var body: some View {
        VStack(alignment: .leading) {
            Text("Settings")
                .font(.headline)
                .padding(.bottom, 5)

            SettingRow(label: "Enable Notifications", isEnabled: $notificationsEnabled, editable: editMode)
//            SettingRow(label: "Dark Mode", isEnabled: $darkModeEnabled, editable: editMode)
//            SettingRow(label: "Location Services", isEnabled: $locationServicesEnabled, editable: false) //Not editable
//            SettingRow(label: "Enable Face ID", isEnabled: $faceIDEnabled, editable: editMode)
//            SettingRow(label: "Enable Two-Factor Auth", isEnabled: $twoFactorAuthEnabled, editable: editMode)

        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(10)
        .padding(.bottom, 10)
    }
}

struct SettingRow: View {
    let label: String
    @Binding var isEnabled: Bool
    let editable: Bool

    var body: some View {
        HStack {
            Text(label)
            Spacer()
            if editable{
                Toggle(isOn: $isEnabled) {
                    EmptyView()
                }
            } else {
                Image(systemName: isEnabled ? "checkmark.circle.fill" : "xmark.circle.fill")
                    .foregroundColor(isEnabled ? .green : .red)
            }
        }
        .padding(.bottom, 3)
    }
}

struct BottomTabItem6: View {
    let icon: String
    let label: String? = nil
    var isSelected: Bool = false

    var body: some View {
        VStack {
            Image(systemName: icon)
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)
                .foregroundColor(isSelected ? .blue : .gray)
            if let label = label {
                Text(label)
                    .font(.caption)
                    .foregroundColor(isSelected ? .blue : .gray)
            }
        }
        .frame(maxWidth: .infinity)
    }
}

struct StudentProfileView_Previews: PreviewProvider {
    static var previews: some View {
        StudentProfileView()
    }
}
