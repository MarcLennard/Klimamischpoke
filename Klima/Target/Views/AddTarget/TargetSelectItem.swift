//
//  TargetSelectItem.swift
//  Klima
//
//  Created by Marc Lennard Vlaminck on 25.09.20.
//

import SwiftUI

struct TargetSelectItem: View {
    var isSelected: Bool
    
    var target: Target
    
    var body: some View {
        VStack {
            HStack {
                if isSelected {
                    Image(systemName: "checkmark.circle.fill")
                        .imageScale(.large)
                }
                else {
                    Image(systemName: "circle")
                        .imageScale(.large)
                }
                Spacer()
                if let points = target.points {
                    Text("\(points) Punkte")
                }
            }
            
            Group {
                switch target.category {
                case "Energie":
                    Image(systemName: "bolt.fill")
                        .resizable()
                case "Wäsche":
                    Image(systemName: "drop.fill")
                        .resizable()
                case "Ernährung":
                    Image(systemName: "leaf.fill")
                        .resizable()
                case "Mobilität":
                    Image(systemName: "bicycle")
                        .resizable()
                case "Netzwerk":
                    Image(systemName: "person.3.fill")
                        .resizable()
                case "Suffizienz":
                    Image(systemName: "wrench.and.screwdriver.fill")
                        .resizable()
                default:
                    Image(systemName: "circle")
                        .resizable()
                }
            }
            .scaledToFit()
            .frame(height: 50)
            .padding()
            
            Text(target.title)
            Spacer()
        }
        .padding()
        .background(Color.gray.opacity(0.5))
        .cornerRadius(10)
    }
}

struct TargetSelectItem_Previews: PreviewProvider {
    static var previews: some View {
        TargetSelectItem(
            isSelected: true,
            target: Target(category: "Wäsche", title: "Nur bei 30 Grad", problem: nil, howTo: nil, achievment: nil, points: nil, co2Saving: nil, yearlyCo2Saving: nil, duration: nil, information: nil))
            .previewLayout(.fixed(width: 400, height: 500))
    }
}
