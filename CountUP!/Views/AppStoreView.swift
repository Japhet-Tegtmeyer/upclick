//
//  StoreView.swift
//  CountUP!
//
//  Created by Japhet Tegtmeyer on 10/28/23.
//

import SwiftUI

struct AppStoreView: View {
    
    @AppStorage("Count++") var CountPlusPlus: Bool = false
    
    @AppStorage("Countx4") var CountxFour: Bool = false
    
    @AppStorage("NightMode") var nightMode: Bool = false
    
    @AppStorage("NightModeOn") var isNightModeOn: Bool = false
    
    @EnvironmentObject private var countData: CountData
    
    @State private var showAlert = false
    
    @State private var showAPAlert = false
   
    var body: some View {
        
        NavigationView {
            
            ZStack {
                
                VStack {
                    
                    List {
                        
                        HStack {
                            
                            Image(systemName: "sparkles")
                                .foregroundColor(isNightModeOn ? .red : .purple)
                            
                                .imageScale(.large)
                            
                            VStack(alignment: .leading) {
                                
                                Text("Welcome to ClickStore")
                                    .font(.title2.weight(.semibold))
                                
                                Text("Purchase upgrades using clicks.")
                                    .font(.subheadline)
                                
                            }
                            
                            Spacer()
                            
                        }
                        
                        HStack {
                            
                            Image(systemName: "bag.fill")
                                .imageScale(.large)
                            
                                .foregroundStyle(isNightModeOn ? .red : .blue)
                            
                                .padding(8)
                            
                            
                            VStack(alignment: .leading) {
                                
                                Text("Count++")
                                    .font(.title3.weight(.semibold))
                                
                                Text("200% CPC*")
                                    .font(.subheadline)
                                
                                    .foregroundStyle(.gray)
                                
                                
                            }
                            
                            Spacer()
                            
                            Button {
                                
                                if CountPlusPlus == false {
                                    
                                    if countData.countNum > 5000 {
                                        
                                        CountPlusPlus = true
                                        
                                        countData.countNum -= 5000
                                        
                                    } else {
                                        
                                        showAlert = true
                                        
                                    }
                                    
                                } else {
                                    
                                }
                                
                            } label: {
                                
                                if CountPlusPlus == true {
                                    
                                    Image(systemName: "checkmark.circle")
                                        .foregroundColor(isNightModeOn ? .red : .green)
                                    
                                        .imageScale(.large)
                                    
                                } else {
                                    
                                    ZStack {
                                        
                                        Capsule()
                                            .frame(width: 70, height: 30)
                                        
                                            .foregroundStyle(isNightModeOn ? .red : .blue)
                                        
                                        Text("5,000c")
                                            .font(.headline.weight(.bold))
                                        
                                            .foregroundStyle(.white)
                                        
                                    }
                                    
                                }
                                
                            }
                            .alert(isPresented: $showAlert) {
                                
                                Alert(title: Text("Purchase Declined"),
                                      
                                      message: Text("Inadequate funds"),
                                      
                                      dismissButton: .default(Text("OK")))
                                
                            }
                            
                        }
                        
                        HStack {
                            
                            Image(systemName: "bag.fill")
                                .imageScale(.large)
                            
                                .foregroundStyle(isNightModeOn ? .red : .blue)
                            
                                .padding(8)
                            
                            VStack(alignment: .leading) {
                                
                                Text("Countx4")
                                    .font(.title3.weight(.semibold))
                                
                                Text("400% CPC*")
                                    .font(.subheadline)
                                
                                    .foregroundStyle(.gray)
                                
                            }
                            
                            Spacer()
                            
                            Button {
                                
                                if CountxFour == false {
                                    
                                    if countData.countNum > 10000 {
                                        
                                        CountxFour = true
                                        
                                        countData.countNum -= 10000
                                        
                                    } else {
                                        
                                        showAlert = true
                                        
                                    }
                                    
                                } else {
                                    
                                }
                                
                            } label: {
                                
                                if CountxFour == true {
                                    
                                    Image(systemName: "checkmark.circle")
                                        .foregroundColor(isNightModeOn ? .red : .green)
                                    
                                        .imageScale(.large)
                                    
                                } else {
                                    
                                    ZStack {
                                        
                                        Capsule()
                                            .frame(width: 80, height: 30)
                                        
                                            .foregroundStyle(isNightModeOn ? .red : .blue)
                                        
                                        Text("10,000c")
                                            .font(.headline.weight(.bold))
                                        
                                            .foregroundStyle(.white)
                                        
                                    }
                                    
                                }
                                
                            }
                            .alert(isPresented: $showAlert) {
                                
                                Alert(title: Text("Purchase Declined"),
                                      
                                      message: Text("Inadequate funds"),
                                      
                                      dismissButton: .default(Text("OK")))
                            }
                            
                        }
                        
                        HStack {
                            
                            Image(systemName: "bag.fill")
                                .imageScale(.large)
                            
                                .foregroundStyle(isNightModeOn ? .red : .blue)
                            
                                .padding(8)
                            
                            VStack(alignment: .leading) {
                                
                                Text("Night Mode")
                                    .font(.title3.weight(.semibold))
                                
                                Text("Unlock night mode")
                                    .font(.subheadline)
                                
                                    .foregroundStyle(.gray)
                                
                            }
                            
                            Spacer()
                            
                            Button {
                                
                                if nightMode == false {
                                    
                                    if countData.countNum > 3000 {
                                        
                                        nightMode = true
                                        
                                        countData.countNum -= 3000
                                        
                                    } else {
                                        
                                        showAlert = true
                                        
                                    }
                                    
                                } else {
                                    
                                }
                                
                            } label: {
                                
                                if nightMode == true {
                                    
                                    Image(systemName: "checkmark.circle")
                                        .foregroundColor(isNightModeOn ? .red : .green)
                                    
                                        .imageScale(.large)
                                    
                                } else {
                                    
                                    ZStack {
                                        
                                        Capsule()
                                            .frame(width: 80, height: 30)
                                        
                                            .foregroundStyle(isNightModeOn ? .red : .blue)
                                        
                                        Text("3,000c")
                                            .font(.headline.weight(.bold))
                                        
                                            .foregroundStyle(.white)
                                        
                                    }
                                    
                                }
                                
                            }
                            .alert(isPresented: $showAlert) {
                                
                                Alert(title: Text("Purchase Declined"),
                                      
                                      message: Text("Inadequate funds"),
                                      
                                      dismissButton: .default(Text("OK")))
                            }
                            
                        }
                        
                        Text("*CPC == Counts Per Click")
                            .font(.caption2.weight(.semibold))
                        
                            .foregroundStyle(.gray)
                        
                    }
                    .modifier(ListBackgroundModifier())
                    
                }
                
            }
            .background(isNightModeOn ? .black : Color(.background))
            
            .foregroundStyle(isNightModeOn ? .red : .text)
            
            .navigationTitle("Store")
            
            .navigationBarTitleDisplayMode(.inline)
            
            .toolbar {
                
                ToolbarItem(placement: .topBarTrailing) {
                    
                    Text("\(countData.countNum)c")
                        .font(.headline)
                    
                        .padding(5)
                    
                        .padding(.horizontal, 8)
                    
                        .background(isNightModeOn ? .red : .blue)
                    
                        .foregroundStyle(.white)
                    
                        .clipShape(Capsule())
                    
                }
            }
        }
    }
}

#Preview {
    
    AppStoreView()
        .environmentObject(CountData())
    
}
