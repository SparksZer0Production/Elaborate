import SwiftUI
import PhotosUI
import FirebaseStorage
import FirebaseFirestore
import Photos

struct NewPhotoView: View {
    @State private var selectedImage: UIImage?       // Holds the random photo as UIImage
    @State private var image: Image? = Image(systemName: "photo") // Placeholder
    @State private var isLoading: Bool = false       // Indicates loading state

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("Random Photo Picker")
                    .font(.title)

                image?
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 300, maxHeight: 300)
                    .cornerRadius(8.0)

                if isLoading {
                    ProgressView("Fetching Photo...")
                        .progressViewStyle(CircularProgressViewStyle())
                }

                Button("Pick Random Photo") {
                    fetchRandomPhoto()
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))

                if selectedImage != nil {
                    Button("Upload to Firebase") {
                        Task {
                            await uploadPhoto()
                        }
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.blue)
                }
            }
            .padding()
            .navigationTitle("Random Photo Picker")
        }
    }

    /// Fetch a random photo from the user's library
    private func fetchRandomPhoto() {
        PHPhotoLibrary.requestAuthorization { status in
            if status == .authorized {
                DispatchQueue.main.async {
                    isLoading = true
                }

                let fetchOptions = PHFetchOptions()
                let allPhotos = PHAsset.fetchAssets(with: .image, options: fetchOptions)

                if allPhotos.count > 0 {
                    let randomIndex = Int.random(in: 0..<allPhotos.count)
                    let randomAsset = allPhotos.object(at: randomIndex)

                    let imageManager = PHImageManager.default()
                    let targetSize = CGSize(width: 300, height: 300)
                    let options = PHImageRequestOptions()
                    options.isSynchronous = true

                    imageManager.requestImage(for: randomAsset, targetSize: targetSize, contentMode: .aspectFill, options: options) { image, _ in
                        DispatchQueue.main.async {
                            self.selectedImage = image
                            if let image = image {
                                self.image = Image(uiImage: image)
                            }
                            self.isLoading = false
                        }
                    }
                } else {
                    DispatchQueue.main.async {
                        self.isLoading = false
                    }
                }
            }
        }
    }

    /// Upload the selected image to Firebase Storage
    private func uploadPhoto() async {
        guard let selectedImage, let imageData = selectedImage.jpegData(compressionQuality: 0.6) else {
            print("No image selected or failed to convert to data.")
            return
        }

        let imageName = UUID().uuidString
        let storageRef = Storage.storage().reference().child("\(imageName).jpg")

        // Metadata
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpeg"

        do{
                    let result = try await storageRef.putDataAsync(imageData, metadata: metadata){ progress in
                        if let progress {
                            print(progress.fractionCompleted)
                            if progress.isFinished{
                                print("Completed")
                            }
                        }
                    }
                    print(result)
                }
                catch{
                    print("Error: \(error)")
                }
    }
}

#Preview {
    ContentView()
}
