//
//  EventList.swift
//  EventApp
//
//  Created by user228425 on 9/21/22.
//

import Foundation

struct EventList: Codable {
    var date: Double
    var description: String
    var image: String
    var longitude: Float
    var latitude: Float
    var price: Float
    var title: String
    var id: String
    
    init(
        date: Double,
        description: String,
        image: String,
        longitude: Float,
        latitude: Float,
        price: Float,
        title: String,
        id: String
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

