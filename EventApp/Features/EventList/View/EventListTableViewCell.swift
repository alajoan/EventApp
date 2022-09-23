//
//  EventListTableViewCell.swift
//  EventApp
//
//  Created by user228425 on 9/22/22.
//

import UIKit

final class EventListTableViewCell: UITableViewCell {
    static let identifier = "eventListCell"
    
    private lazy var eventImageView: UIImageView = {
        var image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "BackgroundTest")
        image.contentMode = .scaleToFill
        return image
    }()
    
    private lazy var eventTitleLabel: UILabel = {
        var title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private lazy var eventDateLabel: UILabel = {
        var date = UILabel()
        date.translatesAutoresizingMaskIntoConstraints = false
        return date
    }()
    
    private lazy var eventPriceLabel: UILabel = {
        var price = UILabel()
        price.translatesAutoresizingMaskIntoConstraints = false
        return price
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layoutViews()
    }
    
    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - LayoutView
extension EventListTableViewCell {
    private func layoutViews() {
        contentView.backgroundColor = .cyan
        contentView.addSubview(eventImageView)
        eventImageView.addSubview(eventTitleLabel)
        eventImageView.addSubview(eventDateLabel)
        eventImageView.addSubview(eventPriceLabel)
        
        eventImageViewConstraints()
        eventTitleLabelConstraints()
        eventDateLabelConstraints()
        eventPriceLabelConstraints()
    }
    
    private func eventImageViewConstraints() {
        NSLayoutConstraint.activate([
            eventImageView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 30
            ),
            eventImageView.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -30
            ),
            eventImageView.bottomAnchor.constraint(
                equalTo: bottomAnchor,
                constant: -5
            ),
            eventImageView.topAnchor.constraint(
                equalTo: topAnchor,
                constant: 5
            )
        ])
    }
    
    private func eventTitleLabelConstraints() {
        NSLayoutConstraint.activate([
            eventTitleLabel.leadingAnchor.constraint(
                equalTo: eventImageView.leadingAnchor,
                constant: 20
            ),
            eventTitleLabel.trailingAnchor.constraint(
                equalTo: eventImageView.trailingAnchor,
                constant: -20
            ),
        ])
    }
    
    private func eventDateLabelConstraints() {
        NSLayoutConstraint.activate([
            eventDateLabel.topAnchor.constraint(
                equalTo: eventTitleLabel.bottomAnchor,
                constant: 10
            ),
            eventDateLabel.leadingAnchor.constraint(
                equalTo: eventImageView.leadingAnchor,
                constant: 20
            ),
            eventDateLabel.trailingAnchor.constraint(
                equalTo: eventImageView.trailingAnchor,
                constant: -20
            ),
            eventDateLabel.bottomAnchor.constraint(
                equalTo: eventImageView.bottomAnchor,
                constant: -10
            )
        ])
    }
    
    private func eventPriceLabelConstraints() {
        
    }
}

extension EventListTableViewCell {
    func setData(eventTitle: String, eventPrice: String, eventImage: UIImage, eventDate: String) {
        eventTitleLabel.text = eventTitle
        eventPriceLabel.text = eventPrice
        eventImageView.image = eventImage
        eventDateLabel.text = eventDate
    }
}
