import SwiftUI
import SemicolonDesign

struct SigninView: View {
    @State var idText = ""
    @State var pwText = ""
    @State var isMovingMainView = false
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

            Button {
                isMovingMainView.toggle()
            } label: {
                Text("로그인")
                    .sdText(type: .body1, textColor: .white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 15)
                    .background(Color.Main.main)
                    .cornerRadius(12)
            }
        }
        .padding(15)
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
