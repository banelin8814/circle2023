//
//  PersonView.swift
//  Circle
//
//  Created by 林佑淳 on 2023/10/31.
//

import UIKit

class PersonView: UIView {
    
    
    private lazy var subscribeButton: UIButton = {
        
        var config = UIButton.Configuration.filled()
        config.title = "Subscribe".uppercased()
        config.baseBackgroundColor = .red
        config.baseForegroundColor = .white
        config.buttonSize = .large
        config.cornerStyle = .medium
        let btn = UIButton(configuration: config)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(didTapSubscribe), for:.touchUpInside)
        return btn
    }()
    
    private lazy var nameLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Bane Lin"
        lbl.font = .systemFont(ofSize: 24, weight: .regular)
        return lbl
    }()
    
    private lazy var emailLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Bane Lin@gmail.com"
        lbl.font = .systemFont(ofSize: 15, weight: .regular)
        return lbl
    }()
    
    private lazy var personStackVw: UIStackView = {
        let vw = UIStackView()
        vw.translatesAutoresizingMaskIntoConstraints = false
        vw.axis = .vertical
        vw.spacing = 8
        return vw
    }()
    
    private var action: () -> ()
    
    init(action: @escaping () -> ()) { //使用 @escaping 是因為call this closure outside of this block ，也就是在 didTapSubscribe那裡觸發
        self.action = action
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")//系統給storyboard用的，這邊用不到
    }
    
    
    
}


private extension PersonView {
    func setup(){
        
        self.layer.cornerRadius = 20
        self.backgroundColor = UIColor.gray.withAlphaComponent (0.1)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(personStackVw)
        personStackVw.addArrangedSubview(nameLbl)
        personStackVw.addArrangedSubview(emailLbl)
        personStackVw.addArrangedSubview(subscribeButton)
        
        NSLayoutConstraint.activate([
            
            personStackVw.topAnchor.constraint(equalTo: self.topAnchor,constant: 8),
            personStackVw.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -8),
            personStackVw.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant:8 ),
            personStackVw.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -8)
            
        ])
    }
    @objc func didTapSubscribe(sender: UIButton){
        action()
    }
}
