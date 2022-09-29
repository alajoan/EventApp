//
//  EventDetailsMainVIew.swift
//  EventApp
//
//  Created by user228425 on 9/27/22.
//

import Foundation
import UIKit
import MapKit

protocol EventDetailsMainViewProtocol: AnyObject {
    func goToCheckin(eventId: String)
}

final class EventDetailsMainView: UIView {
    
    weak var delegate: EventDetailsMainViewProtocol?
    private var viewModel: EventDetailViewModel
    
    var contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height + 200)
    
   private lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView(frame: .zero)
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.layoutIfNeeded()
        return scroll
    } ()
    
   private lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.frame.size = scrollView.contentSize
        return view
    } ()
    
    private lazy var eventDescription: UITextView = {
        let event = UITextView()
        event.translatesAutoresizingMaskIntoConstraints = false
        event.font = UIFont.systemFont(ofSize: 14, weight: .thin)
        event.sizeToFit()
        event.text = viewModel.eventDescription
        event.isScrollEnabled = true
        return event
    }()
    
    private lazy var eventMap: MKMapView = {
        let map = MKMapView()
        map.mapType = MKMapType.standard
        map.isZoomEnabled = true
        map.isScrollEnabled = true
        map.translatesAutoresizingMaskIntoConstraints = false
        map.addAnnotation(viewModel.mapCoordinates())
        map.setRegion(viewModel.mapRegion(), animated: true)
        return map
    }()
    
    private lazy var eventPrice: DSLabel = {
        let price = DSLabel(
            labelType: .descriptionText,
            text: viewModel.eventPrice,
            alignment: .center
        )
        price.numberOfLines = 0
        price.translatesAutoresizingMaskIntoConstraints = false
        return price
    }()
    
    private lazy var eventDate: DSLabel = {
        let eventDate = DSLabel(
            labelType: .descriptionText,
            text: viewModel.eventDate,
            alignment: .center
        )
        eventDate.numberOfLines = 0
        eventDate.translatesAutoresizingMaskIntoConstraints = false
        return eventDate
    }()
    
    private lazy var checkinButton: UIButton = {
        let button = UIButton()
        button.setTitle("Check-in", for: .normal)
        button.backgroundColor = .systemMint
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(checkIn), for: .touchUpInside)
        return button
    }()
    
    init(viewModel: EventDetailViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        layoutViews()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension EventDetailsMainView {
    private func layoutViews() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(eventDescription)
        contentView.addSubview(eventMap)
        contentView.addSubview(eventDate)
        contentView.addSubview(eventPrice)
        contentView.addSubview(checkinButton)
        
        scrollViewConstraints()
        contentViewConstraints()
        eventDescriptionConstraints()
        eventMapConstraints()
        eventDateConstraints()
        eventPriceConstraints()
        checkinButtonConstraints()
    }
     
    private func scrollViewConstraints() {
        NSLayoutConstraint.activate([
            scrollView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor),
            scrollView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor),
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            scrollView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor),
            scrollView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor)
        ])
    }
    
    private func contentViewConstraints() {
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
            contentView.rightAnchor.constraint(equalTo: scrollView.rightAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor, constant: 200)
        ])
    }
    
    private func eventMapConstraints() {
        NSLayoutConstraint.activate([
            eventMap.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            eventMap.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            eventMap.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 1/3),
            eventMap.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 10)
        ])
    }
    
    private func eventDescriptionConstraints() {
        NSLayoutConstraint.activate([
            eventDescription.topAnchor.constraint(equalTo: eventPrice.bottomAnchor, constant: 20),
            eventDescription.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            eventDescription.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: -10 ),
            eventDescription.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 1/2)
        ])
    }
    
    private func eventPriceConstraints() {
        NSLayoutConstraint.activate([
            eventPrice.topAnchor.constraint(equalTo: eventMap.bottomAnchor, constant: 20),
            eventPrice.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40)
        ])
    }
    
    private func eventDateConstraints() {
        NSLayoutConstraint.activate([
            eventDate.topAnchor.constraint(equalTo: eventMap.bottomAnchor, constant: 20),
            eventDate.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40)
        ])
    }
    private func checkinButtonConstraints() {
        NSLayoutConstraint.activate([
            checkinButton.heightAnchor.constraint(equalToConstant: 50),
            checkinButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            checkinButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            checkinButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30)
        ])
    }
}

extension EventDetailsMainView {
    @objc func checkIn() {
        delegate?.goToCheckin(eventId: viewModel.eventId)
    }
}
