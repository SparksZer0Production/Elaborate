import SwiftUI
import Photos

struct NewPhotoView: View {
    @State private var selectedImage: UIImage?
    @State private var selectedImage2: UIImage?
    @State private var selectedImage3: UIImage?
    @State private var selectedImageIndex: Int? = nil
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

                ScrollView(.horizontal, showsIndicators: false){
                    HStack{
                        if let selectedImage = selectedImage {
                            Button(action: {
                                selectedImageIndex = 0
                            }){
                                Image(uiImage: selectedImage)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 300, height: 300)
                                    .padding(.top, 20)
                                    .border(selectedImageIndex == 0 ? Color.blue : Color.clear, width: 5)
                            }
                        }
                        if let selectedImage2 = selectedImage2 {
                            Button(action: {
                                selectedImageIndex = 1
                            }){
                                Image(uiImage: selectedImage2)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 300, height: 300)
                                    .padding(.top, 20)
                                    .border(selectedImageIndex == 1 ? Color.blue : Color.clear, width: 5)
                            }
                        }
                        if let selectedImage3 = selectedImage3 {
                            Button(action: {
                                selectedImageIndex = 2
                            }){
                                Image(uiImage: selectedImage3)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 300, height: 300)
                                    .padding(.top, 20)
                                    .border(selectedImageIndex == 2 ? Color.blue : Color.clear, width: 5)
                            }
                        }
                    }
                }
                if selectedImageIndex != nil{
                    Button("Upload") {
                        print(selectedImageIndex ?? 0)
                        uploadSelectedImage(index: selectedImageIndex)
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                }
            }
        }
        .padding()
    }
    
    func uploadSelectedImage(index: Int?){
        if index == nil {
            return
        }
        
        
        var image: UIImage? = nil
        switch(index){
            case 0:
                print("GG")
                image = self.selectedImage
                break
            case 1:
                print("GG")
                image = self.selectedImage2
                break
            case 2:
                print("GG")
                image = self.selectedImage3
                break
            default:
                return
        }
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
                    var randomIndex = Int.random(in: 0..<allPhotos.count)
                    var randomAsset = allPhotos.object(at: randomIndex)
                    
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
                    randomIndex = Int.random(in: 0..<allPhotos.count)
                    randomAsset = allPhotos.object(at: randomIndex)
                    
                    self.isLoading = true
                    imageManager.requestImage(for: randomAsset, targetSize: targetSize, contentMode: .aspectFill, options: options) { image, _ in
                        DispatchQueue.main.async {
                            self.selectedImage2 = image
                            self.isLoading = false
                        }
                    }
                    
                    randomIndex = Int.random(in: 0..<allPhotos.count)
                    randomAsset = allPhotos.object(at: randomIndex)
                    
                    self.isLoading = true
                    imageManager.requestImage(for: randomAsset, targetSize: targetSize, contentMode: .aspectFill, options: options) { image, _ in
                        DispatchQueue.main.async {
                            self.selectedImage3 = image
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
