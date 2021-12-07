//
//  ColorSquareView.swift
//  HueKit
//
//  Created by Subhra Roy on 31/01/20.
//  Copyright © 2020 Subhra Roy. All rights reserved.
//

import UIKit

@IBDesignable
open class ColorSquareView: UIImageView {

	private var drawnHue: CGFloat = 0.0
	
	@IBInspectable
	open var hue: CGFloat = 0.0 {
		didSet {

			if self.image != nil && abs(drawnHue - hue) <= 1e-10 {
				return
			}
			
			let cgImage = HSBGen.createSaturationBrightnessSquareContentImageWithHue(hue: self.hue * 360.0)
			
			if let cgImage = cgImage {
				self.image = UIImage(cgImage: cgImage)
			} else {
				assertionFailure("Expected CGImage")
			}
			
			drawnHue = hue
		}
	}
	
}
