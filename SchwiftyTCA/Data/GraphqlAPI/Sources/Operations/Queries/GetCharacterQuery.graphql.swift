// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GetCharacterQuery: GraphQLQuery {
  public static let operationName: String = "GetCharacterQuery"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query GetCharacterQuery($id: ID!) { character(id: $id) { __typename id name status species gender origin { __typename name } location { __typename name } episode { __typename id name episode } image created } }"#
    ))

  public var id: ID

  public init(id: ID) {
    self.id = id
  }

  public var __variables: Variables? { ["id": id] }

  public struct Data: GraphqlAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { GraphqlAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("character", Character?.self, arguments: ["id": .variable("id")]),
    ] }

    /// Get a specific character by ID
    public var character: Character? { __data["character"] }

    /// Character
    ///
    /// Parent Type: `Character`
    public struct Character: GraphqlAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { GraphqlAPI.Objects.Character }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("id", GraphqlAPI.ID?.self),
        .field("name", String?.self),
        .field("status", String?.self),
        .field("species", String?.self),
        .field("gender", String?.self),
        .field("origin", Origin?.self),
        .field("location", Location?.self),
        .field("episode", [Episode?].self),
        .field("image", String?.self),
        .field("created", String?.self),
      ] }

      /// The id of the character.
      public var id: GraphqlAPI.ID? { __data["id"] }
      /// The name of the character.
      public var name: String? { __data["name"] }
      /// The status of the character ('Alive', 'Dead' or 'unknown').
      public var status: String? { __data["status"] }
      /// The species of the character.
      public var species: String? { __data["species"] }
      /// The gender of the character ('Female', 'Male', 'Genderless' or 'unknown').
      public var gender: String? { __data["gender"] }
      /// The character's origin location
      public var origin: Origin? { __data["origin"] }
      /// The character's last known location
      public var location: Location? { __data["location"] }
      /// Episodes in which this character appeared.
      public var episode: [Episode?] { __data["episode"] }
      /// Link to the character's image.
      /// All images are 300x300px and most are medium shots or portraits since they are intended to be used as avatars.
      public var image: String? { __data["image"] }
      /// Time at which the character was created in the database.
      public var created: String? { __data["created"] }

      /// Character.Origin
      ///
      /// Parent Type: `Location`
      public struct Origin: GraphqlAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { GraphqlAPI.Objects.Location }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("name", String?.self),
        ] }

        /// The name of the location.
        public var name: String? { __data["name"] }
      }

      /// Character.Location
      ///
      /// Parent Type: `Location`
      public struct Location: GraphqlAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { GraphqlAPI.Objects.Location }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("name", String?.self),
        ] }

        /// The name of the location.
        public var name: String? { __data["name"] }
      }

      /// Character.Episode
      ///
      /// Parent Type: `Episode`
      public struct Episode: GraphqlAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { GraphqlAPI.Objects.Episode }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("id", GraphqlAPI.ID?.self),
          .field("name", String?.self),
          .field("episode", String?.self),
        ] }

        /// The id of the episode.
        public var id: GraphqlAPI.ID? { __data["id"] }
        /// The name of the episode.
        public var name: String? { __data["name"] }
        /// The code of the episode.
        public var episode: String? { __data["episode"] }
      }
    }
  }
}
