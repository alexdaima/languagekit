import SwiftUI
import LanguageKitAPI

struct HomeView: View {
    
    @EnvironmentObject var globalState: GlobalState
    
    func performAuthenticatedRequest() {
        Client.client.apollo.fetch(
            query: HelloWorldQuery()
        ) { result in
            switch result {
                case .success(let graphQLResult):
                    if let errors = graphQLResult.errors {
                        print("errors: \(errors)")
                    }
                    if let data = graphQLResult.data {
                        print("helloWorld: \(data.helloWorld)")
                    }
                case .failure(let error):
                    print("error: \(error)")
            }
        }
    }

    var body: some View {
        VStack(spacing: 20) {
            HeaderView(header: "Home")
            Text("Hello World").onTapGesture {
                performAuthenticatedRequest()
            }
            Spacer()
        }
        .background(Color.white)
    }
}

struct StudyView: View {
    
    @EnvironmentObject var globalState: GlobalState

    var body: some View {
        VStack(spacing: 20) {
            HeaderView(header: "Study")
            Text("Study Page")
            Spacer()
        }
        .background(Color.white)
    }
}

struct DictionaryView: View {
    
    @EnvironmentObject var globalState: GlobalState

    var body: some View {
        VStack(spacing: 20) {
            HeaderView(header: "Dictionary")
            Text("Dictionary Page")
            Spacer()
        }
        .background(Color.white)
    }
}

struct GrammarsView: View {
    
    @EnvironmentObject var globalState: GlobalState

    var body: some View {
        VStack(spacing: 20) {
            HeaderView(header: "Grammars")
            Text("Grammars Page")
            Spacer()
        }
        .background(Color.white)
    }
}

struct HelpView: View {
    
    @EnvironmentObject var globalState: GlobalState

    var body: some View {
        VStack(spacing: 20) {
            HeaderView(header: "Help")
            Text("Help Page")
            Spacer()
        }
        .background(Color.white)
    }
}

struct SettingsView: View {
    
    @EnvironmentObject var globalState: GlobalState

    var body: some View {
        VStack(spacing: 20) {
            HeaderView(header: "Settings")
            Text("Settings Page")
            Spacer()
        }
        .background(Color.white)
    }
}
