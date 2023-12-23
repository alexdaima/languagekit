import SwiftUI
import LanguageKitAPI

class LandingPageViewModel: ObservableObject {
    @Published var page: Page = .login
    
    enum Page {
        case login, signup
    }
}

class LoginViewModel: ObservableObject {
    
    @Published var username: String = ""
    @Published var loginValue: String = ""
    @Published var password: String = ""
    
    func isFormOk() -> Bool {
        guard self.usernameErrorHandler().0 == false else { return false }
        guard self.passwordErrorHandler().0 == false else { return false }
        return true
    }
    
    func usernameErrorHandler() -> (Bool, String) {
        guard self.username.count > 0 else { return (true, "This can't be blank.") }
        return (false, "")
    }
    
    func passwordErrorHandler() -> (Bool, String) {
        guard self.password.count > 0 else { return (true, "This can't be blank.") }
        return (false, "")
    }
}

struct LoginView: View {
    @EnvironmentObject var globalState: GlobalState
    @ObservedObject var viewModel: LoginViewModel = LoginViewModel()
    
    @State var showingAlert: Bool = false
    @State var alertTitle: String = ""
    @State var alertMessage: String = ""

    func login() {
        Client.client.apollo.perform(
            mutation: LoginMutation(
                username: self.viewModel.username,
                password: self.viewModel.password
            )
        ) { result in
            switch result {
                case .success(let graphQLResult):
                    if let errors = graphQLResult.errors {
                        self.alertTitle = "Login Failed"
                        self.alertMessage = "\((errors.map { error in error.message ?? "" }).joined(separator: "\n"))"
                        self.showingAlert = true
                    }
                    if let data = graphQLResult.data {
                        globalState.username = data.login.user.username
                        globalState.userToken = data.login.token
                    }
                case .failure(_):
                    self.alertTitle = "Login Failed"
                    self.alertMessage = "Network Error"
                    self.showingAlert = true
            }
        }
    }
    
    var body: some View {
        VStack {
            VStack(spacing: 15) {
                TextField("Username", text: self.$viewModel.username)
                    .font(.system(size: 13))
                    .foregroundColor(Color.black)
                    .autocapitalization(.none)
                SecureField("Password", text: self.$viewModel.password)
                    .font(.system(size: 13))
                    .foregroundColor(Color.black)
                    .autocapitalization(.none)
            }
            HStack {
                Spacer()
                VStack {
                    Text("Login")
                        .font(.system(size: 13, weight: .bold))
                        .foregroundColor(Color.white)
                }
                .padding(5)
                .background(
                    Rectangle()
                        .fill(
                            self.viewModel.isFormOk() == true ? Color.green.opacity(0.7) : Color.gray.opacity(0.3)
                        )
                        .cornerRadius(10))
                .onTapGesture {
                    self.login()
                }
            }
        }
        .alert(isPresented: self.$showingAlert) {
            Alert(
                title: Text(self.alertTitle),
                message: Text(self.alertMessage),
                dismissButton: .default(Text("Got it!"))
            )
        }
    }
}

class SignupViewModel: ObservableObject {
    
    @Published var username: String = ""
    @Published var loginValue: String = ""
    @Published var password: String = ""
    @Published var password2: String = ""
    
    func isFormOk() -> Bool {
        guard self.usernameErrorHandler().0 == false else { return false }
        guard self.passwordErrorHandler().0 == false else { return false }
        guard self.password2ErrorHandler().0 == false else { return false }
        return true
    }
    
    func usernameErrorHandler() -> (Bool, String) {
        guard self.username.count > 0 else { return (true, "This can't be blank.") }
        return (false, "")
    }
    
    func passwordErrorHandler() -> (Bool, String) {
        guard self.password.count > 0 else { return (true, "This can't be blank.") }
        return (false, "")
    }
    
    func password2ErrorHandler() -> (Bool, String) {
        guard self.password2.count > 0 else { return (true, "This can't be blank.") }
        guard self.password2 == self.password else { return (true, "Password's must match.") }
        return (false, "")
    }
}


struct SignupView: View {
    @EnvironmentObject var globalState: GlobalState
    @ObservedObject var viewModel: SignupViewModel = SignupViewModel()
    
    @State var showingAlert: Bool = false
    @State var alertTitle: String = ""
    @State var alertMessage: String = ""

    func signup() {
        Client.client.apollo.perform(
            mutation: SignupMutation(
                username: self.viewModel.username,
                password: self.viewModel.password
            )
        ) { result in
            switch result {
                case .success(let graphQLResult):
                    if let errors = graphQLResult.errors {
                        self.alertTitle = "Signup Failed"
                        self.alertMessage = "\((errors.map { error in error.message ?? "" }).joined(separator: "\n"))"
                        self.showingAlert = true
                    }
                    if let data = graphQLResult.data {
                        globalState.username = data.signup.user.username
                        globalState.userToken = data.signup.token
                    }
            case .failure(_):
                    self.alertTitle = "Signup Failed"
                    self.alertMessage = "Network Error"
                    self.showingAlert = true
            }
        }
    }
    
    var body: some View {
        VStack {
            VStack(spacing: 15) {
                TextField("Username", text: self.$viewModel.username)
                    .font(.system(size: 13))
                    .foregroundColor(Color.black)
                    .autocapitalization(.none)
                SecureField("Password", text: self.$viewModel.password)
                    .font(.system(size: 13))
                    .foregroundColor(Color.black)
                    .autocapitalization(.none)
                SecureField("Verify Password", text: self.$viewModel.password2)
                    .font(.system(size: 13))
                    .foregroundColor(Color.black)
                    .autocapitalization(.none)
            }
            HStack {
                Spacer()
                VStack {
                    Text("Signup")
                        .font(.system(size: 13, weight: .bold))
                        .foregroundColor(Color.white)
                }
                .padding(5)
                .background(
                    Rectangle()
                        .fill(
                            self.viewModel.isFormOk() == true ? Color.green.opacity(0.7) : Color.gray.opacity(0.3)
                        )
                        .cornerRadius(10))
                .onTapGesture {
                    self.signup()
                }
            }
        }
        .alert(isPresented: self.$showingAlert) {
            Alert(
                title: Text(self.alertTitle),
                message: Text(self.alertMessage),
                dismissButton: .default(Text("Got it!"))
            )
        }
    }
}


struct LandingPageView: View {
    @EnvironmentObject var globalState: GlobalState
    @StateObject var viewModel: LandingPageViewModel = LandingPageViewModel()
    
    var body: some View {
        VStack(spacing: 15) {
            
            Spacer().frame(height: 30)
            
            VStack {
                HStack {
                    Spacer()
                    Image("Logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150)
                    Spacer()
                }
                Text("LanguageKit")
                    .font(.system(size: 30, weight: .black))
                    .foregroundColor(.white)
            }
            Spacer()
            VStack(spacing: 10) {
                HStack(spacing: 3) {
                    Text(self.viewModel.page == .login ? "Login" : "Signup")
                        .font(.system(size: 12, weight: .bold))
                        .foregroundColor(Color.black)
                    Spacer()
                }
                switch self.viewModel.page {
                    case .login: LoginView()
                    case .signup: SignupView()
                }
                switch self.viewModel.page {
                    case .login:
                        Text("Signup")
                        .font(.system(size: 12, weight: .heavy))
                        .foregroundColor(.red.opacity(0.7))
                        .onTapGesture {
                            withAnimation {
                                self.viewModel.page = .signup
                            }
                        }
                    case .signup:
                    Text("Login")
                    .font(.system(size: 12, weight: .heavy))
                    .foregroundColor(.red.opacity(0.7))
                        .onTapGesture {
                            withAnimation {
                                self.viewModel.page = .login
                            }
                        }
                }
            }
            .padding(15)
            .background(Rectangle().fill(Color.white).cornerRadius(15).shadow(color: Color.black.opacity(0.1), radius: 10))
            .padding(.horizontal, 15)
            
            Spacer().frame(height: 20)
        }
        .background(Color("Backdrop"))
    }
}
