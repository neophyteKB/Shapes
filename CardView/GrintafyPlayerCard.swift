//
//  GrintafyPlayerCard.swift
//  CardView
//
//  Created by Apple on 28/06/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import UIKit


class GrintafyPlayerCard: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUp()
    }
    
    func setUp() {
        // Create a CAShapeLayer
        let shapeLayer = CAShapeLayer()
        let path = createBezierPath()
        shapeLayer.path = path.cgPath
        
        // apply other properties related to the path
        shapeLayer.strokeColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        shapeLayer.fillColor = UIColor.white.cgColor
        layer.mask = shapeLayer
        
        let border = CAShapeLayer()
        border.path          = path.cgPath
        border.lineWidth     = 3.0
        border.strokeColor   = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1).cgColor
        border.fillColor     = UIColor.clear.cgColor
        layer.addSublayer(border)
    }
    
    private func createBezierPath() -> UIBezierPath {
        
        let width = frame.size.width
        let height = frame.size.height
        
        let widthCenter = width/2
        let bottomEdgeY = height * 5/6
        let bootomCurvePoint = height * 11/12
        let curveEdgeX = width / 60
        let topEdgeY = height * 1/6
        let curveEdgeY = height / 60
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: widthCenter, y: height))
        path.addCurve(to: CGPoint(x: 0, y: bottomEdgeY),
                      controlPoint1: CGPoint(x: curveEdgeX, y: bootomCurvePoint),
                      controlPoint2: CGPoint(x: 0, y: bootomCurvePoint))
        path.addLine(to: CGPoint(x: 0, y: topEdgeY))
        path.addCurve(to: CGPoint(x: width, y: topEdgeY),
                      controlPoint1: CGPoint(x: widthCenter, y: curveEdgeY),
                      controlPoint2: CGPoint(x: widthCenter, y: 0))
        path.addLine(to: CGPoint(x: width, y: bottomEdgeY))
        path.addCurve(to: CGPoint(x: widthCenter, y: height),
                      controlPoint1: CGPoint(x: width - curveEdgeX, y: bootomCurvePoint),
                      controlPoint2: CGPoint(x: width, y: bootomCurvePoint))
        return path
    }
}
