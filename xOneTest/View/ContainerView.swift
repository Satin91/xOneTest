//
//  ContainerView.swift
//  xOneTest
//
//  Created by Артур on 26.11.21.
//

import UIKit

class ContainerView: UIView {
    
    let radius: CGFloat = 16
    
    lazy var backgroundView: UIView = {
        let view = UIView()
        view.layer.cornerRadius  = radius
        view.backgroundColor     = UIColor().colorFromHexString("EDF3F4")
        view.clipsToBounds       = true
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        constraints()
    }
    
    func setupView() {
        self.layer.cornerRadius  = radius
        self.backgroundColor     = .white
        self.layer.shadowColor   = UIColor().colorFromHexString("616A6A").withAlphaComponent(0.17).cgColor
        self.layer.shadowOffset  = CGSize(width: -4, height: 14)
        self.layer.shadowRadius  = 6
        self.layer.shadowOpacity = 1
        
        
        self.addSubview(backgroundView)
    }
    
    func constraints() {
        self.backgroundView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backgroundView.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -Layout.indent),
            backgroundView.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: Layout.indent),
            backgroundView.topAnchor.constraint(equalTo: self.topAnchor,constant: Layout.indent),
            backgroundView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -Layout.indent),
        ])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.backgroundView.addInnerShadow()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


// https://stackoverflow.com/questions/37668965/adding-inner-shadow-to-top-of-uiview
extension UIView {
    func addInnerShadow() {
        let innerShadow = CALayer()
        innerShadow.frame = CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height + 12)
        
        // Shadow path (1pt ring around bounds)
        let radius = self.layer.cornerRadius
        let path = UIBezierPath(roundedRect: innerShadow.bounds.insetBy(dx: 2, dy:2), cornerRadius:radius)
        let cutout = UIBezierPath(roundedRect: innerShadow.bounds, cornerRadius:radius).reversing()
        
        path.append(cutout)
        innerShadow.shadowPath = path.cgPath
        innerShadow.masksToBounds = true
        
        // Shadow properties
        innerShadow.shadowColor = UIColor.black.cgColor
        innerShadow.shadowOffset = CGSize(width: 0, height: 0)
        innerShadow.shadowOpacity = 0.07
        innerShadow.shadowRadius = 2
        innerShadow.cornerRadius = self.layer.cornerRadius
        layer.addSublayer(innerShadow)
    }
}
