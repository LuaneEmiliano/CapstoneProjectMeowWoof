//
//  ChatLogView.swift
//  CapstoneProjectMeowWoof
//
//  Created by luane Niejelski on 10/2/22.
//

import SwiftUI
import FirebaseFirestore
import Firebase

struct ChatLogView: View {
    
    let offsetXValue: Int = 89
    @ObservedObject var vm: ChatLogViewModel
    @State var offset: CGSize = .zero
    
    var body: some View {
        
        ZStack {
            ScrollView {
                ScrollViewReader { proxy in
                    ForEach(vm.chatMessages) { message in
                        MessageView(message: message, offsetXValue: offsetXValue, offset: $offset)
                    }
                    .padding([.horizontal])
                    
                    Spacer()
                        .id("Bottom")
                        .onReceive(vm.$count) { _ in
                            withAnimation(.easeOut(duration: 0.5)) {
                                proxy.scrollTo("Bottom", anchor: .bottom)
                            }
                        }
                }
            }
            .gesture(
                timestampGesture
            )
            .navigationTitle(vm.chatUser?.email ?? "")
            .navigationBarTitleDisplayMode(.inline)
            .safeAreaInset(edge: .bottom, content: {
                chatBottomBar
            })
            .onDisappear {
                vm.firestoreListener?.remove()
            }
        }
    }
    
    private var timestampGesture: some Gesture {
        DragGesture()
            .onChanged{ value in
                withAnimation(.spring()) {
                    if value.translation.width < 0 {
                        offset = CGSize(width: 0, height: 0)
                    } else if value.translation.width > 0 {
                        offset = CGSize(width: offsetXValue, height: 0)
                    }
                }
            }
            .onEnded { value in
                withAnimation(.spring()) {
                    offset = CGSize(width: offsetXValue, height: 0)
                }
            }
    }
    
    private var chatBottomBar: some View {
        HStack(spacing: 10) {
            HStack {
                TextEditor(text: $vm.chatText)
                    .frame(maxWidth: .infinity, maxHeight: 45)
                    .lineLimit(2)
                    .foregroundColor(Color.universalColor)
//                    .opacity(vm.chatText == vm.placeholderString ? 0.2 : 1.0)
                    .keyboardType(.webSearch)
                    .onChange(of: vm.chatText, perform: { _ in
                        if !vm.chatText.filter({ $0.isNewline }).isEmpty {
                            vm.chatText.removeLast()
                            vm.handleSend()
                        }
                    })
                    .onTapGesture {
                        if vm.chatText == vm.placeholderString {
                            vm.chatText = ""
                        }
                    }
                    .padding(.bottom, Project.Constants.General.paddingSmall)
                Button {
                    vm.handleSend()
                } label: {
                    Image(systemName: "arrow.up")
                        .padding(Project.Constants.General.paddingSmall)
                        .foregroundColor(.primary)
                        .background(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(lineWidth: 1)
                                .foregroundColor(Color.primary)
                        )
                        .padding(.trailing, Project.Constants.General.paddingSmall)
                        .opacity((vm.chatText != vm.placeholderString && !vm.chatText.isEmpty) ? 1.0 : 0.0)
                }
            }
            .background(
                RoundedRectangle(cornerRadius: Project.Constants.General.roundedEdges)
                    .stroke(lineWidth: 2)
                    .opacity(0.2)
            )
        }
        .padding([.horizontal, .top])
        .padding(.bottom, Project.Constants.General.paddingSmall)
        .background(.regularMaterial)
        .ignoresSafeArea()
    }
}

struct ChatLogView_Previews: PreviewProvider {
    static var previews: some View {
        MainMessagesView(shouldShowLogOutOptions: .constant(true))
            .previewInterfaceOrientation(.portrait)
    }
}

struct MessageView: View {
    
    let message: ChatMessageModel
    let offsetXValue: Int
    @Binding var offset: CGSize
    
    var body: some View {
        if message.fromId == FirebaseManager.shared.auth.currentUser?.uid {
            HStack {
                Text(message.text)
                    .foregroundColor(.white)
                    .padding()
                    .background(.blue)
                    .cornerRadius(Project.Constants.General.roundedEdges)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                Text(Date(timeIntervalSince1970: TimeInterval(message.timestamp.seconds)).timeText)
                    .frame(width: 75)
            }
            .onAppear {
                offset = CGSize(width: offsetXValue, height: 0)
            }
            .offset(offset)
        } else {
            HStack {
                Text(message.text)
                    .foregroundColor(.black)
                    .padding()
                    .background(.white)
                    .cornerRadius(Project.Constants.General.roundedEdges)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(Date(timeIntervalSince1970: TimeInterval(message.timestamp.seconds)).timeText)
                    .frame(width: 75)
                    .offset(offset)
            }
            .padding(.leading, -3)
           
        }
    }
}
