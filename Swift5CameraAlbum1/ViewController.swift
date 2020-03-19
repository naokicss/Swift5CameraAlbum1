//
//  ViewController.swift
//  Swift5CameraAlbum1
//
//  Created by みや on 2020/03/11.
//  Copyright © 2020 みや. All rights reserved.
//

import UIKit
import Photos

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    @IBOutlet weak var backImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        
        PHPhotoLibrary.requestAuthorization {(status) in
            
                switch(status){
                
                case.authorized:
                print("許可されています。")
                
                case.denied:
                print("拒否された。")
                
                case.notDetermined:
                print("notDetermined")
                
                case.restricted:
                print("restricted")
            }
    }


}
    
    @IBAction func openCamera(_ sender: Any) {
        
        let sourceType = UIImagePickerController.SourceType.camera
        //カメラが利用可能かチェック
        
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            
            //変数化
            
            let cameraPicer = UIImagePickerController()
            cameraPicer.sourceType = sourceType
            cameraPicer.delegate = self
            present(cameraPicer, animated: true, completion: nil)
        
        }else{
            print("エラー")
        }
    
        
        
}

    @IBAction func openAlbum(_ sender: Any) {
    }
    
}

