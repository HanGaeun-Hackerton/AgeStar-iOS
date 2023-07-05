import SwiftUI
import SemicolonDesign

struct InsuranceCell: View {
//    @State private var isOpen: Bool = false
    @Binding var i: Insurance
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                Image("wjdqn24")
                    .resizable()
                    .frame(width: 50, height: 50)
                VStack(alignment: .leading, spacing: 0) {
                    Text(i.title)
                        .bold()
                    Text(i.content)
                        .sdText(type: .body1)
                }
                Spacer()
                Image(systemName: "chevron.down")
                    .rotationEffect(
                        i.selected
                        ? Angle.degrees(180)
                        : .degrees(0)
                    )
            }
            .padding(.top, 7)
            if i.selected {
                Divider()
                    .padding(11)
                VStack(alignment: .leading, spacing: 20) {
                    Text("신청기간 - \(i.applyTime)")
                        .sdText(type: .body2, textColor: .black)
                    Text("전화문의 - \(i.call)")
                        .sdText(type: .body2, textColor: .black)
                    VStack(alignment: .leading, spacing: 0) {
                        Text("신청방법 - \(i.applyWay)")
                            .sdText(type: .body2, textColor: .black)
                        if let guitar = i.guitar {
                            Text("O 기타: \(guitar)")
                                .sdText(type: .body2, textColor: .black)
                        }
                    }
                    Text("접수기관 - \(i.gigwan)")
                        .sdText(type: .body2, textColor: .black)
                    Text("지원형태 - \(i.type)")
                        .sdText(type: .body2, textColor: .black)
                        .padding(.bottom, 10)
                }
            }
        }
        .padding(15)
        .background(Color.Box.boxBG)
        .cornerRadius(15)
        .padding(1)
        .background(Color.Box.boxBolder)
        .cornerRadius(15)
        .shadow(color: .Main.greenShadow, radius: 10)
        .padding()
        .onTapGesture {
            withAnimation(.spring(response: 0.3)) {
                i.selected.toggle()
            }
        }
    }
}
