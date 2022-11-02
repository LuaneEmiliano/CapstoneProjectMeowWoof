//
//  LoginView.swift
//  Trip Planner Capstone
//
//  Created by luane Niejelski on 10/1/22.
//

import SwiftUI
import Firebase

struct LoginView: View {
    
    @State private var isLoginMode = false
    @State private var email = ""
    @State private var password = ""
    @State private var image: UIImage?
    @State private var loginStatusMessage = ""
    @EnvironmentObject var viewModel: MainMessagesViewModel
    
    let didCompleteLoginProcess: () -> ()
    
    var body: some View {
        NavigationView {
            ZStack {
                GeometryReader { proxy in
                    
                    let height = proxy.frame(in: .global).height
                    AnyView(
                        
                        ZStack {
                            Circle()
                                .fill(Color.petAlbum)
                                .offset(x: getRect().width / 2, y: height / 1)
                                .frame(width: proxy.size.width/1.3, height: proxy.size.width/1.3)
                                .opacity(0.8)
                            Circle()
                                .fill(Color.careNotes)
                                .offset(x: -getRect().width / 2, y: height / 1)
                            Circle()
                                .fill(Color.lightBlueColor)
                                .offset(y: height / 1)
                                .rotationEffect(.init(degrees:  -5))
                                .frame(width: proxy.size.width/1.5, height: proxy.size.width/1.5)
                                .opacity(0.9)
                        }
                    )
                }
                .frame(maxHeight: getRect().width)
                ScrollView {
                    Spacer()
                    VStack(spacing: Project.Constants.General.spacing) {
                        Picker(selection: $isLoginMode) {
                            
                            Text("Log In")
                                .tag(true)
                            Text("Create Account")
                                .tag(false)
                        } label: { Text("Picker") }
                        .pickerStyle(.segmented)
                        
                        if !isLoginMode {
                            
                            ImagePickerView(selectedImage: $image, id: "", text: "Add Profile Image", iconImage: "person.fill")
                        }
                        
                        TextField("Email", text: $email)
                            .foregroundColor(.universalColor)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: Project.Constants.General.roundedEdges)
                                    .stroke(lineWidth: 2)
                                
                            )
                        SecureField("Password", text: $password)
                            .foregroundColor(.universalColor)
                            .autocapitalization(.none)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: Project.Constants.General.roundedEdges)
                                    .stroke(lineWidth: 2)
                            )
                        
                        WideStyleActionButton(
                            action: { handleAction() },
                            buttonText: isLoginMode ? "Log In" : "Create Account")
                            .frame(maxWidth: . infinity,
                            minHeight: 25)
                            .font(.headline)
                            .padding()
                            .foregroundColor(.blackColor)
                            .background(Color.universalColor)
                            .cornerRadius(10)
                        
                        Text(loginStatusMessage)
                            .foregroundColor(.red)
                    }
                    .padding()
                }
                .navigationTitle(isLoginMode ? "Log In" : "Create Account")
                
            }
            .navigationViewStyle(.stack)
        }
        
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(didCompleteLoginProcess: { } )
            .preferredColorScheme(.light)
            .accessibilityLabel(/*@START_MENU_TOKEN@*/"Label"/*@END_MENU_TOKEN@*/)
    }
}

// MARK: Methods for Firebase handling
extension LoginView {
    private func handleAction() {
        if isLoginMode {
            print("Should log into Firebase with existing credentials")
            loginUser()
        } else {
            createNewAccount()
        }
        
        
    }
    
    private func loginUser() {
        FirebaseManager.shared.auth.signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("Failed to login user:", error)
                self.loginStatusMessage = "Failed to login user: \(error)"
                return
            }
            print("Successfully logged in as user: \(result?.user.uid ?? "")")
            
            self.loginStatusMessage = "Successfully logged in as user: \(result?.user.uid ?? "")"
            
            if let uid = result?.user.uid {
                viewModel.chatUserID = uid
            }
            
            self.didCompleteLoginProcess()
        }
    }
    
    private func createNewAccount() {
        if self.image == nil {
            self.loginStatusMessage = "You must select an avatar image"
            return
        }
        
        FirebaseManager.shared.auth.createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("Failed to create user:", error)
                self.loginStatusMessage = "Failed to create user: \(error)"
                return
            }
            print("Successfully created user: \(result?.user.uid ?? "")")
            
            self.loginStatusMessage = "Successfully created user: \(result?.user.uid ?? "")"
            
            self.persistImageToStorage()
        }
    }
    
    private func persistImageToStorage() {
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else { return }
        let reference = FirebaseManager.shared.storage.reference(withPath: uid)
        guard let imageData = self.image?.jpegData(compressionQuality: 0.5) else { return }
        reference.putData(imageData, metadata: nil) { metadata, error in
            if let error = error {
                self.loginStatusMessage = "Failed to push image to storage: \(error)"
                return
            }
            
            reference.downloadURL { url, error in
                if let error = error {
                    self.loginStatusMessage = "Failed to retrieve downloadURL: \(error)"
                    return
                }
                self.loginStatusMessage = "Successfully stored image with url: \(url?.absoluteString ?? "")"
                
                guard let url = url else { return }
                self.storeUserInformation(imageProfileURL: url)
            }
        }
    }
    
    private func storeUserInformation(imageProfileURL: URL) {
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else { return }
        let userData = ["email": self.email, "uid": uid, "profileImageURL": imageProfileURL.absoluteString]
        FirebaseManager.shared.firestore.collection("users")
            .document(uid).setData(userData) { error in
                if let error = error {
                    print(error)
                    self.loginStatusMessage = "\(error)"
                    return
                }
                print("Success")
                self.didCompleteLoginProcess()
            }
    }
    func getRect()-> CGRect {
        return UIScreen.main.bounds
    }
}
