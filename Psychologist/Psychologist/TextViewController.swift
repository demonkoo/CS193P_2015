//
//  TextViewController.swift
//  Psychologist
//
//  Created by SkyeKoo on 15/2/28.
//  Copyright (c) 2015年 SkyeKoo. All rights reserved.
//

import UIKit

class TextViewController: UIViewController
{
    @IBOutlet weak var textView: UITextView! {
        didSet {
            textView.text = text
        }
    }
    
    var text: String = "" {
        didSet {
            textView?.text = text   // In case when called while preparing
        }
    }
    
    override var preferredContentSize: CGSize {
        get {
            if textView != nil && presentingViewController != nil {
                return textView.sizeThatFits(presentingViewController!.view.bounds.size)
            } else {
                return super.preferredContentSize
            }
        }
        set { super.preferredContentSize = newValue }
    }
}
