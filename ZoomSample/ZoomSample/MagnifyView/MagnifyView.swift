//  MagnifyView.swift
//  ZoomSample
//
//  Created by jungwook on 2019/11/18.
//  Copyright © 2019 jungwook. All rights reserved.
//
import UIKit

enum MagnifyType : String{
    case Rect = "rect"
    case Circle = "Circle"
}
class MagnifyView: UIView {

    var zoom: CGFloat = 1.5 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    weak var readView: UIView?
  
    
    // MARK: - UIVIew

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }

    override func draw(_ rect: CGRect) {
        guard let readView = readView else { return }
        var magnifiedBounds = magnifyBounds(of: readView, zoom: zoom)
        let moveForm = CGAffineTransform(translationX: -1 * ((self.frame.size.width / 2) * zoom), y: -1 * ((self.frame.size.height / 2) * zoom))
        magnifiedBounds = magnifiedBounds.applying(moveForm)
      
        readView.drawHierarchy(in: magnifiedBounds, afterScreenUpdates: false)
    }

    // MARK: - Private

    private func setupView() {
        isOpaque = false
        backgroundColor = UIColor.clear
         self.layer.borderColor = UIColor.lightGray.cgColor
                self.layer.borderWidth = 3

    }

    private func magnifyBounds(of view: UIView, zoom: CGFloat) -> CGRect {
        let transform = CGAffineTransform(scaleX: zoom, y: zoom)
        let bounds = view.bounds.applying(transform)
        return view.convert(bounds, to: self)
    }
    func setCenterPoint(point : CGPoint){
        self.center = point


          self.setNeedsDisplay()
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard self.superview != nil else {
            return
        }
        
        
          let point = touches.first?.location(in: self.superview)
    
          setCenterPoint(point: point!)

      }
    
}

//extension CGRect {
//    var center: CGPoint {
//        get {
//            return CGPoint(x: origin.x + width / 2, y: origin.y + height / 2)
//        }
//        set {
//            origin.x = newValue.x - width / 2
//            origin.y = newValue.y - height / 2
//        }
//    }
//}
//class MagnifyView: UIView {
//
//    var magnifyView: UIView!
//    var touchPoint: CGPoint!
//    var type = MagnifyType.Rect
//    @IBInspectable var scale : CGFloat = 1.5
//
//    @available(*, unavailable, message: "This property is reserved for Interface Builder. Use 'shape' instead.")
//    @IBInspectable var shapeName: String? {
//        willSet {
//            // Ensure user enters a valid shape while making it lowercase.
//            // Ignore input if not valid.
//            if let newShape = MagnifyType(rawValue: newValue?.lowercased() ?? "") {
//                type = newShape
//            }
//        }
//    }
//
//    override init(frame: CGRect)
//    {
//        super.init(frame: frame)
//        commonInit()
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        commonInit()
//    }
//
//    func commonInit()
//    {
//        // Set border color, border width and corner radius of the magnify view
//        self.layer.borderColor = UIColor.lightGray.cgColor
//        self.layer.borderWidth = 3
//        switch type {
//        case .Circle:
//            self.layer.cornerRadius = self.frame.width / 2
//            self.layer.masksToBounds = true
//        case .Rect:
//            self.layer.cornerRadius = 0
//            self.layer.masksToBounds = false
//        }
//        self.isUserInteractionEnabled = false
//    }
//
//    func setTouchPoint(pt: CGPoint)
//    {
//        touchPoint = pt
//        if pt.y > self.frame.height / 2 {
//            self.center = CGPoint(x: pt.x, y: pt.y)
//        }
//    }
//
//    override func draw(_ rect: CGRect) {
//        let context = UIGraphicsGetCurrentContext()
//        if touchPoint.y > self.frame.height / 2{
//        context!.translateBy(x: 1 * (self.frame.size.width * 0.5), y: 1 * (self.frame.size.height * 0.5))
//        context!.scaleBy(x: scale, y: scale) // 1.5 is the zoom scale
////        context!.translateBy(x: -1 * (touchPoint.x), y: -1 * (touchPoint.y))
//        self.magnifyView.layer.render(in: context!)
//        }
//    }
//
//}
