import SwiftUI
import SemicolonDesign

struct ChangePasswordView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var nowPasswordText = ""
    @State var newPasswordext = ""
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            Text("비밀번호 변경")
                .sdText(type: .heading1)
            SDTextField(
                title: "현재 비밀번호",
                placeholder: "현재 비밀번호를 입력해주세요",
                text: $nowPasswordText,
                isSecure: true
            )
            .padding(.bottom, 10)
            SDTextField(
                title: "새 비밀번호",
                placeholder: "새 비밀번호를 입력해주세요",
                text: $newPasswordext,
                isSecure: true
            )
            Spacer()
            Spacer()

            Button {
                self.presentationMode.wrappedValue.dismiss()
            } label: {
                Text("변경")
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

struct ChangePasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ChangePasswordView()
    }
}
