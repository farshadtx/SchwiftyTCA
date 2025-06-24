@testable import SchwiftyTCA

class MockGraphQLClient: GraphQLClientProtocol {
    typealias FetchCharactersHandler = (Int) async throws -> PaginatedCharacters
    typealias FetchCharacterDetailsHandler = (String) async throws -> CharacterDetails

    let fetchCharactersHandler: FetchCharactersHandler
    let fetchCharacterDetailsHandler: FetchCharacterDetailsHandler

    init(
        fetchCharactersHandler: @escaping FetchCharactersHandler = { _ in .mock },
        fetchCharacterDetailsHandler: @escaping FetchCharacterDetailsHandler = { _ in .mock }
    ) {
        self.fetchCharactersHandler = fetchCharactersHandler
        self.fetchCharacterDetailsHandler = fetchCharacterDetailsHandler
    }

    func fetchCharacters(page: Int) async throws -> PaginatedCharacters {
        try await fetchCharactersHandler(page)
    }

    func fetchCharacterDetails(id: String) async throws -> CharacterDetails {
        try await fetchCharacterDetailsHandler(id)
    }
}
