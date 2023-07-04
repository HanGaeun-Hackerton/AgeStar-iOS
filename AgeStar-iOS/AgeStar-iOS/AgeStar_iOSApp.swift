//
//  AgeStar_iOSApp.swift
//  AgeStar-iOS
//
//  Created by 홍승재 on 2023/07/04.
//

import SwiftUI

@main
struct AgeStar_iOSApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                SigninView()
            }
            .accentColor(.black)
        }
    }
}
