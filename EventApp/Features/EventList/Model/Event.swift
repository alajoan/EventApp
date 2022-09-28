//
//  EventList.swift
//  EventApp
//
//  Created by user228425 on 9/21/22.
//

import Foundation

struct Event: Codable {
    var date: Double
    var description: String
    var image: String
    var longitude: Float
    var latitude: Float
    var price: Float
    var title: String
    var id: String
    
    init(
        date: Double = 0,
        description: String = "",
        image: String = "",
        longitude: Float = 0,
        latitude: Float = 0,
        price: Float = 0,
        title: String = "",
        id: String = ""
    ) {
        self.date = date
        self.description = description
        self.image = image
        self.longitude = longitude
        self.latitude = latitude
        self.price = price
        self.title =  title
        self.id = id
    }
}

