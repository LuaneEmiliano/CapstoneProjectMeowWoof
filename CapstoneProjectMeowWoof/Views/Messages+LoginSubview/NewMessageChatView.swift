//
//  NewMessageChatView.swift
//  CapstoneProjectMeowWoof
//
//  Created by luane Niejelski on 10/3/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct NewMessageChatView: View {
    
    let didSelectNewUser: (ChatUser) -> ()
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var vm = newMessageChatViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                Text(vm.errorMessage)
                ForEach(vm.users) { user in
                    Button {
                        presentationMode.wrappedValue.dismiss()
                        didSelectNewUser(user)
                    } label: {
                        HStack(spacing: 16) {
                            WebImage(url: URL(string: user.profileImageUrl))
                                .resizable()
                                .scaledToFill()
                                .frame(width: 50, height: 50)
                                .clipped()
                                .cornerRadius(50)
                        }
                        Text(user.email)
                            .foregroundColor(Color(.label))
                        Spacer()
                    }.padding(.horizontal)
                    Divider()
                        .padding(.vertical,8)
                }
            }
            
            .navigationTitle("NewMessage")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Text("Cancel")
                    }
                    
                }
            }
        }
    }
}

struct NewMessageChatView_Previews: PreviewProvider {
    static var previews: some View {
        NewMessageChatView(didSelectNewUser: { user in 
            
        })
    }
}
