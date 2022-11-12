//
//  PostLandingPage.swift
//  LetsBusk
//
//  Created by Abdulaziz Albahar on 11/11/22.
//

import SwiftUI

struct PostLandingPage: View {
    @State var loginPressed = false
    @State var signUpPressed = false
    
    var body: some View {
        
        VStack {
            
            OnboardView(systemImage: "Paint", title: "Join the Community", description: "“Creativity is contagious, pass it on.”")
            
            HStack {
                Rectangle().fill(Color.black).frame(width: 150, height: 1)
                
                Text("Artist").font(.system(size: 20, weight: .medium, design: .rounded))
                
                Rectangle().fill(Color.black).frame(width: 150, height: 1)
                
            }.padding(.top, 50)
            
            Button(action: {
                withAnimation {
                    loginPressed = true
                }
            }) {
                Text("Login").frame(minWidth: 345, minHeight: 60 ).background(.orange).cornerRadius(20).foregroundColor(.white).font(.system(size: 30, weight: .medium, design: .rounded))
            }.shadow(radius: 3).navigationDestination(isPresented: $loginPressed, destination: {
                EmptyView()
            })
            
            Button(action: {
                withAnimation {
                    signUpPressed = true
                }
            }) {
                Text("Sign-up").frame(minWidth: 345, minHeight: 60 ).background(.orange).cornerRadius(20).foregroundColor(.white).font(.system(size: 30, weight: .medium, design: .rounded))
            }.shadow(radius: 3).navigationDestination(isPresented: $signUpPressed, destination: {
                SignUpFirst()
            })
                
            
            HStack {
                Text("Not an artist?").font(.system(size: 18, weight: .semibold, design: .rounded))
                Button(action: {
                    
                }) {
                    Text("Click here.").font(.system(size: 18, weight: .semibold, design: .rounded)).foregroundColor(.orange)
                }
            }.padding(.top)
        }
    }
}

struct PostLandingPage_Previews: PreviewProvider {
    static var previews: some View {
        PostLandingPage()
    }
}
