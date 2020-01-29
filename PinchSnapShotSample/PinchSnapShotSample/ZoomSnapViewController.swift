//
//  ZoomSnapViewController.swift
//  PinchSnapShotSample
//
//  Created by jungwook on 2019/11/22.
//  Copyright © 2019 jungwook. All rights reserved.
//

import UIKit

class ZoomSnapViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var snapMainView: UIView!
    var snapView : UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.snapMainView.addSubview(snapView)
        scrollViewSetting()
    }
    
    func scrollViewSetting(){
          self.scrollView.alwaysBounceVertical = false
          self.scrollView.alwaysBounceHorizontal = false
          
          self.scrollView.minimumZoomScale = 1.0
          self.scrollView.maximumZoomScale = 5.0
          self.scrollView.delegate = self
      }

}

extension ZoomSnapViewController : UIScrollViewDelegate{
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.snapMainView
    }
    
}
