//
//  PersonView.swift
//  Circle
//
//  Created by 林佑淳 on 2023/10/31.
//

import UIKit

class PersonView: UIView {
    
    //設計一個按鈕
    private lazy var subscribeButton: UIButton = {//lazy是變數被實例化才會佔用空間
        //設置subscribeButton按鈕
        var config = UIButton.Configuration.filled()
        config.title = "Subscribe".uppercased()
        config.baseBackgroundColor = .red
        config.baseForegroundColor = .white
        config.buttonSize = .large
        config.cornerStyle = .medium
        
        //把設置傳送進按鈕中
        let theSubscribeButton = UIButton(configuration: config)
        //只要是影加入Constraints，都會要將下面設為false
        theSubscribeButton.translatesAutoresizingMaskIntoConstraints = false
        //self是指定在viewcontroller
        //進行didTapSubscribe的行動，他是一個func
        //for後面是event可以被監聽
        theSubscribeButton.addTarget(self, action: #selector(didTapSubscribe), for:.touchUpInside)
        
        return theSubscribeButton
    }()
    //設計一個名字
    private lazy var nameLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Bane Lin"
        lbl.font = .systemFont(ofSize: 24, weight: .regular)
        return lbl
    }()
    //設計一個信箱標籤
    private lazy var emailLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Bane Lin@gmail.com"
        lbl.font = .systemFont(ofSize: 15, weight: .regular)
        return lbl
    }()
    
    private lazy var personStackVw: UIStackView = {
        let theStackView = UIStackView()
        theStackView.translatesAutoresizingMaskIntoConstraints = false
        theStackView.axis = .vertical
        theStackView.spacing = 8
        return theStackView
    }()

    //使用closure的方法來處理view和viewcontroller的溝通
    private var action: () -> ()
    init(action: @escaping () -> ()) {
        self.action = action
        super.init(frame: .zero)
        setup()
    }//@escaping的用法是因為，他是在外面被呼叫，也就是didTapSubscribe
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")//系統給storyboard用的，這邊用不到
    }
    
    func set(name: String, email: String){
        nameLbl.text = name
        emailLbl.text = email
        
    }
    
}
private extension PersonView {
    func setup(){
        
        //PersonView的設定
        self.layer.cornerRadius = 20
        self.backgroundColor = UIColor.gray.withAlphaComponent (0.1)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        //PersonView加入personStackVw
        //personStackVw再加入下面這些ui元件
        self.addSubview(personStackVw)
        personStackVw.addArrangedSubview(nameLbl)
        personStackVw.addArrangedSubview(emailLbl)
        personStackVw.addArrangedSubview(subscribeButton)
        
        
        //personStackVw裡面元件與外框的空間
        NSLayoutConstraint.activate([
            
            personStackVw.topAnchor.constraint(equalTo: self.topAnchor,constant: 8),
            personStackVw.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -8),
            personStackVw.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant:8 ),
            personStackVw.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -8)
        ])
    }
    
    //選擇UIButton 為type
    @objc func didTapSubscribe(sender: UIButton){
        action() //view和viewcontroller的橋樑
    }
}
