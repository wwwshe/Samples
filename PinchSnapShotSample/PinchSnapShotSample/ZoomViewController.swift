//
//  ZoomViewController.swift
//  PinchSnapShotSample
//
//  Created by jungwook on 2019/11/19.
//  Copyright © 2019 jungwook. All rights reserved.
//

import UIKit

class ZoomViewController: ViewControllerHelper {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var snapShotImageView: UIImageView!
    var image : UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        snapShotImageView.image = image
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

extension ZoomViewController : UIScrollViewDelegate{
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
    
        return self.snapShotImageView
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        if scrollView.zoomScale > 1 {
            if let image = snapShotImageView.image {
                let ratioW = snapShotImageView.frame.width / image.size.width
                let ratioH = snapShotImageView.frame.height / image.size.height
                let ratio = ratioW < ratioH ? ratioW:ratioH
                let newWidth = image.size.width*ratio
                let newHeight = image.size.height*ratio
                let left = 0.5 * (newWidth * scrollView.zoomScale > snapShotImageView.frame.width ? (newWidth - snapShotImageView.frame.width) : (scrollView.frame.width - scrollView.contentSize.width))
                let top = 0.5 * (newHeight * scrollView.zoomScale > snapShotImageView.frame.height ? (newHeight - snapShotImageView.frame.height) : (scrollView.frame.height - scrollView.contentSize.height))
                scrollView.contentInset = UIEdgeInsets(top: top, left: left, bottom: top, right: left)
            }
        } else {
            scrollView.contentInset = .zero
        }
    }
}
