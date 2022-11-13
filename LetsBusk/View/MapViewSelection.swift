//
//  MapViewSelection.swift
//  LetsBusk
//
//  Created by Abdulaziz Albahar on 11/12/22.
//

import SwiftUI
import MapKit
import CoreLocation

struct MapViewSelection: View {
    @StateObject var manager: LocationManager = LocationManager()
    @State var tracking:MapUserTrackingMode = .follow // the tracking more as State so that it's trackable
    @EnvironmentObject var eventsVM: EventsViewModel
    @State var createPost = false
    
    
    var body: some View {
        
            VStack {
                Map(coordinateRegion: $manager.region, interactionModes: .all, showsUserLocation: true, userTrackingMode: $tracking, annotationItems: eventsVM.events) { location in
                    MapAnnotation(coordinate: location.location) {
                         
                        // CHANGE
                        NavigationLink(destination: EmptyView(), label: {
                            VStack {
                                Label("", systemImage:  "mappin").foregroundColor(.orange).font(.headline)
                                
                                Text(location.title).frame(width: 15, height: 15).background(.white).foregroundColor(.orange).font(.system(size: 20, weight: .semibold, design: .rounded))
                            }
                            
                        })
                        
                        
                    }
                    
                }.ignoresSafeArea()
                
                Button(action: {
                    createPost = true
                }, label: {
                    Text("+").font(.system(size: 80, weight: .semibold, design: .rounded)).frame(width: 100, height: 100).foregroundColor(.orange)
                }).navigationDestination(isPresented: $createPost, destination: {
                    AddEvent().environmentObject(eventsVM)
                })
            }
        
    }
}
/*

struct MapViewHelper: UIViewRepresentable {
        @EnvironmentObject var locationManager: LocationManager
    
        func makeUIView(context: Context) -> MKMapView {
            return locationManager.mapView
        }
    func updateUIView(_ uiView: MKMapView , context: Context) {
        ZStack {
            
        }
    }
}*/
    
    

struct MapViewSelection_Previews: PreviewProvider {
    static var previews: some View {
        MapViewSelection().environmentObject(EventsViewModel(userVM: UserViewModel(), locManager: LocationManager(), events: []))
    }
}
