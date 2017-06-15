//
//  CustomMapView.swift
//  CrossOverAssignment
//
//  Created by Pranay on 6/4/17.
//  Copyright © 2017 Pranay. All rights reserved.
//

import UIKit
import MapKit

class CustomMapView: MKMapView,MKMapViewDelegate {

    
    override func awakeFromNib(){
        super.awakeFromNib();
        self.initialSetUp();
        
    }
    
    func initialSetUp(){
        self.delegate = self;
        
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
       
            let annotationViewReuseIdentifier = "annotationViewReuseIdentifier"
            var view: MKAnnotationView
             let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: annotationViewReuseIdentifier)
        
        if ((dequeuedView) != nil) { // 2
                dequeuedView?.annotation = annotation
                view = dequeuedView!
            } else {
                // 3
                view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: annotationViewReuseIdentifier)
                view.canShowCallout = true
                view.calloutOffset = CGPoint(x: -5, y: 5)
                //view.rightCalloutAccessoryView = UIButton.withType(.detailDisclosure) as UIView
            }
            return view
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
