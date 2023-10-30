//
//  ContentView.swift
//  CountUP!
//
//  Created by Japhet Tegtmeyer on 10/23/23.
//

import SwiftUI
import AudioToolbox

class CountData: ObservableObject {
    @Published var countNum: Int = UserDefaults.standard.integer(forKey: "Tap")
}

struct ContentView: View {
    @EnvironmentObject private var countData: CountData
    @State private var sheetIsShowing = false
    @State private var showAlert = false
    @State private var isCountIncreased = false
    @State private var texts: String = "Loading..."
    @AppStorage("SoundToggle") var soundIsOn: Bool = true
    @AppStorage("Haptics") var hapticsIsOn: Bool = true
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            VStack {
                Text(texts)
                    .font(.title2.weight(.bold))
                    .onAppear(perform: fetchText)
                    .multilineTextAlignment(.center)
                    .frame(width: 350)
                    .foregroundColor(.primaryC)
                
                Button {
                    withAnimation {
                        countData.countNum += 1
                        UserDefaults.standard.set(countData.countNum, forKey: "Tap")

                        if soundIsOn == true {
                            playKeyboardClickSound()
                        }
                        
                        isCountIncreased.toggle()
                        
                        if hapticsIsOn == true {
                            if countData.countNum == 100 {
                                UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
                                
                                showAlert = true
                                
                            } else if countData.countNum == 1000 {
                                UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
                                
                                showAlert = true
                                
                            } else if countData.countNum == 10000 {
                                UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
                                
                                showAlert = true
                                
                            } else {
                                UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                                
                            }
                        }
                    }
                } label: {
                    
                    ZStack {
                        
                        Circle()
                            .stroke(lineWidth: 40)
                            .padding(50)
                            .foregroundColor(.primaryC)
                            .shadow(radius: 10)
                        
                        Circle()
                            .stroke(lineWidth: 2)
                            .padding(22)
                            .foregroundColor(.primaryC)
                            .opacity(0.7)
                        
                        Circle()
                            .stroke(lineWidth: 1.5)
                            .padding(12)
                            .foregroundColor(.primaryC)
                            .opacity(0.4)
                        
                        Circle()
                            .stroke(lineWidth: 1)
                            .padding(4)
                            .foregroundColor(.primaryC)
                            .opacity(0.2)
                        
                        Text("\(countData.countNum)")
                            .font(.system(size: countData.countNum > 100 ? 40 : 75))
                            .fontWeight(.black)
                    }
                }
            }
            .foregroundStyle(.text)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(.background))
            .ignoresSafeArea()
            .sheet(isPresented: $sheetIsShowing) {
                SettingsSheet()
            }
            
            Button {
                sheetIsShowing.toggle()
            } label: {
                Image(systemName: "gearshape.fill")
                    .imageScale(.large)
                    .padding(8)
                    .foregroundStyle(Color(.background))
                    .background(.primaryC)
                    .clipShape(Circle())
                    .padding()
                    .shadow(radius: 10)
            }
            
            Image("Circle")
                .resizable()
                .offset(y: 100)
                .opacity(0.5)
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Milestone Reached"),
                message: Text("You've reached \(countData.countNum)"),
                dismissButton: .default(Text("OK"))
            )
        }
    }
    
    func playKeyboardClickSound() {
        let systemSoundID: SystemSoundID = 1104
        
        AudioServicesPlaySystemSound(systemSoundID)
    }
    
    func fetchText() {
        let newText = TextManager.getRandomMessage()
        
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
