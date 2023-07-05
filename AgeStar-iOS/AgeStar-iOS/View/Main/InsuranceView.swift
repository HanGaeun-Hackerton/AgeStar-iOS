import SwiftUI
import SemicolonDesign

struct InsuranceView: View {
    @State var insurance: [Insurance] = [
        .init(
            title: "재단법인 화천군인재육성(특별지원금)",
            content: "국내 10대 대학생 지원금 지원",
            call: "교육복지과 (033-440-2162)",
            applyTime: "상시신청",
            applyWay: "방문 신청 ",
            guitar: "화천군인재육성재단 문의 및 방문 신청",
            gigwan: "화천군인재육성재단",
            type: "현금"
        ),
        .init(
            title: "재단법인 화천군인재육성(특별지원금)",
            content: "국내 10대 대학생 지원금 지원",
            call: "교육복지과 (033-440-2162)",
            applyTime: "상시신청",
            applyWay: "방문 신청 ",
            guitar: "화천군인재육성재단 문의 및 방문 신청",
            gigwan: "화천군인재육성재단",
            type: "현금"
        ),
        .init(
            title: "재단법인 화천군인재육성(특별지원금)",
            content: "국내 10대 대학생 지원금 지원",
            call: "교육복지과 (033-440-2162)",
            applyTime: "상시신청",
            applyWay: "방문 신청 ",
            guitar: "화천군인재육성재단 문의 및 방문 신청",
            gigwan: "화천군인재육성재단",
            type: "현금"
        )
    ]
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                ForEach(0..<insurance.count, id: \.self) { i in
                    InsuranceCell(i: $insurance[i])
                }
            }
        }
        .navigationBarTitle("혜택", displayMode: .inline)
    }
}

struct InsuranceView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            InsuranceView()
        }
    }
}

public struct Insurance: Hashable {
    let title: String
    let content: String
    let call: String
    let applyTime: String
    let applyWay: String
    let guitar: String?
    let gigwan: String
    let type: String
    var selected: Bool = false
}
