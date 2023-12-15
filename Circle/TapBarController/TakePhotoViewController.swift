//
//  ViewController.swift
//  Circle
//
//  Created by 林佑淳 on 2023/10/23.
//
import AVFoundation
import UIKit

class TakePhotoViewController: UIViewController {

    // Capture Session     // 屬性，用於儲存攝影機捕捉的影像
    var session: AVCaptureSession?
    // Photo Output     // 輸出，用於將攝影機捕捉的影像輸出到螢幕上
    let output = AVCapturePhotoOutput()
    // Video Preview     // 視窗圖層，用於顯示攝影機捕捉的影像
    let previewlayer = AVCaptureVideoPreviewLayer()
    // Shutter button   //快門按鍵外觀
    let shutterbutton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        button.layer.cornerRadius = 50
        button.layer.borderWidth = 10
        button.layer.borderColor = UIColor.white.cgColor
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        view.backgroundColor = .black
        
        //加入sublayer，是相機視窗//將視窗圖層添加到視圖上
        view.layer.addSublayer(previewlayer)
        //加入subview，是快門按鍵//將快門按鈕添加到視圖上
        view.addSubview(shutterbutton)
        //快門按鍵功能//設定快門按鈕的點擊事件
        shutterbutton.addTarget(self, action: #selector(didTapTakePhoto), for: .touchUpInside)
        
        // 設定快門按鈕的點擊事件
        checkCameraPermissions()
        
        
        
    }
    // viewDidLayoutSubviews() 方法，在視圖布局完成時被呼叫
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        //MARK: - 首頁標籤

        let width = view.frame.size.width
        let height = view.frame.size.height
        let size = min(width, height) * 0.5
        
        //相機視窗
        previewlayer.frame = CGRect(x: (width - size) / 2, y:(height - size) / 2, width: view.frame.size.width * 0.5, height: view.frame.size.height * 0.5)

        previewlayer.cornerRadius = 50
        
        
        
        //快門按鍵位置
        shutterbutton.center = CGPointMake(view.frame.size.width/2, view.frame.size.height - 130)
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    //MARK: -  確認許可

    private func checkCameraPermissions() {
        switch AVCaptureDevice.authorizationStatus(for: .video){
            
        case .notDetermined:
            //要求存取
            AVCaptureDevice.requestAccess(for: .video) { [weak self] granted in
                guard granted else {
                    return
                } //weak 防止記憶體洩漏，記憶體外漏是指一個物件仍然存在於記憶體中，但它已經不再被使用。
                
                DispatchQueue.main.async {
                    self?.setUpCamera()
                }
            }
        case .restricted:
            break
        case .denied:
            break
        case .authorized:
            setUpCamera() //授權了就可以來設置相機
        @unknown default:
            break
        }
        //MARK: - 設置相機

    }
    
    //MARK: - 設置相機

    private func setUpCamera(){
        let coolSession = AVCaptureSession()
        if let coolDevice = AVCaptureDevice.default(for: .video){ //如果可以實例化device，就往以下步驟操作
            do{
                let input = try AVCaptureDeviceInput(device: coolDevice)
                if coolSession.canAddInput(input){
                    coolSession.addInput(input)
                }
                
                if coolSession.canAddOutput(output){
                    coolSession.addOutput(output)
                }
                
                previewlayer.videoGravity = .resizeAspectFill //調整縱橫比填滿
                previewlayer.session = coolSession
                
                coolSession.startRunning()
                self.session = coolSession //retain to globol
            }
            catch{
                print("錯誤")
            }
            
        }
    }
    
    
    @objc private func didTapTakePhoto(){
        output.capturePhoto(with: AVCapturePhotoSettings(),
                            delegate: self)
    }
}

extension TakePhotoViewController: AVCapturePhotoCaptureDelegate {
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        guard let coolData = photo.fileDataRepresentation() else {
            return
        }
        let coolImage = UIImage(data: coolData)
        
        session?.stopRunning()
        
        let imageView = UIImageView(image: coolImage)
        imageView.contentMode = .scaleAspectFill
        imageView.frame = view.bounds
        view.addSubview(imageView)
    }
}




//MARK: - 預覽
//#Preview{
//    let controller1 = ViewController()
//    return controller1
//}
//

