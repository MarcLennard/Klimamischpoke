//
//  SharingView.swift
//  Klima
//
//  Created by Marc Lennard Vlaminck on 25.09.20.
//

import SwiftUI

struct SharingView: View {
    var body: some View {
        NavigationView {
            List {
                HStack {
                    ProgressBar(co2Progress: .constant(1.5), pointProgress: .constant(0.64), size: .small)
                    VStack(alignment: .leading) {
                        Text("Max Mustermann")
                        Text("100 Punkte")
                            .foregroundColor(.orange)
                            .font(.headline)
                        Text("40 g CO² eingespart")
                            .foregroundColor(.green)
                            .font(.headline)
                    }
                }
                HStack {
                    ProgressBar(co2Progress: .constant(1.5), pointProgress: .constant(0.64), size: .small)
                    VStack(alignment: .leading) {
                        Text("Jane Doe")
                        Text("110 Punkte")
                            .foregroundColor(.orange)
                            .font(.headline)
                        Text("50 g CO² eingespart")
                            .foregroundColor(.green)
                            .font(.headline)
                    }
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationBarItems(trailing: Button(action: {}, label: {
                Image(systemName: "person.crop.circle.badge.plus")
            }))
            .navigationBarTitle("Freunde")
        }
    }
}

struct SharingView_Previews: PreviewProvider {
    static var previews: some View {
        SharingView()
    }
}
