////
////  NewMessageView.swift
////  CapstoneProjectMeowWoof
////
////  Created by luane Niejelski on 10/2/22.
////
//
//import SwiftUI
//import SDWebImageSwiftUI
//
//struct CreateNewMessageView: View {
//    
//    let didSelectNewUser: (ChatUserModel) -> ()
//    @Environment(\.presentationMode) var presentationMode
//    @ObservedObject var vm = CreateNewMessageViewModel()
//    @State var textFieldText: String = ""
//    
//    var body: some View {
//        NavigationView {
//            VStack {
//                TextField("Enter email here...", text: $textFieldText)
//                    .foregroundColor(.universalColor)
//                    .keyboardType(.emailAddress)
//                    .autocapitalization(.none)
//                    .disableAutocorrection(true)
//                    .padding()
//                    .background(
//                        RoundedRectangle(cornerRadius: Project.Constants.General.roundedEdges)
//                            .stroke(lineWidth: 2)
//                        )
//                    .padding()
//                ScrollView {
//                    Text(vm.errorMessage)
//                    ForEach(vm.users) { user in
//                        let textFieldText = textFieldText.lowercased()
//                        if user.email.contains(textFieldText) || textFieldText.isEmpty {
//                            HStack {
//                                WebImage(url: URL(string: user.profileImageURL))
//                                    .resizable()
//                                    .scaledToFill()
//                                    .frame(width: 60, height: 60)
//                                    .cornerRadius(30)
//                                    .background(
//                                        RoundedRectangle(cornerRadius: 30)
//                                            .stroke(lineWidth: 5)
//                                            .foregroundColor(Color.petAlbum)
//                                    )
//                             Text(user.email)
//                                Spacer()
//                            }
//                            .padding(.horizontal)
//                            .onTapGesture {
//                                // TODO: click on new message to user
//                                presentationMode.wrappedValue.dismiss()
//                                didSelectNewUser(user)
//                            }
//                            Divider()
//                        }
//                        
//                    }
//                }
//            
//            }
//            .navigationTitle("New Message")
//            .toolbar {
//                ToolbarItemGroup(placement: .navigationBarLeading) {
//                    Button {
//                        presentationMode.wrappedValue.dismiss()
//                    } label: {
//                        Text("Cancel")
//                    }
//                    
//                }
//            }
//        }
//        .navigationViewStyle(.stack)
//    }
//}
//
//struct NewMessageView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainMessagesView(shouldShowLogOutOptions: .constant(true))
//    }
//}
