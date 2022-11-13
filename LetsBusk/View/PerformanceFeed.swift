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
                    Image("mapImage").resizable().scaledToFit().cornerRadius(10).padding(.horizontal, 20).shadow(radius: 8).frame(minWidth: 250, maxHeight: 225).padding(.top)
                            EventCard(title: "Guitar with Jason", description: "A once in a lifetime experience.").padding(.top, 30)
                            EventCard(title: "Guitar with Jason", description: "A once in a lifetime experience.").padding(.top, 30)
                        }.navigationTitle("Feed!")
            }
            
        }
        

    }
}

struct PerformanceFeed_Previews: PreviewProvider {
    static var previews: some View {
        PerformanceFeed().environmentObject(EventsViewModel(userVM: UserViewModel(), locManager: LocationManager()))
    }
}
