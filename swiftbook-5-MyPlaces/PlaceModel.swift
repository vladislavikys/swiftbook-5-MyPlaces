//
//  PlaceModel.swift
//  swiftbook-5-MyPlaces
//
//  Created by Влад on 10.02.23.
//

import UIKit


struct Place{
    
    let name: String
    let location: String?
    let type: String?
    let restaurantImage: String?
    let image: UIImage?
    
    
    static let restaurantNames = ["1","2","3" ]
    
    static func getPlaces() -> [Place]{
        var places = [Place]()
        
        for place in restaurantNames{
            places.append(Place(name: place, location: "Home", type: "shop",restaurantImage: place, image: nil))
        }
        
        
        return places
    }
}



