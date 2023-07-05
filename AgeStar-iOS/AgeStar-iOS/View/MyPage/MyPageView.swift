import SwiftUI
import SemicolonDesign

struct MyPageView: View {
    @Binding var isAppear: Bool
    @State var isShowAlert = false
    @State var isShowImagePicker = false
    @State var selectedImage: UIImage?
    
    init(isAppear: Binding<Bool>) {
        _isAppear = isAppear
    }
    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
                if let selectedImage {
                    Image(uiImage: selectedImage)
                        .resizable()
                        .frame(width: 100, height: 100)
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                } else {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .foregroundColor(.gray)
                        .frame(width: 100, height: 100)
                }
                Image(systemName: "camera.fill")
                    .foregroundColor(.white)
                    .padding(7)
                    .background(
                        Circle()
                            .fill(Color.Main.main)
                    )
            }
            .padding(40)
            .onTapGesture {
                isShowImagePicker.toggle()
            }
            VStack(spacing: 1) {
                HStack {
                    Text("이름")
                        .sdText(type: .heading6)
                    Spacer()
                    Text("홍승재")
                        .bold()
                }
                .padding(.horizontal, 10)
                .padding(.vertical, 15)
                Divider()
                    .padding(.horizontal, 10)
                HStack {
                    Text("생년월일")
                        .sdText(type: .heading6)
                    Spacer()
                    Text("2006.03.04")
                        .bold()
                }
                .padding(.horizontal, 10)
                .padding(.vertical, 15)
                Divider()
                    .padding(.horizontal, 10)
                HStack {
                    Text("아이디")
                        .sdText(type: .heading6)
                    Spacer()
                    Text("qwer1234")
                        .bold()
                }
                .padding(.horizontal, 10)
                .padding(.vertical, 15)
            }
            .overlay(RoundedRectangle(cornerRadius: 15).stroke().fill(.secondary.opacity(0.25)))
            .padding(.bottom, 20)
            
            NavigationLink(destination: ChangePasswordView()) {
                HStack {
                    Text("비밀번호 변경")
                        .sdText(type: .heading6)
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundColor(.black)
                }
                .padding(.horizontal, 10)
                .padding(.vertical, 15)
                .overlay(RoundedRectangle(cornerRadius: 15).stroke().fill(.secondary.opacity(0.25)))
            }
            Button {
                self.isShowAlert.toggle()
            } label: {
                HStack {
                    Text("로그아웃")
                        .sdText(type: .heading6, textColor: .red)
                    Spacer()
                }
                .padding(.horizontal, 10)
                .padding(.vertical, 15)
                .overlay(RoundedRectangle(cornerRadius: 15).stroke().fill(.secondary.opacity(0.25)))
            }

            Spacer()
            Spacer()
        }
        .padding(.horizontal, 15)
        .alert("로그아웃 하시겠습니까?", isPresented: $isShowAlert) {
            Button("아니오", role: .cancel) { }
            Button("네", role: .destructive) {
                isAppear.toggle()
            }
        }
        .imagePicker(isShow: $isShowImagePicker, uiImage: $selectedImage)
        .navigationBarTitle(Text("마이페이지"), displayMode: .inline)
        .navigationBarItems(trailing: trailingItem())
    }
    
    @ViewBuilder
    func trailingItem() -> some View {
        Image(systemName: "pencil")
    }
}

struct MyPageView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MyPageView(isAppear: .constant(true))
        }
    }
}
