//
//  EventListViewController.swift
//  EventApp
//
//  Created by user228425 on 9/21/22.
//

import UIKit

final class EventListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

extension EventListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       // return presenter.numberOfRows
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: SummaryTableViewCell.identifier, for: indexPath) as! SummaryTableViewCell
//        cell.setData(
//            title: self.presenter.getArticleTitle(at: indexPath.row),
//            image: self.presenter.getArticleImage(at: indexPath.row),
//            description: self.presenter.getArticleDescription(at: indexPath.row),
//            author: self.presenter.getArticleAuthor(at: indexPath.row)
//        )
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
        return 180
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let nextViewController = DetailsViewController(data: self.presenter.getDetailData(at: indexPath.row), title: "\(mainView.getTextfieldValue()) News")
//        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
}
