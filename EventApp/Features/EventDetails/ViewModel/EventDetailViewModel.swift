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
        return "Preço do evento: \n\(self.formatToCurrency(event.price))"
    }
    
    var eventTitle: String {
        return event.title
    }
    
    var eventDate: String {
        return "Data do evento: \n\(self.formatDateFromMilliseconds(event.date))"
    }
    
    var eventDescription: String {
        return event.description
    }
    
    var eventId: String {
        return event.id
    }
    
    init(event: Event) {
        self.event = event
    }
    
    func getEvent() -> Event {
        return self.event
    }
    
    func formatToCurrency(_ value: Float) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "pt-BR")
        guard let formattedValue = formatter.string(from: value as NSNumber) else { return "" }
        return formattedValue
    }
    
    func formatDateFromMilliseconds(_ date: Double) -> String {
        let convertedDate = Date.init(milliseconds: Int64(date))
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "pt-BR")
        dateFormatter.timeZone = .current
        dateFormatter.dateFormat = "EEEE, d MMM, yyyy"
        let finalDate = dateFormatter.string(from: convertedDate)
        return finalDate
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
