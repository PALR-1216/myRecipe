//
//  WebView.swift
//  MyRecipe
//
//  Created by Pedro Alejandro on 12/25/20.
//

import Foundation
import WebKit
import SwiftUI


struct WebView: UIViewRepresentable {
    var url: String
    
    func makeUIView(context: Context) -> WKWebView {
        guard let url = URL(string: url) else{return WKWebView()}
        let request = URLRequest(url: url)
        let webView = WKWebView()
        webView.load(request)
        return webView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}
