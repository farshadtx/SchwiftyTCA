import ComposableArchitecture

@Reducer
struct MainReducer {
    @Dependency(\.cacheService) var cacheService

    @Reducer
    enum Path {
        case characterDetails(CharacterDetailsReducer)
        case episodeDetails(EpisodeDetailsReducer)
    }
    
    @ObservableState
    struct State {
        var path = StackState<Path.State>()
        var characters = CharactersReducer.State()
    }
    
    enum Action {
        case path(StackActionOf<Path>)
        case characters(CharactersReducer.Action)
        case clearCache
    }
    
    var body: some ReducerOf<Self> {
        Scope(state: \.characters, action: \.characters) {
            CharactersReducer()
        }

        Reduce { state, action in
            switch action {
                case let .characters(.characterCardTapped(character)):
                    state.path.append(
                        .characterDetails(.init(character: character)))
                    return .none
//                case let .characters(.episodeTapped(episode)):
//                    state.path.append(
//                        .characterDetails(.init(character: character)))
//                    return .none
                case .path:
                    return .none
                case .characters:
                    return .none
                case .clearCache:
                    cacheService.clear()
                    return .none
            }
        }
        .forEach(\.path, action: \.path)
    }
}
