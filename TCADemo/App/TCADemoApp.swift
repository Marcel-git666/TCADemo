//
//  TCADemoApp.swift
//  TCADemo
//
//  Created by Marcel Mravec on 04.01.2025.
//

import ComposableArchitecture
import Root
import SwiftUI

@main
struct TCADemoApp: App {
    var body: some Scene {
        WindowGroup {
            RootView(store: Store(initialState: RootFeature.State()) {
                RootFeature()
            })
        }
    }
}
