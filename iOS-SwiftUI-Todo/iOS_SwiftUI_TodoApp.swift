//
//  iOS_SwiftUI_TodoApp.swift
//  iOS-SwiftUI-Todo
//
//  Created by Mostafa Davoodi on 6/19/22.
// https://github.com/realm/realm-swift.git

import SwiftUI

@main
struct iOS_SwiftUI_TodoApp: App {
    var body: some Scene {
        WindowGroup {
					ContentView().environmentObject(TaskViewModel())
        }
    }
}
