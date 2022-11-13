//
//  PostLandingPage.swift
//  LetsBusk
//
//  Created by Abdulaziz Albahar on 11/11/22.
//

import SwiftUI

struct PostLandingPage: View {
    @EnvironmentObject var userVM: UserViewModel
    
    @State var loginPressed = false
    @State var signUpPressed = false
    @State var userPressed = false
    
    var body: some View {
        
        VStack {
            
            OnboardView(systemImage: "Paint", title: "Join the Community", description: "“Creativity is contagious, pass it on.”").padding(.top, 30)
            
            HStack {
                Rectangle().fill(Color.black).frame(width: 150, height: 1)
                
                Text("Artist").font(.system(size: 20, weight: .medium, design: .rounded))
                
                Rectangle().fill(Color.black).frame(width: 150, height: 1)
                
            }.padding(.top, 90)
            
            Button(action: {
                withAnimation {
                    loginPressed = true
                }
            }) {
                Text("Login").frame(minWidth: 345, minHeight: 60 ).background(.orange).cornerRadius(20).foregroundColor(.white).font(.system(size: 30, weight: .medium, design: .rounded))
            }.shadow(radius: 3).navigationDestination(isPresented: $loginPressed, destination: {
                LoginScreen().environmentObject(EventsViewModel(userVM: userVM, locManager: LocationManager()))
            })
            
            Button(action: {
                withAnimation {
                    signUpPressed = true
                }
            }) {
                Text("Sign-up").frame(minWidth: 345, minHeight: 60 ).background(.orange).cornerRadius(20).foregroundColor(.white).font(.system(size: 30, weight: .medium, design: .rounded))
            }.shadow(radius: 3).navigationDestination(isPresented: $signUpPressed, destination: {
                SignUpFirst().environmentObject(EventsViewModel(userVM: userVM, locManager: LocationManager()))
            })
                
            
            HStack {
                Text("Not an artist?").font(.system(size: 18, weight: .semibold, design: .rounded))
                Button(action: {
                    userPressed = true
                }) {
                    Text("Click here.").font(.system(size: 18, weight: .semibold, design: .rounded)).foregroundColor(.orange)
                }.navigationDestination(isPresented: $userPressed, destination: {
                    ArtistTabViewEntry().environmentObject(EventsViewModel(userVM: userVM, locManager: LocationManager()))
                })
            }.padding(.top, 20)
        }
    }
}

struct PostLandingPage_Previews: PreviewProvider {
    static var previews: some View {
        PostLandingPage().environmentObject(UserViewModel())
    }
}
