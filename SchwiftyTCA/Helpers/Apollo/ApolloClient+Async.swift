import Apollo
import ApolloAPI
import Foundation

extension ApolloClient {
    func fetchAsync<Query: GraphQLQuery>(query: Query) async throws -> GraphQLResult<Query.Data> {
        try await withCheckedThrowingContinuation { continuation in
            self.fetch(query: query) { result in
                switch result {
                    case .success(let graphQLResult):
                        continuation.resume(returning: graphQLResult)
                    case .failure(let error):
                        continuation.resume(throwing: error)
                }
            }
        }
    }
}
