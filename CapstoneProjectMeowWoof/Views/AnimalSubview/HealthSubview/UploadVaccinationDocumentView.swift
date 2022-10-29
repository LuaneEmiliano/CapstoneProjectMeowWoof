//
//  UploadVaccinationDocumentView.swift
//  CapstoneProjectMeowWoof
//
//  Created by luane Niejelski on 10/28/22.
//

import SwiftUI

struct UploadVaccinationDocumentView: View {
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
                            ForEach(pet.petVaccinationRecords, id: \.self) { petVaccinationRecord in
                                if let uiImage = PhotoModelFileManager.instance.get(key: petVaccinationRecord ){
                                    Image(uiImage: uiImage)
                                        .resizable()
                                        .aspectRatio( contentMode: .fill)
                                        .frame(width: 115 , height: 115)
                                        .cornerRadius(12)
                                        .onTapGesture {
                                            imageFullScreen = uiImage
                                            sheetImage.toggle()
                                        }
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
                            viewModel.saveVaccinationDocumentsImage(pet: pet, id: id)
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
            .navigationTitle("Vaccination Record 💉")
        }
    }
}

struct UploadVaccinationDocumentView_Previews: PreviewProvider {
    static var previews: some View {
        UploadVaccinationDocumentView(pet: Pet(name: "Luna"))
    }
}
