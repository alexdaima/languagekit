// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class LoginMutation: GraphQLMutation {
  public static let operationName: String = "Login"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation Login($username: String!, $password: String!) { login(username: $username, password: $password) { __typename token user { __typename id username } } }"#
    ))

  public var username: String
  public var password: String

  public init(
    username: String,
    password: String
  ) {
    self.username = username
    self.password = password
  }

  public var __variables: Variables? { [
    "username": username,
    "password": password
  ] }

  public struct Data: LanguageKitAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { LanguageKitAPI.Objects.RootMutationType }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("login", Login.self, arguments: [
        "username": .variable("username"),
        "password": .variable("password")
      ]),
    ] }

    /// Login
    public var login: Login { __data["login"] }

    /// Login
    ///
    /// Parent Type: `UserAuth`
    public struct Login: LanguageKitAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { LanguageKitAPI.Objects.UserAuth }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("token", String.self),
        .field("user", User.self),
      ] }

      public var token: String { __data["token"] }
      public var user: User { __data["user"] }

      /// Login.User
      ///
      /// Parent Type: `User`
      public struct User: LanguageKitAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { LanguageKitAPI.Objects.User }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("id", LanguageKitAPI.ID.self),
          .field("username", String.self),
        ] }

        public var id: LanguageKitAPI.ID { __data["id"] }
        public var username: String { __data["username"] }
      }
    }
  }
}
