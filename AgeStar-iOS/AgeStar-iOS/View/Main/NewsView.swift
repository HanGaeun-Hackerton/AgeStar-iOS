import SwiftUI
import SemicolonDesign

struct NewsView: View {
    @State private var searchText = ""
    let newsKeywords: [String] = [
        "범죄",
        "연애",
        "스포츠",
        "취업",
        "경제",
        "성매매",
        "알바",
        "마약",
        "만나이",
        "주식"
    ]
    var body: some View {
        VStack {
            SearchTextField(text: $searchText)
                .padding(.horizontal, 15)
            List(newsKeywords.filter {
                if !searchText.isEmpty {
                    return $0.contains(searchText)
                } else {
                    return true
                }
            }, id: \.self) { new in
                NavigationLink {
                    NewsListView(keyword: new)
                } label: {
                    HStack {
                        Text(new)
                        Spacer()
                    }
                }
            }
            .listStyle(.plain)
            Spacer()
        }
        .navigationBarTitle(Text("뉴스"), displayMode: .inline)
    }

    @ViewBuilder
    func cell() -> some View {
        VStack {
            
        }
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NewsView()
        }
    }
}
