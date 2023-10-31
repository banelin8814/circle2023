//
//  Welcome2ViewController.swift
//  Circle
//
//  Created by 林佑淳 on 2023/10/29.
//

import UIKit
 
class WelcomeViewController: UIViewController {
    
    
    private lazy var personVw: PersonView = {
        let vw = PersonView {[weak self] in
            self?.sayHello()
        }
        return vw
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
}


private extension WelcomeViewController {
    func setup() {
        self.view.backgroundColor = .white
        
        self.view.addSubview(personVw)
        self.view.addSubview(personVw)
        NSLayoutConstraint.activate([
        personVw.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        personVw.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8), personVw.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
        ])
    }
    func sayHello(){
        print("幹")
    }
}
