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
            cameraPicer.allowsEditing = true
            present(cameraPicer, animated: true, completion: nil)
        
        }else{
            print("エラー")
        }
    
        
        
}
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        picker.dismiss(animated: true, completion: nil)
        <#code#>
    }
    
    

    @IBAction func openAlbum(_ sender: Any) {
        
        let sourceType = UIImagePickerController.SourceType.photoLibrary
        //カメラが利用可能かチェック
        
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            
            //変数化
            
            let cameraPicer = UIImagePickerController()
            cameraPicer.sourceType = sourceType
            cameraPicer.delegate = self
            cameraPicer.allowsEditing = true
            present(cameraPicer, animated: true, completion: nil)
        
        }else{
            print("エラー")
        }
        
    }
    //撮影が完了した時に呼ばれる(アルバムから画像が選択された時に呼ばれる箇所)
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let pickedImage = info[.editedImage] as? UIImage{
            backImageView.image = pickedImage
            
            //写真の保存
            
            UIImageWriteToSavedPhotosAlbum(pickedImage, self, nil, nil)
            picker.dismiss(animated: true, completion: nil)
    }
        
}
    
    //シェアするための機能
    
    
    @IBAction func share(_ sender: Any) {
    
    
        let text = "#tamariba"
        let image = backImageView.image?.jpegData(compressionQuality: 0.2)
        let items = [text,image] as [Any]
       
        let activityVC = UIActivityViewController(activityItems: items, applicationActivities: nil)
        present(activityVC, animated: true, completion: nil)
    }
    
   
}

