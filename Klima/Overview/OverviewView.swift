//
//  OverviewView.swift
//  Klima
//
//  Created by Marc Lennard Vlaminck on 25.09.20.
//

import SwiftUI

struct OverviewView: View {
    @State private var progress = 0.5
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Mein Ziel")) {
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
                            Text("2 kg CO₂ eingespart")
                                .foregroundColor(.green)
                        }
                    }
                }
                
                Section(header: header) {
                    HStack {
                        Image(systemName: "bicycle.circle.fill")
                            .imageScale(.large)
                        VStack(alignment: .leading) {
                            Text("5km")
                            Text("5kg CO₂ eingespart")
                                .font(.subheadline)
                                .foregroundColor(.green)
                        }
                        Spacer()
                        Text("+5")
                            .bold()
                            .foregroundColor(.orange)
                    }
                    HStack {
                        Image(systemName: "leaf.fill")
                            .imageScale(.large)
                        VStack(alignment: .leading) {
                            Text("Vegan gegessen")
                            Text("5kg CO₂ eingespart")
                                .font(.subheadline)
                                .foregroundColor(.green)
                        }
                        Spacer()
                        Text("+5")
                            .bold()
                            .foregroundColor(.orange)
                    }
                    HStack {
                        Image(systemName: "cart.fill")
                            .imageScale(.large)
                        VStack(alignment: .leading) {
                            Text("Auf dem Markt eingekauft")
                            Text("5kg CO₂ eingespart")
                                .font(.subheadline)
                                .foregroundColor(.green)
                        }
                        Spacer()
                        Text("+5")
                            .bold()
                            .foregroundColor(.orange)
                    }
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("Übersicht")
            .navigationBarItems(trailing: AddActivityButton())
        }
    }
    
    var header: some View {
        HStack {
            Text("Aktivitäten")
            Spacer()
            
        }
    }
}

struct OverviewView_Previews: PreviewProvider {
    static var previews: some View {
        OverviewView()
            .environment(\.colorScheme, .dark)
    }
}
