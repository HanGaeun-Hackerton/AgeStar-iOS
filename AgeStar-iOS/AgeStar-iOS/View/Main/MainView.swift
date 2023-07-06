import SwiftUI
import SemicolonDesign

struct MainView: View {
    @State var searchText = ""
    @Binding var isAppear: Bool
    
    let insuranceView = AnyView(WebView(
        urlToLoad: "https://direct.samsungfire.com/mall/PP030502_001.html"
    ).navigationBarTitle("보험", displayMode: .inline))
    let recommandView = AnyView(WebView(
        urlToLoad: "https://if-blog.tistory.com/1464"
    ).navigationBarTitle("추천", displayMode: .inline))
    let qnaView = AnyView(WebView(
        urlToLoad: "https://www.youth.go.kr/ywith/bbs/data/list.do?menu_idx=8"
    ).navigationBarTitle("Q&A", displayMode: .inline))
    let licensView = AnyView(WebView(
        urlToLoad: "https://www.q-net.or.kr/crf005.do?id=crf00502"
    ).navigationBarTitle("자격증", displayMode: .inline))
    let guitarView = AnyView(WebView(
        urlToLoad: "https://easylaw.go.kr/CSP/CnpClsMain.laf?popMenu=ov&csmSeq=659&ccfNo=4&cciNo=1&cnpClsNo=1"
    ).navigationBarTitle("기타", displayMode: .inline))
    
    init(isAppear: Binding<Bool>) {
        _isAppear = isAppear
    }

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                VStack {
                    ZStack {
                        Text("10대")
                            .sdText(type: .heading5, textColor: .white)
                        HStack {
                            Spacer()
                            NavigationLink(
                                destination: MyPageView(isAppear: $isAppear),
                                label: {
                                    Image(systemName: "person.circle")
                                        .resizable()
                                        .foregroundColor(.white)
                                        .frame(width: 30, height: 30)
                                }
                            )
                        }
                    }
                    SearchTextField(
                        placeholder: "검색",
                        text: $searchText
                    )
                    .background(Color.white)
                    .cornerRadius(8)
                }
                .padding([.horizontal, .bottom], 15)
                .background(Color.Main.main)
                .cornerRadius(30, corners: [.bottomLeft, .bottomRight])
                .ageStarShadow()
                ScrollView {
                    VStack(spacing: 20) {
                        HStack(spacing: 15) {
                            NavigationLink(destination: InsuranceView()) {
                                oneBox(.benefit)
                            }
                            NavigationLink(destination: insuranceView) {
                                oneBox(.insurance)
                            }
                        }
                        NavigationLink(destination: recommandView) {
                            recommendBox()
                        }
                        HStack(spacing: 15) {
                            NavigationLink(destination: NewsView()) {
                                twoBox(.news)
                            }
                            NavigationLink(destination: qnaView) {
                                twoBox(.qna)
                            }
                        }
                        HStack(spacing: 15) {
                            NavigationLink(destination: licensView) {
                                twoBox(.license)
                            }
                            NavigationLink(destination: guitarView) {
                                twoBox(.guiter)
                            }
                        }
                    }
                    .padding(15)
                }
            }
            .navigationTitle("홈")
            .overlay(alignment: .top) {
                Color.Main.main
                    .ignoresSafeArea(edges: .top)
                    .frame(height: 0)
            }
            .navigationBarHidden(true)
        }
        .accentColor(.black)
    }

    @ViewBuilder
    func oneBox(_ type: AgeStarImageType) -> some View {
        VStack(alignment: .trailing) {
            HStack {
                VStack(alignment: .leading) {
                    HStack {
                        Text(type.title())
                            .sdText(type: .heading6)
                        Image(systemName: "chevron.right")
                            .imageScale(.small)
                            .opacity(0.25)
                    }
                    Text(type.content())
                        .sdText(type: .caption1, textColor: .Sub.sub)
                }

                Spacer()
            }
            AgeStarImage(type)
                .frame(width: 100, height: 100)
        }
        .padding(10)
        .background(Color.Box.boxBG)
        .cornerRadius(15)
        .padding(1)
        .background(Color.Box.boxBolder)
        .cornerRadius(15)
        .ageStarShadow()
    }
    @ViewBuilder
    func twoBox(_ type: AgeStarImageType) -> some View {
        VStack(alignment: .trailing, spacing: 5) {
            HStack {
                VStack(alignment: .leading) {
                    HStack {
                        Text(type.title())
                            .sdText(type: .heading6)
                        Image(systemName: "chevron.right")
                            .imageScale(.small)
                            .opacity(0.25)
                    }
                    Text(type.content())
                        .sdText(type: .caption1, textColor: .Sub.sub)
                }

                Spacer()
            }
            AgeStarImage(type)
                .offset(x: -5, y: -5)
                .frame(width: 60, height: 60)
        }
        .padding(10)
        .frame(minHeight: 130)
        .background(Color.Box.boxBG)
        .cornerRadius(15)
        .padding(1)
        .background(Color.Box.boxBolder)
        .cornerRadius(15)
        .ageStarShadow()
    }
    @ViewBuilder
    func recommendBox() -> some View {
        let type: AgeStarImageType = .recommend
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    Text(type.title())
                        .sdText(type: .heading6)
                    Image(systemName: "chevron.right")
                        .imageScale(.small)
                        .opacity(0.25)
                }
                Text(type.content())
                    .sdText(type: .caption1, textColor: .Sub.sub)
            }
            
            Spacer()
            
            AgeStarImage(type)
                .frame(width: 100, height: 100)
        }
        .padding(10)
        .background(Color.Box.boxBG)
        .cornerRadius(15)
        .padding(1)
        .background(Color.Box.boxBolder)
        .cornerRadius(15)
        .ageStarShadow()
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(isAppear: .constant(true))
    }
}

public struct SearchTextField: View {

    let title: String
    let placeholder: String
    let help: String
    var isImportant: Bool
    @Binding var text: String
    var errorMessage: String
    var isDisabled: Bool
    var isSecure: Bool

    public init(
        title: String = "",
        placeholder: String = "",
        help: String = "",
        isImportant: Bool = false,
        text: Binding<String>,
        errorMessage: String = "",
        isDisabled: Bool = false,
        isSecure: Bool = false
    ) {
        self.title = title
        self.placeholder = placeholder
        self.help = help
        self.isImportant = isImportant
        self._text = text
        self.errorMessage = errorMessage
        self.isDisabled = isDisabled
        self.isSecure = isSecure
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 0) {

            if !title.isEmpty {
                HStack(alignment: .top, spacing: 0) {
                    Text(title)
                        .sdText(type: .body4, textColor: getTitleColor())
                        .padding(.bottom, 8)
                    Text(isImportant ? "*" : "")
                        .foregroundColor(Color.System.red400)
                }
            }
            
            if !isSecure {
                TextField(placeholder, text: $text)
                    .modifier(SDTextFieldModifier(
                        text: text,
                        errorMessage: errorMessage,
                        isDisabled: isDisabled
                    ))
            } else {
                SecureField(placeholder, text: $text)
                    .modifier(SDTextFieldModifier(
                        text: text,
                        errorMessage: errorMessage,
                        isDisabled: isDisabled
                    ))
            }

            if !isDisabled {
                if !errorMessage.isEmpty {
                    Text(errorMessage)
                        .sdText(type: .caption2, textColor: .System.red400)
                        .padding(.top, 4)
                } else if !help.isEmpty {
                    Text(help)
                        .sdText(type: .caption2, textColor: .GrayScale.gray400)
                        .padding(.top, 4)
                }
            }

        }
    }

    private func getTitleColor() -> Color {
        if isDisabled {
            return .GrayScale.gray200
        } else if !errorMessage.isEmpty {
            return .System.red400
        } else {
            return .GrayScale.gray700
        }
    }

}

struct SDTextFieldModifier: ViewModifier {
    
    @FocusState private var isFocusing: Bool
    
    var text: String
    var errorMessage: String
    var isDisabled: Bool
    
    func body(content: Content) -> some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.accentColor)
                .imageScale(.large)
            content
        }
        .autocapitalization(.none)
        .disableAutocorrection(true)
        .font(.system(size: 16))
        .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
        .frame(height: 44, alignment: .center)
        .background(getBackgroundColor())
        .cornerRadius(8)
        .overlay {
            RoundedRectangle(cornerRadius: 8)
                .stroke(getStrokeColor())
        }
        .foregroundColor(getTextColor())
        .accentColor(.GrayScale.gray800)
        .disabled(isDisabled)
        .focused($isFocusing)
    }
    
    private func getTextColor() -> Color {
        if isDisabled || text.isEmpty {
            return .GrayScale.gray300
        } else {
            return .GrayScale.gray800
        }
    }

    private func getBackgroundColor() -> Color {
        if isDisabled || text.isEmpty {
            return .GrayScale.gray50
        } else {
            return .clear
        }
    }

    private func getStrokeColor() -> Color {
        if isDisabled || text.isEmpty {
            return .GrayScale.gray300
        } else if !errorMessage.isEmpty {
            return .System.red400
        } else if isFocusing {
            return .GrayScale.gray800
        } else {
            return .GrayScale.gray500
        }
    }

}
