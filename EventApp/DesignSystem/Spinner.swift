//
//  Spinner.swift
//  EventApp
//
//  Created by user228425 on 9/29/22.
//

import UIKit

public class Spinner: UIView {
   private lazy var spinner: UIActivityIndicatorView = {
        var spin = UIActivityIndicatorView()
        spin.style = .large
        spin.translatesAutoresizingMaskIntoConstraints = false
        return spin
    }()
    
    private var externView: UIView
    
    init(superView: UIView) {
        self.externView = superView
        super.init(frame: externView.frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func startLoading() {
        self.backgroundColor = UIColor(white: 0, alpha: 0.5)
        externView.addSubview(self)
        externView.addSubview(spinner)
        NSLayoutConstraint.activate([
            // MARK: - spinnerConstraints
            spinner.centerXAnchor.constraint(equalTo: externView.centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: externView.centerYAnchor)
        ])
        spinner.startAnimating()
    }
    
    func stopLoading() {
        spinner.stopAnimating()
        self.removeFromSuperview()
    }
}
