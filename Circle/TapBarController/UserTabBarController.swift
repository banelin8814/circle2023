//
//  UserTabBarController.swift
//  Circle
//
//  Created by 林佑淳 on 2023/12/15.
//

import UIKit

class UserTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabs()
    }
    

    private func configureTabs(){
        let vc1 = PostViewController()
        let vc2 = TakePhotoViewController()
        
        vc1.tabBarItem.image = UIImage(systemName: "teddybear.fill")
        vc2.tabBarItem.image = UIImage(systemName: "camera.fill")
        
        vc1.title = "Post"
        vc2.title = "TakePhoto"
        
        let nav1 = UINavigationController(rootViewController: vc1)
        let nav2 = UINavigationController(rootViewController: vc2)
        tabBar.tintColor = .label
        tabBar.backgroundColor = .systemGray3
        setViewControllers([nav1,nav2], animated: true)
    }

}
