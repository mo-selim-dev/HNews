//
//  VisualEffectBlur.swift
//  HNews
//
//  Created by Mohamed Selim on 08/11/2024.
//
import SwiftUI

// UIViewRepresentable لـ Blur Effect
struct VisualEffectBlur: UIViewRepresentable {
    var style: UIBlurEffect.Style
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: style))
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: style)
    }
}
