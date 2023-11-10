//
//  Welcome2ViewController.swift
//  Circle
//
//  Created by 林佑淳 on 2023/10/29.
//



import UIKit
import IGListKit
//這個類別不能被繼承 //不會被修改或擴展
final class PostViewController: UIViewController {

    private var adapter: ListAdapter?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setup()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
    }
    
    
    
    private func setup(){
        
        //IGlistkit
        let PostcollectionView = createCollectionView()
        
        let adapter = ListAdapter(updater: ListAdapterUpdater(), viewController: self)
        
        adapter.collectionView = PostcollectionView
        adapter.dataSource = self
        
        self.adapter = adapter
        
        
        
    }
    
    
    //創建collectionView
    private func createCollectionView() -> UICollectionView {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 20
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: layout
        )
        collectionView.backgroundColor = .systemRed
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
        return collectionView
    }
}



//用於提供數據以配置 IGListKit 中的 ListAdapter
extension PostViewController: ListAdapterDataSource {
    
    //用來計算數據集的差異
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        let data: [NSString] = ["Nike","Jordan","Adidas","LIN"]
        return data
    }
    // 返回一個 ListSectionController 對象，用於配置顯示特定對象的部分
    // ??????
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        
        return LabelSectionController()
        
    }
    
    // 返回一個 UIView 對象，表示在數據集為空時顯示的視圖
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
    
    
}
    
    
   
