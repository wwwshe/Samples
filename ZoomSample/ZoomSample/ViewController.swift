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
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var zoomImage: UIImageView!
    
    var isScrollViewHidden = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        scrollViewSetting()
    }
    func scrollViewSetting(){
          self.scrollView.alwaysBounceVertical = false
          self.scrollView.alwaysBounceHorizontal = false
          
          self.scrollView.minimumZoomScale = 1.0
          self.scrollView.maximumZoomScale = 5.0
          self.scrollView.delegate = self
      }
  
    @IBAction func testAction(_ sender: Any) {
       
        isScrollViewHidden = !isScrollViewHidden
        
        if isScrollViewHidden {
            let image = self.mainView.screenshot()
            zoomImage.image = image
            
    
        }
        mainView.isHidden = isScrollViewHidden
        scrollView.isHidden = !isScrollViewHidden
        
    }
}

extension ViewController : UIScrollViewDelegate{
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {

        return zoomImage
    }
}



extension UIView {
    func screenshot() -> UIImage {
        if #available(iOS 10.0, *) {
            let format = UIGraphicsImageRendererFormat()
            return UIGraphicsImageRenderer(size: bounds.size, format: format).image { _ in
                drawHierarchy(in: CGRect(origin: .zero, size: bounds.size), afterScreenUpdates: true)
            }
        } else {
            UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, UIScreen.main.scale)
            drawHierarchy(in: self.bounds, afterScreenUpdates: true)
            let image = UIGraphicsGetImageFromCurrentImageContext() ?? UIImage()
            UIGraphicsEndImageContext()
            return image
        }
    }
}
