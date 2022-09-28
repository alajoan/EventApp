//
//  EventListViewController.swift
//  EventApp
//
//  Created by user228425 on 9/21/22.
//

import UIKit
import RxSwift
import RxCocoa

final class EventListViewController: UIViewController {
    
    private var viewModel: EventListViewModel?
    private let disposeBag = DisposeBag()
    
    private lazy var mainView: EventListMainView = {
        var mainView = EventListMainView()
        mainView.translatesAutoresizingMaskIntoConstraints = false
        return mainView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.tableView.rx.setDelegate(self).disposed(by: disposeBag)
        bindEventList()
        didSelectEvent()
        layoutViews()
        customizeNavBar()
        view.backgroundColor = .white
    }
    
    init(viewModel: EventListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

//MARK: - Layout
extension EventListViewController {
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

//MARK: - private funcs
extension EventListViewController: UITableViewDelegate {
    private func bindEventList() {
        viewModel?.fetchEventList().bind(
            to: mainView.tableView.rx.items(cellIdentifier: EventListTableViewCell.identifier, cellType: EventListTableViewCell.self)) {
            index, viewModel, cell in
                cell.setData(
                    eventTitle: viewModel.eventTitle,
                    eventPrice: viewModel.eventPrice,
                    eventImageUrl: viewModel.eventImageUrl,
                    eventDate: viewModel.eventDate
                )
            }.disposed(by: disposeBag)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 320
    }
    
    func didSelectEvent() {
        mainView.tableView.rx.modelSelected(EventViewModel.self)
            .subscribe(onNext: { [weak self] model in
                let VC = EventDetailsViewController(viewModel: EventDetailViewModel(event: model.getEvent()))
                self?.navigationController?.pushViewController(VC, animated: true)
            }).disposed(by: disposeBag)
    }
}
