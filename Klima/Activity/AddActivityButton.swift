//
//  AddActivityButton.swift
//  Klima
//
//  Created by Marc Lennard Vlaminck on 25.09.20.
//

import SwiftUI

struct AddActivityButton: View {
    @State private var displayNewActions: Bool = false
    
    var body: some View {
        Button(action: {
            displayNewActions = true
        }, label: {
            Image(systemName: "plus.circle")
                .imageScale(.large)
        })
        .actionSheet(isPresented: $displayNewActions, content: {
            ActionSheet(title: Text("Neue Aktivität"), message: nil, buttons: [
                .default(Text("Transport")),
                .default(Text("Nahrung")),
                .cancel()
            ])
        })
    }
}

struct AddActivityButton_Previews: PreviewProvider {
    static var previews: some View {
        AddActivityButton()
    }
}
