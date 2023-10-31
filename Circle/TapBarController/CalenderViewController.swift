//
//  CalenderViewController.swift
//  Circle
//
//  Created by 林佑淳 on 2023/10/30.
//

import UIKit

class CalenderViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        createCalender()
        
        // Do any additional setup after loading the view.
    }
    
    func createCalender(){
        let myCalenderView = UICalendarView()
        myCalenderView.translatesAutoresizingMaskIntoConstraints = false
        myCalenderView.calendar = .current
        myCalenderView.locale = .current
        myCalenderView.fontDesign = .rounded
        myCalenderView.delegate = self
        
        view.addSubview(myCalenderView)
        
        
        NSLayoutConstraint.activate([
            myCalenderView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 10),
            myCalenderView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -10),
            myCalenderView.heightAnchor.constraint(equalToConstant: 500),
            myCalenderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
            
        ])
        
        var wantsDateDecorations = myCalenderView.wantsDateDecorations
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    }
}


extension CalenderViewController: UICalendarViewDelegate {
    func calendarView(_ calendarView: UICalendarView, decorationFor dateComponents: DateComponents) -> UICalendarView.Decoration? {
        return .customView {
            // 返回一個 UIImageView 物件
            let imageView = UIImageView()
            
            // 設置照片的圖像
//            imageView.image = UIImage(coolImage)
            
            // 返回 UIImageView 物件
            return imageView
        }
    }
    
}
