////
////  CustomButton.swift
////  Circle
////
////  Created by 林佑淳 on 2023/12/19.
////
//
//import UIKit
//
//class CustomButton: UIButton {
//    
//    
//    enum FontSize {
//        case big
//        case med
//        case small
//    }
//    
//    
//    init(title: String, hasBackground: Bool = false, fontSize: FontSize) {
//        super.init(frame: .zero)
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//}
//
//
//self.backgroundColor = hasBackground ? .systemBlue : .clear
//
//let titleColor: UIColor = hasBackground ? .white : .systemBlue
//self.setTitleColor(titleColor, for: .normal)
//
//
//switch fontSize {
//case .big:
//    self.titleLabel?.font = .systemFont(ofSize: 22, weight: .bold)
//case .med:
//    self.titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
//case .small:
//    self.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
//    
//    
//}
//required init?(coder: NSCoder) {
//    fatalError("init(coder:) has not been implemented")
//}
//
//
