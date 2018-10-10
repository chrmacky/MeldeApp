//
//  ViewController.swift
//  MeldeApp
//
//  Created by Christoph Lemke on 09.10.18.
//  Copyright © 2018 Christoph Lemke. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //MARK: Properties
    @IBOutlet weak var reportTextField: UITextField!
    @IBOutlet weak var reportImageView: UIImageView!
    @IBOutlet weak var reportProgressView: UIProgressView!
    
    @IBOutlet weak var descReportTextField: UITextField!
    @IBOutlet weak var originatorLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // handle the user inpiut througt delegate callbacks
        reportTextField.delegate = self
        descReportTextField.delegate = self
        reportProgressView.progress = 0.0
    }
    

    //MARK: UIImagePickerControllerDelegate
    
    // close the picker if the user cancel the picker
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // discard the picker, if the user canceled
        dismiss(animated: true, completion: nil)
    }
    
    // the user select a photo from their own library
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        //only use the original image
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else{
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        //set the image to display
        reportImageView.image = selectedImage
        // discard the picker, if the user canceled
        dismiss(animated: true, completion: nil)
    }
    //MARK: Action
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        //Hide the keyboard
        reportProgressView.resignFirstResponder()
        descReportTextField.resignFirstResponder()
        // UIImagePickerController is a view controller that lets a user pick media from their own photo library
        let imagePickerController = UIImagePickerController()
        // only picked photos, not taken
        imagePickerController.sourceType = .photoLibrary
        // make sure viewcontroller is notified when user picks an image
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    // Soll später über zufall verteilt werden
    @IBAction func progressBtnTapped(_ sender: UIButton) {
        let progressControl = ProgressControl()
        let (progressValue, progressColor) = progressControl.updateProgress(progressValue: reportProgressView.progress)
        reportProgressView.progress = progressValue
        reportProgressView.progressTintColor = progressColor
    }
    
}
