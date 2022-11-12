//
//  OnboardView.swift
//  LetsBusk
//
//  Created by Abdulaziz Albahar on 11/11/22.
//

import SwiftUI

struct OnboardView: View {
    let systemImage: String
    let title: String
    let description: String
    
    var body: some View {
        VStack {
            Image(systemImage).resizable().scaledToFit().frame(width: 300, height: 300)
            Text(title).font(.system(size: 29, weight: .semibold, design: .rounded)).padding(.top)
            Text(description).multilineTextAlignment(.center).padding(.leading).padding(.trailing).padding(.top).foregroundColor(.secondary)
            
        }.padding(.horizontal, 15)
    }
}

struct OnboardView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardView(systemImage: "Guitarist", title: "yo", description: "uiwelehgiewfgu")
    }
}
