import GraphqlAPI

struct Episode: Identifiable, Equatable {
    let id: String
    let name: String
    let episode: String

    init(id: String, name: String, episode: String) {
        self.id = id
        self.name = name
        self.episode = episode
    }

    init?(from raw: GetCharacterQuery.Data.Character.Episode?) {
        guard
            let id = raw?.id,
            let name = raw?.name,
            let episode = raw?.episode
        else { return nil }

        self.id = id
        self.name = name
        self.episode = episode
    }
}

#if DEBUG
extension Episode {
    static let mock: Self = .init(
        id: "1",
        name: "Pilot",
        episode: "S01 E01"
    )
}
#endif
