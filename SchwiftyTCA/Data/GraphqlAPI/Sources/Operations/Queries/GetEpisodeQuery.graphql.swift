// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GetEpisodeQuery: GraphQLQuery {
  public static let operationName: String = "GetEpisodeQuery"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query GetEpisodeQuery($id: ID!) { episode(id: $id) { __typename id name air_date episode characters { __typename id name status image } created } }"#
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
      .field("episode", Episode?.self, arguments: ["id": .variable("id")]),
    ] }

    /// Get a specific episode by ID
    public var episode: Episode? { __data["episode"] }

    /// Episode
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
        .field("air_date", String?.self),
        .field("episode", String?.self),
        .field("characters", [Character?].self),
        .field("created", String?.self),
      ] }

      /// The id of the episode.
      public var id: GraphqlAPI.ID? { __data["id"] }
      /// The name of the episode.
      public var name: String? { __data["name"] }
      /// The air date of the episode.
      public var air_date: String? { __data["air_date"] }
      /// The code of the episode.
      public var episode: String? { __data["episode"] }
      /// List of characters who have been seen in the episode.
      public var characters: [Character?] { __data["characters"] }
      /// Time at which the episode was created in the database.
      public var created: String? { __data["created"] }

      /// Episode.Character
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
          .field("image", String?.self),
        ] }

        /// The id of the character.
        public var id: GraphqlAPI.ID? { __data["id"] }
        /// The name of the character.
        public var name: String? { __data["name"] }
        /// The status of the character ('Alive', 'Dead' or 'unknown').
        public var status: String? { __data["status"] }
        /// Link to the character's image.
        /// All images are 300x300px and most are medium shots or portraits since they are intended to be used as avatars.
        public var image: String? { __data["image"] }
      }
    }
  }
}
