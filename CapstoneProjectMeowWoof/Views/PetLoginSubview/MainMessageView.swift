//
//  MainMessageView.swift
//  CapstoneProjectMeowWoof
//
//  Created by luane Niejelski on 10/2/22.
//

import SwiftUI
import SDWebImageSwiftUI
import Firebase

struct MainMessageView: View {
    
    @State var shouldShowLogOutOptions: Bool = false
    @State var shouldShowNewMessageScreen: Bool = false
    @ObservedObject var vm = MainMessagesViewModel()
    @State var chatUser: ChatUser?
    @State var shouldNavigateToChatLogView = false
    
    private var chatLogViewModel = ChatLogViewModel(chatUser: nil)
    @EnvironmentObject var launchScreenManager: LaunchScreenManager
    
    var body: some View {
        NavigationView {
            VStack {
                customNavBar
                messageView
                
                NavigationLink("",isActive: $shouldNavigateToChatLogView) {
                    PetChatView(vm: chatLogViewModel)
                }
            }
            .overlay(
                newMessageButton, alignment: .bottom)
            .navigationBarHidden(true)
        }
        
    }
    
    private var customNavBar: some View {
        HStack(spacing: 16) {
            
            WebImage(url: URL(string: vm.chatUser?.profileImageUrl ?? ""))
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50)
                .clipped()
                .cornerRadius(44)
            VStack(alignment: .leading, spacing: 4) {
                let email =
                vm.chatUser?.email.replacingOccurrences(of: "@gmail.com", with: "") ?? ""
                Text(email)
                    .font(.title2)
                    .fontWeight(.semibold)
                HStack {
                    Circle()
                        .foregroundColor(.green)
                        .frame(width: 14, height: 14)
                    Text("online")
                        .font(.headline)
                        .foregroundColor(.gray)
                }
            }
            Spacer()
            Button  {
                shouldShowLogOutOptions.toggle()
            } label: {
                Image(systemName: "gear")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(Color(.label))
            }
        }
        .padding()
        .actionSheet(isPresented: $shouldShowLogOutOptions) {
            .init(title: Text("What do you want to do?"), buttons: [
                .destructive(Text("Sign Out"), action: {
                    print("handle sign out")
                    vm.handleSignOut()
                }),
                .cancel()
            ]
            )
        }
        .fullScreenCover(isPresented: $vm.isUserCurrentlyLoggedOut, onDismiss: nil) {
            PetLoginView(didCompleteLoginProcess: {
                self.vm.isUserCurrentlyLoggedOut = false
                self.vm.fetchCurrentUser()
                self.vm.fetchRecentMessages()
            })
        }
    }
    
    private  var messageView: some View {
        ScrollView {
            ForEach(vm.recentMessages) { recentMessage in
                VStack {
                    NavigationLink {
                        Text("dest")
                    } label: {
                        HStack(spacing: 16) {
                            WebImage(url: URL(string: recentMessage.profileImageUrl))
                                .resizable()
                                .scaledToFill()
                                .frame(width: 64, height: 64)
                                .clipped()
                                .cornerRadius(64)
                                .overlay(
                                RoundedRectangle(cornerRadius: 64)
                                    .stroke(Color.black, lineWidth: 1)
                                    .shadow( radius: 5)
                                )
                            VStack(alignment: .leading) {
                                Text(recentMessage.email)
                                    .font(.system(size: 16, weight: .bold))
                                    .foregroundColor(Color.universalColor)
                                Text(recentMessage.text)
                                    .foregroundColor(.gray)
                                    .font(.system(size: 16))
                                    .multilineTextAlignment(.leading)
                            }
                            Spacer()
                            
                            Text("22d")
                                .font(.system(size: 16, weight: .bold))
                                .foregroundColor(Color.universalColor)
                        }
                    }
                                   Divider()
                        .padding(.vertical, 8)
                }.padding(.horizontal)
            }.padding(.bottom, 50)
        }
    }
    private var newMessageButton: some View {
        Button  {
            shouldShowNewMessageScreen.toggle()
        } label: {
            HStack {
                Spacer()
                Text("+ New Message")
                    .font(.title3)
                    .fontWeight(.semibold)
                Spacer()
            }
            .foregroundColor(.white)
            .padding(.vertical)
            .background(Color.detailedColor)
            .cornerRadius(5)
            .padding()
        }
        .fullScreenCover(isPresented: $shouldShowNewMessageScreen) {
            NewMessageChatView(didSelectNewUser: { user in
                print(user.email)
                self.shouldNavigateToChatLogView.toggle()
                self.chatLogViewModel.chatUser = user
                self.chatLogViewModel.fetchMessages()
            })
        }

    }
}

struct MainMessageView_Previews: PreviewProvider {
    static var previews: some View {
        MainMessageView()
            .environmentObject(LaunchScreenManager())
    }
}
