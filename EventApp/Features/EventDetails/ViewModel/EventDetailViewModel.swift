//
//  EventDetailViewModel.swift
//  EventApp
//
//  Created by user228425 on 9/28/22.
//

import Foundation
import MapKit

final class EventDetailViewModel {
    private let event: Event
    
    var eventPrice: String {
        return "Preço do evento: \n\(Utils.formatToCurrency(event.price))"
    }
    
    var eventTitle: String {
        return event.title
    }
    
    var eventDate: String {
        return "Data do evento: \n\(Utils.formatDateFromMilliseconds(event.date, dateFormat: .extensionDate))"
    }
    
    var eventDescription: String {
        return event.description
    }
    
    var eventId: String {
        return event.id
    }
    
    init(event: Event = Event()) {
        self.event = event
    }
    
    func getEvent() -> Event {
        return self.event
    }
    
    func mapCoordinates() -> MKPointAnnotation {
        let annotation = MKPointAnnotation()
        
        annotation.coordinate = CLLocationCoordinate2D(
            latitude: CLLocationDegrees(event.latitude),
            longitude: CLLocationDegrees(event.longitude)
        )
        
        return annotation
    }
    
    func mapRegion() -> MKCoordinateRegion {
        return MKCoordinateRegion(
            center: mapCoordinates().coordinate,
            latitudinalMeters: 600,
            longitudinalMeters: 500
        )
    }
}
