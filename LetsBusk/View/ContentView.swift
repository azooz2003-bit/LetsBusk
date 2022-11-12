//
//  ContentView.swift
//  LetsBusk
//
//  Created by Abdulaziz Albahar on 11/11/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var userVM: UserViewModel
    
    var body: some View {
        NavigationStack {
            LandingPage().environmentObject(userVM)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(UserViewModel())
    }
}
