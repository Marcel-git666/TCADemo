//
//  RootView.swift
//  TCADemo
//
//  Created by Marcel Mravec on 04.01.2025.
//

import ComposableArchitecture
import SwiftUI

@Reducer
public enum RootMode {
    case launching
    case launched
}

@Reducer
public struct RootFeature {
    public init() {}
    @ObservableState
    public struct State: Equatable {
        public init() {}
        public var mode: RootMode.State? = .launching
    }
    public enum Action {
        case didFinishLaunching
        case mode(RootMode.Action)
    }
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .didFinishLaunching:
                print("Did finish launching.")
                state.mode = .launched
                return .none
            case .mode:
                return .none
            }
        }
        .ifLet(\.mode, action: \.mode) {
            RootMode.body
        }
    }
}

public struct RootView: View {
    @Bindable var store: StoreOf<RootFeature>
    public init(store: StoreOf<RootFeature>) {
        self.store = store
    }
    public var body: some View {
        if let store = store.scope(state: \.mode, action: \.mode) {
            switch store.case {
            case .launching:
                Text("Launching...")
            case .launched:
                Text("Launched!")
            }
        }
    }
}

#Preview {
    RootView(store: Store(initialState: RootFeature.State()) {
        RootFeature()
    })
}

