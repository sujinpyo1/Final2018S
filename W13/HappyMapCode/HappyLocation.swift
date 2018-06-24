//
//  HappyLocation.swift
//  W13
//
//  Created by SWUCOMPUTER on 2018. 6. 2..
//  Copyright © 2018년 SWUCOMPUTER. All rights reserved.
//

import UIKit
import CoreLocation

class HappyLocation: NSObject {
    
    var title: String?
    var coordinate: CLLocationCoordinate2D
    init (title: String, latitude: Double, longitude: Double) {
        self.title = title
        self.coordinate = CLLocationCoordinate2D()
        self.coordinate.latitude = latitude
        self.coordinate.longitude = longitude
    }
}
