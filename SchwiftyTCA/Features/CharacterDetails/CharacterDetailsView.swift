import SwiftUI
import ComposableArchitecture

struct CharacterDetailsView: View {
    let store: StoreOf<CharacterDetailsReducer>

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                CachedImageView(url: store.character.imageURL) {
                    ProgressView()
                } imageContent: { image in
                    image
                        .resizable()
                        .scaledToFit()
                }
                .frame(height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .shadow(radius: 5)

                VStack(alignment: .leading, spacing: 12) {
                    PropertyRow("Status", store.character.status)

                    DynamicCharacterDetailsSection(
                        isLoading: store.isLoading,
                        characterDetails: store.characterDetails
                    )
                }
                .padding(.horizontal)
            }
            .padding(.vertical)
        }
        .navigationTitle(store.character.name)
        .onAppear {
            store.send(.onAppear)
        }
    }
}

#Preview {
    CharacterDetailsView(
        store: .init(
            initialState: CharacterDetailsReducer.State(character: .mock),
            reducer: {
                CharacterDetailsReducer()
            }
        )
    )
}
