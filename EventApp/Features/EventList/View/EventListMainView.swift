//
//  EventListMainView.swift
//  EventApp
//
//  Created by user228425 on 9/21/22.
//

import UIKit

class EventListMainView: UIView {
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(
            EventListTableViewCell.self,
            forCellReuseIdentifier: EventListTableViewCell.identifier
        )
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.preservesSuperviewLayoutMargins = false
        return tableView
    }()
    
    init() {
        super.init(frame: .zero)
        layoutViews()
    }
    
    convenience init(delegate: EventListViewController)
    {
        self.init()
        tableView.delegate = delegate
        tableView.dataSource = delegate
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


//MARK: - Layout
extension EventListMainView {
    private func layoutViews() {
        addSubview(tableView)
        NSLayoutConstraint.activate([
            
            // MARK: - tableViewConstraints
            tableView.topAnchor.constraint(
                equalTo: topAnchor,
                constant: 5
            ),
            tableView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 5
            ),
            tableView.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -5
            ),
            tableView.bottomAnchor.constraint(
                equalTo: bottomAnchor,
                constant: -5
            )
        ])
    }
}
