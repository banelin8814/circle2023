//
//  CustomButton.swift
//  Circle
//
//  Created by 林佑淳 on 2023/12/19.
//

import UIKit

class CustomButton: UIButton {
    
    
    enum FontSize {
        case big
        case med
        case small
    }
    
    
    init(title: String, hasBackground: Bool = false, fontSize: FontSize) {
        super.init(frame: .zero)
        
        self.setTitle(title, for: .normal) //設置標題
        
        self.layer.cornerRadius = 12
        self.layer.masksToBounds = true
        self.backgroundColor = hasBackground ? .systemRed : .clear
      
        let titleColor:UIColor = hasBackground ? .white : .systemRed
        self.setTitleColor(titleColor, for: .normal) //設置標題顏色
       
        switch fontSize {
        case .big: //如果是大字體
            self.titleLabel?.font = .systemFont(ofSize: 22, weight: .bold)  
        case .med:
            self.titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        case .small:
            self.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
            
            
            
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



