import Testing
import ComposableArchitecture
@testable import SchwiftyTCA

struct CharactersReducerTests {
    @Test
    func onAppearTriggersFetchCharacters() async {
        let store = await TestStore(initialState: CharactersReducer.State()) {
            CharactersReducer()
        } withDependencies: {
            $0.graphQLClient = MockGraphQLClient()
        }

        await store.send(.onAppear) {
            $0.hasAppeared = true
            $0.isLoading = true
        }

        await store.receive(
            .charactersResponseSuccess(PaginatedCharacters.mock)
        ) {
            $0.isLoading = false
            $0.characters = PaginatedCharacters.mock.characters
            $0.pageInfo = PaginatedCharacters.mock.pageInfo
        }
    }
}
