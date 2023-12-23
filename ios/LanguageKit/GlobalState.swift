import SwiftUI

enum ActiveLanguage: String, Codable, CaseIterable {
    case english, mandarin
    
    func getLanguageString() -> String {
        switch self {
            case .english: return "English"
            case .mandarin: return "Mandarin"
        }
    }
}

enum Module {
    case home
    case study
    case dictionary
    case grammars
    case help
    case settings
}

class GlobalState: ObservableObject {
    @Published var mainMenuActive: Bool = true
    @Published var statusBarStyle = UIStatusBarStyle.darkContent
    @Published var safeAreaInsets: EdgeInsets = .init()
    @Published var activeModule: Module = .home
    
    @AppStorage("user::token") var userToken: String?
    @AppStorage("user::username") var username: String?
    @AppStorage("app::activeLanguage") var activeLanguage: ActiveLanguage = .english
    
    func toggleMainMenu() {
        mainMenuActive.toggle()
        if mainMenuActive == true {
            self.statusBarStyle = UIStatusBarStyle.lightContent
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute: {
                self.statusBarStyle = UIStatusBarStyle.darkContent
            })
        }
    }
    
    static func getUserToken() -> String {
        let token = UserDefaults.standard.string(forKey: "user::token")
        switch token {
            case nil: return ""
            default: return token!
        }
    }
}
