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
                                    ProgressBar(co2Progress: .constant(1.5), pointProgress: .constant(0.64))
                                    Spacer()
                                }
                                HStack {
                                    Text("50 Punkte")
                                        .foregroundColor(.orange)
                                    Divider()
                                    Text("2 kg CO² eingespart")
                                        .foregroundColor(.green)
                                }
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
