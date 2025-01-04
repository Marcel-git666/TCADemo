//
//  AppDelegate.swift
//  TCA Demo App
//
//  Created by Marcel Mravec on 04.01.2025.
//

import ComposableArchitecture
import SwiftUI

public class AppDelegate: NSObject, UIApplicationDelegate {
    
    public let store = Store(initialState: RootFeature.State()) {
        RootFeature()
    }
    public func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        store.send(.didFinishLaunching)
        return true
    }
}
