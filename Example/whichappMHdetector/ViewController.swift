//
//  ViewController.swift
//  whichappMHdetector
//
//  Created by sajjadsarkoobi on 11/10/2018.
//  Copyright (c) 2018 sajjadsarkoobi. All rights reserved.
//

import UIKit
import whichappMHdetector

class ViewController: UIViewController {

    
    //IBOutlets
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var wordTextField: UITextField!
    
    
    //Variables
    let mentionHashtag = mentionHashtagDetector()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ///Setting Delegates:
        //UITextView Delegate
        textView.delegate = self
        //mentionHashtagDetector Delegate
        mentionHashtag.delegate = self
    }
}

extension ViewController:UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        ///send every change in UITextView to the mentionHashtagDetector
        mentionHashtag.detectSign(textView: textView)
    }
}



///Response of mentionHashtagDetector
extension ViewController:mentionHashtagDetectorDelegate {
    func didSignDetected(_ text: String, _ signType: signTypeModels) {
      
        switch signType {
        case .hashTag:
            typeLabel.text = "\(signType)  => #"
            break
        case .mention:
            typeLabel.text = "\(signType)  => @"
            break
        default:
            typeLabel.text = ""
            break
        }
        
        wordTextField.text = text
    }
    
    
}

