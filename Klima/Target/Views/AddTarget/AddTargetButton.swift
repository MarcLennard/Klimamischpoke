//
//  AddTargetButton.swift
//  Klima
//
//  Created by Marc Lennard Vlaminck on 25.09.20.
//

import SwiftUI

struct AddTargetButton: View {
    @Binding var selectedTargets: Set<Target>
    var callback: (Set<Target>) -> Void
    
    @State private var displayAddTargets: Bool = false
    @EnvironmentObject private var targetStore: TargetStore
    
    var body: some View {
        Button(action: {
            displayAddTargets = true
        }, label: {
            Image(systemName: "filemenu.and.selection")
                .imageScale(.large)
        })
        .sheet(isPresented: $displayAddTargets, content: {
            AddTargetView(selectedTargets: $selectedTargets, callback: callback)
                .environmentObject(targetStore)
        })
    }
}

struct AddTargetButton_Previews: PreviewProvider {
    static var previews: some View {
        AddTargetButton(selectedTargets: .constant([])) { targets in
            print(targets)
        }
    }
}
