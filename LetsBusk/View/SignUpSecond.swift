//
//  SignUpSecond.swift
//  LetsBusk
//
//  Created by Abdulaziz Albahar on 11/12/22.
//

import SwiftUI
import SwiftUIX

struct SignUpSecond: View {
    @State var bio = ""
    @State var image: UIImage?
    @State var showPicker = false
    
    var body: some View {
        VStack {
            Button(action: {
                showPicker = true
            }) {
                
                ZStack {
                    if image != nil {
                        Image(uiImage: image!).resizable().frame(width: 135, height: 135).clipShape(Ellipse()).overlay(Ellipse().stroke(Color.orange, lineWidth: 4))
                        
                    } else {
                        Ellipse().fillAndStrokeBorder(.white, borderColor: .orange, borderWidth: 4).frame(width: 135, height: 135)
                        
                        ZStack {
                            Ellipse().frame(width: 35, height: 35)
                            Image("plus").resizable().scaledToFit().frame(width: 35, height: 35)
                        }.padding(.top, 90).padding(.leading, 90).foregroundColor(.white)
                    }
                }
            }.padding(.bottom, 70)
            
            
            Group {
                Text("Bio").padding(.leading, 32).font(.system(size: 18, weight: .semibold, design: .rounded)).frame( maxWidth: .infinity, alignment: .leading)
                
                TextField("What I do and what I hope to communicate through my art, etc.", text: $bio).padding(.leading, 25).frame(width: 325, height: 150).background(Color("fieldOrange")).cornerRadius(20)
            }
            
        }.fullScreenCover(isPresented: $showPicker, onDismiss: {
            showPicker = false
        }) {
            ImagePicker(image: $image)
        }
    }
}

struct SignUpSecond_Previews: PreviewProvider {
    static var previews: some View {
        SignUpSecond()
    }
}
