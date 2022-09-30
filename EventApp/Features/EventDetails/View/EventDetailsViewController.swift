//
//  EventDetailsViewController.swift
//  EventApp
//
//  Created by user228425 on 9/27/22.
//

import Foundation
import UIKit

final class EventDetailsViewController: UIViewController {
    
    private var viewModel: EventDetailViewModel
    
    private lazy var mainView: EventDetailsMainView = {
        var view = EventDetailsMainView(eventId: viewModel.eventId)
        view.delegate = self
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        customizeNavBar()
        layoutSubviews()
    }
    
    init(viewModel: EventDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        viewModel = EventDetailViewModel()
        super.init(coder: aDecoder)
    }
}


extension EventDetailsViewController {
    private func layoutSubviews() {
        view.addSubview(mainView)
        mainViewConstraints()
        let config = EventDetailsMainView.Config(
            eventDescription: viewModel.eventDescription,
            eventMapCoordinates: viewModel.mapCoordinates(),
            eventMapRegion: viewModel.mapRegion(),
            eventPrice: viewModel.eventPrice,
            eventDate: viewModel.eventDate
        )
        mainView.setData(with: config)
    }
    
    private func mainViewConstraints() {
        NSLayoutConstraint.activate([
            mainView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            mainView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func customizeNavBar() {
        let navBar = self.navigationController?.navigationBar

        let standardAppearance = UINavigationBarAppearance()
        standardAppearance.configureWithOpaqueBackground()
        
        navBar?.standardAppearance = standardAppearance
        navBar?.scrollEdgeAppearance = standardAppearance
        let backBarButton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navBar?.backItem?.backBarButtonItem = backBarButton
        navBar?.prefersLargeTitles = true
        navBar?.isTranslucent = true
        navBar?.topItem?.backButtonDisplayMode = .minimal
        self.title = viewModel.eventTitle
    }
}

extension EventDetailsViewController: EventDetailsMainViewProtocol {
    func goToCheckin(eventId: String) {
        let VC = EventCheckinViewController(viewModel: EventCheckinViewModel(event: viewModel.getEvent()))
        self.navigationController?.pushViewController(VC, animated: true)
    }
}
