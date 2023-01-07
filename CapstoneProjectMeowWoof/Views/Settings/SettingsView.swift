////
////  SettingsView.swift
////  CapstoneProjectMeowWoof
////
////  Created by luane Niejelski on 10/22/22.
////
//
//import SwiftUI
//
//struct SettingsView: View {
//    
////    @EnvironmentObject var viewModel: MainMessagesViewModel
//    @Binding var shouldShowLogOutOptions: Bool
//    
//    var body: some View {
//        NavigationView {
//            ZStack {
//                GeometryReader { proxy in
//                    
//                    let height = proxy.frame(in: .global).height
//                    AnyView(
//                        
//                        ZStack {
//                            Circle()
//                                .fill(Color.healthJournalColor)
//                                .offset(x: getRect().width / 3, y: height / 1)
//                                .frame(width: proxy.size.width/1.3, height: proxy.size.width/1.3)
//                                .opacity(0.9)
//                            Circle()
//                                .fill(Color.detailedColor)
//                                .offset(x: -getRect().width / 2, y: height / 1)
//                                .opacity(0.4)
//                            Circle()
//                                .fill(Color.lightBlueColor)
//                                .offset(y: height / 1)
//                                .rotationEffect(.init(degrees:  -5))
//                                .frame(width: proxy.size.width/1.5, height: proxy.size.width/1.5)
//                                .opacity(0.9)
//                        }
//                    )
//                }
//                .frame(maxHeight: getRect().width)
//                VStack{
//                    
//                    Spacer()
//                    
//                    Button {
//                        print(viewModel.chatUser?.id ?? "No user id is found")
//                        if let uid = viewModel.chatUser?.uid {
//                            viewModel.deleteUserData(uid: uid) { result in
//                                switch result {
//                                case .success:
//                                    viewModel.deleteUser { result in
//                                        if case let .failure(error) = result {
//                                            print(error.localizedDescription)
//                                        }
//                                    }
//                                case .failure(let error):
//                                    print(error.localizedDescription)
//                                }
//                            }
//                            print("Successfully deleted user")
//                            viewModel.handleSignOut()
//                            shouldShowLogOutOptions.toggle()
//                        } else {
//                            viewModel.deleteUserData(uid: viewModel.chatUserID) { result in
//                                switch result {
//                                case .success:
//                                    viewModel.deleteUser { result in
//                                        if case let .failure(error) = result {
//                                            print(error.localizedDescription)
//                                        }
//                                    }
//                                case .failure(let error):
//                                    print(error.localizedDescription)
//                                }
//                            }
//                            print("Successfully deleted user")
//                            viewModel.handleSignOut()
//                            shouldShowLogOutOptions.toggle()
//                        }
//                        
//                    } label: {
//                        SettingsRowView(icon: "Delete", title: "Delete Account")
//                            .font(.headline)
//                            .frame(maxWidth: . infinity, maxHeight: 50)
//                            .background(Color.petAlbum)
//                            .cornerRadius(10)
//                            .padding(.bottom,10)
//                            .padding()
//                    }
//                    
//                    
//                    Spacer()
//                    
//                    Button {
//                        viewModel.handleSignOut()
//                        shouldShowLogOutOptions.toggle()
//                    } label: {
//                        Text("SIGN OUT")
//                            .font(.headline)
//                            .frame(maxWidth: . infinity,
//                                   minHeight: 45)
//                            .foregroundColor(.blackColor)
//                            .background(Color.universalColor)
//                            .cornerRadius(10)
//                            .padding(.bottom, 5)
//                            .padding()
//                    }
//            }
//            
//                .navigationTitle("Settings")
//            }
//        }
//    }
//    func getRect()-> CGRect {
//        return UIScreen.main.bounds
//    }
//}
//
//struct SettingsView_Previews: PreviewProvider {
//    static var previews: some View {
//        SettingsView( shouldShowLogOutOptions: .constant(false))
//            .preferredColorScheme(.light)
//    }
//}
