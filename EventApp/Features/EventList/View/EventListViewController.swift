//
//  EventListViewController.swift
//  EventApp
//
//  Created by user228425 on 9/21/22.
//

import UIKit

final class EventListViewController: UIViewController {
    
    
    private lazy var mainView: EventListMainView = {
        var mainView = EventListMainView(delegate: self)
        mainView.translatesAutoresizingMaskIntoConstraints = false
        return mainView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutViews()
        customizeNavBar()
        view.backgroundColor = .white
    }
    
    private func layoutViews() {
        view.addSubview(mainView)
        mainViewConstraints()
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
        self.title = "Eventos"
    }
    
    private func mainViewConstraints() {
        NSLayoutConstraint.activate([
            // MARK: - mainViewConstraints
            mainView.topAnchor.constraint(
                equalTo: view.layoutMarginsGuide.topAnchor            ),
            mainView.leadingAnchor.constraint(
                equalTo: view.layoutMarginsGuide.leadingAnchor,
                constant: 0
            ),
            mainView.trailingAnchor.constraint(
                equalTo: view.layoutMarginsGuide.trailingAnchor,
                constant: 0
            ),
            mainView.bottomAnchor.constraint(
                equalTo: view.layoutMarginsGuide.bottomAnchor,
                constant: 0
            )
        ])
    }
}

extension EventListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EventListTableViewCell.identifier, for: indexPath) as? EventListTableViewCell
        cell?.setData(eventTitle: "Feira de adoção de animais na Redenção", eventPrice: "R$29,99", eventImage: UIImage(named: "BackgroundTest") ?? UIImage(), eventDate: "12/12/2012")
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.contentView.layer.masksToBounds = true
        let radius = cell.contentView.layer.cornerRadius
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: radius).cgPath
        cell.selectionStyle = .none
    }
}

extension EventListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //        let nextViewController = DetailsViewController(data: self.presenter.getDetailData(at: indexPath.row), title: "\(mainView.getTextfieldValue()) News")
        //        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
}
