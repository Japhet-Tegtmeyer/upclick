//
//  MainButton.swift
//  CountUP!
//
//  Created by Japhet Tegtmeyer on 11/5/23.
//

import SwiftUI

import AudioToolbox

struct MainButton: View {
    
    // Makes countData availible everywhere
    @EnvironmentObject private var countData: CountData
    
    // State for if the Sheet is showing
    @State private var sheetIsShowing = false
    
    // State for if Alert is showing
    @State private var showAlert = false
    
    // State for if texts is loading
    @State private var texts: String = "Loading..."
    
    // Data persist for if sound is on
    @AppStorage("SoundToggle") var soundIsOn: Bool = true
    
    // Data persist for if haptics is set to true
    @AppStorage("Haptics") var hapticsIsOn: Bool = true
    
    // Data persist for is Count++ upgrade has been purchased
    @AppStorage("Count++") var CountPlusPlus: Bool = false
    
    // Data persist for if Countx4 upgrade has been purchased
    @AppStorage("Countx4") var CountxFour: Bool = false
    
    @AppStorage("Clicks") var lifetimeClicks: Int = 0
    
    @AppStorage("NightModeOn") var isNightModeOn: Bool = false
    
    @State private var clickCount = 0
    
    @State private var timer: Timer?
    
    @State private var clicksPerSecond = 0
    
    var body: some View {
        
        // Main Button
        Button {
            
            self.clickCount += 1
            if self.timer == nil {
                self.startTimer()
            }
            
            // Adds animation for button click
            withAnimation {
                
                // If user has purchased Count++ upgrade...
                if CountxFour && CountPlusPlus == true {
                    
                    // Increase countNum by two
                    countData.countNum += 6
                    
                    // If user has purchased Countx4 upgrade but not Count++...
                } else if CountxFour == true {
                    
                    // Increase countNum by four
                    countData.countNum += 4
                    
                    // If user has purchased Count++ and Countx4 upgrade...
                } else if CountPlusPlus == true {
                    
                    // Increase countNum by six
                    countData.countNum += 2
                    
                    // If user has purchased no upgrades...
                } else {
                    
                    // Increase countNum by one
                    countData.countNum += 1
                    
                }
                
                lifetimeClicks += 1
                
                // Data persist countNum
                UserDefaults.standard.set(countData.countNum, forKey: "Tap") // key is Tap
                
                // If user has sound toggle set to true...
                if soundIsOn == true {
                    
                    // Play default keybaord click sound
                    playKeyboardClickSound()
                    
                }
                
                // If user has haptics toggle set to true...
                if hapticsIsOn == true {
                    
                    // If countNum = 100...
                    if countData.countNum == 100 {
                        
                        // Make a heavy haptic feedback
                        UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
                        
                        // Show milestone alert
                        showAlert = true
                        
                        // If countNum = 1000...
                    } else if countData.countNum == 1000 {
                        
                        // Make a heavy haptic feedback
                        UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
                        
                        // Show milestone alert
                        showAlert = true
                        
                        // If countNum = 10,000...
                    } else if countData.countNum == 10000 {
                        
                        // Make a heavy haptic feedback
                        UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
                        
                        // SHow milestone alert
                        showAlert = true
                        
                        // If countNum is not at a milestone...
                    } else {
                        
                        // Make a mdeium haptic feedback
                        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                        
                    }
                }
            }
            
            // Label (UI part) for button
        } label: {
            
            // Stacks items ontop of each other
            ZStack {
                
                // Main circle for button
                Circle()
                    .stroke(lineWidth: 40) // Sets thickness of circle
                
                    .padding(50) // Makes circle smaller
                
                    .foregroundColor(isNightModeOn ? .red : Color(.systemGray4)) // Color of circle
                
                // Secondary circle for button
                Circle()
                    .stroke(lineWidth: 2) // Sets thickness of circle
                
                    .padding(22) // Makes circle smaller
                
                    .foregroundColor( isNightModeOn ? .red : Color(.systemGray4)) // Circle color
                
                    .opacity(0.7) // Circle opacity
                
                // Secondary circle for button
                Circle()
                    .stroke(lineWidth: 1.5) // Sets thickness of circle
                
                    .padding(12) // Makes circle smaller
                
                    .foregroundColor( isNightModeOn ? .red : Color(.systemGray4)) // Circle color
                
                    .opacity(0.4) // Circle opacity
                
                // Secondary circle for button
                Circle()
                    .stroke(lineWidth: 1) // Sets thickness of circle
                
                    .padding(4) // Makes circle smaller
                
                    .foregroundColor( isNightModeOn ? .red : Color(.systemGray4)) // Circle color
                
                    .opacity(0.2) // Circle opacity
                
                VStack {
                    
                    // Displays countNum as text inside of the circle
                    Text("\(countData.countNum)")
                        .font(.system(size: countData.countNum > 100_000 ? 30 : countData.countNum > 100 ? 40 : 75)) // Font info
                    
                        .fontWeight(.black) // Font
                    
                        .foregroundStyle(isNightModeOn ? .red : .text)
                        .padding(.vertical, -5)
                    
                    Text("\(clicksPerSecond)c/s")
                        .foregroundStyle(isNightModeOn ? .red.opacity(0.8) : .white)
                        .font(.caption)
                        .padding(.vertical, 5)
                        .padding(.horizontal, 9)
                        .background(isNightModeOn ? .red.opacity(0.3) : Color(.systemGray4))
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                }
            }
        }
    }
    
    // Function for button click sound
    func playKeyboardClickSound() {
        
        // Sets which sound
        let systemSoundID: SystemSoundID = 1104
        
        // plays the sound
        AudioServicesPlaySystemSound(systemSoundID)
    }
    
    func startTimer() {
        self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            self.clicksPerSecond = self.clickCount
            self.clickCount = 0
        }
    }
}


#Preview {
    
    MainButton()
        .environmentObject(CountData())
    
}
