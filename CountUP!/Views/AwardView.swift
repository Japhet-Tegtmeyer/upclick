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
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .topTrailing) {
                List {
                    HStack {
                        Image(systemName: "medal")
                            .imageScale(.large)
                            .foregroundStyle(countData.countNum >= 1 ? .primaryC : .gray)
                        
                        VStack(alignment: .leading) {
                            Text("First")
                                .font(.headline)
                                .foregroundStyle(countData.countNum >= 1 ? .text : .gray)
                            
                            Text("Start off your streak")
                                .font(.subheadline)
                                .foregroundStyle(countData.countNum >= 1 ? .text : .gray)
                        }
                        
                        Spacer()
                        
                        if countData.countNum >= 1 {
                            Image(systemName: "checkmark.circle")
                                .foregroundStyle(.green)
                                .imageScale(.large)
                        } else {
                            Text("")
                        }
                    }
                    .padding(8)
                    
                    HStack {
                        Image(systemName: "medal")
                            .imageScale(.large)
                            .foregroundStyle(countData.countNum >= 100 ? .primaryC : .gray)
                        
                        VStack(alignment: .leading) {
                            Text("Centennial")
                                .font(.headline)
                                .foregroundStyle(countData.countNum >= 100 ? .text : .gray)
                            
                            Text("Reach 100")
                                .font(.subheadline)
                                .foregroundStyle(countData.countNum >= 100 ? .text : .gray)
                        }
                        
                        Spacer()
                        
                        if countData.countNum >= 100 {
                            Image(systemName: "checkmark.circle")
                                .foregroundStyle(.green)
                                .imageScale(.large)
                        } else {
                            Text("")
                        }
                    }
                    .padding(8)
                    
                    HStack {
                        Image(systemName: "medal")
                            .imageScale(.large)
                            .foregroundStyle(countData.countNum > 1000 ? .primaryC : .gray)
                        
                        VStack(alignment: .leading) {
                            Text("Millennial")
                                .font(.headline)
                            
                                .foregroundStyle(countData.countNum > 1000 ? .text : .gray)
                            Text("Reach 1,000")
                                .font(.subheadline)
                                .foregroundStyle(countData.countNum > 1000 ? .text : .gray)
                        }
                        
                        Spacer()
                        
                        if countData.countNum >= 1000 {
                            Image(systemName: "checkmark.circle")
                                .foregroundStyle(.green)
                                .imageScale(.large)
                        } else {
                            Text("")
                        }
                    }
                    .padding(8)
                    
                    HStack {
                        Image(systemName: "medal")
                            .imageScale(.large)
                            .foregroundStyle(countData.countNum >= 10000 ? .primaryC : .gray)
                        
                        VStack(alignment: .leading) {
                            Text("Tenmillennial")
                                .font(.headline)
                            
                                .foregroundStyle(countData.countNum >= 10000 ? .text : .gray)
                            Text("Reach 10,000")
                                .font(.subheadline)
                                .foregroundStyle(countData.countNum >= 10000 ? .text : .gray)
                        }
                        
                        Spacer()
                        
                        if countData.countNum >= 10000 {
                            Image(systemName: "checkmark.circle")
                                .foregroundStyle(.green)
                                .imageScale(.large)
                        } else {
                            Text("")
                        }
                    }
                    .padding(8)
                    
                    HStack {
                        Image(systemName: "medal")
                            .imageScale(.large)
                            .foregroundStyle(countData.countNum >= 20000 ? .primaryC : .gray)
                        
                        VStack(alignment: .leading) {
                            Text("Twenmillennial")
                                .font(.headline)
                            
                                .foregroundStyle(countData.countNum >= 20000 ? .text : .gray)
                            Text("Reach 20,000")
                                .font(.subheadline)
                                .foregroundStyle(countData.countNum >= 20000 ? .text : .gray)
                        }
                        
                        Spacer()
                        
                        if countData.countNum >= 20000 {
                            Image(systemName: "checkmark.circle")
                                .foregroundStyle(.green)
                                .imageScale(.large)
                        } else {
                            Text("")
                        }
                    }
                    .padding(8)
                    
                    HStack {
                        Image(systemName: "medal")
                            .imageScale(.large)
                            .foregroundStyle(didFindDedication ? .primaryC : .gray)
                        
                        VStack(alignment: .leading) {
                            Text(didFindDedication ? "Dedication" : "???")
                                .font(.headline)
                            
                                .foregroundStyle(didFindDedication ? .text : .gray)
                            Text(didFindDedication ? "Find dedication" : "??????")
                                .font(.subheadline)
                                .foregroundStyle(didFindDedication ? .text : .gray)
                        }
                        
                        Spacer()
                        
                        if didFindDedication {
                            Image(systemName: "checkmark.circle")
                                .foregroundStyle(.green)
                                .imageScale(.large)
                        } else {
                            Text("")
                        }
                    }
                    .padding(8)


                }
                .modifier(ListBackgroundModifier())
                .background(Color(.background))
                .navigationTitle("Achievements")
                .navigationViewStyle(.stack)
                .foregroundStyle(.text)
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
