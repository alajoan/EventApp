//
//  EventDetailsViewController.swift
//  EventApp
//
//  Created by user228425 on 9/27/22.
//

import Foundation
import UIKit

final class EventDetailsViewController: UIViewController {
    private lazy var mainView: EventDetailsMainView = {
        var view = EventDetailsMainView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        layoutSubviews()
    }
}


extension EventDetailsViewController {
    private func layoutSubviews() {
        view.addSubview(mainView)
        mainViewConstraints()
    }
    
    private func mainViewConstraints() {
        NSLayoutConstraint.activate([
            mainView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            mainView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
