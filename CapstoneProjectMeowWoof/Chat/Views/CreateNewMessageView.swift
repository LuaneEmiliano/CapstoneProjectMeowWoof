//
//  NewMessageView.swift
//  Trip Planner Capstone
//
//  Created by luane Niejelski on 10/2/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct CreateNewMessageView: View {
    
    let didSelectNewUser: (ChatUserModel) -> ()
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var vm = CreateNewMessageViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                Text(vm.errorMessage)
                ForEach(vm.users) { user in
                    HStack {
                        WebImage(url: URL(string: user.profileImageURL))
                            .resizable()
                            .scaledToFill()
                            .frame(width: 60, height: 60)
                            .cornerRadius(30)
                            .background(
                                RoundedRectangle(cornerRadius: 30)
                                    .stroke(lineWidth: 5)
                                    .foregroundColor(.primary)
                            )
                            .shadow(color: .primary.opacity(0.4), radius: 5, x: 0, y: 0)
                            .padding(.trailing)
                        Text(user.email)
                        Spacer()
                    }
                    .padding(.horizontal)
                    .onTapGesture {
                        // TODO: click on new message to user
                        presentationMode.wrappedValue.dismiss()
                        didSelectNewUser(user)
                    }
                    Divider()
                }
            }
            .navigationTitle("New Message")
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
        .navigationViewStyle(.stack)
    }
}

struct NewMessageView_Previews: PreviewProvider {
    static var previews: some View {
        MainMessagesView()
    }
}
