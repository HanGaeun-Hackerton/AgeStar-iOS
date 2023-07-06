import SwiftUI
import SemicolonDesign

struct SigninView: View {
    @State var idText = ""
    @State var pwText = ""
    @State var isWrongIDPW = false
    @State var isMovingMainView = false
    var buttonDisable: Bool {
        idText.isEmpty || pwText.isEmpty
    }
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            Text("로그인")
                .sdText(type: .heading1)
            SDTextField(
                title: "아이디",
                placeholder: "아이디를 입력해주세요",
                text: $idText
            )
            .padding(.bottom, 10)
            SDTextField(
                title: "비밀번호",
                placeholder: "비밀번호를 입력해주세요",
                text: $pwText,
                isSecure: true
            )
            Spacer()
            Spacer()
            
            HStack(spacing: 5) {
                NavigationLink(
                    destination: KakaoSigninVIew(isMovingMainView: $isMovingMainView)
                ) {
                    HStack {
                        Spacer()
                        Image("Kakao")
                        Text("Login with Kakao")
                            .sdText(type: .caption2, textColor: .black)
                        Spacer()
                    }
                    .padding(.trailing, 5)
                    .background(Color.Logo.kakao)
                    .cornerRadius(12)
                }
                Button {
                } label: {
                    HStack {
                        Spacer()
                        Image("Pass")
                        Text("Login with Pass")
                            .sdText(type: .caption2, textColor: .white)
                        Spacer()
                    }
                }
                .padding(.trailing, 5)
                .background(Color.Logo.pass)
                .cornerRadius(12)
            }

            Button {
                if idText == "qwer1234" || pwText == "qwer1234" {
                    isMovingMainView.toggle()
                } else {
                    isWrongIDPW.toggle()
                }
            } label: {
                Text("로그인")
                    .sdText(type: .body1, textColor: .white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 15)
                    .background(buttonDisable ? Color.gray : Color.Main.main)
                    .cornerRadius(12)
            }
            .disabled(buttonDisable)
            
            HStack(alignment: .bottom) {
                Spacer()
                Text("아직 회원이 아니신가요?")
                    .sdText(type: .caption1)
                NavigationLink(destination: SignupView(isMovingMainView: $isMovingMainView)) {
                    Text("회원가입")
                        .sdText(type: .body4, textColor: .black)
                }
                Spacer()
            }
        }
        .padding(15)
        .alert("아이디 혹은 비밀번호를 확인해주세요.", isPresented: $isWrongIDPW) {
            Button("확인", role: .cancel) {}
        }
        .fullScreenCover(isPresented: $isMovingMainView) {
            MainView(isAppear: $isMovingMainView)
        }
    }
}

struct SigninView_Previews: PreviewProvider {
    static var previews: some View {
        SigninView()
    }
}
