import SwiftUI
import ComposableArchitecture

struct DynamicCharacterDetailsSection: View {
    let isLoading: Bool
    let characterDetails: CharacterDetails?

    var body: some View {
        if isLoading {
            ProgressView()
        } else if let character = characterDetails {
            PropertyRow("Species", character.species)
            PropertyRow("Gender", character.gender)
            PropertyRow("Origin", character.origin)
            PropertyRow("Location", character.location)
            PropertyRow("Created", character.created)

            if !character.episodes.isEmpty {
                Text("Episodes")
                    .font(.headline)
                    .padding(.top)

                ForEach(character.episodes) { episode in
                    NavigationLink(
                        state: MainReducer.Path.State.episodeDetails(.init(episode: episode))
                    ) {
                        EpisodeCardView(episode: episode)
                    }
                }
            }
        }
    }
}

//#Preview("Loading") {
//    DynamicCharacterDetailsSection(
//        store: .init(
//            initialState: CharacterDetailsReducer.State(character: .mock),
//            reducer: {
//                CharacterDetailsReducer()
//            }
//        )
//    )
//}
//
//
//#Preview("Loaded") {
//    DynamicCharacterDetailsSection(
//        store: .init(
//            initialState: CharacterDetailsReducer.State(character: .mock),
//            reducer: {
//                CharacterDetailsReducer()
//            }
//        )
//    )
//}
