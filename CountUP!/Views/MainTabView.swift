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
    
    @AppStorage("NightModeOn") var isNightModeOn: Bool = false
    
    @State var animate: Bool = false
    
    @State var ShowSplash: Bool = true
    
    var body: some View {
        ZStack {
            TabView {
                
                tabItem(content: ContentView(), systemImage: "house.fill", text: "Home")
                
                tabItem(content: AwardView(), systemImage: "medal", text: "Achievements")
                
                tabItem(content: AppStoreView(), systemImage: "bag", text: "Store")
                
                tabItem(content: SettingsSheet(), systemImage: "gearshape.fill", text: "Settings")
                
            }
            .tint(isNightModeOn ? .red : .accentColor)
            
            .navigationViewStyle(.stack)
            
            ZStack {
                Color(isNightModeOn ? .red : .systemBlue)
                Image("LogoCircle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 85, height: 85)
                    .scaleEffect(animate ? 30 : 1 )
                    .animation(Animation.easeIn(duration: 0.5))
            }
            .ignoresSafeArea(.all)
            .animation(.default)
            .opacity( ShowSplash ? 1 : 0)
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now()+0.3) {
                animate.toggle()
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now()+1) {
                ShowSplash.toggle()
            }
        }
        
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
