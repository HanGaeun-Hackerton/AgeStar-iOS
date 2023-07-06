import SwiftUI
import SemicolonDesign

struct KakaoSigninVIew: View {
    @Environment(\.presentationMode) var presentationMode
    @State var name = ""
    @State var birthDay = ""
    @State var phoneNumber = ""
    @Binding var isMovingMainView: Bool
    func bornString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyMMdd"

        let date = Date() // 현재 날짜와 시간
        return dateFormatter.string(from: date)
    }
    var body: some View {
        VStack(alignment: .leading) {
            Text("간편 인증")
                .sdText(type: .heading1)
                .padding(.bottom, 50)
            SDTextField(
                title: "이름",
                placeholder: "홍길동",
                text: $name
            )
            .padding(.bottom, 10)
            SDTextField(
                title: "생년월일",
                placeholder: bornString(),
                text: $birthDay
            )
            .padding(.bottom, 10)
            VStack(alignment: .leading) {
                Text("휴대전화 번호")
                    .sdText(type: .body4)
                HStack {
                    SDTextField(
                        placeholder: "010",
                        text: .constant(""),
                        isDisabled: true
                    )
                    .frame(maxWidth: 60)
                    SDTextField(
                        placeholder: "12345678",
                        text: $phoneNumber
                    )
                }
            }
            Spacer()
            
            Button {
                isMovingMainView.toggle()
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    self.presentationMode.wrappedValue.dismiss()
                }
            } label: {
                Text("인증 요청")
                    .sdText(type: .body1, textColor: .black)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 15)
                    .background(Color.Logo.kakao)
                    .cornerRadius(12)
            }
        }
        .padding(15)
    }
}

struct KakaoSigninVIew_Previews: PreviewProvider {
    static var previews: some View {
        KakaoSigninVIew(isMovingMainView: .constant(false))
    }
}
