//
//  ProfileScreen.swift
//  LetsBusk
//
//  Created by Abdulaziz Albahar on 11/12/22.
//

import SwiftUI

struct ActivityManagement: View {
    @EnvironmentObject var eventVM: EventsViewModel
    var body: some View {
        VStack {
            //myEvents
            
                   
                
                    
            
            
        }
    }
}


struct ProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        ActivityManagement().environmentObject(EventsViewModel(userVM: UserViewModel(), locManager: LocationManager()))
    }
}
