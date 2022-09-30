//
//  EventCheckin.swift
//  EventApp
//
//  Created by user228425 on 9/28/22.
//

import Foundation
import UIKit
import RxSwift

final class EventCheckinViewController: UIViewController {
    
    private var viewModel: EventCheckinViewModel
    private var spinner: Spinner?
    
    private lazy var mainView: EventCheckinMainView = {
        var view = EventCheckinMainView(
            delegate: self,
            eventId: viewModel.eventID
        )
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        customizeNavBar()
        layoutSubviews()
        spinner = Spinner(superView: view)
    }
    
    init(viewModel: EventCheckinViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.viewModel = EventCheckinViewModel()
        super.init(coder: aDecoder)
    }
    
}
extension EventCheckinViewController {
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

extension EventCheckinViewController: EventCheckinViewProtocol {
    func getObservableCheckin(identifier: String, email: String, eventId: String) -> Observable<[String : String]> {
        return viewModel.checkin(identifier: identifier, eventId: eventId, email: email)
    }
    
    func isNameValid(_ name: String) -> Bool {
        return name.count >= 2
    }
    
    func isEmailValid(_ email: String) -> Bool {
        return email.contains("@") && email.contains(".com")
    }
    
    func startSpinner() {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.spinner?.startLoading()
    }
    
    func stopSpinner() {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.spinner?.stopLoading()
    }
    
    func showAlert(title: String, message: String) {
        
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: UIAlertController.Style.alert
        )
        
        alert.addAction(
            UIAlertAction(
                title: "Ok",
                style: UIAlertAction.Style.default,
                handler: { (action) in
                    self.navigationController?.popToRootViewController(animated: true)
                }
            )
        )
        
        self.present(alert, animated: true, completion: nil)
    }
}

