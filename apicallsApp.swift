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
                .environmentObject(ViewModel())//this needs to be here for the enviromental object to work not entirely sure why.
        }
    }
}
