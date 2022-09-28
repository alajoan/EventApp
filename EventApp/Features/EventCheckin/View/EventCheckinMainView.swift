//
//  EventCheckinMainView.swift
//  EventApp
//
//  Created by user228425 on 9/28/22.
//

import Foundation
import UIKit

final class EventCheckinMainView: UIView {
    private lazy var nameLabel: DSLabel = {
        let name = DSLabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    private lazy var emailLabel: DSLabel = {
        let email = DSLabel()
        email.translatesAutoresizingMaskIntoConstraints = false
        return email
    }()
    
    private lazy var errorNameLabel: DSLabel = {
        let error = DSLabel()
        error.translatesAutoresizingMaskIntoConstraints = false
        error.textColor = .systemRed
        error.text = "Nome precisa ter ao menos 2 letras"
        error.font = error.font.withSize(10)
        error.textAlignment = .right
        return error
    }()
    
    private lazy var emailErrorLabel: DSLabel = {
        let emailError = DSLabel()
        emailError.translatesAutoresizingMaskIntoConstraints = false
        emailError.textColor = .systemRed
        emailError.text = "seguir o padrão exemplo@servidor.com"
        emailError.textAlignment = .right
        emailError.font = emailError.font.withSize(10)
        return emailError
    }()
    
    public lazy var textfieldName: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Digite seu nome"
        textfield.font = UIFont.systemFont(ofSize: 15)
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
        textfield.placeholder = "Digite seu email"
        textfield.font = UIFont.systemFont(ofSize: 15)
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
        let botao = UIButton()
        botao.setTitle("Check-in", for: .normal)
        botao.backgroundColor = .systemTeal
        botao.translatesAutoresizingMaskIntoConstraints = false
        // botao.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return botao
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

extension EventCheckinMainView {
    private func layoutViews() {
        addSubview(nameLabel)
        addSubview(emailLabel)
        addSubview(errorNameLabel)
        addSubview(emailErrorLabel)
        addSubview(textfieldName)
        addSubview(textfieldEmail)
        addSubview(buttonCheckin)
        
        nameLabelConstraints()
        emailLabelConstraints()
        errorNameLabelConstraints()
        emailErrorLabelConstraints()
        textfieldNameConstraints()
        textFieldEmailConstraints()
        buttonCheckinConstraints()
    }
    
    private func nameLabelConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 60),
            nameLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 40),
            nameLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -230)
        ])
    }
    
    private func emailLabelConstraints() {
        NSLayoutConstraint.activate([
            emailLabel.topAnchor.constraint(equalTo: textfieldName.bottomAnchor, constant: 20),
            emailLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 40),
            emailLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -230)
        ])
    }
    
    private func errorNameLabelConstraints() {
        NSLayoutConstraint.activate([
            errorNameLabel.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor),
            errorNameLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 10),
            errorNameLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            errorNameLabel.bottomAnchor.constraint(equalTo: textfieldName.topAnchor, constant: 10)
        ])
    }
    
    private func emailErrorLabelConstraints() {
        NSLayoutConstraint.activate([
            emailErrorLabel.centerYAnchor.constraint(equalTo: emailLabel.centerYAnchor),
            emailErrorLabel.leadingAnchor.constraint(equalTo: emailLabel.trailingAnchor, constant: 10),
            emailErrorLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            emailErrorLabel.bottomAnchor.constraint(equalTo: textfieldEmail.topAnchor, constant: 10)
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


