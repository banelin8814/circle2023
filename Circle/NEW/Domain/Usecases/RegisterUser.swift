
import UIKit

protocol PhotoPostingFlowCoordinatorDependencies {
    // 你的其他依賴項，例如 ViewControllers、ViewModels、Managers 等
    func makeTakePhotoViewController(delegate: TakePhotoViewControllerDelegate) -> TakePhotoViewController
    func makePostViewController(photo: UIImage) -> PostViewController
    func makeUserProfileViewController() -> UserProfileViewController
}

final class PhotoPostingFlowCoordinator: Coordinator {
    let dependencies: PhotoPostingFlowCoordinatorDependencies
    private weak var navigationController: UINavigationController?

    init(dependencies: PhotoPostingFlowCoordinatorDependencies, navigationController: UINavigationController) {
        self.dependencies = dependencies
        self.navigationController = navigationController
    }

    func start() {
        // 在這裡啟動拍照和貼文的流程
        let takePhotoVC = dependencies.makeTakePhotoViewController(delegate: self)
        navigationController?.pushViewController(takePhotoVC, animated: true)
    }

    // 實作 TakePhotoViewControllerDelegate 以處理拍照完成後的操作
    func photoCaptured(_ photo: UIImage) {
        // 在這裡處理拍照完成後的操作，例如顯示貼文畫面
        let postViewController = dependencies.makePostViewController(photo: photo)
        navigationController?.pushViewController(postViewController, animated: true)
    }

    // 實作其他方法，用於處理貼文、個人等相關的操作
    func showPostScene() {
        let postViewController = dependencies.makePostViewController(photo: UIImage())
        navigationController?.pushViewController(postViewController, animated: true)
    }

    func showUserProfileScene() {
        let userProfileViewController = dependencies.makeUserProfileViewController()
        navigationController?.pushViewController(userProfileViewController, animated: true)
    }
}
