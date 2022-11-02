//
//  PhotoHomeView.swift
//  CapstoneProjectMeowWoof
//
//  Created by luane Niejelski on 9/25/22.
//

import SwiftUI

struct PhotoHomeView: View {
    @State var shouldShowImagePicker = false
    @State var image: UIImage?
    let pet: Pet
    let columns = [GridItem(.adaptive(minimum: 100))]
    @EnvironmentObject var viewModel: PetViewModel
    
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
                    Spacer()
                    
                    VStack {
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(pet.petPhotos, id: \.self) { photoString in
                                if let uiImage = PhotoModelFileManager.instance.get(key: photoString) {
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
                            viewModel.savePetImage(pet: pet, id: id)
                            viewModel.savePets()
                        }
                }
                .fullScreenCover(isPresented: $shouldShowImagePicker) {
                    ImagePicker(image: $image)
                }
            }
            .navigationTitle("Pet Album")
        }
    }
}

struct PhotoHomeView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoHomeView(pet: Pet(name: "Luna"))
            .preferredColorScheme(.light)
    }
}
