//
//  PostViewController.swift
//  Circle
//
//  Created by 林佑淳 on 2023/12/14.
//

import UIKit
import IGListKit

class PostViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        setup()
        
    }
    
    
    private var adapter: ListAdapter?
    
    
    private func setup() {
        let collectionView = createCollectionView()
        let updater = ListAdapterUpdater()
        let adapter = ListAdapter(updater: updater, viewController: self)
        adapter.collectionView = collectionView
        adapter.dataSource = self
        self.adapter = adapter
    }
    
    //    (updater: IGListAdapterUpdater(), viewController: self)
    
    private func createCollectionView () -> UICollectionView {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 20
        layout.minimumLineSpacing = 20
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .black
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        return collectionView
    }
    
}


    
    
    
    
  



extension PostViewController: ListAdapterDataSource {
      
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        let data: [NSString] = ["Apple", "Facebook" , "Google", "Amazon"]
        return data
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        return LabelSectionController()
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
    
    
}
