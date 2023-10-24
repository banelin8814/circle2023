//
//  ViewController.swift
//  Circle
//
//  Created by 林佑淳 on 2023/10/23.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    

    @IBOutlet weak var cameraView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       
        
        let captureSession = AVCaptureSession()
        
        var isAuthorized: Bool {
            get async {//非同步存取的計算屬性。表示屬性的值可能不是立即可用的，需要一段時間才能計算出來。
              
                //函式會返回使用者對攝影機的存取權限狀態。
                let status = AVCaptureDevice.authorizationStatus(for: .video)
                
                var isAuthorized = status == .authorized  //status ==.authorized也就是true，status !== authorized就是false
                
           
                if status == .notDetermined { //尚未決定使用者的存取權限狀態
                    
                    isAuthorized = await AVCaptureDevice.requestAccess(for: .video)
                    //使用 await 關鍵字後，程式碼會被掛起，直到 AVCaptureDevice.requestAccess(for: .video) 函式完成。
                    //當函式完成時，isAuthorized 變數的值將被設定為 true 或 false，程式碼將繼續執行。
                }
                
                return isAuthorized
            }
        }
        

        func setUpCaptureSession() async { //非同步函式
            guard await isAuthorized else { return } //true/false，使用者未授權攝影機存取權限，則程式碼將直接返回
            //使用 await 關鍵字後，程式碼會被掛起
            //guard...else文法：如果條件為真，則程式碼會繼續執行。如果條件為假，則程式碼會跳轉到 else 分支，或直接返回
            
        }

        captureSession.beginConfiguration()// 開始攝影機擷取會話的配置
        
        
        //MARK: - canAddInput

        let videoDevice = AVCaptureDevice.default(.builtInDualCamera,for: .video,position: .unspecified)
        
        guard
            let videoDeviceInput = try? AVCaptureDeviceInput(device: videoDevice!), //是否可以建立一個攝影機輸入，try失敗一定是返回nil
            captureSession.canAddInput(videoDeviceInput)//"攝影機擷取會話"是否可以添加該輸入
            //如果以上兩個條件都為真，則程式碼會繼續執行。如果兩個條件都為假，則程式碼會跳轉到
            else { return }
        captureSession.addInput(videoDeviceInput)//將"攝影機輸入"添加到"攝影機擷取會話"中。
        
        
        
        
        //MARK: - canAddOutput

        let photoOutput = AVCapturePhotoOutput()
        guard captureSession.canAddOutput(photoOutput) else { return } //檢查是否可以將攝影機照片輸出物件添加到攝影機擷取會話中
        captureSession.sessionPreset = .photo //表示攝影機擷取會話將以最佳設定拍攝照片
        captureSession.addOutput(photoOutput) //將 photoOutput 輸出添加到攝影機擷取會話中。
       
        captureSession.commitConfiguration() // 提交攝影機擷取會話的配置
        
        
        //MARK: - 預覽畫面

        class PreviewView: UIView {

            override class var layerClass: AnyClass {
                return AVCaptureVideoPreviewLayer.self //指定視圖應該使用AVCaptureVideoPreviewLayer圖層類別。
            }
            
            /// Convenience wrapper to get layer as its statically known type.
            var videoPreviewLayer: AVCaptureVideoPreviewLayer {
                return layer as! AVCaptureVideoPreviewLayer
            }
        }
        
     


    }
    
   
    
    
}
