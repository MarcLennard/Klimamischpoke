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
                                HStack{
                                    Text("Silke Haller")
                                        .bold()
                                    Spacer()
                                }
                                .padding()
                                
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
                            
                        
                            Link(destination: URL(string: "https://uba.co2-rechner.de/de_DE/living-hs#panel-calc")!) {
                                HStack {
                                    Spacer()
                                    Text("CO² Rechner des Umweltbundesamts")
                                    .foregroundColor(.white)
                                        .padding()
                                    Spacer()
                                }
                            }
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(10)
                            .padding(.horizontal)
                            
                        
                        
                        
                            if targetStore.selectedTargets.count == 0 {
                                Text("Du hast keine Ziele ausgesucht")
                            }
                            else {
                            LazyVStack {
                                    ForEach(targetStore.selectedTargets.map { $0 }) { target in
                                        Button(action: {
                                            notification()
                                        }, label: {
                                            TargetView(target: target)
                                        })
                                        .buttonStyle(PlainButtonStyle())
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
    
    private func notification() {
        let content = UNMutableNotificationContent()
        content.title = "Wöchentliche Abfrage"
        content.body = "Eine neue Abfrage für dein Ziel ist da!"
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        let uuidString = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuidString,
                    content: content, trigger: trigger)

        // Schedule the request with the system.
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.add(request) { (error) in
           if error != nil {
            print(error)
           }
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
