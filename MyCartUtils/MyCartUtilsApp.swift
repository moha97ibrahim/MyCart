//
//  MyCartUtilsApp.swift
//  MyCartUtils
//
//  Created by Mohammed Ibrahim on 1/7/21.
//

import SwiftUI

@main
struct MyCartUtilsApp: App {

    @StateObject var homeView = HomeViewModel()
    
    @Environment(\.scenePhase) var scenePhase
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(homeView)
        }
        .onChange(of: scenePhase) { (newScenePhase) in
            switch newScenePhase{
            case .background:
                print("Scene in background")
            case.active:
                print("Scene in active")
            case.inactive:
                print("Scene in inactive")
            @unknown default:
                print("Scene in default")
            }
        }
    }
    
}
