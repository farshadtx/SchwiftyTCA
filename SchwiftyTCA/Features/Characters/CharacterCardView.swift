import SwiftUI

struct CharacterCardView: View {
    let character: CharacterModel

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 12) {
                CachedImageView(url: character.imageURL) {
                    ProgressView()
                } imageContent: { image in
                    image
                        .resizable()
                        .scaledToFill()
                }
                .frame(width: 100, height: 100)
                .clipShape(Circle())

                VStack(alignment: .leading, spacing: 16) {
                    Text(character.name)
                        .font(.title3)
                        .fontWeight(.semibold)

                    Text(character.status)
                        .font(.callout)
                        .italic()
                }

                Spacer()
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemGreen).opacity(0.25))
        )
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color(.separator), lineWidth: 0.5)
        )
    }
}

#Preview {
    CharacterCardView(
        character: .mock
    )
}
