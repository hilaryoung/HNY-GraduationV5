//
//  AuthenticationView.swift
//  HNY-GraduationV5
//
//  Created by Hilary Young on 25/03/2023.
//

import SwiftUI

struct AuthenticationView: View {
    var body: some View {
        
        VStack{
            SignInView()
            NavigationLink("Sign Up", destination: signUpView())
        }
        
    }
}

struct SignInView: View {
    @EnvironmentObject var user: UserViewModel
    @State private var email = ""
    @State private var password = ""
    
    var body: some View{
        VStack{
            TextField("Email", text: $email)
                .autocapitalization(.none)
                .disableAutocorrection(true)
            SecureField("Password", text: $password)
                .autocapitalization(.none)
                .disableAutocorrection(true)
            Button(action: {
                user.signIn(email: email, password: password)
            }) {
                Text("Sign In")
            }
        }
    }
}



struct signUpView: View{
    @EnvironmentObject var user: UserViewModel
    @State private var email = ""
    @State private var password = ""
    @State private var firstName = ""
    @State private var lastName = ""
    
    var body: some View{
        VStack{
            TextField("First Name", text: $firstName)
            TextField("Last Name", text: $lastName)
                
            TextField("Email", text: $email)
                .autocapitalization(.none)
                .disableAutocorrection(true)
            SecureField("Password", text: $password)
                .autocapitalization(.none)
                .disableAutocorrection(true)
            Button(action: {
                user.signUp(email: email, firstName: firstName, lastName: lastName, password: password )
            }) {
                Text("Sign Up")
            }
        }
    }
}
