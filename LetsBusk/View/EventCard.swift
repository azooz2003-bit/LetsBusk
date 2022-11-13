//
//  EventCard.swift
//  LetsBusk
//
//  Created by Abdulaziz Albahar on 11/13/22.
//

import SwiftUI

struct EventCard: View {
    var title: String
    var description: String
    
    var body: some View {
        ZStack {
            Rectangle().foregroundLinearGradient(Gradient(colors: [Color.yellow, Color.yellow, Color.orange, Color.orange])).frame(width: 400, height: 240).cornerRadius(13).shadow(radius: 7)
            ZStack {
                VStack{
                    Text(title).font(.system(size: 20, weight: .semibold, design: .rounded))
                    Text(description).font(.system(size: 20, weight: .regular, design: .rounded))
                }.frame(width: 335, height: 75).background(.white).cornerRadius(23).shadow(radius: 3, y: 1)
                
            }
            
        }
    }
}

struct EventCard_Previews: PreviewProvider {
    static var previews: some View {
        EventCard(title: "Guitar Music", description: "A once in a lifetime experience.")
    }
}
