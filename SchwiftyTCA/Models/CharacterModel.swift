import Foundation
import GraphqlAPI

struct CharacterModel: Identifiable, Equatable {
    let id: String
    let name: String
    let image: String
    let status: String

    public init(
        id: String,
        name: String,
        image: String,
        status: String
    ) {
        self.id = id
        self.name = name
        self.image = image
        self.status = status
    }

    init?(from raw: GetCharactersQuery.Data.Characters.Result?) {
        guard
            let id = raw?.id,
            let name = raw?.name,
            let image = raw?.image,
            let status = raw?.status
        else { return nil }

        self.id = id
        self.name = name
        self.image = image
        self.status = status
    }

    init?(from raw: GetEpisodeQuery.Data.Episode.Character?) {
        guard
            let id = raw?.id,
            let name = raw?.name,
            let image = raw?.image,
            let status = raw?.status
        else { return nil }

        self.id = id
        self.name = name
        self.image = image
        self.status = status
    }
}

extension CharacterModel {
    var imageURL: URL? {
        URL(string: image)
    }
}

#if DEBUG
extension CharacterModel {
    static let mock: Self = CharacterModel(
        id: "1",
        name: "Rick",
        image: "rick.png",
        status: "Dead"
    )
}
#endif
