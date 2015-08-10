//
//  ImagePicker.swift
//  ExampleApp
//
//  Created by Scott Williams on 7/9/15.
//  Copyright (c) 2015 Tallwave. All rights reserved.
//

import UIKit

/**
    Wraps up the logic to pick an image. The user can use the Last Photo Taken,
Camera, or pick from their library. The image is sent to an `ImageReceiver` to
handle what was picked.

In many cases you just want to display the image in a `UIImageView`. Use the
`StandardImagePickerBehavior` for that to avoid creating a separate Receiver.
*/
public class ImagePickerBehavior: Behavior, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    /**
        Which sources to pick from.
    
        TODO: 
            * If only one picker is enabled, don't display the sheet
    */
    @IBInspectable public var useLibrary: Bool = true
    @IBInspectable public var useCamera: Bool = true
    @IBInspectable public var useLastPhoto: Bool = true

    @IBOutlet weak public var imageReceiver: ImageReceiver!
    
    /**
        Likely the same as the `owner`, but could be different. Needed to have 
    an origin to display the UIImagePickerController.
    */
    @IBOutlet weak public var controller: UIViewController!

    @IBAction public func presentPickerOptions(sender: AnyObject) {
        let sheet = UIAlertController(title: nil,
            message: nil,
            preferredStyle: .ActionSheet)
        if useLastPhoto {
            let lastPhotoAction = UIAlertAction(title: "Last Photo Taken...", style: .Default) { action in
                sheet.dismissViewControllerAnimated(true, completion: nil)
                self.retrieveLastPhoto()
            }
            sheet.addAction(lastPhotoAction)
        }
        if useCamera {
            let cameraAction = UIAlertAction(title: "Take Photo...", style: .Default) { action in
                sheet.dismissViewControllerAnimated(true, completion: nil)
                self.presentCamera()
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
        let picker = UIImagePickerController()
        picker.sourceType = .Camera
        picker.delegate = self
        controller.presentViewController(picker, animated: true, completion: nil)
    }

    private func retrieveLastPhoto() {
        let lastPhotoRetriever = LastPhotoRetriever()
        lastPhotoRetriever.fetchLastPhoto(resizeTo: nil) { [unowned self] image in
            self.sendImageToReceiver(image)
        }
    }

    // MARK: - ImagePickerDelegate
    //- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo
    public func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        sendImageToReceiver(image)
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    public func sendImageToReceiver(image: UIImage?) {
        imageReceiver.handleImage(image)
    }
}
