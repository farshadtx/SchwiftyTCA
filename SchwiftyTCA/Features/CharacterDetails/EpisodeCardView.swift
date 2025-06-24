import SwiftUI

struct EpisodeCardView: View {
    let episode: CharacterDetails.Episode

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(episode.name)
                .fontWeight(.medium)

            HStack {
                Text(episode.episode)
                    .font(.caption)
                    .bold()
                    .foregroundColor(.secondary)

                Spacer()

                Text("Air date: \(episode.airDate)")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
        .padding(8)
        .background(Color(.secondarySystemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}
