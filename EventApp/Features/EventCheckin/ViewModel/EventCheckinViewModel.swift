//
//  EventCheckinViewModel.swift
//  EventApp
//
//  Created by user228425 on 9/29/22.
//

import Foundation
import RxSwift

class EventCheckinViewModel {
    private var event: Event
    
    var eventCheckinDescription: String {
        return "Digite seu nome e e-mail para dar check-in no evento \(String(describing: event.title)) que vai ocorrer em \(Utils.formatDateFromMilliseconds(event.date, dateFormat: .extensionDate))"
    }
    
    var eventTitle: String {
        return "Check-in"
    }
    
    let namePublishSubject = PublishSubject<String>()
    let emailPublishSubject = PublishSubject<String>()
    
    init (event: Event = Event()) {
        self.event = event
    }
    
    func isEmailValid(_ email: String) -> Bool {
        return email.contains("@") && email.contains(".com")
    }
    
    func isNameValid(_ name: String) -> Bool {
        return name.count > 2
    }
}
