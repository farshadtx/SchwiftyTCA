import SwiftUI

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
                    EpisodeCardView(episode: episode)
                }
            }
        }
    }
}

#Preview("Loading") {
    DynamicCharacterDetailsSection(
        isLoading: true,
        characterDetails: nil
    )
}


#Preview("Loaded") {
    DynamicCharacterDetailsSection(
        isLoading: false,
        characterDetails: CharacterDetails.mock
    )
}
