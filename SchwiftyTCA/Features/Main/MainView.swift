import SwiftUI
import ComposableArchitecture

struct MainView: View {
    @Bindable var store: StoreOf<MainReducer>

    var body: some View {
        NavigationStack(path: $store.scope(state: \.path, action: \.path)) {
            CharactersView(store: store.scope(state: \.characters, action: \.characters))
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button {
                            store.send(.clearCache)
                        } label: {
                            Image(systemName: "arrow.trianglehead.2.clockwise.rotate.90")
                        }
                    }
                }
        } destination: { store in
            switch store.case {
                case let .characterDetails(store):
                    CharacterDetailsView(store: store)
                case let .episodeDetails(store):
                    EpisodeDetailsView(store: store)

            }
        }
    }
}

#Preview {
    MainView(store: Store(initialState: MainReducer.State()) {
        MainReducer()
    })
}
