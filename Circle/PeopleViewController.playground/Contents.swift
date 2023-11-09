import UIKit
import SafariServices
 
class PeopleViewController: UIViewController {
    
    private let theViewModel = PeopleViewModel()
    
    
    private lazy var theCollectionView: UICollectionView = {
        //先完成layout設定
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = .init(width: UIScreen.main.bounds.width, height: 130)
        
        //實例化一個CollectionView
        let vw = UICollectionView(frame: .zero, collectionViewLayout: layout)
        //把cell註冊進CollectionView
        vw.register(PersonCollectionViewCell.self, forCellWithReuseIdentifier: "PersonCollectionViewCell")
        vw.dataSource = self //data來源
        
        vw.translatesAutoresizingMaskIntoConstraints = false
        return vw
    }()

    //呼叫中心
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        theViewModel.delegate = self
        theViewModel.gerUsers()
    }
}


//負責collectionV iew裡面的資料來源
extension PeopleViewController:UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        theViewModel.people.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = theViewModel.people[indexPath.item]
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
        theCollectionView.reloadData() //reloadData()是collectionView裡面都有的功能
    }
    
    func didFail(error: Error) {
        print("error")
    }
}

//這邊都是負責畫面
private extension PeopleViewController {
    func setupView() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "林佑淳"
        self.view.backgroundColor = .white
        
        self.view.addSubview(theCollectionView)
        
        NSLayoutConstraint.activate([
            
            theCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            theCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            theCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            theCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)

        ])
    }
}
