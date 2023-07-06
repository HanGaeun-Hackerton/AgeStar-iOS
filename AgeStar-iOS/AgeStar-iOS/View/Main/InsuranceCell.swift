import SwiftUI
import SemicolonDesign

struct InsuranceCell: View {
    @Binding var i: Insurance
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(alignment: .top) {
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
                    content(a: "신청기간", b: i.applyTime)
                    content(a: "전화문의", b: i.call)
                    content(a: "신청방법", b: i.applyWay.split(separator: "^").joined(separator: "\n"))
                    content(a: "지원형식", b: i.type)
                    content(a: "지원내용", b: i.applyContent.split(separator: "^").joined(separator: "\n"))
                    content(a: "접수기관", b: i.gigwan)
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
    @ViewBuilder
    func content(a: String, b: String) -> some View {
        HStack(alignment: .top) {
            Text(a + " - ")
                .sdText(type: .body2, textColor: .black)
            VStack {
                Text(b)
                    .sdText(type: .body2, textColor: .black)
            }
        }
    }
}

struct InsuranceCell_Previews: PreviewProvider {
    static var previews: some View {
        InsuranceCell(i: .constant(
            .init(
                title: "도시철도 요금 감면(청소년)",
                content: "금정구에 주민등록이 되어있는 만9세~만18세 학교 밖 청소년에게 교통비 지원",
                call: "교육복지과 (033-440-2162)",
                applyTime: "상시신청",
                applyWay: "방문 신청^기타 : 청소년 교통카드 구매 후 티머니 홈페이지에서 생년월일 등록",
                applyContent: "도시철도 청소년 운임할인^어른운임에서 350원을 제하고 20% 할인(기본운임 720원)^교통카드 사용 시 해당",
                gigwan: "인천교통공사",
                type: "현금",
                selected: true
            )
        ))
    }
}
