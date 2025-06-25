import ComposableArchitecture

@Reducer
struct EpisodeDetailsReducer {
    @Dependency(\.graphQLClient) var graphQLClient

    @ObservableState
    struct State: Equatable {
        let episode: Episode

        var isLoading: Bool = false
        var episodeDetails: EpisodeDetails?
    }

    enum Action: Equatable {
        case onAppear
        case episodeDetailsResponseSuccess(EpisodeDetails)
        case episodeDetailsResponseFailure(GraphQLClientError)
    }

    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
                case .onAppear:
                    guard !state.isLoading else { return .none }
                    state.isLoading = true

                    return .run { [state] send in
                        do {
                            let episodeDetails = try await graphQLClient.fetchEpisodeDetails(id: state.episode.id)
                            await send(.episodeDetailsResponseSuccess(episodeDetails))
                        } catch {
                            await send(.episodeDetailsResponseFailure(error as? GraphQLClientError ?? .unknown))
                        }
                    }

                case let .episodeDetailsResponseSuccess(episodeDetails):
                    state.isLoading = false
                    state.episodeDetails = episodeDetails
                    return .none

                case let .episodeDetailsResponseFailure(error):
                    state.isLoading = false
                    print("❌ Failed to fetch characters:", error.localizedDescription)
                    return .none
            }
        }
    }
}
