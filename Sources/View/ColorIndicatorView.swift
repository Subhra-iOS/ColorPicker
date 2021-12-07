//
//  ColorIndicatorView.swift
//  HueKit
//
//  Created by Subhra Roy on 31/01/20.
//  Copyright © 2020 Subhra Roy. All rights reserved.
//

import Foundation
import UIKit

public enum CircularBorder : Int{
    case enable
    case disable
}

@IBDesignable
open class ColorIndicatorView: UIView {
	
	@IBInspectable
	open var color: UIColor = .black {
		didSet {
			
			if oldValue != color {
				self.setNeedsDisplay()
			}
			
		}
	}
    
    open var  circularBorder : CircularBorder = .enable{
        didSet{
           if oldValue != circularBorder {
               self.setNeedsDisplay()
           }
        }
    }
	
	override public init(frame: CGRect) {
		super.init(frame: frame)
	
		self.isOpaque = false
		self.isUserInteractionEnabled = false
	}
	
	required public init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)

	}
		
	override open func draw(_ rect: CGRect) {
		
		guard let context = UIGraphicsGetCurrentContext() else {
			return
		}
		
		let center = CGPoint(x: self.bounds.midX, y: self.bounds.midY)
		let radius = self.bounds.midX
		
		// Fill it:
		
		context.addArc(center: center, radius: radius - 1.0, startAngle: 0.0, endAngle: 2.0 * .pi, clockwise: true)
		self.color.setFill()
		context.fillPath()
		
		// Stroke it (black transucent, inner):
		
		context.addArc(center: center, radius: radius - 1.0, startAngle: 0.0, endAngle: 2.0 * .pi, clockwise: true)

		context.setStrokeColor(gray: 0.0, alpha: 0.5)
		context.setLineWidth(0.0)
		context.strokePath()
		
		// Stroke it (white, outer):
		
		context.addArc(center: center, radius: radius - 2.0, startAngle: 0.0, endAngle: 2.0 * .pi, clockwise: true)

    //    context.setStrokeColor(gray: 1.0, alpha: 1.0)
        switch circularBorder {
            case .enable:
                context.setStrokeColor(gray: 1.0, alpha: 1.0)
                context.setLineWidth(2.0)
            case .disable:
                if self.color == UIColor(hex: "#ffffff"){
                    context.setStrokeColor(UIColor.lightGray.cgColor)
                    context.setLineWidth(2.0)
                }else{
                     context.setStrokeColor(self.color.cgColor)
                    context.setLineWidth(0.0)
                }
                
        }
		
		context.strokePath()
	}
	
}
