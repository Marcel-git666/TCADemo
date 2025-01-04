//
//  RootView.swift
//  TCADemo
//
//  Created by Marcel Mravec on 04.01.2025.
//

import ComposableArchitecture
import SwiftUI

@Reducer
public struct RootFeature {
    public init() {}
    @ObservableState
    public struct State: Equatable {
        public init() {}
    }
    public enum Action {
        case didFinishLaunching
    }
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .didFinishLaunching:
                print("Did finish launching.")
                return .none
            }
            
        }
    }
}

public struct RootView: View {
    @Bindable var store: StoreOf<RootFeature>
    public init(store: StoreOf<RootFeature>) {
        self.store = store
    }
    public var body: some View {
        Text("RootView")
    }
}

#Preview {
    RootView(store: Store(initialState: RootFeature.State()) {
        RootFeature()
    })
}

