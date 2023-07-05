import SwiftUI

extension View {
    func ageStarShadow() -> some View {
        let radius = 4 / 2.0
        let spreadedX: CGFloat = 0
        let spreadedY: CGFloat = 4
        return shadow(
            color: .black.opacity(0.25),
            radius: radius,
            x: spreadedX,
            y: spreadedY
        )
    }
    func insuranceShadow() -> some View {
        let radius = 10 / 2.0
        let spreadedX: CGFloat = 0
        let spreadedY: CGFloat = 0
        return shadow(
            color: .Main.greenShadow,
            radius: radius,
            x: spreadedX,
            y: spreadedY
        )
    }
}
