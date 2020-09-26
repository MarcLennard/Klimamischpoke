//
//  Question.swift
//  Klima
//
//  Created by Kevin Klaebe on 26.09.20.
//

import SwiftUI

struct Question: View {
    @State private var value: Int = 1
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    Text("Wie oft hast du in der letzten Woche mit 30 statt mit 40 Grad gewaschen?")
                    Stepper("\(value) Mal", value: $value)
                }
                
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("Abschicken")
                })
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("Fragebogen")
        }
    }
}

struct Question_Previews: PreviewProvider {
    static var previews: some View {
        Question()
    }
}
