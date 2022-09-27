//
//  EventListViewModel.swift
//  EventApp
//
//  Created by user228425 on 9/25/22.
//

import Foundation
import RxSwift

final class EventListViewModel {
    func fetchEventList() -> Observable<[EventViewModel]>{
        ApiClient.getEventList().map { events in
            events.map { event in
                EventViewModel(event: event)
            }
        }
    }
    
    func fetchImage(url: String) -> Observable<UIImage> {
       ApiClient.getImage(url: url).map { event -> UIImage in
           return event
        }
    }
}
