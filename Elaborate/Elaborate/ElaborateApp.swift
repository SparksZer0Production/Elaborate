//
//  ElaborateApp.swift
//  Elaborate
//
//  Created by Samuel Faucher on 10/22/24.
//

import SwiftUI
import Firebase

@main
struct ElaborateApp: App {
    
//    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
//
//        class AppDelegate: NSObject, UIApplicationDelegate {
//          func application(_ application: UIApplication,
//                           didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
//            FirebaseApp.configure()
//            return true
//          }
//        }
    
    var body: some Scene {
        WindowGroup {
            HomeView()
            //ContentView()
        }
    }
}
