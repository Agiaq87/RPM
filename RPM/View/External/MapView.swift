//
//  MapView.swift
//  RPM
//
//  Created by Alessandro Giaquinto on 24/02/2020.
//  Copyright © 2020 Alessandro Giaquinto. All rights reserved.
//

import SwiftUI
import MapKit


//  Coordinator for using UIKit inside SwiftUI.

class MapViewModel: NSObject, MKMapViewDelegate {
    
      var mapViewController: MapView
        
      init(_ control: MapView) {
          self.mapViewController = control
      }
        
      func mapView(_ mapView: MKMapView, viewFor
           annotation: MKAnnotation) -> MKAnnotationView?{
         //Custom View for Annotation
          let annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "customView")
          annotationView.canShowCallout = true
          //Your custom image icon
          annotationView.image = UIImage(named: "locationPin")
          return annotationView
       }
}


struct MapView: UIViewRepresentable {
    
    private let map = MKMapView(frame: UIScreen.main.bounds)
    
    func makeCoordinator() -> MapViewModel {
        MapViewModel(self)
    }
    
    func makeUIView(context: Context) -> MKMapView{
        self.map.showsUserLocation = true
        self.map.userTrackingMode = .follow
        self.map.showsTraffic = true
        self.map.showsBuildings = true
        self.map.mapType = MKMapType.mutedStandard
        return self.map
    }
    
    func updateUIView(_ view: MKMapView, context: Context){
        //If you changing the Map Annotation then you have to remove old Annotations
        //mapView.removeAnnotations(mapView.annotations)
        view.delegate = context.coordinator
    }
}
