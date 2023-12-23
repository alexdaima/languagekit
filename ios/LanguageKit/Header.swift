import SwiftUI

struct HeaderView: View {
    
    @EnvironmentObject var globalState: GlobalState
    let header: String

    var body: some View {
        HStack(spacing: 5) {
            Button(action : {
                withAnimation {
                    globalState.toggleMainMenu()
                }
            }) {
                Text("Menu")
            }
            
            Text(self.header)
                .foregroundColor(Color.black)
            Spacer(minLength: 0)
        }
        .padding(.top, globalState.safeAreaInsets.top)
        .padding(.leading, 10)
        .padding(.trailing, 10)
        .padding(.bottom, 5)
    }
}
