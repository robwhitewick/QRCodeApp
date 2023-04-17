//
//  apicallsApp.swift
//  apicalls
//
//  Created by user240138 on 4/12/23.
//

import SwiftUI

@main
struct apicallsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ViewModel())
        }
    }
}
