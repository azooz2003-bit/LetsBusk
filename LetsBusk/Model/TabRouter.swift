//
//  TabRouter.swift
//  LetsBusk
//
//  Created by Abdulaziz Albahar on 11/12/22.
//

import Foundation

class TabRouter: ObservableObject {
    
    @Published var screen: Screen = .ActivityManagement
    
    func change(to screen: Screen) {
        
        self.screen = screen
    }
    
}
