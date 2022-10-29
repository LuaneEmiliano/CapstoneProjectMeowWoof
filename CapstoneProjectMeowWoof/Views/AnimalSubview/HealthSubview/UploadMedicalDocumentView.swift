//
//  UploadMedicalDocumentView.swift
//  CapstoneProjectMeowWoof
//
//  Created by luane Niejelski on 10/28/22.
//

import SwiftUI

struct UploadMedicalDocumentView: View {
    @State var shouldShowImagePicker = false
    @State var image: UIImage? = nil
    @State var imageFullScreen: UIImage?
    let pet: Pet
    let columns = [GridItem(.adaptive(minimum: 100))]
    @EnvironmentObject var viewModel: PetViewModel
    @State var sheetImage: Bool = false
    
    var body: some View {
        ZStack {
            VStack {
                ScrollView {
                    HStack {
                        VStack(alignment: .leading) {
                            Button {
                                shouldShowImagePicker.toggle()
                            } label: {
                                Image(systemName: "photo")
                                    .foregroundColor(Color.petAlbum)
                                    .font(.system(size: 35))
                                    .padding()
                                    .position(x: 350, y: 30)
                            }
                        }
                    }
                    VStack {
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(pet.petMedicalRecords, id: \.self) { petMedicalRecord in
                                if let uiImage = PhotoModelFileManager.instance.get(key: petMedicalRecord ){
                                    Image(uiImage: uiImage)
                                        .resizable()
                                        .aspectRatio( contentMode: .fill)
                                        .frame(width: 115 , height: 115)
                                        .cornerRadius(12)
                                }
                                
                            }
                        }
                    }
                    .padding(.horizontal)
                    .padding(.bottom)
                    Spacer()
                    
                        .onChange(of: image) { _ in
                            let id = UUID().uuidString
                            if let image = image {
                                PhotoModelFileManager.instance.add(key: id, value: image)
                            }
                            viewModel.saveMedicalDocumentsImage(pet: pet, id: id)
                            viewModel.savePets()
                        }
                }
                .fullScreenCover(isPresented: $shouldShowImagePicker) {
                    ImagePicker(image: $image)
                }
                .sheet(isPresented: $sheetImage) {
                    if let image = imageFullScreen {
                        FullScreenImageView(image: image)
                    }
                }
            }
            .navigationTitle("Pet Medical Record 📝")
        }
    }
}

struct UploadMedicalDocumentView_Previews: PreviewProvider {
    static var previews: some View {
        UploadMedicalDocumentView(pet: Pet(name: "Luna"))
    }
}
