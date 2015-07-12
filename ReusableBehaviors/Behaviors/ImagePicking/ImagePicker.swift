//
//  ImagePicker.swift
//  ExampleApp
//
//  Created by Scott Williams on 7/9/15.
//  Copyright (c) 2015 Scott Williams. All rights reserved.
//

import UIKit

public class ImagePickerBehavior: Behavior, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBInspectable var useLibrary: Bool = true
    @IBInspectable var useCamera: Bool = true

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var controller: UIViewController!

    @IBAction func presentPickerOptions(sender: AnyObject) {
        let sheet = UIAlertController(title: nil,
            message: nil,
            preferredStyle: .ActionSheet)
        if useCamera {
            let cameraAction = UIAlertAction(title: "Take Photo...", style: .Default) { action in
                //
            }
            sheet.addAction(cameraAction)
        }
        if useLibrary {
            let libraryAction = UIAlertAction(title: "Choose from Library...", style: .Default) { action in
                sheet.dismissViewControllerAnimated(true, completion: nil)
                self.presentImageLibraryPicker()
            }
            sheet.addAction(libraryAction)
        }
        let cancelAction = UIAlertAction(title: "Cancel",
            style: .Cancel) { action in
            sheet.dismissViewControllerAnimated(true, completion: nil)
        }
        sheet.addAction(cancelAction)
        controller.presentViewController(sheet, animated: true, completion: nil)
    }

    private func presentImageLibraryPicker() {
        let picker = UIImagePickerController()
        picker.sourceType = .PhotoLibrary
        picker.delegate = self
        controller.presentViewController(picker, animated: true, completion: nil)
    }

    private func presentCamera() {

    }

    // MARK: - ImagePickerDelegate
    //- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        imageView.image = image
        picker.dismissViewControllerAnimated(true, completion: nil)
    }

}
