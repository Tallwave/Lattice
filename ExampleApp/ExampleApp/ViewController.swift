//
//  ViewController.swift
//  ExampleApp
//
//  Created by Scott Williams on 7/9/15.
//  Copyright (c) 2015 Tallwave. All rights reserved.
//

import UIKit
import Lattice

class ViewController: UIViewController {

    @IBOutlet weak var emailTextField: IconTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func stuffTapped(sender: AnyObject) {
        emailTextField.removeFromSuperview()
        emailTextField = nil
        TextFieldDelegateDispatcher.dispatcher.count()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

