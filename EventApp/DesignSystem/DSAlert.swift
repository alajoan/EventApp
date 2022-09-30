//
//  Alert.swift
//  EventApp
//
//  Created by user228425 on 9/30/22.
//

import Foundation
import UIKit

public class DSAlert: UIAlertController {
    
    private override init() {
        super.init()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public convenience init(
        title: String = "",
        message: String = "",
        style: UIAlertController.Style = UIAlertController.Style.alert
    ) {
        self.init()
        self.title = title
        self.message = message
    }
}
