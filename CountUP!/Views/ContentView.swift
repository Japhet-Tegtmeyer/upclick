//
//  ContentView.swift
//  UpClick
//
//  Created by Japhet Tegtmeyer on 10/23/23.
//

/// Import for SwiftUI UI framework
import SwiftUI

/// Import GameCenter for GameKit integration
import GameKit

/// Import for Audio API
import AudioToolbox

/// Class for persisting `countData.countNum`
class CountData: ObservableObject {
    
    /// Publish `countNum` to the whole app
    @Published var countNum: Int = UserDefaults.standard.integer(forKey: "Tap")
    
}

/// Global instance of `GKLocalPlayer` for GameKit
let localPlayer = GKLocalPlayer.local

/// Function to authenticate the user with GameCenter
func authenticateUser() {
    
    localPlayer.authenticateHandler = { vc, error in
        
        guard error == nil else {
            
            print(error?.localizedDescription ?? "")
            
            return
        }
        
        GKAccessPoint.shared.isActive = localPlayer.isAuthenticated
        
        GKAccessPoint.shared.location = .topLeading
        
    }
    
}

/// Main struct for ContentView View
struct ContentView: View {
    
    /// Makes `countData` available everywhere
    @EnvironmentObject private var countData: CountData
    
    /// State for if Alert is showing
    @State private var showAlert = false
    
    /// State for loading texts
    @State private var texts: String = "Loading..."
    
    // Data persist for sound toggle
    @AppStorage("SoundToggle") var soundIsOn: Bool = true
    
    // Data persist for haptics toggle
    @AppStorage("Haptics") var hapticsIsOn: Bool = true
    
    // Data persist for Count++ upgrade
    @AppStorage("Count++") var CountPlusPlus: Bool = false
    
    // Data persist for Countx4 upgrade
    @AppStorage("Countx4") var CountxFour: Bool = false
    
    @AppStorage("Snarky") var isSnarky: Bool = true
    
    @AppStorage("Clicks") var lifetimeClicks: Int = 0
    
    @AppStorage("NightModeOn") var isNightModeOn: Bool = false
    
    /// Main body of ContentView
    var body: some View {
        
        ZStack(alignment: .topTrailing) {
            
            VStack {
                
                Text(texts)
                    .font(.title2.weight(.bold))
                
                    .onAppear(perform: fetchText)
                
                    .multilineTextAlignment(.center)
                
                    .frame(width: 350)
                
                    .foregroundColor(isNightModeOn ? .red : Color(.text))
                
                    .padding(.vertical)
                
                MainButton()
                
            }
            .onAppear {
                
                authenticateUser()
                
            }
            
            .foregroundStyle(isNightModeOn ? .red : .text)
            
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            .background(isNightModeOn ? .black : Color(.background))
            
            .ignoresSafeArea()
            
        }
        .alert(isPresented: $showAlert) {
            
            Alert(
                
                title: Text("Milestone Reached"),
                
                message: Text("You've reached \(countData.countNum)"),
                
                dismissButton: .default(Text("OK"))
                
            )
            
        }
        
    }
    
    /// Function to fetch texts from TextManager
    func fetchText() {
        
        let newText = isSnarky ? TextManager.getSnarkyRandomMessage() : TextManager.getNiceRandomMessage()
        
        self.texts = newText
        
        UserDefaults.standard.set(newText, forKey: "snarkyText")
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ContentView()
            .environmentObject(CountData())
        
    }
    
}
