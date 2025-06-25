import ComposableArchitecture
import GraphqlAPI

@Reducer
struct CharactersReducer {
    @Dependency(\.graphQLClient) var graphQLClient

    @ObservableState
    struct State: Equatable {
        var hasAppeared = false
        var isLoading = false
        var pageInfo: PageInfo?
        var characters: [CharacterModel] = []
    }

    enum Action: Equatable {
        case onAppear
        case loadNextPage
        case charactersResponseSuccess(PaginatedCharacters)
        case charactersResponseFailure(GraphQLClientError)
        case characterCardTapped(CharacterModel)
        case episodeCardTapped(Episode)
    }

    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
                case .onAppear:
                    guard !state.hasAppeared else { return .none }
                    state.hasAppeared = true
                    fallthrough

                case .loadNextPage:
                    guard !state.isLoading else { return .none }
                    state.isLoading = true
                    let page = state.pageInfo?.next ?? 1
                    return .run { send in
                        do {
                            let paginatedCharacters = try await graphQLClient.fetchCharacters(page: page)
                            await send(.charactersResponseSuccess(paginatedCharacters))
                        } catch {
                            await send(.charactersResponseFailure(error as? GraphQLClientError ?? .unknown))
                        }
                    }

                case let .charactersResponseSuccess(paginatedCharacters):
                    state.isLoading = false
                    state.characters += paginatedCharacters.characters
                    state.pageInfo = paginatedCharacters.pageInfo
                    return .none

                case let .charactersResponseFailure(error):
                    state.isLoading = false
                    print("❌ Failed to fetch characters:", error.localizedDescription)
                    return .none

                case .characterCardTapped:
                    return .none

                case .episodeCardTapped:
                    return .none
            }
        }
    }
}
