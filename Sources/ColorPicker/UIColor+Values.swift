//
//  UIColor+Values.swift
//  HueKit
//
//  Created by Subhra Roy on 31/01/20.
//  Copyright © 2020 Subhra Roy. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
	
	public var rgbValue: RGB? {
		
		guard let components = cgColor.components else {
			return nil
		}
		
		let numComponents = cgColor.numberOfComponents
		
		let r: CGFloat
		let g: CGFloat
		let b: CGFloat
		
		if numComponents < 3 {
			r = components[0]
			g = components[0]
			b = components[0]
		} else {
			r = components[0]
			g = components[1]
			b = components[2]
		}
		
		return RGB(r: r, g: g, b: b)
	}
	
	public var hsvValue: HSV? {
		
		guard let rgb = rgbValue else {
			return nil
		}
		
		return rgb.toHSV(preserveHS: true)
	}
	
	public func hsvValue(preservingHue hue: CGFloat, preservingSat sat: CGFloat) -> HSV? {

		guard let rgb = rgbValue else {
			return nil
		}
		
		return rgb.toHSV(preserveHS: true, h: hue, s: sat)
	}
    
    func rgbToHue(r:CGFloat,g:CGFloat,b:CGFloat) -> (h:CGFloat, s:CGFloat, b:CGFloat) {
        let minV:CGFloat = CGFloat(min(r, g, b))
        let maxV:CGFloat = CGFloat(max(r, g, b))
        let delta:CGFloat = maxV - minV
        var hue:CGFloat = 0
        if delta != 0 {
        if r == maxV {
           hue = (g - b) / delta
        }
        else if g == maxV {
           hue = 2 + (b - r) / delta
        }
        else {
           hue = 4 + (r - g) / delta
        }
        hue *= 60
        if hue < 0 {
           hue += 360
        }
        }
        let saturation = maxV == 0 ? 0 : (delta / maxV)
        let brightness = maxV
        return (h:hue/360, s:saturation, b:brightness)
    }
	
}

extension UIColor {
    
    public var hexString: String {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        self.getRed(&r, green: &g, blue: &b, alpha: &a)
        
        return String(format: "#%02X%02X%02X", Int(r * 255), Int(g * 255), Int(b * 255))
    }
    
     /* convenience public init?(hex: String) {
          var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
          hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

          var rgb: UInt32 = 0

          var r: CGFloat = 0.0
          var g: CGFloat = 0.0
          var b: CGFloat = 0.0
          var a: CGFloat = 1.0

          let length = hexSanitized.count

          guard Scanner(string: hexSanitized).scanHexInt32(&rgb) else { return nil }

          if length == 6 {
              r = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
              g = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
              b = CGFloat(rgb & 0x0000FF) / 255.0

          } else if length == 8 {
              r = CGFloat((rgb & 0xFF000000) >> 24) / 255.0
              g = CGFloat((rgb & 0x00FF0000) >> 16) / 255.0
              b = CGFloat((rgb & 0x0000FF00) >> 8) / 255.0
              a = CGFloat(rgb & 0x000000FF) / 255.0

          } else {
              return nil
          }

          self.init(red: r, green: g, blue: b, alpha: a)
      }*/
    
}
