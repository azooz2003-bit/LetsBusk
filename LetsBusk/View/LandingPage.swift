//
//  LandingPage.swift
//  LetsBusk
//
//  Created by Abdulaziz Albahar on 11/11/22.
//

import SwiftUI

// Hide tab view when last screen appears?
struct LandingPage: View {
    var body: some View {
        NavigationStack {
            TabView {
                OnboardView(systemImage: "Guitarist", title: "Connecting Local Artists", description: "“Yoga is the art work of awareness on the canvas of body, mind, and soul.”")
                OnboardView(systemImage: "Art", title: "Spreading Joy in Your Area", description: "“Art enables us to find ourselves and lose ourselves at the same time.”")
                
                VStack {
                    OnboardView(systemImage: "Paint", title: "Join the Community", description: "“Creativity is contagious, pass it on.”")
                    
                    Button(action: {
                        
                    }) {
                        Text("Login").frame(minWidth: 345, minHeight: 60 ).background(.orange).cornerRadius(20).foregroundColor(.white).font(.system(size: 30, weight: .medium, design: .rounded))
                    }.shadow(radius: 3).padding(.top, 50)
                    
                    Button(action: {
                        
                    }) {
                        Text("Sign-up").frame(minWidth: 345, minHeight: 60 ).background(.orange).cornerRadius(20).foregroundColor(.white).font(.system(size: 30, weight: .medium, design: .rounded))
                    }.shadow(radius: 3)
                    
                    HStack {
                        Text("Not an artist?").font(.system(size: 18, weight: .semibold, design: .rounded))
                        Button(action: {
                            
                        }) {
                            Text("Click here.").font(.system(size: 18, weight: .semibold, design: .rounded)).foregroundColor(.orange)
                        }
                    }.padding(.top)
                }
                
            }.tabViewStyle(.page(indexDisplayMode: .always)).indexViewStyle(.page(backgroundDisplayMode: .always))
        }
        
    }
}

struct LandingPage_Previews: PreviewProvider {
    static var previews: some View {
        LandingPage()
    }
}
