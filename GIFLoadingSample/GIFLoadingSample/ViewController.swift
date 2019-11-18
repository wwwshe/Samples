//
//  ViewController.swift
//  GIFLoadingSample
//
//  Created by jungwook on 2019/11/15.
//  Copyright © 2019 jungwook. All rights reserved.
//

import UIKit
import SwiftyGif

class ViewController: UIViewController {
    let logoAnimationView = LogoAnimationView()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(logoAnimationView)
              logoAnimationView.pinEdgesToSuperView()
              logoAnimationView.logoGifImageView.delegate = self
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
          logoAnimationView.logoGifImageView.startAnimatingGif()
    }

}

extension ViewController: SwiftyGifDelegate {
    func gifDidStop(sender: UIImageView) {
        logoAnimationView.isHidden = true
    }
}
