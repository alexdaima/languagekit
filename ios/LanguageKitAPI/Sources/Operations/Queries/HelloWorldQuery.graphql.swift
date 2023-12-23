// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class HelloWorldQuery: GraphQLQuery {
  public static let operationName: String = "HelloWorld"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query HelloWorld { helloWorld }"#
    ))

  public init() {}

  public struct Data: LanguageKitAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { LanguageKitAPI.Objects.RootQueryType }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("helloWorld", String.self),
    ] }

    /// Hello World
    public var helloWorld: String { __data["helloWorld"] }
  }
}
