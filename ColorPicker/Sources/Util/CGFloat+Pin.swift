//
//  CGFloat+Pin.swift
//  HueKit
//
//  Created by Subhra Roy on 31/01/20.
//  Copyright © 2020 Subhra Roy. All rights reserved.
//

import Foundation
import CoreGraphics

extension CGFloat {
	
	func pinned(between minValue: CGFloat, and maxValue: CGFloat) -> CGFloat {
		
		if self < minValue {
			return minValue
		} else if self > maxValue {
			return maxValue
		} else {
			return self
		}
	}
	
}
