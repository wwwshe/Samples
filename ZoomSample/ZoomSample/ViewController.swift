//
//  ViewController.swift
//  ZoomSample
//
//  Created by jungwook on 2019/11/18.
//  Copyright © 2019 jungwook. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private var magnifyView: MagnifyView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let point = touches.first?.location(in: self.view)
        if magnifyView == nil
        {
            magnifyView = MagnifyView.init(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
            magnifyView?.magnifyView = self.view
            magnifyView?.setTouchPoint(pt: point!)
            self.view.addSubview(magnifyView!)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if magnifyView != nil
        {
            magnifyView?.removeFromSuperview()
            magnifyView = nil
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let point = touches.first?.location(in: self.view)
        magnifyView?.setTouchPoint(pt: point!)
        magnifyView?.setNeedsDisplay()
    }
    
}
