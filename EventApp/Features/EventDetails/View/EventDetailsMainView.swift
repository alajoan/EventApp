//
//  EventDetailsMainVIew.swift
//  EventApp
//
//  Created by user228425 on 9/27/22.
//

import Foundation
import UIKit
import MapKit

final class EventDetailsMainView: UIView {
    var contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height + 200)
    
    lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView(frame: .zero)
        scroll.translatesAutoresizingMaskIntoConstraints = false
        //scroll.contentSize = contentSize
        //scroll.frame = safeAreaLayoutGuide.layoutFrame
        scroll.layoutIfNeeded()
        return scroll
    } ()
    
    lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.frame.size = scrollView.contentSize
        return view
    } ()
    
    private lazy var eventDescription: UITextView = {
        let event = UITextView()
        event.text = "Toda quarta-feira, das 17h às 22h, encontre a feira mais charmosa de produtos frescos, naturais e orgânicos no estacionamento do Shopping. Sintonizado com a tendência crescente de busca pela alimentação saudável, consumo consciente e qualidade de vida. \n\nAs barracas terão grande variedade de produtos, como o shiitake cultivado em Ibiporã há mais de 20 anos, um sucesso na mesa dos que não abrem mão do saudável cogumelo na dieta. Ou os laticínios orgânicos da Estância Baobá, famosos pelo qualidade e modo de fabricação sustentável na vizinha Jaguapitã. Também estarão na feira as conhecidas compotas e patês tradicionais da Pousada Marabú, de Rolândia.\n\nA feira do Catuaí é uma nova opção de compras de produtos que não são facilmente encontrados no varejo tradicional, além de ótima pedida para o descanso de final de tarde em família e entre amigos. E com o diferencial de ser noturna, facilitando a vida dos consumidores que poderão sair do trabalho e ir direto para a “Vila Verde”, onde será possível degustar delícias saudáveis nos bistrôs, ouvir música ao vivo, levar as crianças para a diversão em uma estação de brinquedos e relaxar ao ar livre.\n\nEXPOSITORES DA VILA VERDE CATUAÍ\n\nCraft Hamburgueria\nNido Pastíficio\nSabor e Saúde\nTerra Planta\nEmpório da Papinha\nEmpório Sabor da Serra\nBoleria Dom Leonardi\nCoisas que te ajudam a viver\nPatês da Marisa\nMarabú\nBaobá\nAkko\nCervejaria Amadeus\n12 Tribos\nParr Kitchen\nHorta Fazenda São Virgílio\nHorta Chácara Santo Antonio\nSur Empanadas\nFit & Sweet\nSK e T Cogumelos\nDos Quintana\n\nLocal: Estacionamento (entrada principal do Catuaí Shopping Londrina)\n\n\nAcesso à Feira gratuito."
        event.translatesAutoresizingMaskIntoConstraints = false
        event.font = UIFont.systemFont(ofSize: 14, weight: .thin)
        event.sizeToFit()
        event.isScrollEnabled = true
        return event
    }()
    
    private lazy var eventMap: MKMapView = {
        let map = MKMapView()
        map.mapType = MKMapType.standard
        map.isZoomEnabled = true
        map.isScrollEnabled = true
        map.translatesAutoresizingMaskIntoConstraints = false
        
        return map
    }()
    
    private lazy var eventPrice: DSLabel = {
        let price = DSLabel(
            labelType: .descriptionText,
            text: "Preco do evento: \nR$29,99",
            alignment: .left
        )
        price.numberOfLines = 0
        price.translatesAutoresizingMaskIntoConstraints = false
        return price
    }()
    
    private lazy var eventDate: DSLabel = {
        let eventDate = DSLabel(
            labelType: .descriptionText,
            text: "Data do evento: \n02 ago 2022",
            alignment: .right
        )
        eventDate.numberOfLines = 0
        eventDate.translatesAutoresizingMaskIntoConstraints = false
        return eventDate
    }()
    
    private lazy var checkinButton: UIButton = {
        let button = UIButton()
        button.setTitle("Check-in", for: .normal)
        button.backgroundColor = .systemTeal
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    init() {
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
