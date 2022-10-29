//
//  UploadInsuranceDocumentView.swift
//  CapstoneProjectMeowWoof
//
//  Created by luane Niejelski on 10/28/22.
//

import SwiftUI

struct UploadInsuranceDocumentView: View {
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
                    VStack {
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(pet.petInsuranceDocuments, id: \.self) { petInsuranceDocument in
                                if let uiImage = PhotoModelFileManager.instance.get(key: petInsuranceDocument ){
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
                            viewModel.saveInsuranceImage(pet: pet, id: id)
                            viewModel.savePets()
                        }
                }
                .fullScreenCover(isPresented: $shouldShowImagePicker) {
                    ImagePicker(image: $image)
                }
            }
            .navigationTitle("Pet Insurance 🤒")
        }
    }
}
struct UploadInsuranceDocumentView_Previews: PreviewProvider {
    static var previews: some View {
        UploadInsuranceDocumentView(pet: Pet(name: "Luna"))
    }
}
