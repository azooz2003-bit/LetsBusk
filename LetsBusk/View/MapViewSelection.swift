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
    
    
    var body: some View {
        NavigationView {
            VStack {
                Map(coordinateRegion: $manager.region, interactionModes: .all, showsUserLocation: true, userTrackingMode: $tracking, annotationItems: eventsVM.events) { location in
                    MapAnnotation(coordinate: location.location) {
                         
                        // CHANGE
                        NavigationLink(destination: EmptyView(), label: {
                            Label(location.title, systemImage:  "mappin")
                        })
                        
                        
                    }
                
                }.ignoresSafeArea()
            }
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
