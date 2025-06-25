import SwiftUI

struct EpisodeCardView: View {
    let episode: Episode

    var body: some View {
        HStack {
            Text(episode.name)
                .fontWeight(.medium)

            Spacer()

            Text(episode.episode)
                .font(.caption)
                .bold()
                .foregroundColor(.secondary)
        }
        .padding()
        .background(Color(.secondarySystemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}
