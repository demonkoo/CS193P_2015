//
//  BezierPathsView.swift
//  DropitSwift
//
//  Created by SkyeKoo on 15/3/4.
//  Copyright (c) 2015年 SkyeKoo. All rights reserved.
//

import UIKit

class BezierPathsView: UIView {

    private var bezierPaths = [String:UIBezierPath]()
    
    func setPath(path: UIBezierPath?, named name: String) {
        bezierPaths[name] = path
        setNeedsDisplay()
    }
    
    override func drawRect(rect: CGRect) {
        for (_, path) in bezierPaths {
            path.stroke()
        }
    }
    

}
