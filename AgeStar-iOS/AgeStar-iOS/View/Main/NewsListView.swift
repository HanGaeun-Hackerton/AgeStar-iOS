import SwiftUI
import Moya
import SemicolonDesign

struct NewsListView: View {
    @StateObject var viewModel = NewsListViewModel()
    let keyword: String
    var body: some View {
        VStack {
            if let newsList = viewModel.newsEntity?.items {
                List(newsList, id: \.self) { news in
                    NewsCell(news: news)
                }
                .listStyle(.inset)
            } else {
                ProgressView().progressViewStyle(.circular)
            }
        }
        .onAppear { viewModel.fetchNewsList(keyword: keyword) }
        .navigationTitle(keyword)
    }
}

struct NewsCell: View {
    let news: ItemEntity
    @State var isShowDetailWebView = false
    var body: some View {
        Button {
            isShowDetailWebView.toggle()
        } label: {
            VStack(alignment: .leading) {
                Text(news.title)
                    .sdText(type: .body1, textColor: .black)
                Text(news.description)
                    .sdText(type: .body4)
                    .lineLimit(2)
                Text(news.pubDate)
                    .sdText(type: .caption1)
            }
        }
        .sheet(isPresented: $isShowDetailWebView) {
            WebView(urlToLoad: news.originallink)
                .presentationDragIndicator(.visible)
        }
    }
}

struct NewsListView_Previews: PreviewProvider {
    static var previews: some View {
        NewsListView(keyword: "범죄")
    }
}
