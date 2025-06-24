import GraphqlAPI

struct PaginatedCharacters: Equatable {
    let pageInfo: PageInfo?
    let characters: [CharacterModel]

    init(pageInfo: PageInfo?, characters: [CharacterModel]) {
        self.pageInfo = pageInfo
        self.characters = characters
    }
}

#if DEBUG
extension PaginatedCharacters {
    static let mock: Self = .init(
        pageInfo: PageInfo(next: 2),
        characters: [.mock]
    )
}
#endif
