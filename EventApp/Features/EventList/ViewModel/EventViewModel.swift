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
        return self.formatToCurrency(event.price)
    }
    
    var eventTitle: String {
        return event.title
    }
    
    var eventDate: String {
        return self.formatDateFromMilliseconds(event.date)
    }
    
    var eventImageUrl: String {
        return event.image
    }
    
    init(event: Event) {
        self.event = event
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
        dateFormatter.dateFormat = "d MMM, yyyy"
        let finalDate = dateFormatter.string(from: convertedDate)
        return finalDate
    }
}
