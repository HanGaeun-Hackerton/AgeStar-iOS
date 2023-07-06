import Moya
import Foundation

enum NewsAPI {
    case newsList(keyword: String)
}

extension NewsAPI: TargetType {
    var baseURL: URL {
        return URL(string: "https://openapi.naver.com/v1")!
    }

    var path: String {
        switch self {
        case .newsList:
            return "/search/news.json"
        }
    }

    var method: Moya.Method {
        return .get
    }

    var task: Task {
        switch self {
        case .newsList(let keyword):
            return .requestParameters(
                parameters: [
                    "query": "청소년" + keyword
                ],
                encoding: URLEncoding.queryString)
        }
    }

    var headers: [String: String]? {
        return [
            "X-Naver-Client-Id": "RYF61u1FGEGMsVkOgrJz",
            "X-Naver-Client-Secret": "iXe5BsseXA"
        ]
    }
}
