//
//  LoginViewController.swift
//  Circle
//
//  Created by 林佑淳 on 2023/10/29.
//

import UIKit

class LoginViewController: UIViewController {
    
    //MARK: - UI components

    private let headerView = AuthHeaderView(title: "Sign In ", subTitle: "Sign in to continue")
    private let usernameField = CustomTextField(fieldType: .username)
    private let passwordField = CustomTextField(fieldType: .password)
    private let signInButton = CustomButton(title: "Sign In", hasBackground: true, fontSize: .big)
    private let newUserButton = CustomButton(title: "Create New Account" , fontSize: .med)
    private let forgotPasswordButton = CustomButton(title: "Forgot Password?", fontSize: .small)
     
    
    private lazy var fieldStackView: UIStackView = {
        let theStackView = UIStackView()
        theStackView.translatesAutoresizingMaskIntoConstraints = false
        theStackView.axis = .vertical
        theStackView.spacing = 25
        return theStackView
    }()
    private lazy var loginStackView: UIStackView = {
        let theStackView = UIStackView()
        theStackView.translatesAutoresizingMaskIntoConstraints = false
        theStackView.axis = .vertical
        theStackView.spacing = 10
        return theStackView
    }()
    
    //MARK: - LiftCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.setupUI()
        self.signInButton.addTarget(self, action: #selector(didTapSignIn), for: .touchUpInside)
        self.newUserButton.addTarget(self, action: #selector (didTapNewUser), for: .touchUpInside)
        self.forgotPasswordButton.addTarget(self, action: #selector (didTapForgotPassword), for: .touchUpInside)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
        self.didTapNewUser()
    }
    private func setupUI(){ 
    
        
        self.view.addSubview(headerView)
        self.view.addSubview(fieldStackView)
        self.view.addSubview(loginStackView)
        fieldStackView.addArrangedSubview(usernameField)
        fieldStackView.addArrangedSubview(passwordField)
        loginStackView.addArrangedSubview(signInButton)
        loginStackView.addArrangedSubview(newUserButton)
        loginStackView.addArrangedSubview(forgotPasswordButton)

        headerView.translatesAutoresizingMaskIntoConstraints = false
                
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 270),
            
            self.usernameField.heightAnchor.constraint(equalToConstant: 50),
            self.passwordField.heightAnchor.constraint(equalToConstant: 50),
            
            fieldStackView.topAnchor.constraint(equalTo: self.headerView.bottomAnchor ,constant: -20),
            fieldStackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 25),
            fieldStackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor,constant: -25),
            
            loginStackView.topAnchor.constraint(equalTo: fieldStackView.bottomAnchor, constant: 20),
            loginStackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 50),
            loginStackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor,constant: -50),
        ])
    }
    //MARK: - Selectors
    @objc private func  didTapSignIn(){
        let vc = HomeViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present (vc, animated: false, completion: nil)
    }
    @objc private func didTapNewUser(){
        let vc = RegisterViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @objc private  func didTapForgotPassword(){
        let vc = ForgotPasswordViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }

}

