//
//  MainMessagesView.swift
//  Trip Planner Capstone
//
//  Created by luane Niejelski on 10/2/22.
//

import SwiftUI
import SDWebImageSwiftUI
import Firebase

struct MainMessagesView: View {
    
    @Binding var shouldShowLogOutOptions: Bool
    @State var shouldShowNewMessageScreen = false
    @State var shouldNavigateToChatLogView = false
    
    @State var chatUser: ChatUserModel? = nil
    
    @ObservedObject var vm = MainMessagesViewModel()
    var chatLogViewModel = ChatLogViewModel(chatUser: nil)
    
    var body: some View {
        NavigationView {
            VStack {
                customNavigationBar
                messages
                NavigationLink("",isActive: $shouldNavigateToChatLogView) {
                    ChatLogView(vm: chatLogViewModel)
                }
                
                WideStyleActionButton(action: {
                    shouldShowNewMessageScreen.toggle()
                }, buttonText: "+ New Message")
                    .foregroundColor(.white)
                    .font(.headline)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.petAlbum)
                    .cornerRadius(20)
            }
            .padding()
            .fullScreenCover(isPresented: $vm.isUserCurrentlyLoggedOut) {
                LoginView(didCompleteLoginProcess: {
                    self.vm.isUserCurrentlyLoggedOut = false
                    self.vm.fetchCurrentUser()
                    self.vm.fetchRecentMessages()
                })
            }
            .fullScreenCover(isPresented: $shouldShowNewMessageScreen) {
                CreateNewMessageView(didSelectNewUser: { user in
                    print(user.email)
                    self.shouldNavigateToChatLogView.toggle()
                    self.chatUser = user
                    self.chatLogViewModel.chatUser = user
                    self.chatLogViewModel.fetchMessages()
                })
            }
            .onAppear {
                vm.fetchRecentMessages()
            }
            .navigationViewStyle(.stack)
        }
    }
    
    private var customNavigationBar: some View {
        // custom navigation bar
        HStack(spacing: 16.0) {
            WebImage(url: URL(string: vm.chatUser?.profileImageURL ?? ""))
                .resizable()
                .scaledToFill()
                .frame(width: 60, height: 60)
                .cornerRadius(30)
                .background(
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(lineWidth: 5)
                        .foregroundColor(Color.petAlbum)
                )
                .shadow(color: .secondary.opacity(0.4), radius: 5, x: 0, y: 0)
            
            VStack(alignment: .leading, spacing: 4.0) {
                let username = vm.chatUser?.email.components(separatedBy: "@").first?.capitalized ?? ""
                Text(username)
                    .font(.title2)
                    .bold()
                    .lineLimit(1)
                    .foregroundColor(.primary)
                HStack {
                    Circle()
                        .foregroundColor(.green)
                        .frame(width: 15, height: 15)
                    Text("Online")
                        .font(.headline)
                        .foregroundColor(.primary.opacity(0.5))
                }
            }
            Spacer()
            
        }
        .padding()
        .confirmationDialog("Settings", isPresented: $shouldShowLogOutOptions, titleVisibility: .visible) {
            Button("Sign Out", role: .destructive) {
                vm.handleSignOut()
            }
        }
    }
    
    private var messages: some View {
        // Chat Windows
        ScrollView {
            Divider()
            ForEach(vm.recentMessages) { recentMessage in
                VStack {
                    Button {
                        let uid = FirebaseManager.shared.auth.currentUser?.uid == recentMessage.fromId ? recentMessage.toId : recentMessage.fromId
                        self.chatUser = .init(data: [
                            Project.FirebaseConstants.email: recentMessage.email,
                            Project.FirebaseConstants.profileImageURL: recentMessage.profileImageUrl,
                            Project.FirebaseConstants.uid: uid
                        ])
                        self.chatLogViewModel.chatUser = self.chatUser
                        self.chatLogViewModel.fetchMessages()
                        self.shouldNavigateToChatLogView.toggle()
                    } label: {
                        HStack(spacing: 16) {
                            WebImage(url: URL(string: recentMessage.profileImageUrl))
                                .resizable()
                                .scaledToFill()
                                .frame(width: 75, height: 75)
                                .cornerRadius(40)
                                .foregroundColor(.primary)
                                .background(
                                    RoundedRectangle(cornerRadius: 40)
                                        .stroke(lineWidth: 2)
                                        .foregroundColor(.primary)
                                )
                            VStack(alignment: .leading) {
                                HStack {
                                    Text(recentMessage.username.capitalized)
                                        .font(.title3)
                                        .bold()
                                        .lineLimit(1)
                                        .foregroundColor(.primary)
                                    
                                    Spacer()
                                    
                                    Text(Date(timeIntervalSince1970: TimeInterval(recentMessage.timestamp.seconds)).timeAgo)
                                        .foregroundColor(.primary)
                                }
                                
                                Text(recentMessage.text)
                                    .font(.callout)
                                    .kerning(-0.5)
                                    .foregroundColor(.primary.opacity(0.6))
                                    .fontWeight(.light)
                                    .multilineTextAlignment(.leading)
                                    .lineLimit(3)
                            }
                            
                        }
                    }
                    Divider()
                        .padding(.vertical, Project.Constants.General.paddingSmall)
                }
                .padding(.horizontal)
            }
            .padding(.top, 1)
            Color.clear
                .padding(.bottom, 60)
        }
        .navigationBarHidden(true)
    }
}

struct MainMessagesView_Previews: PreviewProvider {
    static var previews: some View {
        MainMessagesView(shouldShowLogOutOptions: .constant(true))
        
    }
}
