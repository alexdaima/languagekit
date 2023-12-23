import SwiftUI
import SwiftData

struct MenuItem: Hashable {
    var title: String
    var module: Module
}

struct MainMenuItemView: View {
    @EnvironmentObject var globalState: GlobalState
    var menuItem: MenuItem
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 4) {
                Image(systemName: "chevron.forward")
                    .foregroundColor(Color.white.opacity(0.75))
                    .frame(width: 14, height: 14)
                Text(self.menuItem.title)
                    .foregroundColor(Color.white)
            }
        }
        .offset(x: -2)
        .onTapGesture {
            withAnimation {
                globalState.activeModule = menuItem.module
                globalState.toggleMainMenu()
            }
        }
    }
}

struct ContentView: View {
    @State var liveConnectStatus: Bool = true
    @State var showLanguageSelection: Bool = true
    @EnvironmentObject var globalState: GlobalState
    var menuItems: [MenuItem] = [
        MenuItem(title: "Home", module: .home),
        MenuItem(title: "Study", module: .study),
        MenuItem(title: "Dictionary", module: .dictionary),
        MenuItem(title: "Grammars", module: .grammars),
        MenuItem(title: "Help", module: .help),
        MenuItem(title: "Settings", module: .settings)
    ]
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                if globalState.userToken == nil {
                    LandingPageView()
                } else {
                    ZStack {
                        HStack(alignment: .top) {
                            VStack(alignment: .leading, spacing: 5) {
                                Text("Hey,")
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 28))
                                Text(globalState.username ?? "User")
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 36, weight: .black))
                                    .offset(y: -5)
                                
                                Spacer().frame(height: 15)
                                HStack(alignment: .top) {
                                    ScrollView(.vertical, showsIndicators: false) {
                                        VStack(alignment: .leading, spacing: 10) {
                                            ForEach(menuItems, id:\.self) { menuItem in
                                                MainMenuItemView(menuItem: menuItem)
                                            }
                                        }
                                    }
                                }
                                Text("Logout")
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 14, weight: .semibold))
                                    .onTapGesture {
                                        globalState.userToken = nil
                                    }
                                HStack {
                                    Text("v0.1.0")
                                        .foregroundColor(Color.white)
                                        .font(.system(size: 12))
                                }
                            }
                            .padding(.top, 25)
                            .padding(.horizontal, 15)
                            Spacer(minLength: 0)
                        }
                        .padding(.top, globalState.safeAreaInsets.top)
                        .padding(.bottom, globalState.safeAreaInsets.bottom)
                        VStack(spacing: 0) {
                            GeometryReader { _ in
                                VStack {
                                    switch globalState.activeModule {
                                    case .home:
                                        HomeView()
                                    case .study:
                                        StudyView()
                                    case .dictionary:
                                        DictionaryView()
                                    case .grammars:
                                        GrammarsView()
                                    case .help:
                                        HelpView()
                                    case .settings:
                                        SettingsView()
                                    }
                                }
                            }
                        }
                        .background(Color.white)
                        .overlay(
                            globalState.mainMenuActive ?
                            Color.black.opacity(0.25)
                            :
                                Color.clear
                        )
                        .onTapGesture(){
                            if globalState.mainMenuActive == true {
                                withAnimation() {
                                    globalState.toggleMainMenu()
                                }
                            }
                        }
                        .cornerRadius(globalState.mainMenuActive ? 30 : 0)
                        .scaleEffect(globalState.mainMenuActive ? 0.9 : 1)
                        .offset(
                            x: globalState.mainMenuActive ? UIScreen.main.bounds.width / 2 : 0,
                            y: globalState.mainMenuActive ? 15: 0
                        )
                        .rotationEffect(.init(degrees: globalState.mainMenuActive ? -5 : 0))
                        
                    }
                    .background(Color("Backdrop").edgesIgnoringSafeArea(.all))
                    .edgesIgnoringSafeArea(.all)
                }
            }
            .onAppear {
                globalState.safeAreaInsets = geometry.safeAreaInsets
            }
        }
    }
}
