import SwiftUI
import WebKit
 
struct WebView: UIViewRepresentable {
   
    var urlToLoad: String = "https://m.newspim.com/search"
    let keyword: String

    init(
        keyword: String
    ) {
        self.keyword = keyword
    }
    
    //ui view 만들기
    func makeUIView(context: Context) -> WKWebView {
        
        //unwrapping
        guard var url = URL(string: self.urlToLoad) else {
            return WKWebView()
        }
        
        url = url.withQueryParams([
            "searchword": "청소년 \(keyword)"
        ])
        //웹뷰 인스턴스 생성
        let webView = WKWebView()
        
        //웹뷰를 로드한다
        webView.load(URLRequest(url: url))
        return webView
    }
    
    //업데이트 ui view
    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<WebView>) {
        
    }
}
 
//Canvas 미리보기용
struct MyWebView_Previews: PreviewProvider {
    static var previews: some View {
        WebView(keyword: "범죄")
    }
}

extension URL {
    func withQueryParams(_ params: [String: String]) -> URL {
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)!
        components.queryItems = params.map { URLQueryItem(name: $0.key, value: $0.value) }
        return components.url!
    }
}
