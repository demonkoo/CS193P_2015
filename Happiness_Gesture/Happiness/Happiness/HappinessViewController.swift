//
//  HappinessViewController.swift
//  Happiness
//
//  Created by SkyeKoo on 15/2/27.
//  Copyright (c) 2015年 SkyeKoo. All rights reserved.
//

import UIKit

class HappinessViewController: UIViewController, FaceViewDataSource
{
    @IBOutlet weak var faceView: FaceView! {
        didSet {
            faceView.dataSource = self  // HappinessViewController is a FaceViewDataSource
            faceView.addGestureRecognizer(UIPinchGestureRecognizer(target: faceView, action: "scale:"))
        }
    }
    
    private struct Constants {
        static let HappinessGestureScale: CGFloat = 4
    }
    
    @IBAction func changeHappiness(gesture: UIPanGestureRecognizer) {
        switch gesture.state {
        case .Ended: fallthrough
        case .Changed:
            let translation = gesture.translationInView(faceView)
            let happinessChange = -Int(translation.y / Constants.HappinessGestureScale)
            if happinessChange != 0 {
                happiness += happinessChange
                gesture.setTranslation(CGPointZero, inView: faceView)
            }
        default: break
        }
    }
    
    // Different from similiness, smiliness is just the arc of the mouth
    var happiness: Int = 0 {   // 0 - very sad, 100 - ecstatic
        // Property Observer
        didSet {
            happiness = min(max(happiness, 0), 100)
            println("happiness = \(happiness)")
            updateUI()
        }
    }
    
    func updateUI() {
        faceView.setNeedsDisplay()  // Needs to re-draw everytime when happiness is set
    }
    
    func smilinessForFaceView(sender: FaceView) -> Double? {
        return Double(happiness-50)/50
    }
}
