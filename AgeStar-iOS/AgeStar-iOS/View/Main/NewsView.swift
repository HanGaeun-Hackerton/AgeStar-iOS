import SwiftUI
import SemicolonDesign

struct NewsView: View {
    @State private var searchText = ""

    var body: some View {
        VStack {
            SearchTextField(text: $searchText)
            List {
                NavigationLink {
                    ZStack(alignment: .top) {
                        WebView(keyword: "범죄")
                            .offset(y: -310)
//                        Rectangle()
//                            .fill(.white)
//                            .frame(height: 350)
                    }
                    .ignoresSafeArea()
                    .overlay(alignment: .top) {
                        Color.white
                            .ignoresSafeArea(edges: .top)
                            .frame(height: 0)
                    }
                } label: {
                    HStack {
                        Text("hello")
                        Spacer()
                    }
                }
            }
            .listStyle(.plain)
            Spacer()
        }
        .padding(.horizontal, 15)
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
