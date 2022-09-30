//
//  DSLabel.swift
//  EventApp
//
//  Created by user228425 on 9/27/22.
//

import UIKit

public class DSLabel: UILabel {
    public enum LabelType {
        case title
        case descriptionText
        case details
        case error
    }
    
    var labelType: LabelType?
    
    private override init(frame: CGRect = .zero) {
        super.init(frame: frame)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public convenience init(labelType: LabelType? = .descriptionText, text: String = "", alignment: NSTextAlignment = .left) {
        self.init()
        self.labelType = labelType
        self.text = text
        self.textAlignment = alignment
        setConfiguration()
    }
}

//MARK: - Configurations Setup
extension DSLabel {
    private func setConfiguration() {
        setTextColor()
        setFontSize()
    }
    
    private func setTextColor() {
        switch self.labelType {
        case .descriptionText:
            self.textColor = .black
        case .error:
            self.textColor = .systemRed
        default:
            self.textColor = .white
        }
    }
    
    private func setFontSize() {
        switch self.labelType {
        case .title:
            self.font = UIFont.systemFont(ofSize: 17, weight: .bold)
            break
        case .descriptionText:
            self.font = UIFont.systemFont(ofSize: 14, weight: .thin)
            break
        case .details:
            self.font = UIFont.systemFont(ofSize: 14, weight: .thin)
            break
        case .error:
            self.font = UIFont.systemFont(ofSize: 10, weight: .semibold)
        default:
            self.font = UIFont.systemFont(ofSize: 14, weight: .regular)
            break
        }
    }
}
