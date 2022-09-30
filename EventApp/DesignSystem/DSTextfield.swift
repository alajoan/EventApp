//
//  DSTextfield.swift
//  EventApp
//
//  Created by user228425 on 9/30/22.
//

import Foundation
import UIKit

public class DSTextfield: UITextField {
    private override init(frame: CGRect = .zero) {
        super.init(frame: frame)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public convenience init(
        placeHolder: String = "",
        keyboardType: UIKeyboardType = .default,
        returnKeyType: UIReturnKeyType = .done,
        ContentVerticalAlignment: UIControl.ContentVerticalAlignment = UIControl.ContentVerticalAlignment.center,
        autoCorrect: UITextAutocorrectionType = .no
    ) {
        self.init()
        self.placeholder = placeHolder
        self.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        self.keyboardType = UIKeyboardType.default
        self.returnKeyType = UIReturnKeyType.done
        self.autocorrectionType = UITextAutocorrectionType.no
        setConfiguration()
    }
}

extension DSTextfield {
    private func setConfiguration() {
        self.font = UIFont.systemFont(ofSize: 14)
        self.borderStyle = UITextField.BorderStyle.roundedRect
        self.clearButtonMode = UITextField.ViewMode.whileEditing
    }
}
