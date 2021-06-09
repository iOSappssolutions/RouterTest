//
//  RoutingTestApp.swift
//  RoutingTest
//
//  Created by Miroslav Djukic on 9.6.21..
//

import SwiftUI

@main
struct RoutingTestApp: App {
    
    @StateObject var state = NavigationState()
    
    var body: some Scene {
        WindowGroup {
            AView()
                .environmentObject(state)
        }
    }
}
