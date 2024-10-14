//
//  ProfileView.swift
//  ToDoList
//
//  Created by mac on 07/10/2024.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                
                if let user = viewModel.user {
                    // Avatar
                    Image(systemName: "person.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundStyle(Color.blue)
                        .frame(width: 125, height: 125)
                        .padding()
                    
                    // Info: Name, Email, Member since
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Name: ")
                                .bold()
                            Text("Afraz Siddiqui")
                        }
                        .padding()
                        HStack {
                            Text("Email: ")
                                .bold()
                            Text("Afraz Siddiqui")
                        }
                        .padding()
                        HStack {
                            Text("Member Since: ")
                                .bold()
                            Text("Afraz Siddiqui")
                        }
                        .padding()
                    }
                    .padding()
                    
                    // Sign out
                    Button("Log Out") {
                        viewModel.logOut()
                    }
                    .tint(.red)
                    .padding()
                    
                    Spacer()
                }else {
                    Text("Loading Profile...")
                }
                
                
            }
            .navigationTitle("Profile")
        }
    }
}

#Preview {
    ProfileView()
}
