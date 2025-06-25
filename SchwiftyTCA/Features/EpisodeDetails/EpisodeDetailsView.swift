import SwiftUI
import ComposableArchitecture

struct EpisodeDetailsView: View {
    @Bindable var store: StoreOf<EpisodeDetailsReducer>

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                if store.isLoading {
                    Spacer()
                    ProgressView()
                        .scaleEffect(2.0)
                        .padding()
                    Spacer()
                } else if let episodeDetails = store.episodeDetails {
                    PropertyRow("Title", episodeDetails.name)
                    PropertyRow("Air date", episodeDetails.airDate)
                    PropertyRow("Created", episodeDetails.created)

                    Text("Characters")
                        .font(.caption)
                        .foregroundColor(.secondary)

                    ForEach(episodeDetails.characters) { character in
                        HStack {
                            CachedImageView(url: character.imageURL) {
                                ProgressView()
                            } imageContent: { image in
                                image
                                    .resizable()
                                    .scaledToFill()
                            }
                            .frame(width: 30, height: 30)
                            .clipShape(Circle())

                            Text(character.name)

                            Spacer()
                        }
                    }
                }
            }
            .padding()
        }
        .navigationTitle(store.episode.episode)
        .onAppear {
            store.send(.onAppear)
        }
    }
}
