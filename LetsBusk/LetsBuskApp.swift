//
//  LetsBuskApp.swift
//  LetsBusk
//
//  Created by Abdulaziz Albahar on 11/11/22.
//

import SwiftUI
import FirebaseCore


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct YourApp: App {
  // register app delegate for Firebase setup
  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var uvm = UserViewModel(artist: Artist())
    

  var body: some Scene {
      
    WindowGroup {
      NavigationView {
          ContentView().environmentObject(uvm)
      }
    }
  }
}
