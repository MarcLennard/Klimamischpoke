//
//  TargetView.swift
//  Klima
//
//  Created by Marc Lennard Vlaminck on 25.09.20.
//

import SwiftUI

struct TargetsView: View {
    @EnvironmentObject private var targetStore: TargetStore
    
    var body: some View {
        NavigationView {
            Group {
                    ScrollView {
                            VStack {
                                HStack {
                                    Spacer()
                                    ProgressBar(co2Progress: .constant(0.85), pointProgress: .constant(0.75))
                                    Spacer()
                                }
                                HStack {
                                    Text("Noch 1 Woche")
                                        .foregroundColor(.orange)
                                    Divider()
                                    Text("51 kg CO² eingespart")
                                        .foregroundColor(.green)
                                }
                                Text("234 Klimapunkte")
                            }
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(10)
                            .padding()
                            
                        if targetStore.selectedTargets.count == 0 {
                            Text("Du hast keine Ziele ausgesucht")
                        }
                        else {
                        LazyVStack {
                                ForEach(targetStore.selectedTargets.map { $0 }) { target in
                                    TargetView(target: target)
                                }
                            }
                        .padding()
                    }
                }
            }
            .navigationBarItems(trailing: AddTargetButton(selectedTargets: $targetStore.selectedTargets, callback: { targets in
                try? targetStore.setTargets(targets)
            }))
            .navigationTitle("Meine Ziele")

        }
    }
}

struct TargetsView_Previews: PreviewProvider {
    static var previews: some View {
        TargetsView()
            .environmentObject(TargetStore())
            .environment(\.colorScheme, .dark)
    }
}
