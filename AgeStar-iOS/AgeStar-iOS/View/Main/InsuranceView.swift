import SwiftUI
import SemicolonDesign

struct InsuranceView: View {
    @State var insurance: [Insurance] = [
        .init(
            title: "재단법인 화천군인재육성(특별지원금)",
            content: "국내 10대 대학생 지원금 지원",
            call: "교육복지과 (033-440-2162)",
            applyTime: "상시신청",
            applyWay: "방문 신청",
            applyContent: "10대 대학 대학생 등록금 지원",
            gigwan: "화천군인재육성재단",
            type: "현금"
        ),
        .init(
            title: "청소년 드림카드 지원",
            content: "청소년 드림카드 지원",
            call: "가족복지과 (063-540-4097)",
            applyTime: "2023.01.01 ~ 2023.12.15",
            applyWay: "거주지 관할 읍면동 행정복지센터에 방문 신청",
            applyContent: "김제시에 주소를 둔 만16세 ~ 18세 청소년들에게 문화, 체육, 진로개발을 위해 1인당 월 5만원 바우처 제공",
            gigwan: "주민센터",
            type: "이용권"
        ),
        .init(
            title: "학교 밖 청소년 교통비 지원",
            content: "금정구에 주민등록이 되어있는 만9세~만18세 학교 밖 청소년에게 교통비 지원",
            call: "인천교통공사 (032-451-2145)",
            applyTime: "상시신청",
            applyWay: "학교 밖 청소년 지원센터(꿈드림) 방문신청 : 부산광역시 금정구 기찰로 96번길 47",
            applyContent: "1인 연 90,000원 교통비 지원",
            gigwan: "학교 밖 청소년 지원센터(꿈드림)",
            type: "현금"
        ),
        .init(
            title: "도시철도 요금 감면(청소년)",
            content: "금정구에 주민등록이 되어있는 만9세~만18세 학교 밖 청소년에게 교통비 지원",
            call: "교육복지과 (033-440-2162)",
            applyTime: "상시신청",
            applyWay: "방문 신청^기타 : 청소년 교통카드 구매 후 티머니 홈페이지에서 생년월일 등록",
            applyContent: "도시철도 청소년 운임할인^어른운임에서 350원을 제하고 20% 할인(기본운임 720원)^교통카드 사용 시 해당",
            gigwan: "인천교통공사",
            type: "현금"
        ),
        .init(
            title: "경기도 위기청소년 의료비 감면",
            content: "국내 10대 대학생 지원금 지원",
            call: "교육복지과 (033-440-2162)",
            applyTime: "상시신청",
            applyWay: "방문 신청 ",
            applyContent: "",
            gigwan: "화천군인재육성재단",
            type: "현금"
        )
    ]
    @State var isLoading: Bool = false
    var body: some View {
        if isLoading {
            ScrollView {
                VStack(spacing: 0) {
                    ForEach(0..<insurance.count, id: \.self) { i in
                        InsuranceCell(i: $insurance[i])
                    }
                }
            }
            .navigationBarTitle("혜택", displayMode: .inline)
        } else {
            ProgressView().progressViewStyle(.circular)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        isLoading.toggle()
                    }
                }
        }
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
    let applyContent: String
    let gigwan: String
    let type: String
    var selected: Bool = false
}
