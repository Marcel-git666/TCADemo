import ComposableArchitecture
import Testing

@testable import Root

@MainActor
struct RootTests {
    @Test func didFinishLaunching() async throws {
        let store = TestStoreOf<RootFeature>(initialState: RootFeature.State()) {
            RootFeature()
        }
        #expect(store.state.mode == .launching)
        
        await store.send(.didFinishLaunching) {
            $0.mode = .launched
        }
    }
}
