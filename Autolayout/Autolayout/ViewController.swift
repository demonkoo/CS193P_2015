//
//  ViewController.swift
//  Autolayout
//
//  Created by SkyeKoo on 15/3/1.
//  Copyright (c) 2015年 SkyeKoo. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var loginField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var passwordLabel: UILabel!
    // No need for the outlet of Username label, for nothing gonna be changed
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    var secure: Bool = false { didSet { updateUI() } }
    
    private func updateUI() {
        passwordField.secureTextEntry = secure
        passwordLabel.text = secure ? "Secured Password" : "Password"
    }
    
    @IBAction func toggleSecurity() {
        secure = !secure
    }
    
}

