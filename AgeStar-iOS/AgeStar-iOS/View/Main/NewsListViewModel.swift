import Foundation
import Moya

class NewsListViewModel: ObservableObject {
    let provider = MoyaProvider<NewsAPI>()
    @Published var newsEntity: NewsEntity?
    @Published var isShowNewsDetail: Bool = false
    func fetchNewsList(keyword: String) {
        provider.request(.newsList(keyword: keyword)) { res in
            switch res {
            case .success(let result):
                switch result.statusCode {
                case 200...300:
                    DispatchQueue.main.async {
                        let decoder = JSONDecoder()
                        if let data = try? decoder.decode(NewsModel.self, from: result.data) {
                            self.newsEntity = data.toDomain()
                        } else {
                            print("⚠️login docoder error")
                        }
                    }
                default:
                    print(result.statusCode)
                }
            case .failure(let err):
                print("⛔️post error: \(err.localizedDescription)")
            }
        }
    }
}
