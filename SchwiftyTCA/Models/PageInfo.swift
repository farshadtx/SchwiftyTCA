import GraphqlAPI

struct PageInfo: Equatable {
    let next: Int?

    init (next: Int?) {
        self.next = next
    }

    init(info: GetCharactersQuery.Data.Characters.Info?) {
        self.next = info?.next
    }
}
