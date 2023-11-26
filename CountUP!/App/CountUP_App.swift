//
//  CountUP_App.swift
//  CountUP!
//
//  Created by Japhet Tegtmeyer on 10/23/23.
//

import SwiftUI

@main

struct CountUP_App: App {
    
    @State private var snarkyText: String = UserDefaults.standard.string(forKey: "snarkyText") ?? "Loading..."
    
    var body: some Scene {
        
        WindowGroup {
            
            MainTabView()
            
                .environmentObject(CountData())
            
        }
        
    }
    
}
