//
//  TargetView.swift
//  Klima
//
//  Created by Marc Lennard Vlaminck on 26.09.20.
//

import SwiftUI

struct TargetView: View {
    var target: Target
    
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Group {
                    switch target.category {
                    case "Energie":
                        Image(systemName: "bolt.fill")
                            .imageScale(.large)
                    case "Wäsche":
                        Image(systemName: "drop.fill")
                            .imageScale(.large)
                    case "Ernährung":
                        Image(systemName: "leaf.fill")
                            .imageScale(.large)
                    case "Mobilität":
                        Image(systemName: "bicycle")
                            .imageScale(.large)
                    case "Netzwerk":
                        Image(systemName: "person.3.fill")
                            .imageScale(.large)
                    case "Suffizienz":
                        Image(systemName: "wrench.and.screwdriver.fill")
                            .imageScale(.large)
                    default:
                        Image(systemName: "circle")
                            .imageScale(.large)
                    }
                }
                Spacer()
                if let points = target.points {
                    Text("\(points) Punkte")
                }
                
            }
            
            Text(target.title)
            
            HStack{
                Spacer()
                if let duration = target.duration {
                    Text("\(Int(duration * 7)) Tage")
                    .font(.system(size: 14))
                }
            }
                
        }
        .padding()
        .background(Rectangle().fill(LinearGradient(gradient: Gradient(colors: [Color.green, Color.orange]), startPoint: .leading, endPoint: .trailing)))
        .cornerRadius(10)
    }
}

struct TargetView_Previews: PreviewProvider {
    static var previews: some View {
        TargetView(target: Target(category: "Wäsche", title: "Nur bei 30 Grad", problem: nil, howTo: nil, achievment: nil, points: nil, co2Saving: nil, yearlyCo2Saving: nil, duration: nil, information: nil))
        .previewLayout(.fixed(width: 400, height: 500))
    }
}
