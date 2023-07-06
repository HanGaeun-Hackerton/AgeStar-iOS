import SwiftUI

public extension Color {
    struct Main { }
    struct Sub { }
    struct Box { }
    struct Logo { }
}

public extension Color.Main {
    static let main: Color = Color("Main")
    static let bolderColor: Color = Color("BolderColor")
    static let greenShadow: Color = Color("GreenShadow")
}

public extension Color.Sub {
    static let sub: Color = Color("Sub")
}

public extension Color.Box {
    static let boxBG: Color = Color("BoxBG")
    static let boxBolder: Color = Color("boxBolder")
}

public extension Color.Logo {
    static let kakao: Color = Color("KakaoColor")
    static let pass: Color = Color("PassColor")
}
