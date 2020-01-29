//
//  ViewController.swift
//  PinchSnapShotSample
//
//  Created by jungwook on 2019/11/19.
//  Copyright © 2019 jungwook. All rights reserved.
//

import UIKit

class ViewController: ViewControllerHelper {

    @IBOutlet weak var mainView: UIView!
    var isZoom = false
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
      
    }


    @IBAction func zoomAction(_ sender: Any) {
        let controller = getViewController(target: ZoomSnapViewController.self)
        controller.snapView = self.mainView.snapshotView(afterScreenUpdates: true)
        self.navigationController?.pushViewController(controller, animated: true)
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
