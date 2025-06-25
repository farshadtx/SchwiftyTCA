import Foundation
import GraphqlAPI

struct CharacterDetails: Identifiable, Equatable {
    let id: String
    let name: String
    let status: String
    let species: String
    let gender: String
    let origin: String
    let location: String
    let episodes: [Episode]
    let image: String
    let created: String

    init(
        id: String,
        name: String,
        status: String,
        species: String,
        gender: String,
        origin: String,
        location: String,
        episodes: [Episode],
        image: String,
        created: String
    ) {
        self.id = id
        self.name = name
        self.status = status
        self.species = species
        self.gender = gender
        self.origin = origin
        self.location = location
        self.episodes = episodes
        self.image = image
        self.created = created
    }

    init?(from raw: GetCharacterQuery.Data.Character) {
        guard
            let id = raw.id,
            let name = raw.name,
            let status = raw.status,
            let species = raw.species,
            let gender = raw.gender,
            let origin = raw.origin?.name,
            let location = raw.location?.name,
            let image = raw.image,
            let created = raw.created
        else { return nil }

        self.id = id
        self.name = name
        self.status = status
        self.species = species
        self.gender = gender
        self.origin = origin
        self.location = location
        self.episodes = raw.episode.compactMap(Episode.init(from:))
        self.image = image
        self.created = created
    }
}

extension CharacterDetails {
    var imageURL: URL? {
        URL(string: image)
    }
}

#if DEBUG
extension CharacterDetails {
    static let mock: Self = .init(
        id: "1",
        name: "Rick Sanchez",
        status: "Alive",
        species: "Human",
        gender: "Male",
        origin: "Earth (C-137)",
        location: "Earth (Replacement Dimension)",
        episodes: [.mock],
        image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
        created: "2017-11-04T18:48:46.250Z"
    )
}
#endif
