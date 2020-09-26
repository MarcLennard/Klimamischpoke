//
//  SharingView.swift
//  Klima
//
//  Created by Marc Lennard Vlaminck on 25.09.20.
//

import SwiftUI

struct SharingView: View {
    @EnvironmentObject private var friendStore: FriendStore

    
    var body: some View {
        NavigationView {
            List {
                ForEach(friendStore.friends) { friend in
                    FriendView(friend: friend)
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
            .environment(\.colorScheme, .dark)
    }
}
