//
//  UserViewModel.swift
//  grad-project-v1.2-Auth-saveData
//
//  Created by Hilary Young on 10/03/2023.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

class UserViewModel: ObservableObject {
    @Published var user: User?
    
    private let auth = Auth.auth()
    private let db = Firestore.firestore()
    var uuid: String? {
        auth.currentUser?.uid // asking for user ID
    }
    
    var userIsAuthenticated: Bool {
        auth.currentUser != nil // if its not equal 'nil' then user is authenticated
    }
    
    // Pulling data from database
    var userIsAuthenticatedAndSynced: Bool {
        user != nil && userIsAuthenticated
    }
    
    // Firebase Auth Functions
    // Sign In
    func signIn(email: String, password: String) {
        auth.signIn(withEmail: email, password: password) { [weak self] result, error in
            guard result != nil, error == nil else { return }
            DispatchQueue.main.async {
                self?.sync()
            }
        }
    }
    
    // Sign Up
    func signUp(email: String, firstName: String, lastName: String, password: String) {
        auth.createUser(withEmail: email, password: password) { [weak self] result, error in
            guard result != nil, error == nil else { return }
            DispatchQueue.main.async {
                self?.add(User(firstName: firstName, lastName: lastName, userID: self?.uuid))
                self?.sync()
            }
        }
    }
    
    // Sign out
    func signOut() {
        do {
            try auth.signOut()
            self.user = nil
        } catch {
            print("Error signing out user: \(error)")
        }
    }
    
    
    
    // Firestore function for user data
    private func sync() {
        guard userIsAuthenticated else { return }
        db.collection("users").document(self.uuid!).getDocument{ (document, error) in
            guard document != nil, error == nil else { return }
            do {
                try self.user = document!.data(as: User.self)
            } catch {
                print("Sync error: \(error)")
            }
        }
    }
    
    private func add(_ user: User) {
        guard userIsAuthenticated else { return }
        do {
            let _ = try db.collection("users").document(self.uuid!).setData(from: user)
        } catch {
            print("Error adding: \(error)")
        }
    }
    
    private func update() {
        guard userIsAuthenticatedAndSynced else { return }
        do {
            let _ = try db.collection("users").document(self.uuid!).setData(from: user)
        } catch {
            print("Error updating: \(error)")
        }
    }
    
    
    // change language
    // Sign out
    func changeLanguage() {
        print("Language changed")
    }
 
    
    
    
}

