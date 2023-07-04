import SwiftUI

public enum AgeStarImageType: String {
    case benefit = "Benefit"
    case guiter = "Guitar"
    case insurance = "Insurance"
    case license = "License"
    case news = "News"
    case qna = "QnA"
    case recommend = "Recommend"

    public func title() -> String {
        switch self {
        case .benefit:
            return "혜택"
        case .guiter:
            return "기타"
        case .insurance:
            return "보험"
        case .license:
            return "자격증"
        case .news:
            return "뉴스"
        case .qna:
            return "Q&A"
        case .recommend:
            return "추천"
        }
    }
    public func content() -> String {
        switch self {
        case .benefit:
            return "세상은 넓고\n혜택은 많다"
        case .guiter:
            return "이 외에 더 알아보기\n"
        case .insurance:
            return "보험을 한 번에\n빠르게"
        case .license:
            return "나를 위한 자격증을\n바로 알아보세요"
        case .news:
            return "세상을 사회를\n바로 알기"
        case .qna:
            return "질문으로 바로 알아보기\n"
        case .recommend:
            return "당신을 위한 맞춤 리스트"
        }
    }
}

public struct AgeStarImage: View {
    let type: AgeStarImageType

    init(_ type: AgeStarImageType) {
        self.type = type
    }
    
    public var body: some View {
        Image(type.rawValue)
    }
}
