//
//  Utils.swift
//  EventApp
//
//  Created by user228425 on 9/29/22.
//

import Foundation

class  Utils {
    static func formatToCurrency(_ value: Float) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "pt-BR")
        guard let formattedValue = formatter.string(from: value as NSNumber) else { return "" }
        return formattedValue
    }
    
    static func formatDateFromMilliseconds(_ date: Double, dateFormat: DateFormat) -> String {
        let convertedDate = Date.init(milliseconds: Int64(date))
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "pt-BR")
        dateFormatter.timeZone = .current
        
        switch dateFormat {
        case .extensionDate:
            dateFormatter.dateFormat = "EEEE, d MMM, yyyy"
        case .compactDate:
            dateFormatter.dateFormat = "d MMM, yyyy"
        }
        
        let finalDate = dateFormatter.string(from: convertedDate)
        return finalDate
    }
}
