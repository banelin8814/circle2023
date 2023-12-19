//
//  LoginViewController.swift
//  Circle
//
//  Created by 林佑淳 on 2023/10/29.
//

import UIKit

class LoginViewController: UIViewController {
    
    private let headerView = AuthHeaderView(title: "Sign In!", subTitle: "Sign in to continue")
    private let usernameField = CustomTextField(fieldType: .username )
    private let passwordField = CustomTextField(fieldType: .password)
    
    private lazy var loginStackView: UIStackView = {
        let theStackView = UIStackView()
        theStackView.translatesAutoresizingMaskIntoConstraints = false
        theStackView.axis = .vertical
        theStackView.spacing = 25
        return theStackView
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        view.backgroundColor = .systemBackground
    }
    
    
    
    
    private func setupUI(){
    
        
        self.view.addSubview(headerView)
        self.view.addSubview(loginStackView)
        loginStackView.addArrangedSubview(usernameField)
        loginStackView.addArrangedSubview(passwordField)
        
        

        headerView.translatesAutoresizingMaskIntoConstraints = false
                
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 270),
            
            self.usernameField.heightAnchor.constraint(equalToConstant: 50),
            self.passwordField.heightAnchor.constraint(equalToConstant: 50),
            
            loginStackView.topAnchor.constraint(equalTo: self.headerView.bottomAnchor ,constant: -20),
            loginStackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 25 ),
            loginStackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor,constant: -25),
            
        ])
            
    }
}

