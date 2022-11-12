//
//  SignUpSecond.swift
//  LetsBusk
//
//  Created by Abdulaziz Albahar on 11/12/22.
//

import SwiftUI
import SwiftUIX

struct SignUpSecond: View {
    @EnvironmentObject var userVM: UserViewModel

    @State var bio = ""
    @State var image: UIImage?
    @State var showPicker = false
    @State var secondRegPassed = true
    @State var errorOccurred = false
    
    var body: some View {
        VStack {
            Button(action: {
                showPicker = true
            }) {
                
                ZStack {
                    if image != nil {
                        Image(uiImage: image!).resizable().frame(width: 170, height: 170).clipShape(Ellipse()).overlay(Ellipse().stroke(Color.orange, lineWidth: 4)).shadow(radius: 3)
                        
                    } else {
                        ZStack {
                            Ellipse().fillAndStrokeBorder(.white, borderColor: .orange, borderWidth: 4).frame(width: 170, height: 170).shadow(radius: 3)
                            Text("?").font(.system(size: 60)).foregroundColor(.orange)
                        }
                        
                        
                        ZStack {
                            Ellipse().frame(width: 35, height: 35)
                            Image("plus").resizable().scaledToFit().frame(width: 35, height: 35)
                        }.padding(.top, 115).padding(.leading, 115).foregroundColor(.white)
                    }
                }
            }.padding(.bottom, 45).padding(.top, 20)
            
            
            Group {
                Text("Bio (2-3 sentences)").padding(.leading, 32).font(.system(size: 22, weight: .semibold, design: .rounded)).frame( maxWidth: .infinity, alignment: .leading)
                
                TextField("What I hope to communicate through art, etc.", text: $bio, axis: .vertical).padding(.leading, 20).padding(.trailing, 10).padding(.top, 20).frame(width: 355, height: 150, alignment: .top).background(Color("fieldOrange")).cornerRadius(20).multilineTextAlignment(.leading).autocorrectionDisabled().autocapitalization(.none)
            }
            
            Text("Genre Tags").padding(.leading, 32).font(.system(size: 22, weight: .semibold, design: .rounded)).frame( maxWidth: .infinity, alignment: .leading).padding(.top, 20)
            
            TagsView()
            
            
            
            Button(action: {
                //CREATE SECOND PHASE FUNCTION INSTEAD
                userVM.addData(pfpImage: image!) { success in
                    if success {
                        withAnimation {
                            secondRegPassed = true
                        }
                    } else {
                        errorOccurred = true
                    }
                    
                }
                
            }) {
                Text("Proceed").frame(minWidth: 345, minHeight: 60 ).background(.orange).cornerRadius(20).foregroundColor(.white).font(.system(size: 30, weight: .medium, design: .rounded))
            }.shadow(radius: 3).padding(.top, 30).alert("Error!", isPresented: $errorOccurred) {
                Button("Ok.", role: .cancel, action: {
                    errorOccurred = false
                })
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
        SignUpSecond().environmentObject(UserViewModel())
    }
}
