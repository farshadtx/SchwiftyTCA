import SwiftUI
import ComposableArchitecture

@main
struct SchwiftyTCAApp: App {
    static let store = Store(initialState: MainReducer.State()) {
        MainReducer()
    }

    var body: some Scene {
        WindowGroup {
            if isTesting {
                EmptyView()
            } else {
                MainView(store: Self.store)
            }
        }
    }
}
