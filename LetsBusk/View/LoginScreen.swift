//
//  LoginScreen.swift
//  LetsBusk
//
//  Created by Abdulaziz Albahar on 11/12/22.
//

import SwiftUI

struct LoginScreen: View {
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        VStack {
            Text("Login").font(.system(size: 32, weight: .semibold, design: .rounded)).padding(.bottom, 0.75)
            
            Text("Back to sharing your passion!").font(.system(size: 19, weight: .regular, design: .rounded)).foregroundColor(.secondary).padding(.bottom, 80)
            
            Group {
                
                Text("Email").font(.system(size: 18, weight: .semibold, design: .rounded)).frame( maxWidth: .infinity, alignment: .leading).padding(.leading, 32).padding(.top, 20)
                
                TextField("johnhenry@gmail.com", text: $email).padding(.leading, 25).frame(width: 325, height: 50).background(Color("fieldOrange")).cornerRadius(20)
            }
            
            Group {
                
                Text("Password").font(.system(size: 18, weight: .semibold, design: .rounded)).frame( maxWidth: .infinity, alignment: .leading).padding(.leading, 32).padding(.top, 20)
                
                SecureField("********", text: $password).padding(.leading, 25).frame(width: 325, height: 50).background(Color("fieldOrange")).cornerRadius(20)
            }
            
            Button(action: {
                withAnimation {
                }
            }) {
                Text("Proceed").frame(minWidth: 345, minHeight: 60 ).background(.orange).cornerRadius(20).foregroundColor(.white).font(.system(size: 30, weight: .medium, design: .rounded))
            }.shadow(radius: 3).padding(.top, 150)
        }
        
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}