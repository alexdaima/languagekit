import Foundation
import Apollo
import ApolloAPI
import ApolloWebSocket
import AbsintheSocketTransport

class Interceptor: ApolloInterceptor {
    var id: String = "interceptor-1"

    func interceptAsync<Operation: GraphQLOperation>(
        chain: RequestChain,
        request: HTTPRequest<Operation>,
        response: HTTPResponse<Operation>?,
        completion: @escaping (Result<GraphQLResult<Operation.Data>, Error>) -> Void
    ) {
        let token = GlobalState.getUserToken()
        request.addHeader(name: "authorization", value: token)
        chain.proceedAsync(request: request, response: response, interceptor: self, completion: completion)
    }
}

class InterceptorProvider: DefaultInterceptorProvider {
    override func interceptors<Operation>(for operation: Operation) -> [ApolloInterceptor] where Operation : GraphQLOperation {
        var interceptors = super.interceptors(for: operation)
        interceptors.insert(Interceptor(), at: 0)
        return interceptors
    }
}

class Client {
    static let client = Client()
    
    let networkUrl: String = "\(Config.getBackendUrl(.http))/graphql"
    
    private(set) lazy var apollo: ApolloClient = {
        let cache = InMemoryNormalizedCache()
        let store = ApolloStore(cache: cache)
        return ApolloClient(networkTransport: normalTransport, store: store)
    }()
    
    private(set) lazy var apolloSplitTransport: ApolloClient = {
        let cache = InMemoryNormalizedCache()
        let store = ApolloStore(cache: cache)
        let normalTransport: RequestChainNetworkTransport = normalTransport
        let token: String = "a newly formed token!"
        let absintheSocketTransport = AbsintheSocketTransport(
            "\(Config.getBackendUrl(.ws))/subscriptions/websocket",
            params: ["token": token]
        )
        let splitTransport: SplitNetworkTransport = SplitNetworkTransport(
          uploadingNetworkTransport: normalTransport,
          webSocketNetworkTransport: absintheSocketTransport
        )
        return ApolloClient(networkTransport: splitTransport, store: store)
    }()
    
    private lazy var webSocketTransport: WebSocketTransport = {
        let url = URL(string: "\(Config.getBackendUrl(.ws))/socket/websocket")!
        let request = URLRequest(url: url)
        let websocketClient = WebSocket(request: request, protocol: .graphql_ws)
        return WebSocketTransport(websocket: websocketClient)
    }()

    func perRequestHeaders() -> [String: String] {
        print()
        return ["Authorization": "its meeeee"]
    }

    private lazy var normalTransport: RequestChainNetworkTransport = {
        let url = URL(string: "\(Config.getBackendUrl(.http))/graphql")!
        let store = ApolloStore()
        var additionalHeaders = [String: String]()
        let client = URLSessionClient()
        let interceptorProvider = InterceptorProvider(client: client, store: store)
        return RequestChainNetworkTransport(
            interceptorProvider: interceptorProvider,
            endpointURL: url,
            additionalHeaders: additionalHeaders
        )
    }()
    private lazy var splitNetworkTransport = SplitNetworkTransport(
        uploadingNetworkTransport: self.normalTransport,
        webSocketNetworkTransport: self.webSocketTransport
    )
    let store = ApolloStore()
    private(set) lazy var client = ApolloClient(
        networkTransport: self.splitNetworkTransport,
        store: store
    )
}
