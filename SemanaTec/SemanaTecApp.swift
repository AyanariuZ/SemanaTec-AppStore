//
//  SemanaTecApp.swift
//  SemanaTec
//
//  Created by Rafael Alejandro Rivas González on 22/10/24.
//

import SwiftUI

@main
struct SemanaTecApp: App {
    @StateObject var model: AppViewModel = .init()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(model)
        }
    }
}
