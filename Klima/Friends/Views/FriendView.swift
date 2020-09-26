//
//  FriendView.swift
//  Klima
//
//  Created by Kevin Klaebe on 26.09.20.
//

import SwiftUI

struct FriendView: View {
    @State private var isExpanded: Bool = false
    var friend: Friend
    
    var body: some View {
        Section(header: Text(friend.name)) {
            HStack(alignment: .center) {
                ProgressBar(co2Progress: .constant(friend.co2progress), pointProgress: .constant(friend.pointProgress), size: .small)
                VStack(alignment: .leading) {
                    Text("\(friend.points) Punkte")
                        .foregroundColor(.orange)
                        .font(.headline)
                    Text("\(friend.co2Saving) kg CO² eingespart")
                        .foregroundColor(.green)
                        .font(.headline)
                }
                Spacer()
            }
            DisclosureGroup(isExpanded: $isExpanded) {
                VStack(spacing: 10){
                    ForEach(friend.targets) { target in
                        TargetView(target: target)
                    }
                }
            } label: {
                Text("Ziele")
                    .font(.headline)
            }
        }
    }
}

struct FriendView_Previews: PreviewProvider {
    static var previews: some View {
        FriendView(friend: Friend(name: "Max Mustermann",
                                  points: 15, co2Saving: 45, co2progress: 0.5, pointProgress: 0.4, targets: []))
    }
}
