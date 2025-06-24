import ComposableArchitecture

@Reducer
struct CharacterDetailsReducer {
    @Dependency(\.graphQLClient) var graphQLClient

    @ObservableState
    struct State: Equatable {
        let character: CharacterModel

        var isLoading: Bool = false
        var characterDetails: CharacterDetails?
    }

    enum Action: Equatable {
        case onAppear
        case characterDetailsResponseSuccess(CharacterDetails)
        case characterDetailsResponseFailure(GraphQLClientError)
    }

    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
                case .onAppear:
                    guard !state.isLoading else { return .none }
                    state.isLoading = true

                    return .run { [state] send in
                        do {
                            let characterDetails = try await graphQLClient.fetchCharacterDetails(id: state.character.id)
                            await send(.characterDetailsResponseSuccess(characterDetails))
                        } catch {
                            await send(.characterDetailsResponseFailure(error as? GraphQLClientError ?? .unknown))
                        }
                    }

                case let .characterDetailsResponseSuccess(characterDetails):
                    state.isLoading = false
                    state.characterDetails = characterDetails
                    return .none

                case let .characterDetailsResponseFailure(error):
                    state.isLoading = false
                    print("❌ Failed to fetch characters:", error.localizedDescription)
                    return .none
            }
        }
    }
}
