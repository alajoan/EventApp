//
//  EventListTableViewCell.swift
//  EventApp
//
//  Created by user228425 on 9/22/22.
//

import UIKit

final class EventListTableViewCell: UITableViewCell {
    static let identifier = "eventListCell"
    private var gradient: CAGradientLayer?
    
    private lazy var holder: UIView = {
        var holder = UIView()
        holder.translatesAutoresizingMaskIntoConstraints = false
        return holder
    }()
    
    private lazy var eventImageView: UIImageView = {
        var image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "BackgroundTest")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private lazy var eventTitleLabel: UILabel = {
        var title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textColor = .white
        title.numberOfLines = 0
        return title
    }()
    
    private lazy var eventDateLabel: UILabel = {
        var date = UILabel()
        date.translatesAutoresizingMaskIntoConstraints = false
        date.textColor = .white
        return date
    }()
    
    private lazy var eventPriceLabel: UILabel = {
        var price = UILabel()
        price.translatesAutoresizingMaskIntoConstraints = false
        price.textColor = .white
        return price
    }()
    
    private lazy var bottomShadow: UIView = {
       var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        gradient = CAGradientLayer()
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
        contentView.addSubview(holder)
        holder.addSubview(eventImageView)
        eventImageView.addSubview(bottomShadow)
        eventImageView.addSubview(eventTitleLabel)
        eventImageView.addSubview(eventDateLabel)
        eventImageView.addSubview(eventPriceLabel)
        
        holderConstraints()
        eventImageViewConstraints()
        eventTitleLabelConstraints()
        eventDateLabelConstraints()
        eventPriceLabelConstraints()
        bottomShadowConstraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        makeRound()
        makeGradientBottomShadow()
        layoutViews()
    }
    
    private func makeRound() {
        contentView.layer.cornerRadius = 30
        contentView.layer.masksToBounds = true
    }
        
    private func makeGradientBottomShadow() {
        gradient?.frame = bottomShadow.bounds
        gradient?.colors = [
            UIColor.clear.cgColor,
            UIColor.darkGray.cgColor
        ]
        gradient?.locations = [0.3, 1]
        bottomShadow.layer.insertSublayer(gradient ?? CAGradientLayer(), at: 0)
    }
    
    private func holderConstraints () {
        NSLayoutConstraint.activate([
            holder.centerXAnchor.constraint(equalTo: centerXAnchor),
            holder.centerYAnchor.constraint(equalTo: centerYAnchor),
            holder.widthAnchor.constraint(equalToConstant: 288),
            holder.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    private func eventImageViewConstraints() {
        NSLayoutConstraint.activate([
            eventImageView.centerXAnchor.constraint(equalTo: holder.centerXAnchor),
            eventImageView.centerYAnchor.constraint(equalTo: holder.centerYAnchor),
            eventImageView.widthAnchor.constraint(equalTo: holder.widthAnchor),
            eventImageView.heightAnchor.constraint(equalTo: holder.heightAnchor)
        ])
    }
    
    private func eventTitleLabelConstraints() {
        NSLayoutConstraint.activate([
            eventTitleLabel.leadingAnchor.constraint(
                equalTo: eventImageView.leadingAnchor,
                constant: 5
            ),
            eventTitleLabel.trailingAnchor.constraint(
                equalTo: eventImageView.trailingAnchor,
                constant: -5
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
                constant: 5
            ),
            eventDateLabel.trailingAnchor.constraint(
                equalTo: eventImageView.trailingAnchor,
                constant: -5
            ),
            eventDateLabel.bottomAnchor.constraint(
                equalTo: eventImageView.bottomAnchor,
                constant: -10
            )
        ])
    }
    
    private func eventPriceLabelConstraints() {
        NSLayoutConstraint.activate([
            eventPriceLabel.centerYAnchor.constraint(equalTo: eventDateLabel.centerYAnchor),
            eventPriceLabel.trailingAnchor.constraint(equalTo:  holder.trailingAnchor, constant: -15)
        ])
        
    }
    
    private func bottomShadowConstraints() {
        NSLayoutConstraint.activate([
            bottomShadow.topAnchor.constraint(equalTo: holder.topAnchor),
            bottomShadow.bottomAnchor.constraint(equalTo: holder.bottomAnchor),
            bottomShadow.leadingAnchor.constraint(equalTo: holder.leadingAnchor),
            bottomShadow.trailingAnchor.constraint(equalTo: holder.trailingAnchor)
        ])
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
