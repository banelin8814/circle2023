//
//  Welcome2ViewController.swift
//  Circle
//
//  Created by 林佑淳 on 2023/10/29.
//

import UIKit
import SafariServices
 
class PeopleViewController: UIViewController {
    
    private let vm = PeopleViewModel()
    
    private lazy var cv: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = .init(width: UIScreen.main.bounds.width, height: 130)
        let vw = UICollectionView(frame: .zero, collectionViewLayout: layout)
        vw.register(PersonCollectionViewCell.self, forCellWithReuseIdentifier: "PersonCollectionViewCell")
        vw.dataSource = self //data來源
        
        vw.translatesAutoresizingMaskIntoConstraints = false
        return vw
    }()

    //呼叫中心
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        vm.delegate = self
        vm.gerUsers()
    }
}

extension PeopleViewController:UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        vm.people.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = vm.people[indexPath.item]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PersonCollectionViewCell",
                                                      for: indexPath) as! PersonCollectionViewCell
        cell.delegate = self
        cell.item = item
        
        return cell
    }
    
}

extension PeopleViewController: PersonCollectionViewCellDelegate{
    func didTapSubscribe() {
        let url = URL(string: "https://www.youtube.com/@tundsdev")!
        let vc = SFSafariViewController(url: url)
        vc.modalPresentationStyle = .formSheet
        self.present (vc, animated: true)
    }
}

extension PeopleViewController: PeopleViewModelDelegate{
    func didFinish() {
        cv.reloadData() //reloadData()是collectionView裡面都有的功能
 
    }
    
    func didFail(error: Error) {
        print("error")
    }
}

//這邊都是負責畫面
private extension PeopleViewController { //private是只有這個VC才可以用
    func setupView() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "林佑淳"
        self.view.backgroundColor = .white
        
        self.view.addSubview(cv)
        
        NSLayoutConstraint.activate([
            
            cv.topAnchor.constraint(equalTo: view.topAnchor),
            cv.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            cv.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            cv.trailingAnchor.constraint(equalTo: view.trailingAnchor)

        ])
    }
}
