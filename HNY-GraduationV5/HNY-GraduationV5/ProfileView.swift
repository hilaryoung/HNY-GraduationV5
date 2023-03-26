//
//  ProfileView.swift
//  HNY-GraduationV5
//
//  Created by Hilary Young on 25/03/2023.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var user: UserViewModel
    @State private var email = ""
    @State private var password = ""
    
    // Language settings states
    @State private var isPresented = false
    
    var body: some View{
        VStack{
            
            HStack{
                Text("Welcome-text")
                Text("\(user.user?.firstName ?? "") \(user.user?.lastName ?? "")")
            }
            
            NavigationLink("QuickAdd", destination: QuickAddView())
            
            // Change language button
            Button("Change-language") {
              isPresented = true // change to indonesia
            }
            
            
            
            //Sign out button
            Button(action: {
                user.signOut()
            }) {
                Text("Sign-out")
            }
            
        }
        
        
        // Language button configuration
        .fullScreenCover(isPresented: $isPresented) {
          LangaugeView()
        }
        
        
    }
}
