import SwiftUI
import SemicolonDesign

struct SignupView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var idText = ""
    @State var pwText = ""
    @State var birthDay = ""
    @State var name = ""
    @State var personalNumber1 = ""
    @State var personalNumber2 = ""
    @State var phoneNumber = ""
    @Binding var isMovingMainView: Bool
    func dateString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"

        let date = Date() // 현재 날짜와 시간
        return dateFormatter.string(from: date)
    }
    func bornString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyMMdd"

        let date = Date() // 현재 날짜와 시간
        return dateFormatter.string(from: date)
    }
    var body: some View {
        VStack(alignment: .leading) {
            Text("회원가입")
                .sdText(type: .heading1)
                .padding(.bottom, 50)
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
            .padding(.bottom, 10)
            HStack {
                SDTextField(
                    title: "출생연도",
                    placeholder: dateString(),
                    text: $birthDay
                )
                .padding(.bottom, 10)
                SDTextField(
                    title: "이름",
                    placeholder: "홍길동",
                    text: $name
                )
                .padding(.bottom, 10)
            }
            HStack {
                SDTextField(
                    title: "주민등록번호",
                    placeholder: bornString(),
                    text: $personalNumber1
                )
                .padding(.bottom, 10)
                Text("-")
                    .offset(y: 10)
                SDTextField(
                    title: "`",
                    placeholder: "XXXXXXX",
                    text: $personalNumber2
                )
                .padding(.bottom, 10)
            }
            SDTextField(
                title: "전화번호",
                placeholder: "01012345678",
                text: $phoneNumber
            )
            .padding(.bottom, 10)
            Spacer()

            Button {
                isMovingMainView.toggle()
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    self.presentationMode.wrappedValue.dismiss()
                }
            } label: {
                Text("회원가입")
                    .sdText(type: .body1, textColor: .white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 15)
                    .background(Color.Main.main)
                    .cornerRadius(12)
            }
        }
        .padding(15)
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView(isMovingMainView: .constant(false))
    }
}
