//
//  AwardView.swift
//  CountUP!
//
//  Created by Japhet Tegtmeyer on 10/24/23.
//

import SwiftUI

struct AwardView: View {
    
    @EnvironmentObject var countData: CountData
    
    @State private var sheetIsShowing = false
    
    @AppStorage("Discovery") var didFindDedication: Bool = false
    
    @AppStorage("Count++") var CountPlusPlus: Bool = false
    
    @AppStorage("Countx4") var CountxFour: Bool = false
    
    @AppStorage("NightModeOn") var isNightModeOn: Bool = false
    
    var body: some View {
        
        NavigationView {
            
            ZStack(alignment: .topTrailing) {
                
                List {
                    
                    HStack {
                        
                        Image(systemName: "medal")
                            .imageScale(.large)
                        
                            .foregroundStyle(isNightModeOn ? countData.countNum >= 1 ? .red : .gray : countData.countNum >= 1 ? .blue : .gray)
                        
                        VStack(alignment: .leading) {
                            
                            Text("First")
                                .font(.headline)
                            
                                .foregroundStyle(isNightModeOn ? countData.countNum >= 1 ? .red : .gray : countData.countNum >= 1 ? .text : .gray)
                            
                            Text("Start off your streak")
                                .font(.subheadline)
                            
                                .foregroundStyle(isNightModeOn ? countData.countNum >= 1 ? .red : .gray : countData.countNum >= 1 ? .text : .gray)
                            
                        }
                        
                        Spacer()
                        
                        if countData.countNum >= 1 {
                            Image(systemName: "checkmark.circle")
                                .foregroundStyle(isNightModeOn ? .red : .green)
                            
                                .imageScale(.large)
                            
                        } else {
                            
                            Text("")
                            
                        }
                        
                    }
                    .padding(8)
                    
                    HStack {
                        
                        Image(systemName: "medal")
                            .imageScale(.large)
                        
                            .foregroundStyle(isNightModeOn ? countData.countNum >= 100 ? .red : .gray : countData.countNum >= 100 ? .blue : .gray)
                        
                        VStack(alignment: .leading) {
                            Text("Centennial")
                                .font(.headline)
                            
                                .foregroundStyle(isNightModeOn ? countData.countNum >= 100 ? .red : .gray : countData.countNum >= 100 ? .text : .gray)
                            
                            Text("Reach 100")
                                .font(.subheadline)
                            
                                .foregroundStyle(isNightModeOn ? countData.countNum >= 100 ? .red : .gray : countData.countNum >= 100 ? .text : .gray)
                        }
                        
                        Spacer()
                        
                        if countData.countNum >= 100 {
                            
                            Image(systemName: "checkmark.circle")
                                .foregroundStyle(isNightModeOn ? .red : .green)
                            
                                .imageScale(.large)
                            
                        } else {
                            
                            Text("")
                            
                        }
                    }
                    .padding(8)
                    
                    HStack {
                        
                        Image(systemName: "medal")
                            .imageScale(.large)
                        
                            .foregroundStyle(isNightModeOn ? countData.countNum > 1000 ? .red : .gray : countData.countNum > 1000 ? .blue : .gray)
                        
                        VStack(alignment: .leading) {
                            
                            Text("Millennial")
                                .font(.headline)
                            
                                .foregroundStyle(isNightModeOn ? countData.countNum > 1000 ? .red : .gray : countData.countNum > 1000 ? .text : .gray)
                            
                            Text("Reach 1,000")
                                .font(.subheadline)
                            
                                .foregroundStyle(isNightModeOn ? countData.countNum > 1000 ? .red : .gray : countData.countNum > 1000 ? .text : .gray)
                            
                        }
                        
                        Spacer()
                        
                        if countData.countNum >= 1000 {
                            
                            Image(systemName: "checkmark.circle")
                                .foregroundStyle(isNightModeOn ? .red : .green)
                            
                                .imageScale(.large)
                            
                        } else {
                            
                            Text("")
                            
                        }
                        
                    }
                    .padding(8)
                    
                    HStack {
                        
                        Image(systemName: "medal")
                            .imageScale(.large)
                        
                            .foregroundStyle(isNightModeOn ? countData.countNum >= 10000 ? .red : .gray : countData.countNum >= 10000 ? .blue : .gray)
                        
                        VStack(alignment: .leading) {
                            
                            Text("Tenmillennial")
                                .font(.headline)
                            
                                .foregroundStyle(isNightModeOn ? countData.countNum >= 10000 ? .red : .gray : countData.countNum >= 10000 ? .text : .gray)
                            
                            Text("Reach 10,000")
                                .font(.subheadline)
                            
                                .foregroundStyle(isNightModeOn ? countData.countNum >= 10000 ? .red : .gray : countData.countNum >= 10000 ? .text : .gray)
                            
                        }
                        
                        Spacer()
                        
                        if countData.countNum >= 10000 {
                            
                            Image(systemName: "checkmark.circle")
                                .foregroundStyle(isNightModeOn ? .red : .green)
                            
                                .imageScale(.large)
                            
                        } else {
                            
                            Text("")
                            
                        }
                    }
                    .padding(8)
                    
                    HStack {
                        
                        Image(systemName: "medal")
                            .imageScale(.large)
                        
                            .foregroundStyle(isNightModeOn ? countData.countNum >= 20000 ? .red : .gray : countData.countNum >= 20000 ? .blue : .gray)
                        
                        VStack(alignment: .leading) {
                            Text("Twenmillennial")
                                .font(.headline)
                            
                                .foregroundStyle(isNightModeOn ? countData.countNum >= 20000 ? .red : .gray : countData.countNum >= 20000 ? .text : .gray)
                            
                            Text("Reach 20,000")
                                .font(.subheadline)
                            
                                .foregroundStyle(isNightModeOn ? countData.countNum >= 20000 ? .red : .gray : countData.countNum >= 20000 ? .text : .gray)
                            
                        }
                        
                        Spacer()
                        
                        if countData.countNum >= 20000 {
                            
                            Image(systemName: "checkmark.circle")
                                .foregroundStyle(isNightModeOn ? .red : .green)
                            
                                .imageScale(.large)
                            
                        } else {
                            
                            Text("")
                            
                        }
                        
                    }
                    .padding(8)
                    
                    HStack {
                        
                        Image(systemName: "medal")
                            .imageScale(.large)
                        
                            .foregroundStyle(isNightModeOn ? CountPlusPlus || CountxFour ? .red : .gray : CountPlusPlus || CountxFour ? .blue : .gray)
                        
                        VStack(alignment: .leading) {
                            Text("Upgraded")
                                .font(.headline)
                            
                                .foregroundStyle(isNightModeOn ? CountPlusPlus || CountxFour ? .red : .gray : CountPlusPlus || CountxFour ? .text : .gray)
                            
                            Text("Buy an upgrade")
                                .font(.subheadline)
                            
                                .foregroundStyle(isNightModeOn ? CountPlusPlus || CountxFour ? .red : .gray : CountPlusPlus || CountxFour ? .text : .gray)
                        }
                        
                        Spacer()
                        
                        if CountPlusPlus || CountxFour {
                            
                            Image(systemName: "checkmark.circle")
                                .foregroundStyle(isNightModeOn ? .red : .green)
                            
                                .imageScale(.large)
                            
                        } else {
                            
                            Text("")
                            
                        }
                        
                    }
                    .padding(8)

                    
                    HStack {
                        
                        Image(systemName: "medal")
                            .imageScale(.large)
                        
                            .foregroundStyle(isNightModeOn ? didFindDedication ? .red : .gray : didFindDedication ? .blue : .gray)
                        
                        VStack(alignment: .leading) {
                            
                            Text(didFindDedication ? "Dedication" : "???")
                                .font(.headline)
                            
                                .foregroundStyle(isNightModeOn ? didFindDedication ? .red : .gray : didFindDedication ? .text : .gray)
                            
                            Text(didFindDedication ? "Find dedication" : "??????")
                                .font(.subheadline)
                            
                                .foregroundStyle(isNightModeOn ? didFindDedication ? .red : .gray : didFindDedication ? .text : .gray)
                        }
                        
                        Spacer()
                        
                        if didFindDedication {
                            
                            Image(systemName: "checkmark.circle")
                                .foregroundStyle(isNightModeOn ? .red : .green)
                            
                                .imageScale(.large)
                            
                        } else {
                            
                            Text("")
                            
                        }
                        
                    }
                    .padding(8)

                }
                .modifier(ListBackgroundModifier())
                
                .background(isNightModeOn ? .black : Color(.background))
                
                .navigationTitle("Achievements")
                
                .navigationBarTitleDisplayMode(.inline)
                
                .navigationViewStyle(.stack)
                
                .foregroundStyle(isNightModeOn ? .red : .text)
                
            }
            .navigationViewStyle(.stack)
            
        }
        
    }
    
}

struct ListBackgroundModifier: ViewModifier {

    @ViewBuilder
    
    func body(content: Content) -> some View {
        
        if #available(iOS 16.0, *) {
            
            content
                .scrollContentBackground(.hidden)
            
        } else {
            
            content
            
        }
        
    }
    
}

#Preview {
    
    AwardView()
        .environmentObject(CountData())
    
}
