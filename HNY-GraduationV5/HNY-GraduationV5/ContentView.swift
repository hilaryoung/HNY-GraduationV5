//
//  ContentView.swift
//  HNY-GraduationV5
//
//  Created by Hilary Young on 25/03/2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var user: UserViewModel
    
    var body: some  View {
        NavigationView {
            if user.userIsAuthenticatedAndSynced {
                ProfileView()
            } else {
                AuthenticationView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
