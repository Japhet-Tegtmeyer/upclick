//
//  SettingsSheet.swift
//  CountUP!
//
//  Created by Japhet Tegtmeyer on 10/23/23.
//

import SwiftUI
import StoreKit

struct SettingsSheet: View {
    
    @Environment(\.dismiss) var dismiss
    
    @EnvironmentObject var countData: CountData
    
    @State private var showAlert = false
    
    let firstDownloadKey = "FirstDownloadDate"
    
    @AppStorage("SoundToggle") var soundIsOn = true
    
    @AppStorage("Haptics") var hapticsIsOn = true
    
    @AppStorage("Discovery") var didFindDedication: Bool = false
    
    @AppStorage("Snarky") var isSnarky: Bool = true
    
    @AppStorage("Clicks") var lifetimeClicks: Int = 0
    
    @AppStorage("NightMode") var nightMode: Bool = false
    
    @AppStorage("NightModeOn") var isNightModeOn: Bool = false
    
    @AppStorage("Count++") var CountPlusPlus: Bool = false
    
    @AppStorage("Countx4") var CountxFour: Bool = false

    var body: some View {
        
        NavigationView {
            
            ScrollView(showsIndicators: false) {
                
                VStack(spacing: 4) {
                    
                    Image("Icon")
                        .resizable()
                    
                        .frame(width: 100, height: 100)
                    
                        .cornerRadius(20)
                    
                        .padding(4)
                    
                        .padding(.top, 50)
                    

                    Text("UpClick")
                        .font(.title)
                    
                        .bold()

                    Text("Built in my basement.")
                        .font(.subheadline.weight(.semibold))
                    
                        .foregroundStyle(.gray)

                    Text("v1.4.5")
                        .font(.caption2)
                    
                        .foregroundStyle(.gray)
                    
                        .padding(4)
                    
                    VStack {
                        
                        Toggle(isOn: $soundIsOn) {
                            
                            Label("Sounds", systemImage: soundIsOn ? "speaker.wave.2.fill" : "speaker.slash.fill")
                            
                        }
                        
                        Divider()
                        
                        Toggle(isOn: $hapticsIsOn) {
                            
                            Label("Haptics", systemImage: hapticsIsOn ? "iphone.gen2.radiowaves.left.and.right" : "iphone.gen2.slash")
                            
                        }
                        
                        Divider()
                        
                        Toggle(isOn: $isSnarky) {
                            
                            Label("Snarky", systemImage: "person.2.wave.2")
                            
                        }
                        
                        if nightMode == true {
                            Divider()
                            
                            Toggle(isOn: $isNightModeOn) {
                                
                                Label("NightMode", systemImage: "moon.haze.fill")
                                
                            }
                        }
                        
                    }
                    .padding()
                    
                    .background(Color(.systemGray5))
                    
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    
                    .padding(.horizontal)
                    
                    .padding(.top)
                    
                    VStack(alignment: .leading) {
                        
                        HStack {
                            
                            Text("Stats")
                            
                            Spacer()
                            
                        }
                        
                    }
                    .font(.headline)
                    
                    .padding(.top)
                    
                    .padding(.horizontal)

                    VStack {
                        
                        HStack {
                            
                            Image(systemName: "square.and.arrow.down.fill")
                            
                            Text("First Install")
                            
                            Spacer()
                            
                            Text(getFirstDownloadDate() ?? "Unknown")
                            
                        }
                        .padding(.horizontal, 3)
                        
                        .padding(.bottom, 8)
                        
                        
                        Divider()
                        
                        HStack {
                            
                            Image(systemName: "cursorarrow.click.2")
                            
                            Text("Lifetime Clicks")
                            
                            Spacer()
                            
                            Text("\(lifetimeClicks)")
                            
                        }
                        .padding(.horizontal, 3)
                        
                        .padding(.horizontal, 3)
                        
                        .padding(.top, 8)
                        
                    }
                    .font(.subheadline)
                    
                    .padding()
                    
                    .background(Color(.systemGray5))
                    
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    
                    .padding(.horizontal)
                    
                    VStack(alignment: .leading) {
                        
                        HStack {
                            
                            Text("Misc")
                            
                            Spacer()
                            
                        }
                        
                    }
                    .font(.headline)
                    .padding(.top)
                    .padding(.horizontal)

                    Button {
                        
                        requestReviews()
                        
                    } label: {
                        
                        HStack {
                            
                            HStack {
                                
                                Image(systemName: "star.fill")
                                
                                Text("Review The App")
                                
                            }
                            .padding()
                            .foregroundStyle(isNightModeOn ? .red : .blue)

                            Spacer()
                            
                        }
                        .frame(maxWidth: .infinity)
                        
                        .background(isNightModeOn ? .red.opacity(0.3) : .blue.opacity(0.3))
                        
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        
                        .padding(.horizontal)
                        
                    }
                    
                    Button {
                        
                        if let url = URL(string: "https://testflight.apple.com/join/fBbp5bYh") {
                            
                            UIApplication.shared.open(url)
                            
                        }
                        
                    } label: {
                        
                        HStack {
                            
                            Image(systemName: "shield.lefthalf.filled")
                            
                            Text("Join Beta")
                            
                        }
                        .padding()
                        
                        .foregroundStyle(isNightModeOn ? .red : .purple)
                        
                        Spacer()
                        
                    }
                    .frame(maxWidth: .infinity)
                    
                    .background(isNightModeOn ? .red.opacity(0.3) : .purple.opacity(0.3))
                    
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    
                    .padding([.horizontal])
                    
                    .padding(.top, 8)
                    
                    Button(action: {
                        
                        showAlert = true
                        
                    }) {
                        
                        HStack {
                            
                            HStack {
                                
                                Image(systemName: "exclamationmark.triangle.fill")
                                
                                Text("Self-Destruct")
                                    .fontWeight(.semibold)
                                
                            }
                            .foregroundStyle(.red)
                            
                            .padding()

                            Spacer()
                        }
                        .frame(maxWidth: .infinity)
                        
                        .background(.red.opacity(0.3))
                        
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        
                        .padding(.horizontal)
                        
                        .padding(.top, 8)
                        
                    }
                    .padding(.bottom)
                    
                    .alert(isPresented: $showAlert) {
                        Alert(
                            
                            title: Text("Confirm Action"),
                            
                            message: Text("Are you sure you want to destroy your streak? This will delete any streak or purchase made with clicks. This action cannot be undone."),
                            
                            primaryButton: .default(Text("Yes")) {
                                
                                countData.countNum = 0
                                
                                CountPlusPlus = false
                                
                                CountxFour = false
                                
                                nightMode = false
                                
                                isNightModeOn = false
                                
                            },
                            
                            secondaryButton: .cancel()
                            
                        )
                        
                    }

                    Spacer(minLength: 500)

                    Image(systemName: "desktopcomputer")
                        .imageScale(.small)
                    
                        .foregroundStyle(.gray)

                    Text("Dedicated to 7th Period IST")
                        .font(.caption2)
                    
                        .foregroundStyle(.gray)
                    
                        .onTapGesture {
                            
                            didFindDedication = true
                            
                        }
                    
                }
                .foregroundStyle(.text)
                
            }
            .navigationTitle("Settings")
            
            .navigationBarTitleDisplayMode(.inline)
            
        }
        
    }

    func requestReviews() {
        
        SKStoreReviewController.requestReview()
        
    }

    func getFirstDownloadDate() -> String? {
        
        let userDefaults = UserDefaults.standard

        if let firstDownloadDate = userDefaults.object(forKey: firstDownloadKey) as? Date {
            
            let dateFormatter = DateFormatter()
            
            dateFormatter.dateStyle = .medium
            
            dateFormatter.timeStyle = .none
            
            return dateFormatter.string(from: firstDownloadDate)
            
        } else {
            
            let firstDownloadDate = Date()
            
            userDefaults.set(firstDownloadDate, forKey: firstDownloadKey)
            
            return nil
            
        }
        
    }

    func getDaysUsed() -> String {
        
        let userDefaults = UserDefaults.standard

        if let firstDownloadDate = userDefaults.object(forKey: firstDownloadKey) as? Date {
            
            let calendar = Calendar.current
            
            let currentDate = Date()
            
            let dateComponents = calendar.dateComponents([.day], from: firstDownloadDate, to: currentDate)
            
            if let days = dateComponents.day {
                
                return "\(days) days"
                
            }
            
        }

        return "Unknown"
    }
    
}

#Preview {
    
    SettingsSheet()
        .environmentObject(CountData())
    
}
