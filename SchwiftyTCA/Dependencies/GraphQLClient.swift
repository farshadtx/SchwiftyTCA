import Foundation
import Apollo
import GraphqlAPI
import Dependencies

enum GraphQLClientError: Error, Equatable {
    case unknown
    case noData
}

protocol GraphQLClientProtocol {
    func fetchCharacters(page: Int) async throws -> PaginatedCharacters
    func fetchCharacterDetails(id: String) async throws -> CharacterDetails
}

final class GraphQLClient: GraphQLClientProtocol {
    private let apollo: ApolloClient

    init(client: ApolloClient) {
        self.apollo = client
    }

    func fetchCharacters(page: Int) async throws -> PaginatedCharacters {
        let query = GetCharactersQuery(page: .some(page))
        let result = try await apollo.fetchAsync(query: query)
        guard let data = result.data else {
            throw GraphQLClientError.noData
        }
        let pageInfo = PageInfo(info: data.characters?.info)
        let characters = data.characters?.results?.compactMap(CharacterModel.init) ?? []
        return .init(pageInfo: pageInfo, characters: characters)
    }

    func fetchCharacterDetails(id: String) async throws -> CharacterDetails {
        let query = GetCharacterQuery(id: id)
        let result = try await apollo.fetchAsync(query: query)
        guard
            let data = result.data,
            let characterData = data.character,
            let characterDetails = CharacterDetails(from: characterData)
        else {
            throw GraphQLClientError.noData
        }
        return characterDetails
    }
}

final class PreviewGraphQLClient: GraphQLClientProtocol {
    func fetchCharacters(page: Int) async throws -> PaginatedCharacters {
        .mock
    }

    func fetchCharacterDetails(id: String) async throws -> CharacterDetails {
        .mock
    }
}

enum GraphQLClientKey: DependencyKey {
    static let liveValue: GraphQLClientProtocol = GraphQLClient(
        client: ApolloClient(url: URL(string: "https://rickandmortyapi.com/graphql")!)
    )

    static let previewValue: GraphQLClientProtocol = PreviewGraphQLClient()
}

extension DependencyValues {
    var graphQLClient: GraphQLClientProtocol {
        get { self[GraphQLClientKey.self] }
        set { self[GraphQLClientKey.self] = newValue }
    }
}
