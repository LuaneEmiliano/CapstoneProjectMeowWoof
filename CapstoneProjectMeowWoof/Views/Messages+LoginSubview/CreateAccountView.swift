//
//  PetLoginView.swift
//  CapstoneProjectMeowWoof
//
//  Created by luane Niejelski on 10/1/22.
//

import SwiftUI

struct PetLoginView: View {
    
    let didCompleteLoginProcess: () -> ()
    
    @State var isLoginMode = false
    @State var email = ""
    @State var password = ""
    @State var loginStatusMessage = ""
    @State var shouldShowImagePicker = false
    @State var image: UIImage?
    
    @EnvironmentObject var mainMessageViewModel: MainMessagesViewModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 10) {
                    Picker(selection: $isLoginMode, label: Text("Picker")) {
                        Text("Login")
                            .tag(true)
                        Text("Create Account")
                            .tag(false)
                    }.pickerStyle(SegmentedPickerStyle())
                        .padding(.vertical,10)
                    
                    if !isLoginMode {
                        Button {
                            shouldShowImagePicker.toggle()
                        } label: {
                            VStack {
                                if let image = self.image {
                                    Image(uiImage: image)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 130, height: 130)
                                        .cornerRadius(64)
                                } else {
                                    Image(systemName: "person.fill")
                                        .font(.system(size: 64))
                                        .padding()
                                        .foregroundColor(Color.detailedColor)
                                }
                            }
                        }
                    }
                    VStack {
                        TextField("Email", text: $email)
                            .padding(.horizontal, 20)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                            .padding(.vertical)
                            .background(Color.blackColor)
                            .cornerRadius(5)
                        SecureField("Password",text: $password)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 15)
                            .background(Color.blackColor)
                            .cornerRadius(5)
                    }
                    .padding(.horizontal, 7)
                    
                    Button {
                        handleAction()
                    } label: {
                        Text(isLoginMode ? "Log In" :  "Create Account")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 10)
                            .background(Color.detailedColor)
                            .cornerRadius(10)
                    }
                    .padding(.horizontal, 8)
                }
                Text(self.loginStatusMessage)
                    .foregroundColor(.black)
            }
            .navigationTitle(isLoginMode ? "Login Meow Woof" : "Create Account")
            .background(
                ZStack(alignment: .bottom) {
                    Color.petAlbum
                        .ignoresSafeArea()
                        .opacity(0.6)
                    
                    HStack(alignment: .bottom, spacing: 5){
                        Image("Cat")
                            .renderingMode(.template)
                            .resizable()
                            .foregroundColor(Color.petAlbum)
                            .frame(width: 90, height: 90)
                        Image("Dog")
                            .renderingMode(.template)
                            .resizable()
                            .foregroundColor(Color.petAlbum)
                            .frame(width: 90, height: 90)
                        Image("Others")
                            .renderingMode(.template)
                            .resizable()
                            .foregroundColor(Color.petAlbum)
                            .frame(width: 90, height: 90)
                        Image("Pig")
                            .renderingMode(.template)
                            .resizable()
                            .foregroundColor(Color("PetAlbum"))
                            .frame(width: 90, height: 90)
                    }
                }
            )
        }
        .padding(.vertical)
        .edgesIgnoringSafeArea(.all)
        .navigationViewStyle(StackNavigationViewStyle())
        .fullScreenCover(isPresented: $shouldShowImagePicker, onDismiss: nil) {
            ImagePicker(image: $image)
        }
    }
    
    
}

struct PetLoginView_Previews: PreviewProvider {
    static var previews: some View {
        PetLoginView(didCompleteLoginProcess: {
            
        })                
    }
}

// MARK: Methods

extension PetLoginView {
    
    func handleAction() {
        if isLoginMode {
            loginUser()
        } else {
            createNewAccount()
        }
    }
    
    func loginUser() {
        FirebaseManager.shared.auth.signIn(withEmail: email, password: password) {
            result, err in
            if let err = err {
                print("Failed to login user:", err)
                self.loginStatusMessage = "Failed to login user: \(err)"
                return
            }
            print("Successfully logged in as user: \(result?.user.uid ?? "")")
            self.loginStatusMessage = "Successfuly logged in as user: \(result?.user.uid ?? "")"
            
            self.didCompleteLoginProcess()
        }
    }
    
    func createNewAccount() {
        if self.image == nil {
            self.loginStatusMessage = "You must select an avatar image"
            return
        }
        FirebaseManager.shared.auth.createUser(withEmail: email, password: password) {
            result, err in
            if let err = err {
                print("Failed to create user:", err)
                self.loginStatusMessage = "Failed to create user: \(err)"
                return
            }
            print("Successfully created user: \(result?.user.uid ?? "")")
            self.loginStatusMessage = "Successfuly created user: \(result?.user.uid ?? "")"
            
            self.persistImageToStorage()
        
        }
        mainMessageViewModel.wasAccountCreated = true
    }
    
    func persistImageToStorage() {
        let filename = UUID().uuidString
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid
        else { return }
        let ref = FirebaseManager.shared.storage.reference(withPath: uid)
        guard let imageData = self.image?.jpegData(compressionQuality: 0.5) else { return }
        ref.putData(imageData, metadata: nil) { metadata, err in
            if let err = err {
                self.loginStatusMessage = "Failed to push image to Storage: \(err)"
                return
            }
            ref.downloadURL { url, err in
                if let err = err {
                    self.loginStatusMessage = "Failed to retrieve downloadURL: \(err)"
                    return
                }
                self.loginStatusMessage = "Successfully stored image with url: \(url?.absoluteString ?? "")"
//                print(url?.absoluteString)
                
                guard let url = url else { return }
                self.storeUserInformation(imageProfileUrl: url)
            }
        }
    }
    
    func storeUserInformation(imageProfileUrl: URL) {
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else { return }
        let userData = ["email": self.email, "uid": uid, "profileImageUrl": imageProfileUrl.absoluteString]
        FirebaseManager.shared.firestore.collection("users")
            .document(uid).setData(userData) { err in
            if let err = err {
                print(err)
                self.loginStatusMessage = "\(err)"
                return
            }
            print("success")
                self.didCompleteLoginProcess()
        }
    }
}
