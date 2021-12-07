//
//  ColorBarView.swift
//  HueKit
//
//  Created by Subhra Roy on 31/01/20.
//  Copyright © 2020 Subhra Roy. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
open class ColorBarView: UIView {

	private static func createContentImage() -> CGImage? {
	
		let hsv: [CGFloat] = [0.0, 1.0, 1.0]
		
		return HSBGen.createHSVBarContentImage(hsbComponent: .hue, hsv: hsv)
	}

	override open func draw(_ rect: CGRect) {
		
		guard let context = UIGraphicsGetCurrentContext() else {
			return
		}
		
		guard let image = ColorBarView.createContentImage() else {
			return
		}

		context.draw(image, in: self.bounds)

	}
	
}
