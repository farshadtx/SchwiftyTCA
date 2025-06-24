import Testing
import ComposableArchitecture
@testable import SchwiftyTCA

struct CharacterDetailsReducerTests {
    @Test
    func onAppearTriggersFetchCharacterDetails() async {
        let store = await TestStore(
            initialState: CharacterDetailsReducer.State(character: .mock)
        ) {
            CharacterDetailsReducer()
        } withDependencies: {
            $0.graphQLClient = MockGraphQLClient()
        }

        await store.send(.onAppear) {
            $0.isLoading = true
        }

        await store.receive(
            .characterDetailsResponseSuccess(.mock)
        ) {
            $0.isLoading = false
            $0.characterDetails = .mock
        }
    }
}
