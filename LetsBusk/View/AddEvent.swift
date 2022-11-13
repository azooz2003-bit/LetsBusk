//
//  AddEvent.swift
//  LetsBusk
//
//  Created by Abdulaziz Albahar on 11/13/22.
//

import SwiftUI

struct AddEvent: View {
    @State var title = ""
    @State var description = ""
    @State var created = ""
    
    @EnvironmentObject var eventVM: EventsViewModel
    
    var body: some View {
        VStack {
            Text("Ongoing Event").font(.system(size: 32, weight: .semibold, design: .rounded)).padding(.bottom, 0.75)
            
            Text("Share your art!").font(.system(size: 19, weight: .regular, design: .rounded)).foregroundColor(.secondary).padding(.bottom, 80)
            
            Group {
                Text("Title").font(.system(size: 18, weight: .semibold, design: .rounded)).frame( maxWidth: .infinity, alignment: .center).padding(.horizontal, 32)
                
                TextField("The .....", text: $title).padding(.horizontal, 25).frame(width: 350, height: 50, alignment: .center).background(Color("fieldOrange")).cornerRadius(20).autocorrectionDisabled().autocapitalization(.none)
                
            }
            
            Group {
                
                Text("Description").font(.system(size: 18, weight: .semibold, design: .rounded)).frame( maxWidth: .infinity, alignment: .center).padding(.top, 20)
                
                TextField("Enter...", text: $description).padding(.top, 25).padding(.horizontal, 25).frame(width: 350, height: 250, alignment: .topLeading).background(Color("fieldOrange")).cornerRadius(20).autocorrectionDisabled().autocapitalization(.none)
            }
            
            Button(action: {
                eventVM.addEvent(event: Event(title: title, genreTags: [:], location: eventVM.locManager.region.center, description: description)) { result in
                    if (result) {
                        created = true
                    }
                    
                }
                
            }, label: {
                Text("Create").frame(minWidth: 345, minHeight: 60 ).background(Gradient(colors: [Color.systemOrange, Color.systemOrange, Color.systemOrange, Color.systemOrange, Color.white])).cornerRadius(20).foregroundColor(.white).font(.system(size: 30, weight: .medium, design: .rounded)).shadow(radius: 4)
            }).padding(.top, 40).navigationDestination(isPresented: $created, destination: {
                
            })
            
        }
    }
}

struct AddEvent_Previews: PreviewProvider {
    static var previews: some View {
        AddEvent()
    }
}
