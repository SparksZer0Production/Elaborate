import SwiftUI
import Photos

struct NewPhotoView: View {
    @State private var selectedImage: UIImage?
    @State private var isLoading: Bool = false

    var body: some View {
        VStack {
            Text("Random Photo from Library")
                .font(.title)
                .padding()

            if isLoading {
                ProgressView("Loading...")
                    .progressViewStyle(CircularProgressViewStyle())
                    .padding()
            } else {
                Button("Pick a Random Photo") {
                    fetchRandomPhoto()
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))

                if let selectedImage = selectedImage {
                    Image(uiImage: selectedImage)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300)
                        .padding(.top, 20)
                }
            }
        }
        .padding()
    }

    func fetchRandomPhoto() {
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
}

#Preview {
    NewPhotoView()
}
