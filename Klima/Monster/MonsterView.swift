//
//  MonsterView.swift
//  Klima
//
//  Created by Kevin Klaebe on 26.09.20.
//

import SwiftUI
import WebKit

struct MonsterView: View {
    var body: some View {
        NavigationView {
            WebView(url: .constant(URL(string: "https://jamesjoyce92.github.io/svenkonning/")!))
                .navigationTitle("Münster")
        }
    }
}

struct WebView: UIViewRepresentable {
    @Binding var url: URL
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        var request = URLRequest(url: url)
        request.cachePolicy = URLRequest.CachePolicy.returnCacheDataElseLoad
        uiView.load(request)
    }
    
    typealias UIViewType = WKWebView
    
    
}

struct MonsterView_Previews: PreviewProvider {
    static var previews: some View {
        MonsterView()
    }
}
