//
//  LandingPage.swift
//  LetsBusk
//
//  Created by Abdulaziz Albahar on 11/11/22.
//

import SwiftUI

// Hide tab view when last screen appears?
struct LandingPage: View {
    @State var continuePressed = false
    
    var body: some View {
        
        TabView {
            OnboardView(systemImage: "Guitarist", title: "Connecting Local Artists", description: "“Yoga is the art work of awareness on the canvas of body, mind, and soul.”")
            OnboardView(systemImage: "Art", title: "Spreading Joy in Your Area", description: "“Art enables us to find ourselves and lose ourselves at the same time.”")
            
            VStack {
                OnboardView(systemImage: "Paint", title: "Join the Community", description: "“Creativity is contagious, pass it on.”")
                
                Button(action: {
                    withAnimation {
                        continuePressed = true
                    }
                }) {
                    Text("Continue").frame(minWidth: 200, minHeight: 60 ).background(.orange).cornerRadius(20).foregroundColor(.white).font(.system(size: 25, weight: .semibold, design: .rounded))
                }.shadow(radius: 1).padding(.top)
            }.navigationDestination(isPresented: $continuePressed) {
                    PostLandingPage().navigationBarBackButtonHidden(true)
            }
            
        }.tabViewStyle(.page(indexDisplayMode: .always)).indexViewStyle(.page(backgroundDisplayMode: .always))
    }
}

struct LandingPage_Previews: PreviewProvider {
    static var previews: some View {
        LandingPage()
    }
}
