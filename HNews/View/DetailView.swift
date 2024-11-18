//
//  DetailView.swift
//  HNews
//
//  Created by Mohamed Selim on 04/11/2024.
//


import SwiftUI
import WebKit

struct DetailView: View {
    
    let url: String?
    
    var body: some View {
        WebView(urlString: url)
//            .edgesIgnoringSafeArea(.bottom) // للتأكد من أن الويب في ملء الشاشة


    }
}

#Preview {
    DetailView(url: "https://ww w.google.com")
}



