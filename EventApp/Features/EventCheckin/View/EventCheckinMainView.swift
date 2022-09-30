//
//  EventCheckinMainView.swift
//  EventApp
//
//  Created by user228425 on 9/28/22.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

protocol EventCheckinViewProtocol: AnyObject {
    func startSpinner()
    func stopSpinner()
    func showAlert(title: String, message: String)
    func isNameValid(_ name: String) -> Bool
    func isEmailValid(_ email: String) -> Bool
}

final class EventCheckinMainView: UIView {
    private var disposeBag = DisposeBag()
    weak var delegate: EventCheckinViewProtocol?
    private var checkinObservable: Observable<[String:String]>
    private var eventId: String
    
    private lazy var eventDescription: DSLabel = {
        let name = DSLabel(labelType: .descriptionText)
        name.numberOfLines = 0
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    private lazy var nameLabel: DSLabel = {
        let name = DSLabel(text: "Digite o seu nome")
        name.numberOfLines = 0
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    private lazy var emailLabel: DSLabel = {
        let email = DSLabel(text: "Digite o seu e-mail")
        email.numberOfLines = 0
        email.translatesAutoresizingMaskIntoConstraints = false
        return email
    }()
    
    private lazy var errorNameLabel: DSLabel = {
        let error = DSLabel(
            labelType: .error,
            text: "Nome precisa ter ao menos 2 letras",
            alignment: .right
        )
        error.translatesAutoresizingMaskIntoConstraints = false
        return error
    }()
    
    private lazy var emailErrorLabel: DSLabel = {
        let emailError = DSLabel(
            labelType: .error,
            text: "seguir o padrão exemplo@servidor.com",
            alignment: .right
        )
        emailError.translatesAutoresizingMaskIntoConstraints = false
        return emailError
    }()
    
    public lazy var textfieldName: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Nome"
        textfield.font = UIFont.systemFont(ofSize: 14)
        textfield.borderStyle = UITextField.BorderStyle.roundedRect
        textfield.autocorrectionType = UITextAutocorrectionType.no
        textfield.keyboardType = UIKeyboardType.default
        textfield.returnKeyType = UIReturnKeyType.done
        textfield.clearButtonMode = UITextField.ViewMode.whileEditing
        textfield.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }()
    
    public lazy var textfieldEmail: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "E-mail"
        textfield.font = UIFont.systemFont(ofSize: 14)
        textfield.borderStyle = UITextField.BorderStyle.roundedRect
        textfield.autocorrectionType = UITextAutocorrectionType.no
        textfield.keyboardType = UIKeyboardType.default
        textfield.returnKeyType = UIReturnKeyType.done
        textfield.clearButtonMode = UITextField.ViewMode.whileEditing
        textfield.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }()
    
    private lazy var buttonCheckin: UIButton = {
        let button = UIButton()
        button.setTitle("Check-in", for: .normal)
        button.setBackgroundColor(color: .systemMint.withAlphaComponent(1), forState: .normal)
        button.setBackgroundColor(color: .systemMint.withAlphaComponent(0.3), forState: .disabled)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(checkIn), for: .touchUpInside)
        return button
    }()
    
    init(delegate: EventCheckinViewProtocol, checkinObservable: Observable<[String:String]>, eventId: String) {
        self.delegate = delegate
        self.checkinObservable = checkinObservable
        self.eventId = eventId
        super.init(frame: .zero)
        bindError()
        layoutViews()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension EventCheckinMainView {
    private func layoutViews() {
        addSubview(eventDescription)
        addSubview(nameLabel)
        addSubview(emailLabel)
        addSubview(errorNameLabel)
        addSubview(emailErrorLabel)
        addSubview(textfieldName)
        addSubview(textfieldEmail)
        addSubview(buttonCheckin)
        
        eventDescriptionConstraints()
        nameLabelConstraints()
        emailLabelConstraints()
        errorNameLabelConstraints()
        emailErrorLabelConstraints()
        textfieldNameConstraints()
        textFieldEmailConstraints()
        buttonCheckinConstraints()
    }
    
    private func eventDescriptionConstraints() {
        NSLayoutConstraint.activate([
            eventDescription.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 40),
            eventDescription.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            eventDescription.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
    }
    
    private func nameLabelConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: eventDescription.bottomAnchor, constant: 20),
            nameLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 25),
            nameLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -230)
        ])
    }
    
    private func emailLabelConstraints() {
        NSLayoutConstraint.activate([
            emailLabel.topAnchor.constraint(equalTo: textfieldName.bottomAnchor, constant: 20),
            emailLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 25),
            emailLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -230)
        ])
    }
    
    private func errorNameLabelConstraints() {
        NSLayoutConstraint.activate([
            errorNameLabel.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor),
            errorNameLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 10),
            errorNameLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            errorNameLabel.bottomAnchor.constraint(equalTo: textfieldName.topAnchor, constant: -10)
        ])
    }
    
    private func emailErrorLabelConstraints() {
        NSLayoutConstraint.activate([
            emailErrorLabel.centerYAnchor.constraint(equalTo: emailLabel.centerYAnchor),
            emailErrorLabel.leadingAnchor.constraint(equalTo: emailLabel.trailingAnchor, constant: 10),
            emailErrorLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            emailErrorLabel.bottomAnchor.constraint(equalTo: textfieldEmail.topAnchor, constant: -10)
        ])
    }
    
    private func textfieldNameConstraints() {
        NSLayoutConstraint.activate([
            textfieldName.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            textfieldName.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            textfieldName.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
    }
    
    private func textFieldEmailConstraints() {
        NSLayoutConstraint.activate([
            textfieldEmail.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 5),
            textfieldEmail.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            textfieldEmail.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
        ])
    }
    
    private func buttonCheckinConstraints() {
        NSLayoutConstraint.activate([
            buttonCheckin.heightAnchor.constraint(equalToConstant: 50),
            buttonCheckin.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 30),
            buttonCheckin.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -30),
            buttonCheckin.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
}

extension EventCheckinMainView {
    func bindError() {
        let usernameValid = textfieldName.rx.text.orEmpty
            .map { [weak self] name -> Bool in
                self?.delegate?.isNameValid(name) ?? false
            }
            .share(replay: 1)
        let emailValid = textfieldEmail.rx.text.orEmpty
            .map { [weak self] email -> Bool in
                self?.delegate?.isEmailValid(email) ?? false
            }
            .share(replay: 1)
        
        let allValid = Observable.combineLatest(usernameValid, emailValid){ $0 && $1 }
                    .share(replay: 1)
                    .startWith(false)
        
        usernameValid
            .bind(to: errorNameLabel.rx.isHidden)
            .disposed(by: disposeBag)
        emailValid
            .bind(to: emailErrorLabel.rx.isHidden)
            .disposed(by: disposeBag)
        allValid
            .bind(to: buttonCheckin.rx.isEnabled)
            .disposed(by: disposeBag)
    }
    
    @objc func checkIn() {
        delegate?.startSpinner()
        checkinObservable.subscribe(
            onNext: {[weak self] _ in
                self?.delegate?.stopSpinner()
                self?.delegate?.showAlert(title: "foi", message: "Realmente foi")
                print("Deu certo:")
            }
        )
        .disposed(by: disposeBag)
    }
}


