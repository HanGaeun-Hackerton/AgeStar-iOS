import Foundation

// MARK: - NewsModel
struct NewsModel: Codable {
    let items: [Item]
}

// MARK: - Item
struct Item: Codable {
    let title: String
    let originallink: String
    let link: String
    let description, pubDate: String
}

// MARK: - NewsModel
struct NewsEntity: Hashable {
    let items: [ItemEntity]
}

// MARK: - Item
struct ItemEntity: Hashable {
    let title: String
    let originallink: String
    let link: String
    let description, pubDate: String
}

extension NewsModel {
    func toDomain() -> NewsEntity {
        NewsEntity(items: items.map { $0.toDomain() })
    }
}

extension Item {
    func toDomain() -> ItemEntity {
        ItemEntity(
            title: title.htmlToSwift(),
            originallink: originallink,
            link: link,
            description: description.htmlToSwift(),
            pubDate: pubDate.timeAgo()
        )
    }
}

extension String {
    func htmlToSwift() -> String {
        let encodedData = self.data(using: .utf8)
        let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [
            .documentType: NSAttributedString.DocumentType.html,
            .characterEncoding: String.Encoding.utf8.rawValue
        ]
        
        if let encodedData = encodedData {
            let attributedString = try? NSAttributedString(data: encodedData, options: options, documentAttributes: nil)
            return attributedString?.string ?? ""
        }
        
        return ""
    }

}

extension String {
    func timeAgo() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE, dd MMM yyyy HH:mm:ss Z"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        
        if let date = dateFormatter.date(from: self) {
            let minutesAgo = Int(Date().timeIntervalSince(date) / 60)
            
            if minutesAgo < 60 {
                return "\(minutesAgo)분 전"
            } else {
                let hoursAgo = minutesAgo / 60
                if hoursAgo < 24 {
                    return "\(hoursAgo)시간 전"
                } else {
                    return self.formatDate()
                }
            }
        }
        
        return self
    }
}

extension String {
    func formatDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE, dd MMM yyyy HH:mm:ss Z"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        
        if let date = dateFormatter.date(from: self) {
            let outputFormatter = DateFormatter()
            outputFormatter.dateFormat = "yyyy년 M월 d일"
            outputFormatter.locale = Locale(identifier: "ko_KR")
            
            return outputFormatter.string(from: date)
        }
        
        return self
    }
}
