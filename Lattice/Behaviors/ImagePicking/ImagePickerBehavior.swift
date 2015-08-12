//
//  ImagePicker.swift
//  ExampleApp
//
//  Created by Scott Williams on 7/9/15.
//  Copyright (c) 2015 Tallwave. All rights reserved.
//

import UIKit

/**
    Wraps up the logic for picking an image. The user first picks to use the Last Photo Taken, Camera, or pick from their Library. A `UIImagePickerController` is presented (if applicable), and then the image is sent to an `ImageReceiver` to handle what was picked.

    In many cases you just want to display the image in a `UIImageView`. If you don't need the extra customizability that the `ImageReceiver` provides, wse the `StandardImagePickerBehavior`.

## Usage
1. Drag an Object onto the scene in Interface Builder
2. Set its class to `ImagePickerBehavior`
3. Connect the `owner` and `controller` outlets
4. Connect the `presentPickerOptions` action (usually to a `TouchUpInside` event)
5. Drag another Object onto the scene and use an `ImageReceiver` subclass
6. Connect an outler from the `imageReceiver` property here to the new `ImageReceiver` object

*/
public class ImagePickerBehavior: Behavior, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    // MARK: - Sources
    // TODO:
    //   * If only one picker is enabled, don't display the sheet

    /**
        Allow the user to pick images from their own library.
    */
    @IBInspectable public var useLibrary: Bool = true
    /**
        Allow the user to take pictures with their camera.
    */
    @IBInspectable public var useCamera: Bool = true
    /**
        Pulls the last photo taken from the user's library.
    */
    @IBInspectable public var useLastPhoto: Bool = true

    // MARK: - Receiver
    /**
        When an image is picked, this object receives it and does something intelligent with it.
    */
    @IBOutlet weak public var imageReceiver: ImageReceiver!

    // MARK: - User Interaction
    /**
        Likely the same as the `owner`, but could be different. This is necessary to present `UIImagePickerControllers`.
    */
    @IBOutlet weak public var controller: UIViewController!

    /**
        Displays a sheet with all of the actions available.
    */
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
    public func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        sendImageToReceiver(image)
        picker.dismissViewControllerAnimated(true, completion: nil)
    }

    /**
    Sends the image that was picked to the `ImageReceiver`.
    */
    public func sendImageToReceiver(image: UIImage?) {
        imageReceiver.handleImage(image)
    }
}
