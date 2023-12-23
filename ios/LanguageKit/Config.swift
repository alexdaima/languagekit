import Foundation


struct Config {
    enum RequestType {
        case http, ws
    }

    struct UrlConfig {
        let url: String
        let ssl: Bool
        let port: String
    }
    
    static let devConfig: UrlConfig = UrlConfig(url: "127.0.0.1", ssl: false, port: "4000")
    static let config = devConfig

    static func getBackendUrl(_ requestType: RequestType) -> String {
        switch requestType {
            case .http: return "http\(self.config.ssl == true ? "s" : "")://\(self.config.url):\(self.config.port)"
            case .ws: return "ws\(self.config.ssl == true ? "s" : "")://\(self.config.url):\(self.config.port)"
        }
    }
}
