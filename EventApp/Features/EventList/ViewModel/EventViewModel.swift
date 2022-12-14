//
//  EventViewModel.swift
//  EventApp
//
//  Created by user228425 on 9/26/22.
//

import Foundation
import UIKit
import RxCocoa
import RxSwift

struct EventViewModel {
    private let event: Event
    
    var eventPrice: String {
        return Utils.formatToCurrency(event.price)
    }
    
    var eventTitle: String {
        return event.title
    }
    
    var eventDate: String {
        return Utils.formatDateFromMilliseconds(event.date, dateFormat: .compactDate)
    }
    
    var eventImageUrl: String {
        return event.image
    }
    
    init(event: Event) {
        self.event = event
    }
    
    func getEvent() -> Event {
        return event
    }
}
