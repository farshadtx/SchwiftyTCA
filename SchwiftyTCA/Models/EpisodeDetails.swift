import GraphqlAPI

struct EpisodeDetails: Identifiable, Equatable {
    let id: String
    let name: String
    let airDate: String
    let episode: String
    let characters: [CharacterModel]
    let created: String

    init(
        id: String,
        name: String,
        airDate: String,
        episode: String,
        characters: [CharacterModel],
        created: String
    ) {
        self.id = id
        self.name = name
        self.airDate = airDate
        self.episode = episode
        self.characters = characters
        self.created = created
    }

    init?(from raw: GetEpisodeQuery.Data.Episode?) {
        guard
            let id = raw?.id,
            let name = raw?.name,
            let airDate = raw?.air_date,
            let episode = raw?.episode,
            let characters = raw?.characters,
            let created = raw?.created
        else { return nil }

        self.id = id
        self.name = name
        self.airDate = airDate
        self.episode = episode
        self.characters = characters.compactMap(CharacterModel.init)
        self.created = created
    }
}

#if DEBUG
extension EpisodeDetails {
    static let mock: Self = .init(
        id: "1",
        name: "Pilot",
        airDate: "2014-11-01",
        episode: "S01 E01",
        characters: [.mock],
        created: "2017-12-29T18:51:29.693Z"
    )
}
#endif
