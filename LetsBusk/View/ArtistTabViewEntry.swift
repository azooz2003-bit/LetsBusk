//
//  TabViewEntry.swift
//  LetsBusk
//
//  Created by Abdulaziz Albahar on 11/12/22.
//

import SwiftUI



enum Screen: CaseIterable {
    case PerformanceFeed
    case MapScreen
    case ProfileScreen
    
    var icon: String {
        var i: String
        switch self {
        case .PerformanceFeed:
            i = "house"
        case .MapScreen:
            i = "gear"
        case .ProfileScreen:
            i = "house"
        
        }
        
        return i
    }
    
}

struct ArtistTabViewEntry: View {
    @StateObject var router = TabRouter()
    @EnvironmentObject var userVM: UserViewModel
    
    var body: some View {
        
        VStack {
            ZStack {
                switch router.screen {
                case .ProfileScreen:
                    withAnimation {
                        NavigationView {
                            VStack {
                                ProfileScreen()
                            }
                        }
                    }
                    
                case .MapScreen:
                    withAnimation {
                        NavigationView {
                            VStack {
                                MapScreen()
                            }
                        }
                    }
                    
                case .PerformanceFeed:
                    withAnimation {
                        NavigationView {
                            VStack {
                                PerformanceFeed()
                            }
                        }
                    }
                }
                
            }
            
            Divider()
            HStack {
                ForEach(Screen.allCases, id: \.self) { screen in
                    
                    Spacer()
                    Button(action: {
                        withAnimation {
                            router.change(to: screen)
                        }
                    }) {
                        Image(systemName: screen.icon).overlay(screen != router.screen ? AnyView(EmptyView()) : AnyView(Rectangle().cornerRadius(6).opacity(0.3).frame(width: 50, height: 50))).font(.system(size: 25, weight: .regular, design: .default)).padding(.top).foregroundColor(.orange)
                    }
                    Spacer()
                }
            }
        }
        
        
        
    }
}

struct TabViewEntry_Previews: PreviewProvider {
    static var previews: some View {
        ArtistTabViewEntry().environmentObject(UserViewModel())
    }
}
