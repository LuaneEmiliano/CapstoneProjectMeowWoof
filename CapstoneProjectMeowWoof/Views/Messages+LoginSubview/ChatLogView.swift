//
//  ChatLoginView.swift
//  CapstoneProjectMeowWoof
//
//  Created by luane Niejelski on 10/3/22.
//

import SwiftUI

struct PetChatView: View {

    @ObservedObject var vm: ChatLogViewModel

    var body: some View {
        ZStack {
            messagesView
            Text(vm.errorMessage)
        }
        .navigationTitle(vm.chatUser?.email ?? "")
        .navigationBarTitleDisplayMode(.inline)
        .onDisappear {
            vm.firestoreListener?.remove()
        }
    }

    static let emptyScrollToString = "Empty"

    private var messagesView: some View {
        VStack {
            ScrollView {
                ScrollViewReader { ScrollViewProxy in
                    VStack {
                        ForEach(vm.chatMessages) { message in
                            MessageView(message: message)

                        }
                        HStack{Spacer()}
                        .id(Self.emptyScrollToString)
                    }
                    .onReceive(vm.$count) { _ in
                        withAnimation(.easeOut(duration: 0.5)) {
                            ScrollViewProxy.scrollTo(Self.emptyScrollToString, anchor: .bottom)

                        }

                    }
                }
            }
            .background(Color.blackColor)
            .safeAreaInset(edge: .bottom) {
                chatBottomBar
                    .background(Color(.systemBackground)
                                    .ignoresSafeArea())
            }
        }
    }

    struct MessageView: View {

        let message: ChatMessage

        var body: some View {
            VStack {
                if message.fromId == FirebaseManager.shared.auth.currentUser?.uid {
                    HStack {
                        Spacer()
                        HStack {
                            Text(message.text)
                                .foregroundColor(.white)
                        }
                        .padding()
                        .background(Color.detailedColor)
                        .cornerRadius(5)
                    }

                } else {
                    HStack {
                        HStack {
                            Text(message.text)
                                .foregroundColor(.white)
                        }
                        .padding()
                        .background(Color.careNotes)
                        .cornerRadius(5)
                        Spacer()
                    }

                }
            }
            .padding(.horizontal)
            .padding(.top,8)
        }
    }

    private var chatBottomBar: some View {
        HStack {
            Image(systemName: "photo.fill.on.rectangle.fill")
                .font(.system(size: 24))
            ZStack {
                DescriptionPlaceholder()
                TextEditor(text: $vm.chatText)
                    .opacity(vm.chatText.isEmpty ? 0.5 : 1)
            }
            .frame(height: 40)
            Button {
                vm.handleSend()
            } label: {
                Text("Send")
                    .foregroundColor(Color.white)
            }
            .padding(.horizontal)
            .padding(.vertical,8)
            .background(Color.detailedColor)
            .cornerRadius(5)
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
    }
}
struct DescriptionPlaceholder: View {
    var body: some View {
        HStack {
            Text("Description")
                .foregroundColor(Color(.gray))
                .font(.system(size: 17))
                .padding(.leading, 5)
                .padding(.top, -4)
            Spacer()
        }
    }
}
////struct PetChatView_Previews: PreviewProvider {
////    static var previews: some View {
//////        NavigationView {
//////           PetChatView(vm: .init(chatUser? ["uid":"AMvYtWlebxYML3ud7ATxm4Pok602","email":
//////                                               "test09@gmail.com"]))
//////        }
////////        .preferredColorScheme(.light)
////
//////    }
//// )
////}
