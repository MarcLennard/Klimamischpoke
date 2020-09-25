//
//  TargetView.swift
//  Klima
//
//  Created by Marc Lennard Vlaminck on 25.09.20.
//

import SwiftUI

struct AddTargetView: View {
    @Binding var selectedTargets: Set<Target>
    var callback: (Set<Target>) -> Void
    @EnvironmentObject private var targetStore: TargetStore
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 150, maximum: 150))], spacing: 10){
                    ForEach(targetStore.targets) { target in
                        Button(action: {
                            if selectedTargets.contains(target) {
                                selectedTargets.remove(target)
                            }
                            else {
                                selectedTargets.insert(target)
                            }
                        }, label: {
                            TargetSelectItem(isSelected: selectedTargets.contains(target), target: target)
                        })
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding(.horizontal)
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("Ziele")
            .navigationBarItems(leading: Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Text("Abbrechen")
            }), trailing: Button(action: {
                callback(selectedTargets)
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Text("Auswählen")
            }))
        }
    }
}

struct AddTargetView_Previews: PreviewProvider {
    static var previews: some View {
        AddTargetView(selectedTargets: .constant([]), callback: { targets in
            print(targets)
        })
        .environmentObject(TargetStore())
    }
}
