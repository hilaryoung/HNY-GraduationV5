//
//  HNY_GraduationV5App.swift
//  HNY-GraduationV5
//
//  Created by Hilary Young on 25/03/2023.
//

import SwiftUI
import FirebaseCore
import LanguageManagerSwiftUI

@main
struct HNY_GraduationV5App: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            let user = UserViewModel()
            
            //ContentView()
                //.environmentObject(user)
            
            
            LanguageManagerView(.deviceLanguage) {
                ContentView()
                    .environmentObject(user)
                //AppView()
                    //.transition(.slide) // The animation that will be happening when the language change.
            }
            
        }
    }
}


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions:
                   [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    FirebaseApp.configure()
    return true
  }
}
