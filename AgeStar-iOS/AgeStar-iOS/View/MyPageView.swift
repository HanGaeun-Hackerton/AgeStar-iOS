import SwiftUI

struct MyPageView: View {
    @Binding var isAppear: Bool
    
    init(isAppear: Binding<Bool>) {
        _isAppear = isAppear
    }
    var body: some View {
        VStack {
            Button("로그아웃") {
                isAppear.toggle()
            }
        }
    }
}

struct MyPageView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageView(isAppear: .constant(true))
    }
}
