import SwiftUI
import ComposableArchitecture

struct CharactersView: View {
    @Bindable var store: StoreOf<CharactersReducer>

    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(store.characters) { character in
                    CharacterCardView(character: character)
                        .padding(.horizontal)
                        .onTapGesture {
                            store.send(.characterCardTapped(character))
                        }
                        .onAppear {
                            if character.id == store.characters.last?.id {
                                store.send(.loadNextPage)
                            }
                        }
                }
                
                if store.isLoading {
                    HStack {
                        Spacer()
                        ProgressView()
                            .scaleEffect(2.0)
                            .padding()
                        Spacer()
                    }
                }
            }
        }
        .navigationTitle("Characters")
        .onAppear {
            store.send(.onAppear)
        }
    }
}

#Preview {
    CharactersView(
        store: Store(initialState: CharactersReducer.State()) { CharactersReducer() }
    )
}
