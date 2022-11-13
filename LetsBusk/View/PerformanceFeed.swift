//
//  PerformanceFeed.swift
//  LetsBusk
//
//  Created by Abdulaziz Albahar on 11/12/22.
//

import SwiftUI

struct PerformanceFeed: View {
    @EnvironmentObject var eventVM: EventsViewModel
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                VStack {
                    Text("Nearby Performers").font(.system(size: 35, weight: .semibold, design: .rounded)).padding(.vertical, 12).padding(.vertical, 23)
                   
                    Image("mapImage").resizable().scaledToFit().cornerRadius(10).shadow(radius: 8).frame(minWidth: 250, maxWidth: .infinity, maxHeight: 225, alignment: .center).padding(.bottom).padding(.horizontal)
                    
                   
                        
                    
                    Rectangle().frame( height: 1).padding(.horizontal, 24).cornerRadius( 6)
                    
                    ForEach(eventVM.events, id: \.self.id) { event in
                        EventCard(title: event.title, description: event.description)
                    }
                            EventCard(title: "Guitar with Jason", description: "A once in a lifetime experience.").padding(.top, 30)
                            EventCard(title: "Jane's Karaoke Craze ", description: "Sing your hearts out.").padding(.top, 30)
                }
            }
            
        }
        

    }
}

struct PerformanceFeed_Previews: PreviewProvider {
    static var previews: some View {
        PerformanceFeed().environmentObject(EventsViewModel(userVM: UserViewModel(), locManager: LocationManager()))
    }
}
