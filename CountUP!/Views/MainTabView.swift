//
//  TabView.swift
//  CountUP!
//
//  Created by Japhet Tegtmeyer on 10/24/23.
//

import SwiftUI

struct MainTabView: View {
    init() {
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithDefaultBackground()
        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
    }
    
    var body: some View {
        TabView {
            tabItem(content: ContentView(), systemImage: "house.fill", text: "Home")

            tabItem(content: AwardView(), systemImage: "medal", text: "Achievements")

        }
        .tint(.primaryC)
        .navigationViewStyle(.stack)
    }
    
    @ViewBuilder
    func tabItem<T: View>(content: T, systemImage: String, text: String) -> some View {
        content
            .tabItem {
                Image(systemName: systemImage)
                Text(text)
            }
    }
}

#Preview {
    MainTabView()
}
