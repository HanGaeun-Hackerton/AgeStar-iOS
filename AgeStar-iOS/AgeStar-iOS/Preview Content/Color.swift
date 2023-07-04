import SwiftUI

public extension Color {
    struct Main { }
    struct Sub { }
    struct Box { }
}

public extension Color.Main {
    static let main: Color = Color("Main")
    static let bolderColor: Color = Color("BolderColor")
}

public extension Color.Sub {
    static let sub: Color = Color("Sub")
}

public extension Color.Box {
    static let boxBG: Color = Color("BoxBG")
    static let boxBolder: Color = Color("boxBolder")
}
