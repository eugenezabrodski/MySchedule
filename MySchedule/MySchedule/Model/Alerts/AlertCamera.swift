//
//  AlertCamera.swift
//  MySchedule
//
//  Created by Eugene on 02/02/2024.
//

import UIKit

extension UIViewController {
    
    func alertCamera(completionHandler: @escaping (UIImagePickerController.SourceType) -> Void) {
        
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let camera = UIAlertAction(title: "Camera", style: .default) { _ in
            let camera = UIImagePickerController.SourceType.camera
            completionHandler(camera)
        }
        
        let gallery = UIAlertAction(title: "Gallery", style: .default) { _ in
            let photoLibrary = UIImagePickerController.SourceType.photoLibrary
            completionHandler(photoLibrary)
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        
        alertController.addAction(camera)
        alertController.addAction(gallery)
        alertController.addAction(cancel)
        
        present(alertController, animated: true)
    }
}
